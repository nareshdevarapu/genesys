#===============================================================================
#	Genesys Production
#	Copyright (C) 2002-2013 Genesys Telecommunications Laboratories, Inc.
#===============================================================================
#	Description:	Common functions for work with ip_description.xml files
#					for Unix-based product installation scripts
#
#	History of changes:
#		2015-10-19, version 1.12, AlxNik
#			Format.
#
#		2013-01-07, version 1.11, AlxNik
#			Update GetPlatformsVersions for common, RHEL and Ubuntu cases.
#
#		2012-01-25, version 1.10, AlxNik
#			Adapt to Perl 5.14.2 used for Mac OS X 10.6.8 (Snow Leopard).
#
#		2010-02-16, version 1.09, AlxNik
#			Update GetPlatformsVersions.
#
#		2008-04-22, version 1.08, AlxNik
#			Accept all versions greater $CurrentFormatVersion.
#
#		2006-11-21, version 1.07, AlxNik
#			Add support for Platforms/Computer/OS/Version.
#
#		2006-04-27, version 1.06, AlxNik
#			Add support for ProductLanguage.
#
#		2003-10-07, version 1.05, AlxNik
#			Add processing of special characters in ProductLongName
#
#		2003-02-27, version 1.04, AlxNik
#			Comment not used code to avoid exceptions on HP-UX
#
#		2002-12-12, version 1.03, AlxNik
#			Use nicknames for comments
#
#		2002-12-02, version 1.01, AlxNik
#			Add support for arbitrary elements,
#			add interface methods
#
#		2002-11-27, version 1.00, AlxNik
#			First release.
#===============================================================================

use strict;
use warnings;
use v5.6.1;

use XML::Parser::Lite;

package ip_description;

our $VERSION;
$VERSION = 1.12;

#===============================================================================
# Global data
#===============================================================================

our $xml_attribute = 1;
our $xml_value = 2;

my $CurrentFormatVersion="4.0";
my $NoLicenseValue="NotRequired";

#===============================================================================
# Prototypes
#===============================================================================

sub getProductLicense($$);
sub getProductVersion($$);
sub getProductFamilyVersion($$);
sub getProductMinorVersion($$);
sub getProductBuildNumber($$);
sub getProductReleaseType($$);
sub getProductLongName($$);
sub getProductNickname($$);
sub getOSGroupName($$);
sub getProductLanguage($$);
sub GetPlatformsVersions($$\@);
sub ReplaceSpecialCharacters($);

sub CheckFormatVersion($);
sub GetKeyValues($\@\%);
sub GetProductData($\%);

#===============================================================================
# Subroutine definitions:
#===============================================================================

#===============================================================================
# Name:
#	Start_Handler
# Description:
#	Start_Handler handles the start and attributes values of element
#===============================================================================

sub Start_Handler
{
	shift;
	my $ref_product_data = pop;
	my $ref_path = pop;
	my @path = @$ref_path;
	my $print_data = pop;

	if ($print_data)
	{
		print "start: @_\n";
	}

	# update path
	push(@path,$_[0]);
	@$ref_path = @path;

	####################################
	# process attributes

	my %product_data = %{$ref_product_data};

	my ($key, $value);
	while ( ($key, $value) = each(%product_data))
	{
		my %map=%{$value};

		if ($map{type} == $xml_attribute)
		{
			# check current path
			my $buffer="";

			foreach my $item (@path)
			{
				$buffer .= "/$item";
			}

			if ($buffer eq $map{path})
			{
				# create string with key-value data

				my $length = $#_ + 1;

				my $string_data="";
				my $i;

				for ($i=1;$i<$length;$i++)
				{
					$string_data .= $_[$i];

					if ($i != ($length -1))
					{
						$string_data .= " ";
					}
				}

				my @names = @{$map{attributes_names}};
				my %hash=();

				GetKeyValues($string_data,@names,%hash);

				$value->{value}=$hash{$map{attribute_name}};
			}
		}
	}

	$ref_product_data = \%product_data;
}

#===============================================================================
# Name:
#	Char_Handler
# Description:
#	Char_Handler handles the characters and values of element
#===============================================================================

sub Char_Handler
{
	my $ref_product_data = pop;
	my $ref_path = pop;
	my @path = @$ref_path;
	my $print_data = pop;

	if ($print_data)
	{
		print "path: ";
		foreach my $item (@path)
		{
			printf "/%s", $item;
		}
		print "\n";
	}

	shift;

	if ($print_data)
	{
		print "char: @_\n";
	}

	####################################
	# process values

	my %product_data = %{$ref_product_data};

	my ($key, $value);
	while ( ($key, $value) = each(%product_data))
	{

		my %map=%{$value};

		if ($map{type} == $xml_value)
		{
			# check current path
			my $buffer="";

			foreach my $item (@path)
			{
				$buffer .= "/$item";
			}

			if ($buffer eq $map{path})
			{
				$value->{value}=$_[0];
			}
		}
	}

	$ref_product_data = \%product_data;
}

#===============================================================================
# Name:
#	End_Handler
# Description:
#	End_Handler handles the end of element
#===============================================================================

sub End_Handler
{
	shift;
	my $ref_path = pop;
	my @path = @$ref_path;
	my $print_data = pop;

	if ($print_data)
	{
		print "end: @_\n";
	}

	# update path
	pop(@path);
	@$ref_path = @path;
}

#===============================================================================
# Name:
#	GetKeyValues
# Description:
#	GetKeyValues retrieves key values from string
# Input parameters:
#	String containing keys and values data
#	Reference to array with key names
#	Reference to hash with key-value pairs.
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetKeyValues($\@\%)
{
	my $buffer = $_[0];
	my @names = @{$_[1]};
	my %hash = %{$_[2]};

	my ($i,$nCount,$before,$after);
	my @values=();

	$nCount = @names;

	#print "\$buffer=$buffer\n";
	#print "\$nCount=$nCount\n";

	for ($i = 0; $i < $nCount; $i++)
	{
		my $last_index = 0;

		if ($i == ($nCount-1))
		{
			$last_index = 1;
		}

		if (!$last_index)
		{
			$before = $names[$i];
			$after = $names[$i+1];
		}
		else
		{
			$before = $names[$i];
		}

		#print "i=$i\n";
		my $match;

		if (!$last_index)
		{
			$match = $before . '\s*(.*)\s*' . $after;
		}
		else
		{
			$match = $before . '\s*(.*)';
		}

		my ($nPosBefore,$nPosAfter,$string);

		$nPosBefore = index($buffer,$before,0);

		if ($nPosBefore != -1 )
		{
			if (!$last_index)
			{
				$nPosAfter = index($buffer,$after,$nPosBefore+length($before));

				if ($nPosAfter != -1 )
				{
					my $len = $nPosAfter - ($nPosBefore+length($before)) - 2;
					$string = substr($buffer,$nPosBefore+length($before)+1,$len);
				}
			}
			else
			{
				$string = substr($buffer,$nPosBefore+length($before)+1);
			}
		}

		#print "***********************************\$string=$string*\n";

		push(@values,$string);
	}

	#print "Typing values:\n";
	#for my $value (@values)
	#{
	#	print "value= $value\n";
	#}

	# create hash
	for ($i = 0; $i < $nCount; $i++)
	{
		$hash{$names[$i]} = $values[$i];
	}

	 %{$_[2]} = %hash;
}

#===============================================================================
# Name:
#	GetProductData
# Description:
#	GetProductData retrieves data from .xml file
# Input parameters:
#	File path
#	Reference to hash for product data
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetProductData($\%)
{
	my $filepath=$_[0];
	my $ref_product_data=$_[1];

	# read data
	local(*INPUT, $/);

	my $result=open (INPUT, $filepath);

	if (!$result)
	{
		return 0;
	}

	my $buffer = <INPUT>;

	# init variables
	my %product_data=%{$ref_product_data};

	my @path=();
	my $print_data=0;

	# parse data
	my $pLite = new XML::Parser::Lite;
	$pLite->setHandlers(
		Start => sub { Start_Handler(@_,$print_data,\@path,\%product_data); },
		Char => sub { Char_Handler(@_,$print_data,\@path,\%product_data); },
		End => sub { End_Handler(@_,$print_data,\@path); }
		);

	$pLite->parse($buffer);

	$ref_product_data=\%product_data;

	return 1;
}

#===============================================================================
# Name:
#	CheckFormatVersion
# Description:
#	CheckFormatVersion checks format version of data in .xml file
# Input parameters:
#	File path
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CheckFormatVersion($)
{
	my $filepath=$_[0];

	my %hash=();
	my %target=();
	$target{type}=$ip_description::xml_attribute;
	$target{path}="/InstallationPackage";
	$target{attribute_name}="FormatVersion";
	my @names=('FormatVersion');
	$target{attributes_names}=\@names;
	$target{value}=undef;
	$hash{format_version}=\%target;

	if (ip_description::GetProductData($filepath,%hash) == 0)
	{
		return 0;
	}

	if ($hash{format_version}->{value} lt $CurrentFormatVersion)
	{
		return 0;
	}

	return 1;
}

#===============================================================================
# Name:
#	getProductLicense
# Description:
#	getProductLicense checks if product reqiures license
# Input parameters:
#	File path
#	Reference to license flag (1-license is required, 0-license is not required)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub getProductLicense($$)
{
	my $filepath=$_[0];
	my $ref_license_flag=$_[1];
	my $license_flag=0;

	if (CheckFormatVersion($filepath) == 0)
	{
		return 0;
	}

	my %hash=();
	my %target=();
	$target{type}=$ip_description::xml_attribute;
	$target{path}="/InstallationPackage/Product";
	$target{attribute_name}="License";
	my @names=('License');
	$target{attributes_names}=\@names;
	$target{value}=undef;
	$hash{license}=\%target;

	if (ip_description::GetProductData($filepath,%hash) == 0)
	{
		return 0;
	}

	if ($hash{license}->{value} eq $NoLicenseValue)
	{
		$license_flag=0;
	}
	else
	{
		$license_flag=1;
	}

	$$ref_license_flag = $license_flag;

	return 1;
}

#===============================================================================
# Name:
#	getProductVersion
# Description:
#	getProductLicense gets product version
# Input parameters:
#	File path
#	Reference to product version
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub getProductVersion($$)
{
	my $filepath=$_[0];
	my $ref_product_version=$_[1];
	my $product_version=0;

	if (CheckFormatVersion($filepath) == 0)
	{
		return 0;
	}

	my %hash=();
	my %target=();
	$target{type}=$ip_description::xml_attribute;
	$target{path}="/InstallationPackage/Product/Release";
	$target{attribute_name}="Version";
	my @names=('Version', 'BuildDate', 'BuildNumber', 'Type');
	$target{attributes_names}=\@names;
	$target{value}=undef;
	$hash{version}=\%target;

	if (ip_description::GetProductData($filepath,%hash) == 0)
	{
		return 0;
	}

	if ($hash{version}->{value})
	{
		$product_version=$hash{version}->{value};
	}

	$$ref_product_version = $product_version;

	return 1;
}

#===============================================================================
# Name:
#	getProductFamilyVersion
# Description:
#	getProductFamilyVersion gets product family version
#		(for 6.5.100.01 the minor version is 6.5)
# Input parameters:
#	File path
#	Reference to product family version
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub getProductFamilyVersion($$)
{
	my $filepath=$_[0];
	my $ref_family_version=$_[1];
	my $family_version=0;
	my $product_version=0;

	if (getProductVersion($filepath,\$product_version) == 0)
	{
		return 0;
	}

	if ($product_version =~ /^(\d+\.\d+)\./)
	{
		$family_version = $1;
	}
	else
	{
		return 0;
	}

	$$ref_family_version = $family_version;

	return 1;
}

#===============================================================================
# Name:
#	getProductMinorVersion
# Description:
#	getProductMinorVersion gets product minor version
#		(for 6.5.100.01 the minor version is 100.01)
# Input parameters:
#	File path
#	Reference to product minor version
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub getProductMinorVersion($$)
{
	my $filepath=$_[0];
	my $ref_product_minor_version=$_[1];
	my $product_minor_version=0;
	my $product_version=0;

	if (getProductVersion($filepath,\$product_version) == 0)
	{
		return 0;
	}

	if ($product_version =~ /\.(\d+\.\d+)$/)
	{
		$product_minor_version = $1;
	}
	else
	{
		return 0;
	}

	$$ref_product_minor_version = $product_minor_version;

	return 1;
}

#===============================================================================
# Name:
#	getProductBuildNumber
# Description:
#	getProductBuildNumber gets product build number
# Input parameters:
#	File path
#	Reference to product build number
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub getProductBuildNumber($$)
{
	my $filepath=$_[0];
	my $ref_product_build_number=$_[1];
	my $product_build_number=0;

	if (CheckFormatVersion($filepath) == 0)
	{
		return 0;
	}

	my %hash=();
	my %target=();
	$target{type}=$ip_description::xml_attribute;
	$target{path}="/InstallationPackage/Product/Release";
	$target{attribute_name}="BuildNumber";
	my @names=('Version', 'BuildDate', 'BuildNumber', 'Type');
	$target{attributes_names}=\@names;
	$target{value}=undef;
	$hash{build_number}=\%target;

	if (ip_description::GetProductData($filepath,%hash) == 0)
	{
		return 0;
	}

	if ($hash{build_number}->{value})
	{
		$product_build_number=$hash{build_number}->{value};
	}

	$$ref_product_build_number = $product_build_number;

	return 1;
}

#===============================================================================
# Name:
#	getProductReleaseType
# Description:
#	getProductReleaseType gets product release type
# Input parameters:
#	File path
#	Reference to product release type
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub getProductReleaseType($$)
{
	my $filepath=$_[0];
	my $ref_product_release_type=$_[1];
	my $product_release_type=0;

	if (CheckFormatVersion($filepath) == 0)
	{
		return 0;
	}

	my %hash=();
	my %target=();
	$target{type}=$ip_description::xml_attribute;
	$target{path}="/InstallationPackage/Product/Release";
	$target{attribute_name}="Type";
	my @names=('Version', 'BuildDate', 'BuildNumber', 'Type');
	$target{attributes_names}=\@names;
	$target{value}=undef;
	$hash{release_type}=\%target;

	if (ip_description::GetProductData($filepath,%hash) == 0)
	{
		return 0;
	}

	if ($hash{release_type}->{value})
	{
		$product_release_type=$hash{release_type}->{value};
	}

	$$ref_product_release_type = $product_release_type;

	return 1;
}

#===============================================================================
# Name:
#	getProductLongName
# Description:
#	getProductLongName gets product long name
# Input parameters:
#	File path
#	Reference to product long name
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub getProductLongName($$)
{
	my $filepath=$_[0];
	my $ref_product_long_name=$_[1];
	my $product_long_name=0;

	if (CheckFormatVersion($filepath) == 0)
	{
		return 0;
	}

	my %hash=();
	my %target=();
	$target{type}=$ip_description::xml_value;
	$target{path}="/InstallationPackage/Product/Name/Long";
	$target{value}=undef;
	$hash{product_long_name}=\%target;

	if (ip_description::GetProductData($filepath,%hash) == 0)
	{
		return 0;
	}

	if ($hash{product_long_name}->{value})
	{
		$product_long_name=$hash{product_long_name}->{value};
	}

	ReplaceSpecialCharacters(\$product_long_name);

	$$ref_product_long_name = $product_long_name;

	return 1;
}

#===============================================================================
# Name:
#	getProductNickname
# Description:
#	getProductNickname gets product nickname
# Input parameters:
#	File path
#	Reference to product nickname
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub getProductNickname($$)
{
	my $filepath=$_[0];
	my $ref_product_nickname=$_[1];
	my $product_nickname=0;

	if (CheckFormatVersion($filepath) == 0)
	{
		return 0;
	}

	my %hash=();
	my %target=();
	$target{type}=$ip_description::xml_value;
	$target{path}="/InstallationPackage/Product/Name/Nickname";
	$target{value}=undef;
	$hash{product_nickname}=\%target;

	if (ip_description::GetProductData($filepath,%hash) == 0)
	{
		return 0;
	}

	if ($hash{product_nickname}->{value})
	{
		$product_nickname=$hash{product_nickname}->{value};
	}

	$$ref_product_nickname = $product_nickname;

	return 1;
}

#===============================================================================
# Name:
#	getOSGroupName
# Description:
#	getOSGroupName gets product OS Group name
# Input parameters:
#	File path
#	Reference to product OS Group name
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub getOSGroupName($$)
{
	my $filepath=$_[0];
	my $ref_product_os_group_name=$_[1];
	my $product_os_group_name=0;

	if (CheckFormatVersion($filepath) == 0)
	{
		return 0;
	}

	my %hash=();
	my %target=();
	$target{type}=$ip_description::xml_attribute;
	$target{path}="/InstallationPackage/Platforms";
	$target{attribute_name}="OSGroupName";
	my @names=('OSGroupName');
	$target{attributes_names}=\@names;
	$target{value}=undef;
	$hash{product_os_group_name}=\%target;

	if (ip_description::GetProductData($filepath,%hash) == 0)
	{
		return 0;
	}

	if ($hash{product_os_group_name}->{value})
	{
		$product_os_group_name=$hash{product_os_group_name}->{value};
	}

	$$ref_product_os_group_name = $product_os_group_name;

	return 1;
}

#===============================================================================
# Name:
#	getProductLanguage
# Description:
#	getProductLanguage gets product Language name
# Input parameters:
#	File path
#	Reference to product Language name
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub getProductLanguage($$)
{
	my $filepath=$_[0];
	my $ref_product_language_name=$_[1];
	my $product_language_name=0;

	if (CheckFormatVersion($filepath) == 0)
	{
		return 0;
	}

	my %hash=();
	my %target=();
	$target{type}=$ip_description::xml_value;
	$target{path}="/InstallationPackage/Product/Language/Name";
	$target{value}=undef;
	$hash{product_language_name}=\%target;

	if (ip_description::GetProductData($filepath,%hash) == 0)
	{
		return 0;
	}

	if ($hash{product_language_name}->{value})
	{
		$product_language_name=$hash{product_language_name}->{value};
	}

	$$ref_product_language_name = $product_language_name;

	return 1;
}

#===============================================================================
# Name:
#	GetPlatformsVersions
# Description:
#	Gets the list of platforms versions
# Input parameters:
#	String containing <Platforms> info like
#		<Platforms OSGroupName="aix">
#			<Computer Type="PowerPC 64 bit">
#				<OS Name="AIX" Version="5.1"/>
#				<OS Name="AIX" Version="5.2"/>
#				<OS Name="AIX" Version="5.3"/>
#			</Computer>
#			<Computer Type="PowerPC 32 bit">
#				<OS Name="AIX" Version="5.1"/>
#				<OS Name="AIX" Version="5.2"/>
#				<OS Name="AIX" Version="5.3"/>
#			</Computer>
#		</Platforms>
#	OS type ($OS_common,$OS_RHEL,$OS_Ubuntu)
#	Reference to versions list
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

our $OS_common = 1;
our $OS_RHEL = 2;
our $OS_Ubuntu = 3;

sub GetPlatformsVersions($$\@)
{
	my $platforms_string = $_[0];
	my $OS_type = $_[1];
	my $ref_versions = $_[2];
	my $element_name="Platforms";
	my $debug_print=0;

	my ($element_content) = ($platforms_string =~ /.*<$element_name[\s\w="]*>(.*)<\/$element_name>.*/sm);

	if ($debug_print == 1)
	{
		print "\$element_content=\"$element_content\"\n";
	}

	for ($element_content)
	{
		s/^\s+//;
		s/\s+$//;
	}

	if ($debug_print == 1)
	{
		print "\$element_content=\"$element_content\"\n";
	}

	my $done=0;
	my $count=0;
	my $max_count=20;
	my @info=();

	while (!$done)
	{
		my @versions = ();

		if ($OS_type == $OS_RHEL)
		{
			@versions = ($element_content =~ /.*?Red Hat.*?Version="([\w\.\w]*)".*?\/>(.*)/sm);
		}
		elsif ($OS_type == $OS_Ubuntu)
		{
			@versions = ($element_content =~ /.*?Ubuntu.*?Version="([\w\.\w]*)".*?\/>(.*)/sm);
		}
		else
		{
			# $OS_type == $OS_common
			@versions = ($element_content =~ /.*?Version="([\w\.\w]*)".*?\/>(.*)/sm);
		}

		my $length = scalar @versions;

		if ($length == 0 )
		{
			$done=1;
			last;
		}

		push(@info,$versions[0]);

		if ($debug_print == 1)
		{
			print "*************** Typing elements:\n";
			for my $elem (@versions)
			{
				print "value= $elem\n";
			}
		}

		$count++;

		if ($length == 1)
		{
			$done = 1;
		}

		if ($count > $max_count)
		{
			#$done = 1;
			return 0;
		}

		if ($done == 0)
		{
			$element_content = $versions[1];
		}
	}

	if ($debug_print == 1)
	{
		print "*************** Typing elements:\n";
		for my $elem (@info)
		{
			print "value= $elem\n";
		}
	}

	my @unique_info=();

	for my $elem (@info)
	{
		my $found=0;

		for my $search_elem (@unique_info)
		{
			if ($elem eq $search_elem)
			{
				$found=1;
				last;
			}
		}

		if ($found == 0)
		{
			push(@unique_info,$elem);
		}
	}

	if ($debug_print == 1)
	{
		print "*************** Typing elements:\n";
		for my $elem (@unique_info)
		{
			print "value= $elem\n";
		}
	}

	@{$ref_versions}=@unique_info;

	return 1;
}

#===============================================================================
# Name:
#	ReplaceSpecialCharacters
# Description:
#	ReplaceSpecialCharacters replaces special characters in string
# Input parameters:
#	Reference to string
# Return value:
#	Returns 1.
#===============================================================================

sub ReplaceSpecialCharacters($)
{
	my $ref_string=$_[0];
	my $buffer=$$ref_string;
	my @search_and_replace_items=(
		{
			search => "&amp;",
			replace => "&",
		},
		{
			search => "&lt;",
			replace => "<",
		},
		{
			search => "&gt;",
			replace => ">",
		},
		{
			search => "&quot;",
			replace => "\"",
		},
		{
			search => "&apos;",
			replace => "'",
		},
	);

	foreach my $item (@search_and_replace_items)
	{
		#print "\$item->{search}=$item->{search} \$item->{replace}=$item->{replace}\n";
		$buffer =~ s/$item->{search}/$item->{replace}/g;
	}

	$$ref_string=$buffer;

	return 1;
}

1;
