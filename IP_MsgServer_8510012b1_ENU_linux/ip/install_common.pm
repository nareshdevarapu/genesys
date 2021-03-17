#===============================================================================
#	Genesys Production
#	Copyright (C) 2000-2015 Genesys Telecommunications Laboratories, Inc.
#===============================================================================
#	Description:	Common functions for Unix-based product installation scripts
#
#	History of changes:
#		2015-10-19, version 1.92, AlxNik
#			Format.
#
#		2014-12-02, version 1.91, AlxNik
#			Adapt GetIPAddresses for RHEL7.
#
#		2013-06-17, version 1.90, AlxNik
#			Allow hostnames to start from digit.
#
#		2013-02-27, version 1.89, AlxNik
#			Update GetOSDataModel,FINDPLAT.
#
#		2013-01-07, version 1.88, AlxNik
#			Add GetUbuntuVersion.
#
#		2012-09-14, version 1.87, AlxNik
#			Add ASKNULL_Confirm,ASK_Confirm.
#
#		2012-01-25, version 1.86, AlxNik
#			Add Mac OS X 10.6.8 (Snow Leopard) support.
#
#		2012-01-06, version 1.85, AlxNik
#			Update GetDomainNameNslookup (check explicitly for Name:).
#
#		2011-11-14, version 1.84, AlxNik
#			Add AskIPAddress.
#
#		2011-08-18, version 1.83, AlxNik
#			Update GetDomainNameNslookup (check for nslookup failure).
#
#		2011-07-22, version 1.82, AlxNik
#			Add GetAllIPAddresses, update FilterApplications (replace GetIPAddress
#			by GetAllIPAddresses.
#
#		2011-07-14, version 1.81, AlxNik
#			Add $LS and FindLs.
#
#		2011-07-08, version 1.80, AlxNik
#			Update GetDomainNameNslookup.
#
#		2011-07-08, version 1.79, AlxNik
#			Add GetDomainNameNslookup, update GETDOMAINNAME.
#
#		2011-06-28, version 1.78, AlxNik
#			Add DirectoryBITS.
#
#		2011-06-26, version 1.77, AlxNik
#			Add IPv6 support.
#
#		2011-04-05, version 1.76, AlxNik
#			Update BITS (Linux 64-bit checking).
#
#		2010-11-04, version 1.75, AlxNik
#			Add support for Aspect T-Server 8.0.1 changes.
#
#		2010-07-12, version 1.74, AlxNik
#			Add GetItaniumModel.
#
#		2010-02-17, version 1.73, AlxNik
#			Add GetOSDataModel.
#
#		2010-02-10, version 1.72, AlxNik
#			Add GetRHLVersion.
#
#		2009-10-30, version 1.71, AlxNik
#			Remove "_backup" files.
#
#		2009-08-10, version 1.70, AlxNik
#			Update BACKUPDIR, PREPTARGET, GetFreeSpace to support $TargetDir
#			with spaces.
#
#		2009-05-15, version 1.69, AlxNik
#			Add support for Aspect T-Server 8.x changes.
#
#		2008-12-16, version 1.68, AlxNik
#			Add support for uninstall data.
#
#		2008-10-06, version 1.67, AlxNik
#			Relax requirements for hostname to allow Windows specific symbol "_".
#
#		2008-07-24, version 1.66, AlxNik
#			Add AdaptMessageToSilentMode
#
#		2008-07-18, version 1.65, AlxNik
#			Add $Silent_response_file_InstallPath_key_name standard support in
#			silent mode.
#
#		2008-07-07, version 1.64, AlxNik
#			Add package tar support, export $TAR.
#			Add release_notes directory support.
#			Add IP description variables from install_lib.
#
#		2008-06-09, version 1.63, AlxNik
#			Add EULA support.
#
#		2008-05-16, version 1.62, AlxNik
#			Add strict hostname checking in AskHostname, AskDefHostname,
#			GETHOSTNAME (ER 182496061).
#
#		2008-03-12, version 1.61, AlxNik
#			Add AskDefNumber, AskHostname, AskDefHostname. Update GETHOSTNAME.
#
#		2007-12-14, version 1.60, AlxNik
#			Update GetIPAddress.
#
#		2007-11-20, version 1.59, AlxNik
#			Add support for Client Side Port,
#			move IsValidIPAddress from install_lib, add GetIPAddresses.
#
#		2007-09-24, version 1.58, AlxNik
#			Add support for standard 64-bit processing (ER 146219031): update
#			BITS, add GetStartupDirectory.
#
#		2007-05-25, version 1.57, AlxNik
#			Update GETDOMAINNAME (ER 128722333).
#
#		2007-05-07, version 1.56, AlxNik
#			Update GETDOMAINNAME (ER 124144761).
#
#		2007-02-06, version 1.55, AlxNik
#			Add SetDomainName.
#
#		2007-01-26, version 1.54, AlxNik
#			Update GETDOMAINNAME: remove usage of domainname (ER 103074589),
#			add GetDomainName usage.
#
#		2006-12-20, version 1.53, AlxNik
#			Add support for single application in GCTISetup.ini file (ER 95807572).
#
#		2006-11-21, version 1.52, AlxNik
#			Update FINDPLATVER.
#
#		2006-11-14, version 1.51, AlxNik
#			Update ENUMINI, FilterApplications.
#
#		2006-10-12, version 1.50, AlxNik
#			Optimize Record_BITS.
#
#		2006-10-11, version 1.49, AlxNik
#			Use "DataModel" instead of "BitsNumber".
#
#		2006-10-10, version 1.48, AlxNik
#			Add support for comments in files used for silent mode.
#
#		2006-09-29, version 1.47, AlxNik
#			Make some silent constants public.
#
#		2006-09-12, version 1.46, AlxNik
#			Add AskNumber and AskNullNumber functions.
#
#		2006-09-11, version 1.45, AlxNik
#			Messages changes (ER 65712591).
#
#		2006-07-27, version 1.44, AlxNik
#			Add AIX 64-bit mode support.
#
#		2006-07-26, version 1.43, AlxNik
#			Add applications sorting from GCTISetup.ini, normalize ENUMINI.
#
#		2006-07-24, version 1.42, AlxNik
#			Update ENUMINI.
#
#		2006-07-03, version 1.41, AlxNik
#			Update GETDOMAINNAME: process standalone host case.
#
#		2006-06-30, version 1.40, AlxNik
#			Update ENUMINI: process FilterApplications failure.
#
#		2006-06-13, version 1.39, AlxNik
#			Update GETDOMAINNAME.
#
#		2006-06-05, version 1.38, AlxNik
#			Add silent mode support methods, move CreateSilentLog from install_lib,
#			change DATAMOVE, move ini file subroutines from
#			install_gvpne 1.35.
#
#		2006-04-19, version 1.37, AlxNik
#			Add silent mode support methods.
#
#		2006-02-02, version 1.36, AlxNik
#			Add IsOverwriteMode function.
#
#		2006-01-27, version 1.35, AlxNik
#			Add support for application host filtering, add Trim function,
#			move GetIPAddress from install_lib.
#
#		2006-01-16, version 1.34, AlxNik
#			Simplify PREPTARGET finction and add checking for free space availability,
#			add FindOneCommand and simplify FINDGUNZIP.
#
#		2005-11-03, version 1.33, AlxNik
#			Add ExtractData finction, update DATAMOVE function.
#
#		2005-09-23, version 1.32, AlxNik
#			Add GetFilesListEx and GetFilenamesFromFileEx finctions
#
#		2005-01-11, version 1.31, AlxNik
#			Correct comments.
#
#		2004-12-06, version 1.30, AlxNik
#			Change pattern for printing "\n".
#
#		2004-11-19, version 1.29, AlxNik
#			Add CatchInterruptSignal handler, update KILLPROC (ER 92349).
#
#		2004-08-24, version 1.28, AlxNik
#			Add support for "Red Hat Enterprise Linux 3"
#
#		2004-08-13, version 1.27, AlxNik
#			Update DATAMOVE to add silent mode.
#
#		2004-08-06, version 1.26, AlxNik
#			Update GETDOMAINNAME to solve problem with custom host configurations
#			(ER 86923).
#
#		2004-07-23, version 1.25, AlxNik
#			Update PARSEINI finction (add support for case-insensitive comparison
#			of section names)
#
#		2004-06-22, version 1.24, AlxNik
#			Add GetFilesList and GetFilenamesFromFile finctions
#
#		2004-06-16, version 1.23, AlxNik
#			Update PARSEINI finction (add optional parameter, accept "[" character
#				not in first position, accept multiple "=" characters).
#
#		2004-05-10, version 1.22, AlxNik
#			Update DATAMOVE finction.
#
#		2004-03-15, version 1.21, AlxNik
#			Correct PREPTARGET finction.
#
#		2004-01-05, version 1.20, AlxNik
#			Correct GETDOMAINNAME finction.
#
#		2003-11-04, version 1.19, AlxNik
#			Add $dirname_cmd and $basename_cmd
#
#		2003-10-23, version 1.18, AlxNik
#			Add another callback function for BACKUPDIR,
#			add BACKUPDIR_SetCallback_Init,
#			replace "run.sh" by $StartupFileName
#
#		2003-10-17, version 1.17, AlxNik
#			Add callback function for PREPTARGET, add PREPTARGET_SetCallback.
#
#		2003-10-08, version 1.16, AlxNik
#			Add InitPlatform function for updating $LN for Linux
#
#		2003-10-02, version 1.15, AlxNik
#			Update PREPTARGET: for read-only flag don't ask about backup options,
#			add callback function for BACKUPDIR, add BACKUPDIR_SetCallback.
#
#		2003-06-12, version 1.14, AlxNik
#			Recognize host names longer then 8 characters.
#
#		2003-04-18, version 1.13, AlxNik
#			Extend custom procession for Aspect T-Server from solaris
#			to hpux and aix
#
#		2003-01-03, version 1.12, AlxNik
#			Add optional parameter for BITS
#
#		2002-12-12, version 1.11, AlxNik
#			Use nicknames for comments
#
#		2002-11-13, version 1.10, AlxNik
#			Add all necessary prototypes to ensure compile-time argument checking.
#
#		2002-10-30, version 1.09, AlxNik
#			Synchronize with install-common.pl:
#			1. $MKDIR="/bin/mkdir" -> $MKDIR="/bin/mkdir -p",
#			2. find gunzip in current directory,
#			3. modify BITS to work differently for AIX - add FINDPLATVER,
#				modify FINDPLAT (add Linux support, correct close UNAME)
#			4. correct PARSEINI - use exact match
#
#		2002-08-16, version 1.08, AlxNik
#			Add READCFGSERV_EX
#
#		2002-08-06, version 1.07, AlxNik
#			modify PREPTARGET - add read-only parameter
#
#		2002-06-12, version 1.06, AlxNik
#			modify PREPTARGET - enable creation of non-existing parent directories
#			add Init and IsValidPath functions
#
#		2002-06-03, version 1.05, AlxNik
#			add IsNumberOrNotEmptyDigitString
#			use IsNumberOrNotEmptyDigitString in ENUMINI and ENUMAPPSLIST
#
#		2002-06-03, version 1.04, AlxNik
#			add checking for GUNZIP in DATAMOVE
#			correct ENUMAPPSLIST - enable to work with 1 application
#
#		2002-05-30, version 1.03, AlxNik
#			use prototypes
#
#		2002-05-30, version 1.02, AlxNik
#			modify PARSEINI - return undefined hash on error
#			modify ENUMINI - return undefined scalar on error
#			modify ENUMAPPSLIST - return undefined scalar on error
#
#		2002-05-26, version 1.01, AlxNik
#			port to ActivePerl 5.6.1
#			port to package install_common.pm
#			reformat
#			modify ENUMAPPSLIST - use different parameters
#			isolate code for finding gunzip into subroutine FINDGUNZIP
#			modify ENUMINI - check file existence
#
#		2000-04-14, version 1.00, NtshUsmnv, JCrft:
#			First release includes:
#				INITCOMMON
#				EDITFILE
#				FINDCOMMAND
#				FINDPLAT
#				KILLPROC
#				ASK
#				ASKNULL
#				ASKDEF
#				GETHOSTNAME
#				GETDOMAINNAME
#				PARSEINI
#				ENUMINI
#				READCFGSERV
#				CFGSERVERR
#				ENUMAPPSLIST
#				BACKUPDIR
#				PREPTARGET
#				BITS
#				DATAMOVE
#				MAKERUNSH
#===============================================================================

use strict;
use warnings;
use v5.6.1;

package install_common;

our $VERSION;
$VERSION = 1.92;

#===============================================================================
# Prototypes
#===============================================================================

sub FINDCOMMAND($;@);
sub ASK(@);
sub IsNumberOrNotEmptyDigitString($);
sub IsValidPath($);
sub PARSEINI($$;$$);
sub GetFilesList($\@);
sub GetFilenamesFromFile($\@);
sub DATAMOVE($$;$);
sub GetFilesListEx($$\@);
sub GetFilenamesFromFileEx($\@);
sub FindOneCommand($$\@);
sub Trim($);
sub GetIPAddress($$);
sub FilterApplications($\@\@);

# Ini file subroutines
sub CreateEmptyFile($);
sub GetIniFileKeyValue($$$$$);
sub SetIniFileKeyValue($$$$);
sub GetIniFileKeyValues($$\%$);
sub UpdateIniFileValue($$$$$);
sub DoesSectionExist($$$);
sub CreateSection($$);

sub GetDomainName($$);
sub GetDomainNameNslookup($$);
sub SetDomainName($);

sub GetStartupDirectory();

sub GetIPAddresses(\@);
sub GetIPv6Addresses(\@);
sub GetAllIPAddresses(\@);
sub VerifyHostname($$;$);

#===============================================================================
# Specify locations of Unix commands
#===============================================================================

our $PWD="/bin/pwd";
our $LN="/usr/bin/ln";
our $RM="/bin/rm";
our $MV="/bin/mv";
our $MKDIR="/bin/mkdir -p";
our $CP="/bin/cp";
our $dirname_cmd="/bin/dirname";
our $basename_cmd="/bin/basename";

my $UNAME="/bin/uname";
my $UNAME_MAC="/usr/bin/uname";
my $HOSTNAME="/bin/hostname";
our $TAR;
our $LS;
my $GUNZIP;
my $OSLEVEL="oslevel";
my $DU;
my $DF;
my $DOMAINNAME="domainname";

#===============================================================================
# other important constants
#===============================================================================

my $LOCKFILE="install.lock";
my $CFGUTIL="./cfgutility";
my $MYSELF="install_common.pm";
my $Aspect_T_Server_question="Do you use Aspect Contact Server?";
my $Aspect_T_Server_Commad_Line="aspect_server";
our $StartupFileName="run.sh";

# disk free space checking
my $Check_free_space=0;

# application host filtering
my $Application_host_filtering=0;
my $LocalHostname="";
my $Domain="";

# silent mode support
my $Silent_mode_support=0;
my $Silent_mode=0;
my $Record_mode=0;
my $Silent_mode_response_file_path="";
my $Silent_mode_log_file_path="";

my $Silent_mode_response_default_filename="genesys_silent.ini";
my $Silent_mode_log_default_dir="/tmp";
my $Silent_mode_log_default_filename="genesys_install_result.log";

our $Silent_result_success=0;
our $Silent_result_error=1;
our $Silent_action_conntinue=0;
our $Silent_action_exit=1;

# Silent response file data
our $Silent_response_file_IPCommon_section_name="IPCommon";
our $Silent_response_file_InstallPath_key_name="InstallPath";
our $Silent_response_file_Components_key_name="Components";
our $Silent_response_file_Components_key_value_delimiter=";";
our $Silent_response_file_RunTimeMode_key_name="RunTimeMode";
my $Silent_response_file_DataModel_key_name="DataModel";
my %Silent_IPCommon_info=();

# Silent result file data
my $Silent_result_file_GenesysProductInfo_section_name="GenesysProductInfo";
my $Silent_result_file_File_key_name="File";
my $Silent_result_file_IPName_key_name="IPName";
my $Silent_result_file_IPVersion_key_name="IPVersion";
my $Silent_result_file_IPBuildNumber_key_name="IPBuildNumber";
my $Silent_result_file_IPLanguage_key_name="IPLanguage";
my $Silent_result_file_Result_section_name="Result";
my $Silent_result_file_ResultCode_key_name="ResultCode";
my $Silent_result_file_Error_key_name="Error";
my $Silent_result_file_Reboot_key_name="Reboot";

our %IP_description_info=();

# GetIniFileKeyValue errors
my $IniFile_error_file_not_found=0;
my $IniFile_error_file_not_readable=1;
our $IniFile_error_section_or_section_keys_not_found=2;
my $IniFile_error_key_not_found=3;

our $comments_characters="#;";
my $debug_print=0;

# UpdateIniFileValue flags
my $IniFileValue_Update=0;
my $IniFileValue_Create=1;

# AIX 64-bit mode support
my $AIX_64_bit_mode_support=0;

our $WizardIniFile="GCTISetup.ini";
our $WizardIniFile_GeneralSection="___general___";

our $InstallationTerminationMessage="Installation has terminated.";

# processing of single application in ini file
my $SingleAppInIniFileProcessing=0;

# Standard 64-bit mode support
my $Standard_64_bit_mode_support=0;

# Standard Client Side Port support
my $Standard_ClientSidePort_support=0;

# Standard InstallPath in SilentMode support
my $Standard_InstallPathInSilentMode_support=0;

my $StartupDirectory="";

our $NotHostnamePattern='[^0-9a-zA-Z-\._]+';
our $PossibleHostFormat_prompt="only [0-9,a-z,A-Z,-,.,_] symbols are allowed";
our $AlphaNumericPattern='[a-zA-Z0-9]';
our $HostnamePattern='[0-9a-zA-Z-\._]+';
our $NotAllowedTrailingPattern='[-,\.,_]';
our $PossibleDNSNameFormat_prompt="hostname should start from [a-z,A-Z,0-9] symbols,\nlast symbol must not be from [-,.,_] symbols, single symbol hostnames are not allowed";

# EULA
our $EULA_filename="genesys_license_agreement.txt";
our $EULA_prompt="Did you read and agree to the End User Licensing Agreement (EULA) terms\nin $EULA_filename file (y/n)?";

# IP description
our $ip_description_filename="ip_description.xml";
our $ospatchlist_filename="ospatchlist.txt";
our $read_me_html_filename="read_me.html";
our $release_notes_dirname="release_notes";

# Standard Uninstall Data support
my $Standard_UninstallData_support=0;

# DATAMOVE data
our $InstallationDirectory="";

# Aspect T-Server 8.x changes
my $Standard_AspectTServer_support=0;

# Aspect T-Server 8.0.1 changes
my $Standard_AspectTServer_AllPlatforms_support=0;

# IPv6 support
my $Standard_IPv6_support=0;
our $IPAddrressType_v4=1;
our $IPAddrressType_v6=2;

#===============================================================================
# Subroutine definitions:
#===============================================================================

#===============================================================================
# Name:
#	BEGIN
# Description:
#	Tunes @INC using platform type.
#===============================================================================

BEGIN
{
	my $UNAME="/bin/uname";
	my $UNAME_MAC="/usr/bin/uname";

	#===============================================================================
	# Name:
	#	FINDPLAT
	# Description:
	#	FINDPLAT uses $UNAME to determine the platform of the machine it's
	#	running on. It returns a list with one element, one of the
	#	following strings: osf, hpux, aix, solaris, or none on failure.
	#	(It's a list to allow further expansion to report version if needed.)
	#===============================================================================

	sub FINDPLAT_b()
	{
		if (! (-e $UNAME))
		{
			if (! (-e $UNAME_MAC))
			{
				return ("none");
			}
			else
			{
				$UNAME=$UNAME_MAC;
			}
		}

		local *UN;

		open UN, "$UNAME -a |" or return ("none");

		while(<UN>)
		{
			if (/SunOS/)
			{
				close UN;
				return ("solaris");
			}

			if (/OSF1/)
			{
				close UN;
				return ("osf");
			}

			if (/HP-UX/)
			{
				close UN;
				return ("hpux");
			}

			if (/AIX/)
			{
				close UN;
				return ("aix");
			}

			if (/Linux/)
			{
				close UN;
				return ("linux");
			}

			if (/Darwin/)
			{
				close UN;
				return ("mac");
			}
		}

		close UN;
		return ("none");
	}

	my $debug_print=0;
	my $Library_Env_Name="PERLLIB";

	if (defined($ENV{$Library_Env_Name}))
	{
		if ($debug_print == 1)
		{
			print "PERLLIB=$ENV{$Library_Env_Name}\n";
		}

		my $platform=FINDPLAT_b();

		@INC=();
		push(@INC,".");
		push(@INC,"$ENV{$Library_Env_Name}");

		if ($platform eq "solaris")
		{
			push(@INC,"$ENV{$Library_Env_Name}/sun4-solaris");
		}
		elsif ($platform eq "osf")
		{
			push(@INC,"$ENV{$Library_Env_Name}/alpha-dec_osf");
		}
		elsif ($platform eq "hpux")
		{
			push(@INC,"$ENV{$Library_Env_Name}/PA-RISC2.0");
		}
		elsif ($platform eq "aix")
		{
			push(@INC,"$ENV{$Library_Env_Name}/aix");
		}
		elsif ($platform eq "linux")
		{
			push(@INC,"$ENV{$Library_Env_Name}/i686-linux");
		}
		elsif ($platform eq "mac")
		{
			push(@INC,"$ENV{$Library_Env_Name}/darwin-2level");
		}
		else
		{
			print "\nUnknown OS platform.\n";
			exit 1;
		}
	}
	else
	{
		#print "\n\$COMPILING=$^C\n";

		if ($^C != 1)
		{
			print "\nPERLLIB is not defined.\n";
			exit 1;
		}
	}
}

#===============================================================================
# Name:
#	BEGIN
# Description:
#	Optional using of Socket6.
#===============================================================================

use Socket 1.72;

our $Socket6_Loaded;

BEGIN
{
	package install_common;

	if ($^C != 1)
	{
		my $debug_print=0;

		my $module = "Socket6";

		if ($debug_print == 1)
		{
			print "before eval use $module\n";
		}

		my $use_flag=eval "use $module; 1;";

		if ($debug_print == 1)
		{
			warn $@ if $@;
			print "after eval use $module\n";
		}

		if (defined($use_flag))
		{
			$Socket6_Loaded=1;
		}
		else
		{
			$Socket6_Loaded=0;
		}

		if ($debug_print == 1)
		{
			print "\$Socket6_Loaded=$Socket6_Loaded\n";
		}
	}
}

#===============================================================================
# Name:
#	BEGIN
# Description:
#	Mandatory using of Regexp::IPv6.
#===============================================================================

BEGIN
{
	if ($^C != 1)
	{
		my $debug_print=0;

		my $module = "Regexp::IPv6";

		if ($debug_print == 1)
		{
			print "before eval use $module\n";
		}

		my $use_flag=eval "use $module; 1;";

		if ($debug_print == 1)
		{
			warn $@ if $@;
			print "after eval use $module\n";
		}

		if (!defined($use_flag))
		{
			print "Module $module not found\n";
			exit 1;
		}
	}
}

#===============================================================================
# Name:
#	Enable_free_space_checking
# Description:
#	Enables free space checking
#===============================================================================

sub Enable_free_space_checking()
{
	$Check_free_space=1;
}

#===============================================================================
# Name:
#	Disable_free_space_checking
# Description:
#	Disables free space checking
#===============================================================================

sub Disable_free_space_checking()
{
	$Check_free_space=0;
}

#===============================================================================
# Name:
#	Enable_app_host_filtering
# Description:
#	Enables application host filtering
#===============================================================================

sub Enable_app_host_filtering()
{
	$Application_host_filtering=1;
}

#===============================================================================
# Name:
#	Disable_app_host_filtering
# Description:
#	Disables application host filtering
#===============================================================================

sub Disable_app_host_filtering()
{
	$Application_host_filtering=0;
}

#===============================================================================
# Name:
#	Enable_silent_mode_support
# Description:
#	Enables silent mode support
#===============================================================================

sub Enable_silent_mode_support()
{
	$Silent_mode_support=1;
}

#===============================================================================
# Name:
#	Disable_silent_mode_support
# Description:
#	Disables silent mode support
#===============================================================================

sub Disable_silent_mode_support()
{
	$Silent_mode_support=0;
}

#===============================================================================
# Name:
#	Get_silent_mode
# Description:
#	Gets silent mode
#===============================================================================

sub Get_silent_mode()
{
	return $Silent_mode;
}

#===============================================================================
# Name:
#	Set_silent_mode
# Description:
#	Sets silent mode
#===============================================================================

sub Set_silent_mode($)
{
	if ($Silent_mode_support == 1)
	{
		$Silent_mode=$_[0];
	}
}

#===============================================================================
# Name:
#	Get_record_mode
# Description:
#	Gets record mode
#===============================================================================

sub Get_record_mode()
{
	return $Record_mode;
}

#===============================================================================
# Name:
#	Set_record_mode
# Description:
#	Sets record mode
#===============================================================================

sub Set_record_mode($)
{
	if ($Silent_mode_support == 1)
	{
		$Record_mode=$_[0];
	}
}

#===============================================================================
# Name:
#	Get_silent_mode_response_file_path
# Description:
#	Gets silent mode response file path
#===============================================================================

sub Get_silent_mode_response_file_path()
{
	return $Silent_mode_response_file_path;
}

#===============================================================================
# Name:
#	Set_silent_mode_response_file_path
# Description:
#	Sets silent mode response file path
#===============================================================================

sub Set_silent_mode_response_file_path($)
{
	if ($Silent_mode_support == 1)
	{
		my $path=$_[0];

		if (!$path)
		{
			my $sourcedir=`$install_common::PWD`;
			chomp $sourcedir;

			$path="$sourcedir/$Silent_mode_response_default_filename";
		}

		$Silent_mode_response_file_path=$path;
	}
}

#===============================================================================
# Name:
#	Verify_silent_mode_response_file_path
# Description:
#	Verifies silent mode response file path
#===============================================================================

sub Verify_silent_mode_response_file_path()
{
	if (!-f $Silent_mode_response_file_path)
	{
		my $Message="File $Silent_mode_response_file_path was not found.";
		install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
	}
}

#===============================================================================
# Name:
#	Get_silent_mode_log_file_path
# Description:
#	Gets silent mode log file path
#===============================================================================

sub Get_silent_mode_log_file_path()
{
	return $Silent_mode_log_file_path;
}

#===============================================================================
# Name:
#	Set_silent_mode_log_file_path
# Description:
#	Sets silent mode log file path
#===============================================================================

sub Set_silent_mode_log_file_path($)
{
	if ($Silent_mode_support == 1)
	{
		my $path=$_[0];

		if (!$path)
		{
			$path="$Silent_mode_log_default_dir/$Silent_mode_log_default_filename";
		}

		$Silent_mode_log_file_path=$path;
	}
}

#===============================================================================
# Name:
#	Enable_AIX_64_bit_mode_support
# Description:
#	Enables AIX 64-bit mode support
#===============================================================================

sub Enable_AIX_64_bit_mode_support()
{
	$AIX_64_bit_mode_support=1;
}

#===============================================================================
# Name:
#	Disable_AIX_64_bit_mode_support
# Description:
#	Disables AIX 64-bit mode support
#===============================================================================

sub Disable_AIX_64_bit_mode_support()
{
	$AIX_64_bit_mode_support=0;
}

#===============================================================================
# Name:
#	EnableSingleAppInIniFileProcessing
# Description:
#	Enables processing of single application in ini file
#===============================================================================

sub EnableSingleAppInIniFileProcessing()
{
	$SingleAppInIniFileProcessing=1;
}

#===============================================================================
# Name:
#	DisableSingleAppInIniFileProcessing
# Description:
#	Disables processing of single application in ini file
#===============================================================================

sub DisableSingleAppInIniFileProcessing()
{
	$SingleAppInIniFileProcessing=0;
}

#===============================================================================
# Name:
#	EnableStandard64bitProcessing
# Description:
#	Enables standard processing of 64-bit modules
#===============================================================================

sub EnableStandard64bitProcessing()
{
	$Standard_64_bit_mode_support=1;
}

#===============================================================================
# Name:
#	DisableStandard64bitProcessing
# Description:
#	Disables standard processing of 64-bit modules
#===============================================================================

sub DisableStandard64bitProcessing()
{
	$Standard_64_bit_mode_support=0;
}

#===============================================================================
# Name:
#	DisableClientSidePortSupport
# Description:
#	Disables standard processing of Client Side Port
#===============================================================================

sub DisableClientSidePortSupport()
{
	$Standard_ClientSidePort_support=0;
}

#===============================================================================
# Name:
#	EnableClientSidePortSupport
# Description:
#	Enables standard processing of Client Side Port
#===============================================================================

sub EnableClientSidePortSupport()
{
	$Standard_ClientSidePort_support=1;
}

#===============================================================================
# Name:
#	DisableStandardInstallPathInSilentModeProcessing
# Description:
#	Disables standard processing of InstallPath in silent mode
#===============================================================================

sub DisableStandardInstallPathInSilentModeProcessing()
{
	$Standard_InstallPathInSilentMode_support=0;
}

#===============================================================================
# Name:
#	EnableStandardInstallPathInSilentModeProcessing
# Description:
#	Enables standard processing of InstallPath in silent mode
#===============================================================================

sub EnableStandardInstallPathInSilentModeProcessing()
{
	$Standard_InstallPathInSilentMode_support=1;
}

#===============================================================================
# Name:
#	DisableStandardUninstallDataProcessing
# Description:
#	Disables standard processing of Uninstall Data
#===============================================================================

sub DisableStandardUninstallDataProcessing()
{
	$Standard_UninstallData_support=0;
}

#===============================================================================
# Name:
#	EnableStandardUninstallDataProcessing
# Description:
#	Enables standard processing of Uninstall Data
#===============================================================================

sub EnableStandardUninstallDataProcessing()
{
	$Standard_UninstallData_support=1;
}

#===============================================================================
# Name:
#	DisableStandardAspectTServerProcessing
# Description:
#	Disables standard processing for Aspect T-Server
#===============================================================================

sub DisableStandardAspectTServerProcessing()
{
	$Standard_AspectTServer_support=0;
}

#===============================================================================
# Name:
#	EnableStandardAspectTServerProcessing
# Description:
#	Enables standard processing for Aspect T-Server
#===============================================================================

sub EnableStandardAspectTServerProcessing()
{
	$Standard_AspectTServer_support=1;
}

#===============================================================================
# Name:
#	DisableStandardAspectTServerAllPlatformsProcessing
# Description:
#	Disables standard processing for Aspect T-Server (all platforms)
#===============================================================================

sub DisableStandardAspectTServerAllPlatformsProcessing()
{
	$Standard_AspectTServer_AllPlatforms_support=0;
}

#===============================================================================
# Name:
#	EnableStandardAspectTServerAllPlatformsProcessing
# Description:
#	Enables standard processing for Aspect T-Server (all platforms)
#===============================================================================

sub EnableStandardAspectTServerAllPlatformsProcessing()
{
	$Standard_AspectTServer_AllPlatforms_support=1;
}

#===============================================================================
# Name:
#	DisableStandardIPv6Support
# Description:
#	Disables standard processing for IPv6
#===============================================================================

sub DisableStandardIPv6Support()
{
	$Standard_IPv6_support=0;
}

#===============================================================================
# Name:
#	EnableStandardIPv6Support
# Description:
#	Enables standard processing for IPv6
#===============================================================================

sub EnableStandardIPv6Support()
{
	$Standard_IPv6_support=1;
}

#===============================================================================
# Name:
#	IsSocket6Loaded
# Description:
#	Returns status of Socket6 (0 or 1)
#===============================================================================

sub IsSocket6Loaded()
{
	return $Socket6_Loaded;
}

#===============================================================================
# Name:
#	FINDGUNZIP
# Description:
#	FINDGUNZIP locates the gunzip command since it doesn't have a standard place.
#	If not found, prompts the user for the location.
# Return value:
#	Function returns 1 or dies.
#===============================================================================

sub FINDGUNZIP()
{
	my @DirectoriesArray=();
	my @DirectoriesArray_Predefined=("/usr/local/bin","/usr/bin","/usr/contrib/bin");

	my $sourcedir=`$PWD`;
	chomp $sourcedir;

	push(@DirectoriesArray,$sourcedir);
	push(@DirectoriesArray,@DirectoriesArray_Predefined);

	FindOneCommand(\$GUNZIP,"gunzip",@DirectoriesArray);

	return 1;
}

#===============================================================================
# Name:
#	FindTar
# Description:
#	FindTar locates the tar command since it can be located in different places:
#	/bin directory or package (starting from 8 family)
#	If not found, prompts the user for the location.
# Return value:
#	Function returns 1 or dies.
#===============================================================================

sub FindTar()
{
	my @DirectoriesArray=();
	my @DirectoriesArray_Predefined=("/bin","/usr/bin","/usr/local/bin");

	my $sourcedir=`$PWD`;
	chomp $sourcedir;

	push(@DirectoriesArray,$sourcedir);
	push(@DirectoriesArray,@DirectoriesArray_Predefined);

	FindOneCommand(\$TAR,"tar",@DirectoriesArray);

	return 1;
}

#===============================================================================
# Name:
#	FindLs
# Description:
#	FindLs locates the ls command since it can be located in different places.
#	If not found, prompts the user for the location.
# Return value:
#	Function returns 1 or dies.
#===============================================================================

sub FindLs()
{
	my @DirectoriesArray_Predefined=("/bin","/usr/bin","/usr/local/bin");

	FindOneCommand(\$LS,"ls",@DirectoriesArray_Predefined);

	return 1;
}

#===============================================================================
# Name:
#	FindUname
# Description:
#	FindLs locates the uname command since it can be located in different places.
#	If not found, prompts the user for the location.
# Return value:
#	Function returns 1 or dies.
#===============================================================================

sub FindUname()
{
	my @DirectoriesArray_Predefined=("/bin","/usr/bin","/usr/local/bin");

	FindOneCommand(\$UNAME,"uname",@DirectoriesArray_Predefined);

	return 1;
}

#===============================================================================
# Name:
#	FindOneCommand
# Description:
#	Find one command
# Return value:
#	Function returns 1 or dies.
#===============================================================================

sub FindOneCommand($$\@)
{
	my $ref_CommandPath=$_[0];
	my $CommandName=$_[1];
	my $ref_DirectoriesArray = $_[2];
	my @DirectoriesArray = @{$ref_DirectoriesArray};
	my $CommandPath;

	$$ref_CommandPath="";

	if(! ($CommandPath=FINDCOMMAND($CommandName,@DirectoriesArray)) )
	{
		if(! (-f ($CommandPath=ASK("Please enter the path to the $CommandName command =>")) && -x $CommandPath) )
		{
			die "\n---> The $CommandName command is required for this installation. Exiting.\n\n";
		}
	}

	$$ref_CommandPath=$CommandPath;

	return 1;
}

#===============================================================================
# Name:
#	FindCommands
# Description:
#	Find commands
# Return value:
#	Function returns 1 or dies.
#===============================================================================

sub FindCommands()
{
	if ($Check_free_space == 1)
	{
		my @DirectoriesArray=("/bin","/usr/local/bin","/usr/bin");
		FindOneCommand(\$DU,"du",@DirectoriesArray);
		FindOneCommand(\$DF,"df",@DirectoriesArray);
	}

	return 1;
}

#===============================================================================
# Name:
#	INITCOMMON
# Description:
#	INITCOMMON does any necessary work to initialize the install script.
#	The call is located at the end of this file.
#===============================================================================

sub INITCOMMON()
{

	if ( ! (-e $MYSELF) )
	{
		die "Please run this script from the directory in which it is located.\n\n";
	}

	if (-e $LOCKFILE)
	{
		if (Get_silent_mode() == 0)
		{
			print "Last install terminated abnormally. Cleaning up...\n\n";
		}

		unlink $LOCKFILE;
	}

	return 1;
}

#===============================================================================
# Name:
#	EDITFILE
# Description:
#	EDITFILE takes two or three arguments. The first argument is a
#	string containing the path of file to be edited. The second argument
#	is a reference to a hash with the key names which are tokens to be
#	found and replaced by the corresponding value. Edits are performed
#	in place unless there is a third argument, the path of the file to
#	which to write them instead. EDITFILE returns 1 on success, 0 on
#	failure. Searches are case-sensitive and multiple substitutions
#	will be made per line.
#===============================================================================

sub EDITFILE($\%;$)
{
	my ($name1, $name2);
	my %reps;
	my $key;
	local (*FH1, *FH2);

	%reps=%{$_[1]};

	if (!$_[2])
	{
		$name2=$_[0];
		$name1=$_[0] . time;
		rename ($name2, $name1) || return 0;
	}
	else
	{
		$name1=$_[0];
		$name2=$_[2];
	}

	open(FH1,"<$name1") || return 0;
	open(FH2,">$name2") || return 0;

	while(<FH1>)
	{
		foreach $key (keys %reps)
		{
			s/$key/$reps{$key}/g;
		}
		print FH2 $_;
	}

	close FH1 || return 0;
	close FH2 || return 0;

	if(!$_[2])
	{
		unlink $name1 || return 0;
	}

	return 1;
}

#===============================================================================
# Name:
#	FINDCOMMAND
# Description:
#	FINDCOMMAND looks for Unix commands. It takes one or more arguments.
#	The first argument contains the name of the command to locate.
#	The rest of the arguments contain search paths. If the command
#	is not found in any of the search paths, or if a search path is
#	not provided it will prompt the user to enter the path to the command.
#	On success it returns the full path to the first place it finds the command
#	(full path = the name appended to the search path)
#	and on failure it returns the null string.
#===============================================================================

sub FINDCOMMAND($;@)
{
	my $i;
	my $testcommand;  # temporary storage for the full path

	for ($i=1; $i<=$#_; $i++)
	{
		$testcommand=$_[$i] . "/" . $_[0];
		$testcommand=~s#\/\/#\/#g;  # remove doubled path separators

		if( (-x $testcommand) && (-f $testcommand) )
		{
			return $testcommand;
		}
	}

	return "";
}

#===============================================================================
# Name:
#	FINDPLAT
# Description:
#	FINDPLAT uses $UNAME to determine the platform of the machine it's
#	running on. It returns a list with one element, one of the
#	following strings: osf, hpux, aix, solaris, or none on failure.
#	(It's a list to allow further expansion to report version if needed.)
#===============================================================================

sub FINDPLAT()
{
	if (! (-e $UNAME))
	{
		if (! (-e $UNAME_MAC))
		{
			return ("none");
		}
		else
		{
			$UNAME=$UNAME_MAC;
		}
	}

	local *UN;

	open UN, "$UNAME -a |" or return ("none");

	while(<UN>)
	{
		if (/SunOS/)
		{
			close UN;
			return ("solaris");
		}

		if (/OSF1/)
		{
			close UN;
			return ("osf");
		}

		if (/HP-UX/)
		{
			close UN;
			return ("hpux");
		}

		if (/AIX/)
		{
			close UN;
			return ("aix");
		}

		if (/Linux/)
		{
			close UN;
			return ("linux");
		}

		if (/Darwin/)
		{
			close UN;
			return ("mac");
		}
	}

	close UN;
	return ("none");
}

#===============================================================================
# Name:
#	FINDPLATVER
# Description:
#	FINDPLATVER returns a string containing the version of the operating system
#	as reported by the uname command for most platforms and the oslevel command in AIX.
#	It returns undef on failure.
#
#	Examples of valid version strings:
#		solaris: 5.6, 5.7, 5.8
#		osf: V4.0
#		hpux: B.11.00
#		aix: 4.3.2.0, 5.1.0.0
#		linux: 2.4.21-4.ELsmp
#===============================================================================

sub FINDPLATVER
{
	local *VERF;
	my $ver;
	my @ver;

	my $platform=FINDPLAT;

	if ($platform eq "none")
	{
		return undef;
	}

	if ($platform eq "aix")
	{
		open (VERF, "$OSLEVEL |") || return undef;
		$ver=<VERF>;
		chomp $ver;
		close VERF;
		return $ver;
	}
	else
	{
		open (VERF, "$UNAME -r |") || return undef;
		$ver=<VERF>;
		chomp $ver;
		close VERF;

		if(!$ver)
		{
			return undef;
		}

		return $ver;
	}
}

#===============================================================================
# Name:
#	GetItaniumModel
# Description:
#	Detects Itanium model.
# Input parameters:
#	Reference to Itanium flag (set to 0-not Itanium or 1-Itanium on return)
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub GetItaniumModel($)
{
	my $ref_Itanium=$_[0];
	$$ref_Itanium=0;
	my $Result=0;
	local *UN;

	open UN, "$UNAME -m |" or return $Result;
	my $data=<UN>;
	chomp $data;
	close UN;

	if( $data eq "ia64" )
	{
		$$ref_Itanium=1;
		$Result=1;
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetRHLVersion
# Description:
#	Returns a string containing the version of the Red Hat Linux.
#	It returns undef on failure.
#
#	Examples of valid version strings:
#		3,4,5.3
#===============================================================================

sub GetRHLVersion()
{
	my $version=undef;

	my $redhat_release_filename="/etc/redhat-release";

	if ( -f $redhat_release_filename)
	{
		my $info_cmd="cat $redhat_release_filename";
		my $info=`$info_cmd`;
		chomp $info;

		# Example of info content: Red Hat Enterprise Linux ES release 4 (Nahant Update 6)
		$info =~ /.*release\s(\d+|\d+\.\d+)\s.*/;

		if (defined($1))
		{
			$version=$1;
		}
	}

	return $version;
}

#===============================================================================
# Name:
#	GetUbuntuVersion
# Description:
#	Returns a string containing the version of the Ubuntu.
#	It returns undef on failure.
#
#	Examples of valid version strings:
#		3,4,5.3
#===============================================================================

sub GetUbuntuVersion()
{
	my $version=undef;

	my $lsb_release_filename="/etc/lsb-release";

	if ( -f $lsb_release_filename)
	{
		my $info_cmd="grep DISTRIB_RELEASE $lsb_release_filename";
		my $info=`$info_cmd`;
		chomp $info;

		# Example of info content:
		#DISTRIB_ID=Ubuntu
		#DISTRIB_RELEASE=12.04
		#DISTRIB_CODENAME=precise
		#DISTRIB_DESCRIPTION="Ubuntu 12.04.1 LTS"

		$info =~ /^DISTRIB_RELEASE=(\d+|\d+\.\d+)$/;

		if (defined($1))
		{
			$version=$1;
		}
	}

	return $version;
}

#===============================================================================
# Name:
#	CompareVersionsEx
# Description:
#	Compares versions (version format can be arbitrary)
# Input parameters:
#	Version1 value (for example 7.0.000.00)
#	Version2 value (for example 7.0.000.00)
#	Reference to compare result (<0 Version1 is less then Version2,
#								  0 Version1 is equal to Version2,
#								 >0 Version1 is greater than Version2)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CompareVersionsEx($$$)
{
	my $Version_01=$_[0];
	my $Version_02=$_[1];
	my $ref_Result=$_[2];
	my $Result=0;
	my $array_size_01=0;
	my $array_size_02=0;

	############################

	install_common::Trim(\$Version_01);
	install_common::Trim(\$Version_02);

	############################
	# check for validity

	my @version_parts_01 = split(/\./, $Version_01);
	$array_size_01 = scalar @version_parts_01;

	my @version_parts_02 = split(/\./, $Version_02);
	$array_size_02 = scalar @version_parts_02;

	############################
	# verify content of each part

	for my $elem (@version_parts_01)
	{
		if ( $elem =~ /\D/)
		{
			# not digit value
			return $Result;
		}
	}

	for my $elem (@version_parts_02)
	{
		if ( $elem =~ /\D/)
		{
			# not digit value
			return $Result;
		}
	}

	$Result=1;

	############################
	# compare

	my $array_size=0;

	if ($array_size_01 <= $array_size_02)
	{
		$array_size=$array_size_01;
	}
	else
	{
		$array_size=$array_size_02;
	}

	for (my $i=0;$i<$array_size;$i++)
	{
		if ($version_parts_01[$i] < $version_parts_02[$i])
		{
			$$ref_Result = -1;
			last;
		}
		elsif ($version_parts_01[$i] > $version_parts_02[$i])
		{
			$$ref_Result = 1;
			last;
		}
		else
		{
			$$ref_Result = 0;
		}
	}

	if ($$ref_Result == 0)
	{
		if ($array_size_01 != $array_size_02)
		{
			if ($array_size_01 < $array_size_02)
			{
				$$ref_Result = -1;
			}
			else
			{
				$$ref_Result = 1;
			}
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	CompareRHEVersions
# Description:
#	Compares RHE versions (version format is as in install_common::GetRHLVersion)
# Input parameters:
#	Version1 value (for example 42.10)
#	Version2 value (for example 5.3)
#	Reference to compare result (<0 Version1 is less then Version2,
#								  0 Version1 is equal to Version2,
#								 >0 Version1 is greater than Version2)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CompareRHEVersions($$$)
{
	my $Version_01=$_[0];
	my $Version_02=$_[1];
	my $ref_Result=$_[2];
	my $Result=0;
	my $array_size_01=0;
	my $array_size_02=0;
	my $Expected_array_size=2;

	############################

	install_common::Trim(\$Version_01);
	install_common::Trim(\$Version_02);

	############################
	# check for validity

	my @version_parts_01 = split(/\./, $Version_01);
	$array_size_01 = scalar @version_parts_01;

	if ($array_size_01 > $Expected_array_size)
	{
		return $Result;
	}

	my @version_parts_02 = split(/\./, $Version_02);
	$array_size_02 = scalar @version_parts_02;

	if ($array_size_02 > $Expected_array_size)
	{
		return $Result;
	}

	############################
	# verify content of each part

	for my $elem (@version_parts_01)
	{
		if ( $elem =~ /\D/)
		{
			# not digit value
			return $Result;
		}
	}

	for my $elem (@version_parts_02)
	{
		if ( $elem =~ /\D/)
		{
			# not digit value
			return $Result;
		}
	}

	$Result=1;

	############################
	# normalize both versions

	my ($VersionNormalized_01,$VersionNormalized_02,$Part_01,$Part_02);

	$Part_01=sprintf("%02u",$version_parts_01[0]);

	if ($array_size_01 == 1)
	{
		$Part_02="00";
	}
	else
	{
		my $version=$version_parts_01[1];

		if ($version == 0)
		{
			$Part_02="00";
		}
		else
		{
			if ($version < 10)
			{
				$version="$version"."0";
			}

			$Part_02=sprintf("%2u",$version);
		}
	}

	$VersionNormalized_01="$Part_01"."$Part_02";

	$Part_01=sprintf("%02u",$version_parts_02[0]);

	if ($array_size_02 == 1)
	{
		$Part_02="00";
	}
	else
	{
		my $version=$version_parts_02[1];

		if ($version == 0)
		{
			$Part_02="00";
		}
		else
		{
			if ($version < 10)
			{
				$version="$version"."0";
			}

			$Part_02=sprintf("%2u",$version);
		}
	}

	$VersionNormalized_02="$Part_01"."$Part_02";

	############################
	# compare

	$Result=CompareVersionsEx($VersionNormalized_01,$VersionNormalized_02,$ref_Result);

	return $Result;
}

#===============================================================================
# Name:
#	KILLPROC
# Description:
#	KILLPROC takes as its argument the name of the process to kill.
#	It searches the process list for that process name and kills the
#	first one it finds. It uses FINDPLAT to make up for differences in
#	the Unix ps command. Returns 1 on success, 0 on failure.
#	The search in this function is simple: it looks for the first
#	occurence of the string, kills the PID associated with it,
#	and then stops.
#===============================================================================

sub KILLPROC($)
{
	my $platform;
	my $pscommand;
	my $field;  # which field number of ps output has PID
	my @psline; # hold one line of split ps output
	local *PS;

	($platform)=FINDPLAT;

	for ($platform)
	{
		/none/   and do { return 0; };
		/aix/    and do { $pscommand="/usr/bin/ps -ef"; $field=1; last; };
		/solaris/ and do { $pscommand="/bin/ps -ef"; $field=1; last; };
		/osf/    and do { $pscommand="/bin/ps -ef"; $field=1; last; };
		/hpux/   and do { $pscommand="/usr/bin/ps -ef"; $field=1; last; };
		/linux/  and do { $pscommand="/bin/ps -ef"; $field=1; last; };
	}

	open PS, "$pscommand |" or return 0;

	while(<PS>)
	{
		if ( (/$_[0]/) && !(/install/) )
		{
			@psline=split;

			if ( (kill "TERM", $psline[$field]) > 0)
			{
				close PS;
				return 1;
			}
			else
			{
				close PS;
				return 0;
			}
		}
	}

	close PS;
	return 0;
}

#===============================================================================
# Name:
#	ASK
# Description:
#	ASK takes as an argument a list containing two or more elements:
#	The first element is a question to ask the user and the rest of
#	the elements are the possible choices. It loops until it gets
#	one of the possibilities, then returns the user's selection.
#	If the second element of the list is empty, it loops until the
#	user enters *something* and then returns it.
#	For good form, pass the list of possible choices as part of
#	the question string so that it's visible to the user.
#===============================================================================

sub ASK(@)
{
	my $i;

	print $_[0];

	while(<STDIN>)
	{
		chomp;

		if(($_)&&(!($_[1])))
		{
			return $_;
		}

		if($_)
		{
			for($i=1;$i<=$#_;$i++)
			{
				if($_[$i] eq $_)
				{
					return $_;
				}
			}
		}

		print "Invalid response\n$_[0]";
	}
}

#===============================================================================
# Name:
#	AskNumber
# Description:
#	Asks about number
# Input parameters:
#	Same as for ASK
# Return value:
#	Returns number.
#===============================================================================

sub AskNumber(@)
{
	my @Arguments=$_[0];
	my $value="";

	my $done=0;

	while ( !$done )
	{
		$value=ASK(@Arguments);

		# verify format
		if ( $value =~ /\D/)
		{
			print "Invalid input, should be a number.\n";
			next;
		}

		$done=1;
	}

	return $value;
}

#===============================================================================
# Name:
#	AskHostname
# Description:
#	Asks about hostname
# Input parameters:
#	Same as for ASK
# Return value:
#	Returns hostname.
#===============================================================================

sub AskHostname(@)
{
	my @Arguments=$_[0];
	my $value="";

	my $done=0;

	while ( !$done )
	{
		$value=ASK(@Arguments);

		my $VerboseMode=1;

		if (VerifyHostname($value,$VerboseMode) == 0)
		{
			next;
		}

		$done=1;
	}

	return $value;
}

#===============================================================================
# Name:
#	AskIPAddress
# Description:
#	Asks about IP address
# Input parameters:
#	Same as for ASK plus IP address type ($IPAddrressType_v4 or $IPAddrressType_v6)
# Return value:
#	Returns IP address.
#===============================================================================

sub AskIPAddress($$)
{
	my $Argument=$_[0];
	my $IPAddressType=$_[1];
	my $value="";

	my $done=0;

	while ( !$done )
	{
		$value=ASK($Argument);

		# verify format
		if ($IPAddressType == $IPAddrressType_v4)
		{
			if (IsValidIPAddress($value) == 0)
			{
				print "Invalid input, should be an IPv4 address.\n";
				next;
			}
		}
		elsif ($IPAddressType == $IPAddrressType_v6)
		{
			if (IsValidIPv6Address($value) == 0)
			{
				print "Invalid input, should be an IPv6 address.\n";
				next;
			}
		}
		else
		{
			print "Invalid IP address type.\n";
			next;
		}

		$done=1;
	}

	return $value;
}

#===============================================================================
# Name:
#	ASK_Confirm
# Description:
#	Asks about value with confirmation (useful for passwords)
# Input parameters:
#	Same as for ASK
#	Confirmation argument
# Return value:
#	Returns confirmed value.
#===============================================================================

sub ASK_Confirm(\@\@)
{
	my $ref_Arguments=$_[0];
	my @Arguments=@{$ref_Arguments};
	my $ref_ArgumentsConfirm=$_[1];
	my @ArgumentsConfirm=@{$ref_ArgumentsConfirm};
	my $value="";

	my $done=0;

	while ( !$done )
	{
		$value=ASK(@Arguments);
		my $value_confirm=ASK(@ArgumentsConfirm);

		if ( $value ne $value_confirm)
		{
			print "\nInvalid input, should be a matched value.\n";
			next;
		}

		$done=1;
	}

	return $value;
}

#===============================================================================
# Name:
#	ASKNULL
# Description:
#	ASKNULL takes as its argument a question to ask the user and returns
#	the response. It performs no input checks and will accept null input.
#===============================================================================

sub ASKNULL($)
{
	print $_[0];

	while(<STDIN>)
	{
		chomp;
		return $_;
	}
}

#===============================================================================
# Name:
#	AskNullNumber
# Description:
#	Asks about empty value or number
# Input parameters:
#	Same as for ASKNULL
# Return value:
#	Returns empty value or number.
#===============================================================================

sub AskNullNumber($)
{
	my $Argument=$_[0];
	my $value="";

	my $done=0;

	while ( !$done )
	{
		$value=ASKNULL($Argument);

		if ($value ne "")
		{
			# verify format
			if ( $value =~ /\D/)
			{
				print "Invalid input, should be empty value or a number.\n";
				next;
			}
		}

		$done=1;
	}

	return $value;
}

#===============================================================================
# Name:
#	AskNullIPAddress
# Description:
#	Asks about empty value or IP address
# Input parameters:
#	Same as for ASKNULL plus IP address type ($IPAddrressType_v4 or $IPAddrressType_v6)
# Return value:
#	Returns empty value or IP address.
#===============================================================================

sub AskNullIPAddress($$)
{
	my $Argument=$_[0];
	my $IPAddressType=$_[1];
	my $value="";

	my $done=0;

	while ( !$done )
	{
		$value=ASKNULL($Argument);

		if ($value ne "")
		{
			# verify format
			if ($IPAddressType == $IPAddrressType_v4)
			{
				if (IsValidIPAddress($value) == 0)
				{
					print "Invalid input, should be empty value or an IPv4 address.\n";
					next;
				}
			}
			elsif ($IPAddressType == $IPAddrressType_v6)
			{
				if (IsValidIPv6Address($value) == 0)
				{
					print "Invalid input, should be empty value or an IPv6 address.\n";
					next;
				}
			}
			else
			{
				print "Invalid IP address type.\n";
				next;
			}
		}

		$done=1;
	}

	return $value;
}

#===============================================================================
# Name:
#	ASKNULL_Confirm
# Description:
#	Asks about empty value or not empty value with confirmation (useful for passwords)
# Input parameters:
#	Same as for ASKNULL
#	Confirmation promt
# Return value:
#	Returns empty value or confirmed not empty value.
#===============================================================================

sub ASKNULL_Confirm($$)
{
	my $Argument=$_[0];
	my $ArgumentConfirm=$_[1];
	my $value="";

	my $done=0;

	while ( !$done )
	{
		$value=ASKNULL($Argument);

		if ($value ne "")
		{
			# confirm
			my $value_confirm=ASKNULL($ArgumentConfirm);

			# verify format
			if ( $value ne $value_confirm)
			{
				print "\nInvalid input, should be empty value or matched not empty value.\n";
				next;
			}
		}

		$done=1;
	}

	return $value;
}

#===============================================================================
# Name:
#	ASKDEF
# Description:
#	ASKDEF takes as its first argument the question to ask the user
#	and as its second argument the default response. It does not print
#	the default response for the user, so that should be passed as part
#	of the question string.
#===============================================================================

sub ASKDEF($$)
{
	print $_[0];

	while(<STDIN>)
	{
		chomp;
		if($_)
		{
			return $_;
		}
		else
		{
			return $_[1];
		}
	}
}

#===============================================================================
# Name:
#	AskDefNumber
# Description:
#	AskDefNumber takes as its first argument the question to ask the user
#	and as its second argument the default response. It does not print
#	the default response for the user, so that should be passed as part
#	of the question string.
#	The same as ASKDEF, but controls user input to be a number.
#	If the second argument is not a number, the 0 is returned.
#===============================================================================

sub AskDefNumber($$)
{
	print $_[0];

	while(<STDIN>)
	{
		chomp;
		if($_)
		{
			my $value=$_;

			# verify format
			if ( $value =~ /\D/)
			{
				print "Invalid input, should be a number.\n";
				print $_[0];
				next;
			}

			return $value;
		}
		else
		{
			my $value=$_[1];

			# verify format
			if ( $value =~ /\D/)
			{
				$value=0;
			}

			return $value;
		}
	}
}

#===============================================================================
# Name:
#	AskDefHostname
# Description:
#	AskDefHostname takes as its first argument the question to ask the user
#	and as its second argument the default response. It does not print
#	the default response for the user, so that should be passed as part
#	of the question string.
#	The same as ASKDEF, but controls user input to be a hostname.
#	If the second argument is not a hostname, the "" is returned.
#===============================================================================

sub AskDefHostname($$)
{
	print $_[0];

	while(<STDIN>)
	{
		chomp;
		if($_)
		{
			my $value=$_;
			my $VerboseMode=1;

			if (VerifyHostname($value,$VerboseMode,$_[0]) == 0)
			{
				next;
			}

			return $value;
		}
		else
		{
			my $value=$_[1];
			my $VerboseMode=0;

			if (VerifyHostname($value,$VerboseMode) == 0)
			{
				$value="";
			}

			return $value;
		}
	}
}

#===============================================================================
# Name:
#	GETHOSTNAME
# Description:
#	GETHOSTNAME tries two different methods to read the hostname, then
#	asks for user input. It assumes that the FQDN is not wanted.
#===============================================================================

sub GETHOSTNAME()
{
	my $temp;
	my $hostname;
	my $hn;
	local *UNAME;

	open UNAME, "$HOSTNAME |";

	while(<UNAME>)
	{
		chomp ($temp=$_);
	}

	close UNAME;

	if (!$temp)
	{
		open UNAME, "$UNAME -n |";

		while (<UNAME>)
		{
			chomp ($temp=$_);
		}

		close UNAME;
	}

	($hostname)=split /\./, $temp;  #clip off unneeded parts of FQDN

	if (Get_silent_mode() == 1)
	{
		$LocalHostname=$hostname;
		return $hostname;
	}

	if($hostname)
	{
		my $done=0;

		while ( !$done )
		{
			print "\nPlease enter the hostname or press enter for \"$hostname\" =>";
			$_=<STDIN>;
			chomp;

			if(!($_))
			{
				$LocalHostname=$hostname;
				return $hostname;
			}
			else
			{
				# verify format
				my $value=$_;

				my $VerboseMode=1;

				if (VerifyHostname($value,$VerboseMode) == 0)
				{
					next;
				}

				($hostname)=split /\./, $value;  # again, clip FQDN if user entered one
				$LocalHostname=$hostname;
				return $hostname;
			}
		}
	}

	print "\nUnable to determine the hostname of this machine.\n";
	$hn=ASK "Please enter it =>";
	($hostname)=split /\./, $hn;  # clip FQDN
	$LocalHostname=$hostname;
	return $hostname;
}

#===============================================================================
# Name:
#	GETDOMAINNAME
# Description:
#	GETDOMAINNAME attempts to find the DNS domainname and if it can't
#	it asks the user to enter it.
#===============================================================================

sub GETDOMAINNAME()
{
	my ($domain, $dom);
	local *DOM;

	open(DOM, "$HOSTNAME |");

	$domain=<DOM>;
	chomp $domain;
	$domain=~s/^[^.]+.//;

	close DOM;

	if ($domain)
	{
		$Domain=$domain;
		return $domain;
	}
	else
	{
		open(DOM, "$UNAME -n |");

		$domain=<DOM>;
		chomp $domain;
		$domain=~s/^[^.]+.//;

		close DOM;

		if ($domain)
		{
			$Domain=$domain;
			return $domain;
		}
		else
		{
			open(DOM, "$HOSTNAME |");
			my $hostname=<DOM>;
			close DOM;
			chomp $hostname;

			my $Result=GetDomainNameNslookup($hostname,\$domain);

			if ($Result == 1)
			{
				$Domain=$domain;
				return $domain;
			}
			else
			{
				$Result = open(DOM, "/etc/resolv.conf");

				if (defined($Result))
				{
					my $domain_value=undef;
					my $search_value=undef;

					while (<DOM>)
					{
						my $current_string = $_;
						$current_string =~ s/\r\n|\n\r|\n|\r//;

						if ($current_string =~ /domain/)
						{
							$current_string =~ /\A\s*domain\s+(\S+)/;
							$domain_value = $1;
						}

						if ($current_string =~ /search/)
						{
							$current_string =~ /\A\s*search\s+(\S+)/;
							$search_value = $1;
						}
					}

					close DOM;

					if (defined($domain_value))
					{
						$domain=$domain_value;
					}
					else
					{
						if (defined($search_value))
						{
							$domain=$search_value;
						}
						else
						{
							$domain=undef;
						}
					}
				}

				if (!$domain)
				{
					my $Result=GetDomainName($LocalHostname,\$domain);

					if ($Result == 0)
					{
						$domain=undef;
					}
				}

				if (Get_silent_mode() == 1)
				{
					$Domain=$domain;
					return $domain;
				}

				if ($domain)
				{
					$Domain=$domain;
					return $domain;
				}
				else
				{
					$domain = "";

					while($domain !~ /\w+\.\w+/)
					{
						print "\nUnable to determine the domain name for this machine\n";
						$domain=ASK "Please enter it =>";
					}

					$Domain=$domain;
					return $domain;
				}
			}
		}
	}
}

#===============================================================================
# Name:
#	PARSEINI
# Description:
#	PARSEINI takes as its first argument the INI filename and as its
#	second argument the section name without braces and returns the
#	key/value pairs of that section in a hash. It assumes that the
#	section name passed to it only appears once in the file. If the INI
#	file doesn't exist, it returns a undefined hash.
#	Third optional argument defines set of characters used for distinguishing
#	comments (used as /^[$comments_characters]/).
#	Fourth optional argument defines usage of case-insensitive comparison for
#	section names. "ci_mode" value is used for case-insensitive comparison, if
#	value is not defained or not equal to "ci_mode" value, the comparison is
#	case-insensitive
#===============================================================================

our $case_insensitive_mode=1;
our $case_sensitive_mode=2;

sub PARSEINI($$;$$)
{
	my %temp;
	my $INIFILE=$_[0];
	my $left;
	my $right;
	local *INI;

	if (! -e $INIFILE)
	{
		return ();
	}

	open INI, $INIFILE or return (retcode => 1);

	my $section_string = "[" . $_[1] . "]";

	# check presence of optional argument
	my $comments_index=2;
	my $discard_comments=0;
	my $comments_characters="";

	if (($#_ >= $comments_index) && defined($_[$comments_index]))
	{
		$discard_comments=1;
		$comments_characters=$_[$comments_index];
	}

	# check presence of optional argument
	my $case_insensitive_comparison_index=3;
	my $case_insensitive_comparison=0;

	if (($#_ >= $case_insensitive_comparison_index) && defined($_[$case_insensitive_comparison_index]))
	{
		if ($_[$case_insensitive_comparison_index] == $case_insensitive_mode)
		{
			$case_insensitive_comparison=1;
		}
	}

	while (<INI>)
	{
		my $current_string = $_;
		$current_string =~ s/\r\n|\n\r|\n|\r//;

		if ($case_insensitive_comparison == 1)
		{
			next if(!("\L$current_string\E" eq "\L$section_string\E"));
		}
		else
		{
			next if(!($current_string eq $section_string));
		}

		while((!eof INI) && !(($_=<INI>)=~/^\[.*\]/))
		{
			s/\r\n|\n\r|\n|\r//;  # remove various ends of line

			if ($discard_comments == 1)
			{
				my $line=$_;

				if (!($line =~ /^[$comments_characters]/))
				{
					if (($line =~ /=/))
					{
						($left, $right)=split /=/, $line, 2;
						$temp{$left}=$right;
					}
				}
			}
			else
			{
				($left, $right)=split /=/, $_;
				$temp{$left}=$right;
			}
		}
	}

	close INI;
	return %temp;
}

#===============================================================================
# Name:
#	ENUMINI
# Description:
#	ENUMINI takes as its argument the INI filename and prints list of
#	all sections, except ___general___, then asks the user to select one
#	of the sections. It returns the name of the section without square
#	brackets. If it can't read any sections, it returns undefined scalar.
#===============================================================================

sub ENUMINI($)
{
	my @temp;
	my $array_size=0;
	my ($j,$jj);
	my $INIFILE=$_[0];
	local *INI;
	my $Debug=0;
	my $SectionName="";

	if (! -e $INIFILE)
	{
		return undef;
	}

	open INI, $INIFILE;

	while(<INI>)
	{
		next if /$WizardIniFile_GeneralSection/;

		if(m/\[.*\]/)
		{
			s/\r\n|\n\r|\n|\r//;  # remove various ends of line
			$temp[$array_size]=$_;
			$array_size++;
		}
	}

	close INI;

	if ($array_size == 0)
	{
		# return undef if it didn't work
		return undef;
	}

	if ($Application_host_filtering == 1)
	{
		my @filtered_applications=();
		my $Result = FilterApplications($INIFILE,@temp,@filtered_applications);

		if ($Result == 1)
		{
			@temp = @filtered_applications;
			$array_size=scalar @temp;

			if ($array_size == 0)
			{
				# return undef if it didn't work

				if ($Debug == 1)
				{
					print "no filtering results\n";
				}

				return undef;
			}
		}
		else
		{
			return undef;
		}
	}

	if ($Debug == 1)
	{
		print "filtering results\n";
	}

	if (Get_silent_mode() == 0)
	{
		my $array_size=scalar @temp;

		if (($SingleAppInIniFileProcessing == 1) && ($array_size == 1))
		{
			$temp[0]=~s/^\[|\]$//g;  # clip off brackets, if any
			$SectionName=$temp[0];
		}
		else
		{
			my @sorted=sort @temp;
			@temp = @sorted;

			print "\nPlease select which application to install: \n";

			for($j=0;$j<$array_size;$j++)
			{
				$jj = $j+1;
				print "$jj : $temp[$j]\n";
			}

			print "=>";
			$_=<STDIN>;
			chomp;

			while(!(IsNumberOrNotEmptyDigitString($_) && ($_>=1) && ($_<=$array_size)))
			{
				print "Please choose one of the above.\n=>";
				$_=<STDIN>;
				chomp;
			}

			$temp[$_-1]=~s/^\[|\]$//g;  # clip off brackets, if any
			$SectionName=$temp[$_-1];
		}
	}
	else
	{
		if ($array_size == 1)
		{
			$SectionName=$temp[0];
			$SectionName=~s/^\[|\]$//g;  # clip off brackets, if any
		}
		else
		{
			$SectionName=undef;
		}
	}

	return $SectionName;
}

#===============================================================================
# Name:
#	READCFGSERV
# Description:
#	READCFGSERV takes one argument: the string to use to call $CFGUTIL.
#	It returns a hash containing the return code of the invocation
#	under the key "retcode" as well as the key-value pairs that $CFGUTIL
#	returns. This scheme will fail if "retcode" is a field returned by
#	the call. I currently know of no cases in which this happens.
#===============================================================================

sub READCFGSERV($)
{
	my $name;
	my $value;
	my %temp;
	local *CFG;

	#print "\n*** before call to cfgutility, parameters=$_[0]\n";

	open CFG, "$CFGUTIL $_[0] |";

	#print "*** after call to cfgutility\n\n";

	while(<CFG>)
	{
		next if (!($_=~/=/));
		chomp;

		if($_)
		{
			($name, $value)=split /=/;
			$temp{$name}=$value;
		}
	}

	close CFG;
	$temp{retcode}=($? >> 8);  # get the bits we want and stuff 'em in the hash
	return %temp;
}

#===============================================================================
# Name:
#	READCFGSERV_EX
# Description:
#	READCFGSERV_EX takes one argument: the string to use to call $CFGUTIL.
#	It returns a hash containing the return code of the invocation
#	under the key "retcode" as well as the key-value pairs that $CFGUTIL
#	returns. This scheme will fail if "retcode" is a field returned by
#	the call. I currently know of no cases in which this happens.
#	The same as READCFGSERV, but enables to have "=" in value.
#===============================================================================

sub READCFGSERV_EX($)
{
	my $name;
	my $value;
	my %temp;
	local *CFG;

	open CFG, "$CFGUTIL $_[0] |";

	while(<CFG>)
	{
		next if (!($_=~/=/));
		chomp;

		if($_)
		{
			my @array = split /=/;
			$name = $array[0];
			my $value = "";

			for (my $i = 1; $i <= $#array; $i++)
			{
				$value = $value . $array[$i];

				if ($i != $#array)
				{
					$value = $value . "=";
				}
			}

			$temp{$name}=$value;
		}
	}

	close CFG;
	$temp{retcode}=($? >> 8);  # get the bits we want and stuff 'em in the hash
	return %temp;
}

#===============================================================================
# Name:
#	CFGSERVERR
# Description:
#	CFGSERVERR takes as an argument the return code of $CFGUTIL and returns
#	the error string. If the error string comes back as "Code 'undefined'"
#	that means there is no such error code.
#===============================================================================

sub CFGSERVERR($)
{
	return `$CFGUTIL -e $_[0]`;
}

#===============================================================================
# Name:
#	ENUMAPPSLIST
# Description:
#	ENUMAPPSLIST prints a list of applications from the config server,
#	then asks the user to select one of them. It takes as an argument
#	the command line for cfgutility. It returns the name of the application
#	the user selected. If the read from the config server fails it
#	returns undefined scalar.
#===============================================================================

sub ENUMAPPSLIST($)
{
	my (@temp, @sorted);
	@temp = ();
	@sorted = ();
	my $i=0;
	my $value;
	my $waste;
	my $j;
	my $jj;
	local *CFG;

	open CFG, "$CFGUTIL $_[0] |";

	while(<CFG>)
	{
		if(m/^name=/)
		{
			chomp;
			($waste, $value)=split /=/;
			$temp[$i]=$value;
			$i++;
		}
	}

	close CFG;

	if($?!=0)
	{
		# return undef if it didn't work
		return undef;
	}

	my $AppName="";

	if (Get_silent_mode() == 0)
	{
		@sorted=sort @temp;
		print "\nPlease choose which application to install:\n";

		for($j=0;$j<$i;$j++)
		{
			$jj = $j+1;
			print "$jj : $sorted[$j]\n";
		}

		print "=>";
		$_=<STDIN>;
		chomp;

		while(!(IsNumberOrNotEmptyDigitString($_) && ($_>=1) && ($_<=$i)))
		{
			print "Please choose one of the above.\n=>";
			$_=<STDIN>;
			chomp;
			print "$_\n";
		}

		$AppName=$sorted[$_-1];
	}
	else
	{
		my $array_size=scalar @temp;

		if ($array_size == 1)
		{
			$AppName=$temp[0];
		}
		else
		{
			$AppName=undef;
		}
	}

	return $AppName;
}

#===============================================================================
# Name:
#	BACKUPDIR
# Description:
#	BACKUPDIR takes as its argument the path to the directory to back up.
#	It prompts the user either to back up or overwrite. If the user chooses to back up
#	It creates a directory starting with "backup" and with time and date
#	inside the directory passed as an argument and moves all files into it.#
#	Calls callback function if set.
#
#	It returns 1 on success and 0 on failure.
#===============================================================================

my $BACKUPDIR_CallbackPackage=undef;
my $BACKUPDIR_CallbackFunction=undef;

my $BACKUPDIR_Callback_Init_Package=undef;
my $BACKUPDIR_Callback_Init_Function=undef;

our $BACKUPDIR_action_backup=1;
our $BACKUPDIR_action_overwrite=2;
our $BACKUPDIR_action_wipe=3;

my $BACKUPDIR_action=undef;

sub BACKUPDIR($)
{
	local *DH;
	my @fnames;
	my $fname;
	my @tt;
	my $cwd=`$PWD`;
	my $action;

	chomp $cwd;
	if(!$cwd)
	{
		return 0;
	}

	chdir "$_[0]" || return 0;
	opendir DH, "." or return 0;
	@fnames=readdir DH;
	closedir DH;

	if($#fnames<=1)
	{
		# case where directory is empty
		chdir $cwd;
		return 1;
	}
	else
	{
		# call callback function

		if ($BACKUPDIR_Callback_Init_Package && $BACKUPDIR_Callback_Init_Function)
		{
			my $Directory=$_[0];
			$BACKUPDIR_Callback_Init_Package->$BACKUPDIR_Callback_Init_Function($Directory);
		}

		if (Get_silent_mode() == 0)
		{
			# case where directory has files
			print "\nThe target install directory $_[0]\n";
			print "has files in it. Please select an action to perform:\n";
			print "1. Back up all files in the directory\n";
			print "2. Overwrite only the files contained in this package\n";
			print "3. Wipe the directory clean\n";
			$action=ASK("1, 2, or 3 =>", 1, 2, 3);
		}
		else
		{
			$action=$BACKUPDIR_action_backup;
		}

		$BACKUPDIR_action = $action;

		# call callback function

		if ($BACKUPDIR_CallbackPackage && $BACKUPDIR_CallbackFunction)
		{
			my $Directory=$_[0];
			$BACKUPDIR_CallbackPackage->$BACKUPDIR_CallbackFunction($Directory,$action);
		}

		if($action==$BACKUPDIR_action_backup)
		{
			@tt=localtime(time);
			my $backup=sprintf("backup_%.4d-%.2d-%.2d_%.2d-%.2d-%.2d",(1900+$tt[5]),($tt[4]+1),$tt[3],$tt[2],$tt[1],$tt[0]);

			if ( (! -d $_[0]) || (! -w $_[0]) )
			{
				chdir $cwd;
				return 0;
			}

			mkdir "$_[0]/$backup", 0700 || return 0;

			foreach $fname (@fnames)
			{
				next if ( ($fname eq ".") || ($fname eq "..") || ($fname eq $backup) );
				system "$MV \"$fname\" \"$backup\"";

				if ($?!=0)
				{
					chdir $cwd;
					return 0;
				}
			}
		}
		elsif($action==$BACKUPDIR_action_wipe)
		{
			chdir $cwd || return 0;
			print "Are you sure you wish to ERASE ALL FILES\n";

			if ( ASK("in $_[0] (y/n)", "y", "n") eq "y")
			{
				system("$RM -rf \"$_[0]\"");

				if ($?!=0)
				{
					print "Unable to remove $_[0]\n";
					return 0;
				}

				system("$MKDIR \"$_[0]\"");

				if ($?!=0)
				{
					print "Unable to create $_[0]\n";
					return 0;
				}
			}
			else
			{
				print "Not removing...\n";
				chdir $cwd;
				return 0;
			}
		}

		chdir $cwd || return 0;
		return 1;
	}

	chdir $cwd; # shouldn't reach here
	return 0;
}

#===============================================================================
# Name:
#	BACKUPDIR_SetCallback
# Description:
#	Sets callback info for BACKUPDIR function.
#
#	Returns 1.
#===============================================================================

sub BACKUPDIR_SetCallback($$)
{
	my $CallbackPackage=$_[0];
	my $CallbackFunction=$_[1];

	$BACKUPDIR_CallbackPackage=$CallbackPackage;
	$BACKUPDIR_CallbackFunction=$CallbackFunction;

	return 1;
}

#===============================================================================
# Name:
#	BACKUPDIR_SetCallback_Init
# Description:
#	Sets callback info for BACKUPDIR function.
#
#	Returns 1.
#===============================================================================

sub BACKUPDIR_SetCallback_Init($$)
{
	my $CallbackPackage=$_[0];
	my $CallbackFunction=$_[1];

	$BACKUPDIR_Callback_Init_Package=$CallbackPackage;
	$BACKUPDIR_Callback_Init_Function=$CallbackFunction;

	return 1;
}

#===============================================================================
# Name:
#	IsOverwriteMode
# Description:
#	Sets callback info for BACKUPDIR function.
# Input parameters:
#	None.
# Return value:
#	Returns 1 when $BACKUPDIR_action_overwrite was selected, 0 otherwise,
#===============================================================================

sub IsOverwriteMode()
{
	if (defined($BACKUPDIR_action) && ($BACKUPDIR_action == $BACKUPDIR_action_overwrite))
	{
		return 1;
	}

	return 0;
}

#===============================================================================
# Name:
#	PREPTARGET
# Description:
#	PREPTARGET preps the target directory. It accepts the default directory
#	as its argument. It checks if the directory already exists. If it does,
#	it asks the user to confirm making a backup. If not, it creates the directory.
#	If it's not able to create the directory, it gives an error and asks
#	for a new directory. It returns the successfully created directory.
#	It won't allow overwrite of the current working directory. This is
#	accomplished by comparing the source and destination paths. That doesn't
#	always work (e.g. symbolic links), so it also creates a temporary file
#	and tests for its presence in the destination directory.
#	The second optional argument is read-only flag for default directory, which
#	means that user can't change the default directory, but can cancel intallation.
#	The read-only flag is specified as "TRUE", all other values are treated as
#	"FALSE".
#===============================================================================

my $PREPTARGET_CallbackPackage=undef;
my $PREPTARGET_CallbackFunction=undef;

sub PREPTARGET(;$$)
{
	my $TargetDir="";
	my $newtd;
	my $cwd=`$PWD`;
	local *LOCK;

	chomp $cwd;

	# create the temporary file
	open LOCK, ">$LOCKFILE" or print "Couldn't create lock file: $!\n";
	close LOCK;

	if ($#_ > -1)
	{
		$TargetDir=$_[0];
	}

	if (!defined($TargetDir))
	{
		$TargetDir="";
	}

	# determine if we can change default directory
	my $can_change_dir = 1;

	if ($#_ == 1)
	{
		if ($_[1] eq "TRUE")
		{
			$can_change_dir = 0;
		}
	}

	# the next bit makes sure it's a full path and doesn't use ~, ., or ..

	if (!IsValidPath($TargetDir))
	{
		$TargetDir="";  # Kills default path if it's invalid
	}

BEGIN:
	if ($TargetDir)
	{
		if ($can_change_dir == 1)
		{
			if (Get_silent_mode() == 0)
			{
				print "\nPress ENTER to confirm $TargetDir as\n";
				print "the destination directory or enter a new one =>";
				$newtd=<STDIN>;
				chomp $newtd;

				if ($newtd)
				{
					$TargetDir=$newtd
				}
			}
			else
			{
				# keep directory
			}
		}
		else
		{
			if (Get_silent_mode() == 0)
			{
				print "\nPlease confirm that it is acceptable to use\n";
				print "$TargetDir\n";
				print "directory as destination directory.\n";
				print "If it is not acceptable you can stop setup now\n";
				print "by entering \"n\".\n\n";

				if((install_common::ASK("Do you wish to continue (y/n)?","y","n")) eq "n")
				{
					unlink $LOCKFILE;
					die "Exiting install.\n";
				}
			}
			else
			{
				# use directory
			}
		}

		if (Get_silent_mode() == 1)
		{
			# read $Silent_response_file_DataModel_key_name

			my %IniSectionData=();
			my $Filepath = install_common::Get_silent_mode_response_file_path();

			if (!-f $Filepath)
			{
				my $Message="File $Filepath was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			%IniSectionData=install_common::PARSEINI($Filepath,$Silent_response_file_IPCommon_section_name,$install_common::comments_characters);

			if (!%IniSectionData)
			{
				my $Message="Section $Silent_response_file_IPCommon_section_name was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			%Silent_IPCommon_info = %IniSectionData;

			if ($Standard_InstallPathInSilentMode_support == 1)
			{
				my $value=$IniSectionData{$Silent_response_file_InstallPath_key_name};

				if (!defined($value))
				{
					# $Silent_response_file_InstallPath_key_name is optional
					#my $Message="Key $Silent_response_file_InstallPath_key_name in section $Silent_response_file_IPCommon_section_name was not found.";
					#install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);

					# keep directory
				}
				else
				{
					# get priority to $Silent_response_file_InstallPath_key_name
					$TargetDir=$value;
				}
			}
		}
	}
	else
	{
		if (Get_silent_mode() == 0)
		{
			$TargetDir=ASK "\nPlease enter full path of the destination directory for installation =>";
		}
		else
		{
			my %IniSectionData=();
			my $Filepath = install_common::Get_silent_mode_response_file_path();

			if (!-f $Filepath)
			{
				my $Message="File $Filepath was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			%IniSectionData=install_common::PARSEINI($Filepath,$Silent_response_file_IPCommon_section_name,$install_common::comments_characters);

			if (!%IniSectionData)
			{
				my $Message="Section $Silent_response_file_IPCommon_section_name was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			my $value=$IniSectionData{$Silent_response_file_InstallPath_key_name};

			if (!defined($value))
			{
				if ($Standard_InstallPathInSilentMode_support == 1)
				{
					# $Silent_response_file_InstallPath_key_name is optional
				}
				else
				{
					my $Message="Key $Silent_response_file_InstallPath_key_name in section $Silent_response_file_IPCommon_section_name was not found.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}
			}
			else
			{
				$TargetDir=$value;
			}

			%Silent_IPCommon_info = %IniSectionData;
		}
	}

	# the next bit makes sure it's a full path and doesn't use ~, ., or ..

	if (!IsValidPath($TargetDir))
	{
		if (Get_silent_mode() == 0)
		{
			print "Invalid path. Please enter a full path name.\n";
			$TargetDir="";
			goto BEGIN;  # path invalid
		}
		else
		{
			if ($Standard_InstallPathInSilentMode_support == 1)
			{
				my $Message="Key $Silent_response_file_InstallPath_key_name in section $Silent_response_file_IPCommon_section_name is missing or it has invalid value.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
			else
			{
				my $Message="Invalid value of key $Silent_response_file_InstallPath_key_name in section $Silent_response_file_IPCommon_section_name.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}

	# these bits prevent the user from overwriting the current directory

	if ( ($TargetDir eq $cwd) || (-e "$TargetDir/$LOCKFILE") )
	{
		if (Get_silent_mode() == 0)
		{
			print "The destination directory cannot be the same as the directory\n";
			print "from which this script is being run.\n\n";
			$TargetDir="";
			goto BEGIN;  # path invalid
		}
		else
		{
			my $Message="The destination directory cannot be the same as the directory from which this script is being run.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}

	if (! (-e $TargetDir) )
	{
		if (Get_silent_mode() == 0)
		{
			system("$MKDIR \"$TargetDir\"");
		}
		else
		{
			system("$MKDIR \"$TargetDir\" >/dev/null 2>&1");
		}

		if($? != 0)
		{
			if (Get_silent_mode() == 0)
			{
				print "Unable to create $TargetDir\n";
				$TargetDir="";
				goto BEGIN;
			}
			else
			{
				my $Message="Unable to create $TargetDir";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}
	else
	{
		if (! (-d $TargetDir) )
		{
			if (Get_silent_mode() == 0)
			{
				print "$TargetDir already exists and isn't a directory.\n";
				$TargetDir="";
				goto BEGIN;
			}
			else
			{
				my $Message="$TargetDir already exists and isn't a directory.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}

		if (! (-w $TargetDir) )
		{
			if (Get_silent_mode() == 0)
			{
				print "Unable to write to $TargetDir\n";
				$TargetDir="";
				goto BEGIN;
			}
			else
			{
				my $Message="Unable to write to $TargetDir";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}

	if (Get_record_mode() == 1)
	{
		my $Filepath = Get_silent_mode_response_file_path();
		my $Result = SetIniFileKeyValue($Filepath,$Silent_response_file_IPCommon_section_name,$Silent_response_file_InstallPath_key_name,$TargetDir);
	}

	#########################################################
	# $TargetDir exists, do some custom actions like backup, upgrade, check free space, etc.
	#########################################################

	# Check free space

	if ($Check_free_space == 1)
	{
		my $Result;
		my ($RequiredSpace,$FreeSpace);

		$Result = GetRequiredSpace($cwd,\$RequiredSpace);

		if ($Result == 1)
		{
			$Result = GetFreeSpace($TargetDir,\$FreeSpace);

			if ($Result == 1)
			{
				if ($FreeSpace < $RequiredSpace)
				{
					if (Get_silent_mode() == 0)
					{
						print "\nThe space required for installation is $RequiredSpace KB,\n";
						print "while $TargetDir directory has only $FreeSpace KB of free space.\n";
						print "Please free required amount of space in $TargetDir directory\n";
						print "or select other directory with required amount of free space.\n";
						$TargetDir="";
						goto BEGIN;
					}
					else
					{
						my $Message="The space required for installation is $RequiredSpace KB, while $TargetDir directory has only $FreeSpace KB of free space.";
						install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
					}
				}
			}
		}
	}

	# other custom actions

	if ($can_change_dir == 1)
	{
		if (BACKUPDIR($TargetDir))
		{
			unlink $LOCKFILE;
			return $TargetDir;
		}
		else
		{
			if (Get_silent_mode() == 0)
			{
				print "Couldn't back up $TargetDir\n";
				$TargetDir="";
				goto BEGIN;  # remove unsuccessful
			}
			else
			{
				my $Message="Couldn't back up $TargetDir";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}
	else
	{
		unlink $LOCKFILE;

		# use "2. Overwrite only the files contained in this package" option

		# call callback function

		if ($PREPTARGET_CallbackPackage && $PREPTARGET_CallbackFunction)
		{
			$PREPTARGET_CallbackPackage->$PREPTARGET_CallbackFunction($TargetDir,$BACKUPDIR_action_overwrite);
		}

		return $TargetDir;
	}
}

#===============================================================================
# Name:
#	GetRequiredSpace
# Description:
#	Gets required space for copying provided directory
# Input parameters:
#	Directory path.
#	Reference to variable containg required space value
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub GetRequiredSpace($$)
{
	my $Directory=$_[0];
	my $ref_Space=$_[1];
	my $Result=0;
	local *DU;

	$$ref_Space = 0;
	open DU, "$DU -ks $Directory |" or return $Result;

	while(<DU>)
	{
		my $line=$_;
		Trim(\$line);

		my @elements = split(/\s+/, $line);
		my $size=scalar @elements;

		if ($size < 1)
		{
			close DU;
			return $Result;
		}

		$$ref_Space = $elements[0];
		$Result=1;
		last;
	}

	close DU;
	return $Result;
}

#===============================================================================
# Name:
#	GetFreeSpace
# Description:
#	Gets free space for provided directory
# Input parameters:
#	Directory path.
#	Reference to variable containg free space value
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub GetFreeSpace($$)
{
	my $Directory=$_[0];
	my $ref_Space=$_[1];
	my $Result=0;
	local *DF;

	$$ref_Space = 0;

	open DF, "$DF -k \"$Directory\" |" or return $Result;

	while(<DF>)
	{
		my $line=$_;

		if ($line =~ /%\s+/)
		{
			Trim(\$line);

			my @elements = split(/\s+/, $line);
			my $size=scalar @elements;

			if (($size != 6) && ($size != 5))
			{
				close DF;
				return $Result;
			}

			if ($size == 6)
			{
				$$ref_Space = $elements[3];
			}
			else
			{
				$$ref_Space = $elements[2];
			}

			$Result=1;
			last;
		}
	}

	close DF;
	return $Result;
}

#===============================================================================
# Name:
#	PREPTARGET_SetCallback
# Description:
#	Sets callback info for PREPTARGET function.
#
#	Returns 1.
#===============================================================================

sub PREPTARGET_SetCallback($$)
{
	my $CallbackPackage=$_[0];
	my $CallbackFunction=$_[1];

	$PREPTARGET_CallbackPackage=$CallbackPackage;
	$PREPTARGET_CallbackFunction=$CallbackFunction;

	return 1;
}

#===============================================================================
# Name:
#	Record_BITS
# Description:
#	Record BITS value.
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub Record_BITS($)
{
	my $bits=$_[0];
	my $Result=0;

	if (Get_record_mode() == 1)
	{
		if (($bits == 32) || ($bits == 64))
		{
			my $Filepath = Get_silent_mode_response_file_path();
			$Result = SetIniFileKeyValue($Filepath,$Silent_response_file_IPCommon_section_name,$Silent_response_file_DataModel_key_name,$bits);
		}
		else
		{
			$Result=1;
		}
	}
	else
	{
		$Result=1;
	}

	return $Result;
}

#===============================================================================
# Name:
#	BITS
# Description:
#	BITS looks in the current working directory for files with names
#	ending in _32 and _64. If it finds both, it prompts the user to select
#	which one to use, 32 or 64, and returns the response. If it finds only one,
#	it returns that one. If it finds neither, it returns 1. If it encounters
#	an error, it returns 0.
#
#	Apr 2002: in the case of AIX v5, the return value is always 32 if there exists
#	a file with a name ending in _32. If none is found, the return value is 1.
#
# Input parameters:
#	Command line (optional)
#===============================================================================

sub BITS(;$)
{
	my @files32;
	my @files64;
	my $bits;
	local *DH1;

	my $platform = FINDPLAT;
	my $ver = FINDPLATVER;

	opendir DH1, "." or return 0;
	@files32=grep /_32$/, readdir DH1;
	return 0 if $?;
	rewinddir DH1;
	@files64=grep /_64$/, readdir DH1;
	return 0 if $?;
	closedir DH1;

	if ($AIX_64_bit_mode_support == 1)
	{
		# standard processing
	}
	else
	{
		#	Exception for AIX 5:

		if ( ($platform eq "aix") && ($ver =~ /^5/) )
		{
			if ( $#files32 > -1)
			{
				Record_BITS(32);
				return 32;
			}
			else
			{
				Record_BITS(1);
				return 1;
			}
		}

		#	end of exception for AIX 5
	}

	if ( ($#files32 > -1) && ($#files64 > -1) )
	{
		# check presence of optional argument

		if (defined($_) && ($#_ == 0) && defined($_[$#_]))
		{
			my $COMMLINE = $_[$#_];

			if ($Standard_AspectTServer_AllPlatforms_support == 0)
			{
				#	Exception for Aspect T-Server on Solaris,AIX,HP-UX 64bit platforms:

				if ($COMMLINE eq $Aspect_T_Server_Commad_Line)
				{
					if ( ($platform eq "solaris") || (($platform eq "hpux") && ($Standard_AspectTServer_support == 0) ) ||
						($platform eq "aix"))
					{
						if (Get_silent_mode() == 0)
						{
							if ( ASK("\n$Aspect_T_Server_question (y/n)", "y", "n") eq "y")
							{
								if ( $#files32 > -1)
								{
									Record_BITS(32);
									return 32;
								}
								else
								{
									Record_BITS(1);
									return 1;
								}
							}
						}
						else
						{
							Record_BITS(32);
							return 32;
						}
					}
				}

				#	end of exception for Aspect T-Server on 64bit platforms
			}
		}

		if (Get_silent_mode() == 0)
		{
			my $OS_32_bit=0;

			if ($Standard_64_bit_mode_support == 1)
			{
				# don't allow to install 64-bit modules on 32-bit OS
				my @DirectoriesArray=("/bin","/usr/local/bin","/usr/bin");

				if ($platform eq "solaris")
				{
					my $isainfo_path="";
					$isainfo_path=FINDCOMMAND("isainfo",@DirectoriesArray);

					if ($isainfo_path)
					{
						my $info=`isainfo -b`;
						chomp $info;

						if (defined($info) && (length($info) > 0))
						{
							if ($info eq "32")
							{
								$OS_32_bit=1;

								$bits=32;
								Record_BITS($bits);
								return $bits;
							}
						}
					}
				}
				elsif ($platform eq "osf")
				{
					# should never be here (always 64 bit)
				}
				elsif ($platform eq "hpux")
				{
					my $getconf_path="";
					$getconf_path=FINDCOMMAND("getconf",@DirectoriesArray);

					if ($getconf_path)
					{
						my $info=`getconf KERNEL_BITS`;
						chomp $info;

						if (defined($info) && (length($info) > 0))
						{
							if ($info eq "32")
							{
								$OS_32_bit=1;

								$bits=32;
								Record_BITS($bits);
								return $bits;
							}
						}
					}
				}
				elsif ($platform eq "aix")
				{
					my $info_path="$StartupDirectory/info";

					if (-f $info_path)
					{
						my $info=`$info_path`;
						chomp $info;

						if (defined($info) && (length($info) > 0))
						{
							if ($info eq "32")
							{
								$OS_32_bit=1;

								$bits=32;
								Record_BITS($bits);
								return $bits;
							}
						}
					}
				}
				elsif ($platform eq "linux")
				{
					my $info=`uname -m`;
					chomp $info;

					if (defined($info) && (length($info) > 0))
					{
						if ( !($info =~ "_64"))
						{
							$OS_32_bit=1;

							$bits=32;
							Record_BITS($bits);
							return $bits;
						}
					}
				}
			}

			if ($OS_32_bit == 0)
			{
				print "\nThere are two versions of this product available: 32-bit and 64-bit.\n";
				$bits=ASK "Please enter 32 or 64 to select which version to use =>", "32", "64";
			}
		}
		else
		{
			my $value=$Silent_IPCommon_info{$Silent_response_file_DataModel_key_name};

			if (!defined($value))
			{
				my $Message="Key $Silent_response_file_DataModel_key_name in section $Silent_response_file_IPCommon_section_name was not found.";
				CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			$bits=$value;
		}

		Record_BITS($bits);
		return $bits;
	}
	elsif ( ($#files32 > -1) && (!($#files64 > -1)) )
	{
		Record_BITS(32);
		return 32;
	}
	elsif ( ($#files64 > -1) && (!($#files32 > -1)) )
	{
		Record_BITS(64);
		return 64;
	}
	else
	{
		Record_BITS(1);
		return 1;
	}

	return 0;  # won't reach here
}


#===============================================================================
# Name:
#	DirectoryBITS
# Description:
#	DirectoryBITS looks in the current working directory for main sub-directory
#	and other sub-directories with names ending in _32 and _64. If it finds both,
#	it prompts the user to select which one to use, 32 or 64, and returns the
#	response. If it finds only one, it returns that one. If it finds neither,
#	it returns 1. If it encounters an error, it returns 0.
#
# Input parameters:
#	Main directory name
#	Reference to directories list
#===============================================================================

sub DirectoryBITS($\@)
{
	my $DirectoryName=$_[0];
	my $ref_DirectoriesArray=$_[1];
	my @DirectoriesArray=@{$ref_DirectoriesArray};
	my @files32;
	my @files64;
	my $bits;
	local *DH1;
	my $debug_print=0;

	my $platform = FINDPLAT;
	my $ver = FINDPLATVER;

	opendir DH1, "." or return 0;
	@files32=grep /_32$/, readdir DH1;
	return 0 if $?;
	rewinddir DH1;
	@files64=grep /_64$/, readdir DH1;
	return 0 if $?;
	closedir DH1;

	if ($debug_print == 1)
	{
		print "Typing 32 items:\n";
		for my $elem (@files32)
		{
			print "item= $elem\n";
		}

		print "Typing 64 items:\n";
		for my $elem (@files64)
		{
			print "item= $elem\n";
		}
	}

	my @files=();
	my $CurrentDir=`$install_common::PWD`;
	chomp $CurrentDir;

	# delete files from arrays
	for my $elem (@files32)
	{
		if ($debug_print == 1)
		{
			print "item=$CurrentDir/$elem\n";
		}

		if ( -d "$CurrentDir/$elem" )
		{
			if ($debug_print == 1)
			{
				print "dir\n";
			}

			push(@files,$elem);
		}
	}

	@files32=@files;

	@files=();

	for my $elem (@files64)
	{
		if ($debug_print == 1)
		{
			print "item=$CurrentDir/$elem\n";
		}

		if ( -d "$CurrentDir/$elem" )
		{
			if ($debug_print == 1)
			{
				print "dir\n";
			}

			push(@files,$elem);
		}
	}

	@files64=@files;

	if ($debug_print == 1)
	{
		print "Typing 32 items:\n";
		for my $elem (@files32)
		{
			print "item= $elem\n";
		}

		print "Typing 64 items:\n";
		for my $elem (@files64)
		{
			print "item= $elem\n";
		}
	}

	# remove not-paired elements
	@files=();
	my $suffix32="_32";
	my $suffix64="_64";
	my $basedir;

	for my $elem (@files32)
	{
		($basedir)=($elem =~ /(\S*)$suffix32$/);

		if ($debug_print == 1)
		{
			print "\$basedir=$basedir\n";
		}

		my $target=$basedir.$suffix64;

		my $array_size = scalar grep(/^$target$/, @files64);

		if ( $array_size == 1 )
		{
			if ($debug_print == 1)
			{
				print "$elem\n";
			}

			push(@files,$elem);
		}
	}

	@files32=@files;

	if ($debug_print == 1)
	{
		print "Typing 32 items:\n";
		for my $elem (@files32)
		{
			print "item= $elem\n";
		}
	}

	# remove main directory
	my $target=$DirectoryName.$suffix32;
	@files=grep( !/^$target$/, @files32);

	if ($debug_print == 1)
	{
		print "Typing 32 items:\n";
		for my $elem (@files)
		{
			print "item= $elem\n";
		}
	}

	@{$ref_DirectoriesArray}=@files;

	if ( ($#files32 > -1) && ($#files64 > -1) )
	{
		if (Get_silent_mode() == 0)
		{
			my $OS_32_bit=0;

			if ($Standard_64_bit_mode_support == 1)
			{
				# don't allow to install 64-bit modules on 32-bit OS
				my @DirectoriesArray=("/bin","/usr/local/bin","/usr/bin");

				if ($platform eq "solaris")
				{
					my $isainfo_path="";
					$isainfo_path=FINDCOMMAND("isainfo",@DirectoriesArray);

					if ($isainfo_path)
					{
						my $info=`isainfo -b`;
						chomp $info;

						if (defined($info) && (length($info) > 0))
						{
							if ($info eq "32")
							{
								$OS_32_bit=1;

								$bits=32;
								Record_BITS($bits);
								return $bits;
							}
						}
					}
				}
				elsif ($platform eq "osf")
				{
					# should never be here (always 64 bit)
				}
				elsif ($platform eq "hpux")
				{
					my $getconf_path="";
					$getconf_path=FINDCOMMAND("getconf",@DirectoriesArray);

					if ($getconf_path)
					{
						my $info=`getconf KERNEL_BITS`;
						chomp $info;

						if (defined($info) && (length($info) > 0))
						{
							if ($info eq "32")
							{
								$OS_32_bit=1;

								$bits=32;
								Record_BITS($bits);
								return $bits;
							}
						}
					}
				}
				elsif ($platform eq "aix")
				{
					my $info_path="$StartupDirectory/info";

					if (-f $info_path)
					{
						my $info=`$info_path`;
						chomp $info;

						if (defined($info) && (length($info) > 0))
						{
							if ($info eq "32")
							{
								$OS_32_bit=1;

								$bits=32;
								Record_BITS($bits);
								return $bits;
							}
						}
					}
				}
				elsif ($platform eq "linux")
				{
					my $info=`uname -m`;
					chomp $info;

					if (defined($info) && (length($info) > 0))
					{
						if ( !($info =~ "_64"))
						{
							$OS_32_bit=1;

							$bits=32;
							Record_BITS($bits);
							return $bits;
						}
					}
				}
			}

			if ($OS_32_bit == 0)
			{
				print "\nThere are two versions of this product available: 32-bit and 64-bit.\n";
				$bits=ASK "Please enter 32 or 64 to select which version to use =>", "32", "64";
			}
		}
		else
		{
			my $value=$Silent_IPCommon_info{$Silent_response_file_DataModel_key_name};

			if (!defined($value))
			{
				my $Message="Key $Silent_response_file_DataModel_key_name in section $Silent_response_file_IPCommon_section_name was not found.";
				CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			$bits=$value;
		}

		Record_BITS($bits);
		return $bits;
	}
	elsif ( ($#files32 > -1) && (!($#files64 > -1)) )
	{
		Record_BITS(32);
		return 32;
	}
	elsif ( ($#files64 > -1) && (!($#files32 > -1)) )
	{
		Record_BITS(64);
		return 64;
	}
	else
	{
		Record_BITS(1);
		return 1;
	}

	return 0;  # won't reach here
}

#===============================================================================
# Name:
#	GetOSDataModel
# Description:
#	Gets OS data model: 32 or 64 bit.
# Input parameters:
#	Reference to OS data model. Is set to 32,64 on success or to 0 on failure.
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetOSDataModel($)
{
	my $refDataModel=$_[0];
	$$refDataModel=0;
	my $Result=0;
	my @DirectoriesArray=("/bin","/usr/local/bin","/usr/bin");

	my $platform = FINDPLAT();

	if ($platform eq "solaris")
	{
		my $isainfo_path="";
		$isainfo_path=FINDCOMMAND("isainfo",@DirectoriesArray);

		if ($isainfo_path)
		{
			my $info=`isainfo -b`;
			chomp $info;

			if (defined($info) && (length($info) > 0))
			{
				if ($info eq "32")
				{
					$$refDataModel=32;
					$Result=1;
				}
				elsif ($info eq "64")
				{
					$$refDataModel=64;
					$Result=1;
				}
				else
				{
					$$refDataModel=0;
				}
			}
		}
	}
	elsif ($platform eq "osf")
	{
		$$refDataModel=64;
		$Result=1;
	}
	elsif ($platform eq "hpux")
	{
		my $getconf_path="";
		$getconf_path=FINDCOMMAND("getconf",@DirectoriesArray);

		if ($getconf_path)
		{
			my $info=`getconf KERNEL_BITS`;
			chomp $info;

			if (defined($info) && (length($info) > 0))
			{
				if ($info eq "32")
				{
					$$refDataModel=32;
					$Result=1;
				}
				elsif ($info eq "64")
				{
					$$refDataModel=64;
					$Result=1;
				}
				else
				{
					$$refDataModel=0;
				}
			}
		}
	}
	elsif ($platform eq "aix")
	{
		my $info_path="$StartupDirectory/info";

		if (-f $info_path)
		{
			my $info=`$info_path`;
			chomp $info;

			if (defined($info) && (length($info) > 0))
			{
				if ($info eq "32")
				{
					$$refDataModel=32;
					$Result=1;
				}
				elsif ($info eq "64")
				{
					$$refDataModel=64;
					$Result=1;
				}
				else
				{
					$$refDataModel=0;
				}
			}
		}
	}
	elsif ($platform eq "linux")
	{
		my $info=`uname -m`;
		chomp $info;

		if (defined($info) && (length($info) > 0))
		{
			if ( !($info =~ "_64"))
			{
				$$refDataModel=32;
			}
			else
			{
				$$refDataModel=64;
			}

			$Result=1;
		}
		else
		{
			$$refDataModel=0;
		}
	}
	elsif ($platform eq "mac")
	{
		$$refDataModel=64;
		$Result=1;
	}
	else
	{
		$$refDataModel=0;
	}

	return $Result;
}

#===============================================================================
# Name:
#	ExtractData
# Description:
#	Extracts data from .tar.gz of .tar archive.
# Input parameters:
#	Name of archive file
#	Target directory
#	Operartion mode (silent or not).
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub ExtractData($$$)
{
	my $ArchiveFile = $_[0];
	my $TargetDirectory = $_[1];
	my $silent_mode = $_[2];

	my $sourcedir=`$PWD`;
	chomp $sourcedir;

	if ($silent_mode != 1)
	{
		print "\nExtracting tarfile: $ArchiveFile to directory: $TargetDirectory\n";
	}

	chdir $TargetDirectory || return 0;

	if ($ArchiveFile =~ m/\.tar\.gz$/)
	{
		if (!defined($GUNZIP) or (defined($GUNZIP) and length($GUNZIP)) == 0)
		{
			return 0;
		}

		if ($silent_mode == 1)
		{
			system("$GUNZIP -c $sourcedir/$ArchiveFile | $TAR xf -");
		}
		else
		{
			system("$GUNZIP -c $sourcedir/$ArchiveFile | $TAR xvf -");
		}
	}
	elsif ($ArchiveFile =~ m/\.tar$/)
	{
		if ($silent_mode == 1)
		{
			system("$TAR xf $sourcedir/$ArchiveFile");
		}
		else
		{
			system("$TAR xvf $sourcedir/$ArchiveFile");
		}
	}
	else
	{
		# tarfile not found
		return 0;
	}

	if($?!=0)
	{
		return 0;
	}

	chdir $sourcedir || return 0;  # go back to directory where we were called

	return 1;
}

#===============================================================================
# Name:
#	DATAMOVE
# Description:
#	DATAMOVE takes two arguments: the name of the tar file in the
#	current directory and the destination directory. It extracts the tar
#	file in the destination directory and copies release notes and IP
#	description files if they exist. It returns 1 on success and dies on
#	failure.
#	Third optional parameter defines operartion mode (silent or not).
#===============================================================================

our $datamove_silent_mode=1;

sub DATAMOVE($$;$)
{
	my $ArchiveFile = $_[0];
	my $TargetDirectory = $_[1];

	# detect silent mode

	# check presence of optional argument
	my $silent_mode_index=2;
	my $silent_mode=0;

	if (($#_ >= $silent_mode_index) && defined($_[$silent_mode_index]))
	{
		$silent_mode=1;
	}

	if (Get_silent_mode() == 1)
	{
		# enforce
		$silent_mode=1;
	}

	if (!ExtractData($ArchiveFile,$TargetDirectory,$silent_mode))
	{
		if (Get_silent_mode() == 0)
		{
			die "Failed to extract $ArchiveFile\n";
		}
		else
		{
			my $Message="Failed to extract $ArchiveFile";
			CreateSilentLog($Silent_result_error,$Message,$Silent_action_exit);
		}
	}

	if(-f $ip_description_filename)
	{
		system("$CP $ip_description_filename \"$_[1]\"");

		if($?!=0)
		{
			if (Get_silent_mode() == 0)
			{
				die "Failed to copy $ip_description_filename\n";
			}
			else
			{
				my $Message="Failed to copy $ip_description_filename";
				CreateSilentLog($Silent_result_error,$Message,$Silent_action_exit);
			}
		}
	}

	# copy html files like release_notes.html and read_me.html

	local *DH1;
	opendir DH1, "." or return 0;
	my @files_html=grep /\.html$/, readdir DH1;
	return 0 if $?;
	closedir DH1;

	if ( $#files_html > -1)
	{
		system("$CP *.html \"$_[1]\"");
	}

	if(-f $ospatchlist_filename)
	{
		system("$CP $ospatchlist_filename \"$_[1]\"");

		if($?!=0)
		{
			if (Get_silent_mode() == 0)
			{
				die "Failed to copy $ospatchlist_filename\n";
			}
			else
			{
				my $Message="Failed to copy $ospatchlist_filename";
				CreateSilentLog($Silent_result_error,$Message,$Silent_action_exit);
			}
		}
	}

	if(-f $EULA_filename)
	{
		system("$CP $EULA_filename \"$_[1]\"");

		if($?!=0)
		{
			if (Get_silent_mode() == 0)
			{
				die "Failed to copy $EULA_filename\n";
			}
			else
			{
				my $Message="Failed to copy $EULA_filename";
				CreateSilentLog($Silent_result_error,$Message,$Silent_action_exit);
			}
		}
	}

	if(-d $release_notes_dirname)
	{
		system("$CP -r $release_notes_dirname \"$_[1]\"");

		if($?!=0)
		{
			if (Get_silent_mode() == 0)
			{
				die "Failed to copy $release_notes_dirname\n";
			}
			else
			{
				my $Message="Failed to copy $release_notes_dirname";
				CreateSilentLog($Silent_result_error,$Message,$Silent_action_exit);
			}
		}
	}

	if ($Standard_UninstallData_support == 1)
	{
		$InstallationDirectory = $TargetDirectory;
	}

	return 1;
}

#===============================================================================
# Name:
#	MAKERUNSH
# Description:
#	MAKERUNSH takes the full command line and optionally the destination
#	directory as its arguments and creates a $StartupFileName file to start
#	the product. It returns 1 on success, 0 on failure.
#===============================================================================

sub MAKERUNSH($;$)
{
	local *RUNSH;

	if($_[1])
	{
		open RUNSH, ">$_[1]/$StartupFileName" or return 0;
		chmod 0750, "$_[1]/$StartupFileName";
	}
	else
	{
		open RUNSH, ">$StartupFileName" or return 0;
		chmod 0750, "$StartupFileName";
	}

	print RUNSH $_[0] or return 0;
	close RUNSH;
	return 1;
}

#===============================================================================
# Name:
#	IsNumberOrNotEmptyDigitString
# Description:
#	IsNumberOrNotEmptyDigitString takes as its argument the variable and
#	returns 1, if variable is not empty string and contains only numeric
#	characters or variable is number.
#	If variable is empty string or not empty string which contains some
#	not numeric characters, function returns 0.
#===============================================================================

sub IsNumberOrNotEmptyDigitString($)
{
	my $var = $_[0];

	if( (length($var) != 0) and !($var =~ /\D/))
	{
		return 1;
	}

	return 0;
}

#===============================================================================
# Name:
#	IsValidPath
# Description:
#	Checks for path in absolute form
# Input parameters:
#	Target path
# Return value:
#	1 if path is valid, 0 if path is not valid.
#===============================================================================

sub IsValidPath($)
{
	my $TargetDir = $_[0];

	# make sure it's a full path and doesn't use ~, ., or ..

	if ( !($TargetDir =~ m{^/}) || ($TargetDir =~ m{~|\.+/|/\.+}) )
	{
		return 0;
	}

	return 1;
}

#===============================================================================
# Name:
#	GetFilesList
# Description:
#	Gets files list in tar.gz file
# Input parameters:
#	tar.gz file path
#	Reference to list of filenames
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetFilesList($\@)
{
	my $TarGzFile_path = $_[0];
	my $refFilesArray = $_[1];
	my @FilesArray = @{$refFilesArray};
	my $Result=0;
	my $FilesList_filename="files_list_". $$ . "_" . time;

	if ($TarGzFile_path =~ m/\.tar\.gz$/)
	{
		if (!defined($GUNZIP) or (defined($GUNZIP) and length($GUNZIP)) == 0)
		{
			return 0;
		}

		system("$GUNZIP -c $TarGzFile_path | $TAR tvf - > $FilesList_filename");
	}
	elsif ($TarGzFile_path =~ m/\.tar$/)
	{
		system("$TAR tvf $TarGzFile_path > $FilesList_filename");
	}
	else
	{
		# tarfile not found
		return $Result;
	}

	if($?!=0)
	{
		return $Result;
	}

	$Result=GetFilenamesFromFile($FilesList_filename,@FilesArray);

	if ($Result == 1)
	{
		@{$refFilesArray} = @FilesArray;
	}

	system("$RM -f $FilesList_filename");

	return $Result;
}

#===============================================================================
# Name:
#	GetFilenamesFromFile
# Description:
#	Gets filenames from file
# Input parameters:
#	File name
#	Reference to list of filenames
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetFilenamesFromFile($\@)
{
	my $FilesList_filename=$_[0];
	my $refFilesArray=$_[1];
	my @FilesArray = @{$refFilesArray};
	@FilesArray=();
	my $Result=0;

	open (IN, "$FilesList_filename") || return $Result;

	while (<IN>)
	{
		s/\r\n|\n\r|\n|\r//;  # remove various ends of line

		my $line=$_;
		my @elements = split /\s+/, $line;

		# save last element of list
		push(@FilesArray,$elements[$#elements]);
	}

	close IN || return $Result;

	$Result=1;
	@{$refFilesArray} = @FilesArray;

	return $Result;
}

#===============================================================================
# Name:
#	GetFilesListEx
# Description:
#	Gets files list in directory and all sub-directories
# Input parameters:
#	Directory
#	Filename mask
#	Reference to list of filenames
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetFilesListEx($$\@)
{
	my $Directory = $_[0];
	my $FilenameMask = $_[1];
	my $refFilesArray = $_[2];
	my @FilesArray = @{$refFilesArray};
	my $Result=0;
	my $FilesList_filename="files_list_". $$ . "_" . time;

	if ( (-e $Directory) && (-d $Directory))
	{
		system("find $Directory -name \"$FilenameMask\" > $FilesList_filename");

		if($?!=0)
		{
			return $Result;
		}

		$Result=GetFilenamesFromFileEx($FilesList_filename,@FilesArray);

		if ($Result == 1)
		{
			@{$refFilesArray} = @FilesArray;
		}

		system("$install_common::RM -f $FilesList_filename");
	}
	else
	{
		# not found
		return $Result;
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetFilenamesFromFileEx
# Description:
#	Gets filenames from file
# Input parameters:
#	File name
#	Reference to list of filenames
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetFilenamesFromFileEx($\@)
{
	my $FilesList_filename=$_[0];
	my $refFilesArray=$_[1];
	my @FilesArray = @{$refFilesArray};
	@FilesArray=();
	my $Result=0;

	open (IN, "$FilesList_filename") || return $Result;

	while (<IN>)
	{
		s/\r\n|\n\r|\n|\r//;  # remove various ends of line

		my $line=$_;
		push(@FilesArray,$line);
	}

	close IN || return $Result;

	$Result=1;
	@{$refFilesArray} = @FilesArray;

	return $Result;
}

#===============================================================================
# Name:
#	InitPlatform
# Description:
#	Does platform specific initialization.
# Input parameters:
#	None
# Return value:
#	Returns 1 or dies.
#===============================================================================

sub InitPlatform()
{
	my $platform=FINDPLAT();

	if ($platform eq "linux")
	{
		if(! ($LN=FINDCOMMAND("ln","/usr/local/bin","/usr/bin","/bin")) )
		{
			if(! (-f ($LN=ASK("Please enter the path to the ln command =>")) && -x $LN) )
			{
				die "\n---> The ln command is required for this installation. Exiting.\n\n";
			}
		}
	}

	return 1;
}

#===============================================================================
# Name:
#	GetStartupDirectory
# Description:
#	Gets startup directory
# Input parameters:
#	None
# Return value:
#	None
#===============================================================================

sub GetStartupDirectory()
{
	my $sourcedir=`$PWD`;
	chomp $sourcedir;

	$StartupDirectory = $sourcedir;
}

#===============================================================================
# Name:
#	CatchInterruptSignal
# Description:
#	Init initializes this library, should be called from client script before any
#	other calls to function from this library.
#	Function exits with code 1.
#===============================================================================

sub CatchInterruptSignal
{
	system("stty echo");
	print "\n\n$InstallationTerminationMessage\n";
	exit 1;
}

#===============================================================================
# Name:
#	Trim
# Description:
#	Trims string
# Input parameters:
#	Reference to varable with string to trim
# Return value:
#	None.
#===============================================================================

sub Trim($)
{
	my $ref_string=$_[0];
	my $string=$$ref_string;

	for ($string)
	{
		s/^\s+//;
		s/\s+$//;
	}

	$$ref_string=$string;
}

#===============================================================================
# Name:
#	GetIPAddress
# Description:
#	Gets IP address for host
# Input parameters:
#	Local host name
#	Reference to IP address
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetIPAddress($$)
{
	my $LocalHostname = $_[0];
	my $refIP_address = $_[1];
	my $IP_address="";

	my $Generis_hosts_file="/etc/hosts";
	my $Generis_Solaris_hosts_file="/etc/inet/hosts";
	my $hosts_file="";

	# detect "hosts" file location

	my $platform = FINDPLAT();

	if ( $platform eq "none" )
	{
		return 0;
	}

	if ( ($platform eq "osf") || ($platform eq "hpux") ||
		($platform eq "aix") || ($platform eq "linux") )
	{
		$hosts_file=$Generis_hosts_file;
	}
	else
	{
		if ( $platform eq "solaris" )
		{
			$hosts_file=$Generis_Solaris_hosts_file;
		}
		else
		{
			return 0;
		}
	}

	# process "hosts" file

	if ( -e $hosts_file )
	{
		my $found=0;

		open(IN, "$hosts_file") || return 0;

		while (<IN>)
		{
			my $line = $_;
			chomp($line);

			if($line !~ /^\s*#/)
			{
				if($line =~ /^(\w+\.\w+\.\w+\.\w+)\s+$LocalHostname/ )
				{
					$IP_address=$1;
					$found=1;
					last;
				}
			}
		}

		close(IN) || return 0;

		if ($found == 0)
		{
			return 0;
		}
	}
	else
	{
		return 0;
	}

	$$refIP_address = $IP_address;
	return 1;
}

#===============================================================================
# Name:
#	GetIPAddresses
# Description:
#	Gets all IPv4 addresses for host
# Input parameters:
#	Reference to IP addresses array
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetIPAddresses(\@)
{
	my $refAddressesArray=$_[0];
	my @AddressesArray = @{$refAddressesArray};
	@AddressesArray=();
	my $Result=0;
	local *OUT;

	my $platform = FINDPLAT();

	if ( $platform eq "none" )
	{
		return 0;
	}

	if ( $platform eq "osf")
	{
		my $ifconfig="/usr/sbin/ifconfig";

		if ( ! -e $ifconfig)
		{
			return 0;
		}

		my $command="$ifconfig -a | grep inet | grep broadcast | cut -d' ' -f7";
		my @output=();

		open (OUT, "$command |") || return 0;
		@output=<OUT>;
		close OUT;

		for my $line (@output)
		{
			chomp $line;
			Trim(\$line);

			if (IsValidIPAddress($line))
			{
				push(@AddressesArray,$line);
			}
		}
	}
	elsif ( $platform eq "hpux")
	{
		my $ifconfig="/usr/sbin/ifconfig";

		if ( ! -e $ifconfig)
		{
			return 0;
		}

		my $lan_number;
		my $lan_name;

		for ($lan_number = 0; $lan_number < 10; $lan_number++)
		{
			$lan_name=sprintf("lan%d", $lan_number);

			my $command="$ifconfig $lan_name 2>/dev/null | grep inet | cut -d' ' -f2";
			my @output=();

			open (OUT, "$command |") || return 0;
			@output=<OUT>;
			close OUT;

			for my $line (@output)
			{
				chomp $line;
				Trim(\$line);

				if (IsValidIPAddress($line))
				{
					push(@AddressesArray,$line);
				}
			}
		}
	}
	elsif ( $platform eq "aix")
	{
		my $ifconfig="/etc/ifconfig";

		if ( ! -e $ifconfig)
		{
			return 0;
		}

		my $command="$ifconfig -a | grep inet | grep broadcast | cut -d' ' -f2";
		my @output=();

		open (OUT, "$command |") || return 0;
		@output=<OUT>;
		close OUT;

		for my $line (@output)
		{
			chomp $line;
			Trim(\$line);

			if (IsValidIPAddress($line))
			{
				push(@AddressesArray,$line);
			}
		}
	}
	elsif ($platform eq "linux")
	{
		my $ifconfig="/sbin/ifconfig";

		if ( ! -e $ifconfig)
		{
			return 0;
		}

		my $command="$ifconfig -a | grep \"inet addr\" | grep Bcast | cut -d: -f2 | cut -d' ' -f1";

		my $RHLVersion=GetRHLVersion();

		if (defined($RHLVersion))
		{
			my $RequiredRHEVersion_found=0;
			my $MinLinuxVersion_for_AlternativeProcessing="7";
			my $CompareResult;
			my $Result=install_lib::CompareRHEVersions($RHLVersion,$MinLinuxVersion_for_AlternativeProcessing,\$CompareResult);

			if ($Result == 1)
			{
				if ($CompareResult >= 0)
				{
					$RequiredRHEVersion_found=1;
				}
			}

			if ($RequiredRHEVersion_found == 1)
			{
				$command="$ifconfig -a | grep inet | grep broadcast | cut -d' ' -f10";
			}
		}

		my @output=();

		open (OUT, "$command |") || return 0;
		@output=<OUT>;
		close OUT;

		for my $line (@output)
		{
			chomp $line;
			Trim(\$line);

			if (IsValidIPAddress($line))
			{
				push(@AddressesArray,$line);
			}
		}
	}
	elsif ($platform eq "solaris")
	{
		my $ifconfig="/usr/sbin/ifconfig";

		if ( ! -e $ifconfig)
		{
			return 0;
		}

		my $command="$ifconfig -a | grep inet | grep broadcast | cut -d' ' -f2";
		my @output=();

		open (OUT, "$command |") || return 0;
		@output=<OUT>;
		close OUT;

		for my $line (@output)
		{
			chomp $line;
			Trim(\$line);

			if (IsValidIPAddress($line))
			{
				push(@AddressesArray,$line);
			}
		}
	}
	else
	{
		return 0;
	}

	# remove 127.0.0.1 address
	my $LoopbackAddress="127.0.0.1";
	my @AddressesArray_tmp=@AddressesArray;
	@AddressesArray=();

	for my $address (@AddressesArray_tmp)
	{
		if ($address ne $LoopbackAddress)
		{
			push(@AddressesArray,$address);
		}
	}

	$Result=1;
	@{$refAddressesArray} = @AddressesArray;

	return $Result;
}

#===============================================================================
# Name:
#	GetIPv6Addresses
# Description:
#	Gets all IPv6 addresses for host
# Input parameters:
#	Reference to IP addresses array
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetIPv6Addresses(\@)
{
	my $refAddressesArray=$_[0];
	my @AddressesArray = @{$refAddressesArray};
	@AddressesArray=();
	my $Result=0;
	local *OUT;

	my $platform = FINDPLAT();

	if ( $platform eq "none" )
	{
		return 0;
	}

	if ( $platform eq "osf")
	{
		# currently not supported
		return 0;
	}
	elsif ( $platform eq "hpux")
	{
		my $ifconfig="/usr/sbin/ifconfig";

		if ( ! -e $ifconfig)
		{
			return 0;
		}

		my $lan_number;
		my $lan_name;

		for ($lan_number = 0; $lan_number < 10; $lan_number++)
		{
			$lan_name=sprintf("lan%d", $lan_number);

			my $command="$ifconfig $lan_name 2>/dev/null | grep inet6 | cut -d' ' -f2";
			my @output=();

			open (OUT, "$command |") || return 0;
			@output=<OUT>;
			close OUT;

			for my $line (@output)
			{
				chomp $line;
				Trim(\$line);

				if (IsValidIPv6Address($line))
				{
					push(@AddressesArray,$line);
				}
			}
		}
	}
	elsif ( $platform eq "aix")
	{
		my $ifconfig="/etc/ifconfig";

		if ( ! -e $ifconfig)
		{
			return 0;
		}

		my $command="$ifconfig -a | grep inet6 | cut -d' ' -f2 | cut -d/ -f1";
		my @output=();

		open (OUT, "$command |") || return 0;
		@output=<OUT>;
		close OUT;

		for my $line (@output)
		{
			chomp $line;
			Trim(\$line);

			if (IsValidIPv6Address($line))
			{
				push(@AddressesArray,$line);
			}
		}
	}
	elsif ($platform eq "linux")
	{
		my $ifconfig="/sbin/ifconfig";

		if ( ! -e $ifconfig)
		{
			return 0;
		}

		my $command="$ifconfig -a | grep \"inet6 addr\" | cut -d' ' -f13 | cut -d/ -f1";
		my @output=();

		open (OUT, "$command |") || return 0;
		@output=<OUT>;
		close OUT;

		for my $line (@output)
		{
			chomp $line;
			Trim(\$line);

			if (IsValidIPv6Address($line))
			{
				push(@AddressesArray,$line);
			}
		}
	}
	elsif ($platform eq "solaris")
	{
		my $ifconfig="/usr/sbin/ifconfig";

		if ( ! -e $ifconfig)
		{
			return 0;
		}

		my $command="$ifconfig -a | grep inet6 | cut -d' ' -f2 | cut -d/ -f1";
		my @output=();

		open (OUT, "$command |") || return 0;
		@output=<OUT>;
		close OUT;

		for my $line (@output)
		{
			chomp $line;
			Trim(\$line);

			if (IsValidIPv6Address($line))
			{
				push(@AddressesArray,$line);
			}
		}
	}
	else
	{
		return 0;
	}

	# remove ::1 address
	my $LoopbackAddress="::1";
	my @AddressesArray_tmp=@AddressesArray;
	@AddressesArray=();

	for my $address (@AddressesArray_tmp)
	{
		if ($address ne $LoopbackAddress)
		{
			push(@AddressesArray,$address);
		}
	}

	$Result=1;
	@{$refAddressesArray} = @AddressesArray;

	return $Result;
}

#===============================================================================
# Name:
#	GetAllIPAddresses
# Description:
#	Gets all IP addresses (IPv4 and IPv6)
# Input parameters:
#	Reference to array of IP addresses
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetAllIPAddresses(\@)
{
	my $ref_IPAddresses=$_[0];
	my @AllIPAddresses=();
	my @IPAddresses=();
	my $Result=0;
	my $debug_print=0;

	if ($debug_print == 1)
	{
		print "GetAllIPAddresses:\n";
	}

	$Result=GetIPAddresses(@IPAddresses);

	if ($Result == 1)
	{
		push(@AllIPAddresses,@IPAddresses);

		if ($debug_print == 1)
		{
			print "IPv4 found\n";

			for my $IP_address (@IPAddresses)
			{
				print "\$IP_address=$IP_address\n";
			}
		}
	}

	@IPAddresses=();
	$Result=GetIPv6Addresses(@IPAddresses);

	if ($Result == 1)
	{
		push(@AllIPAddresses,@IPAddresses);

		if ($debug_print == 1)
		{
			print "IPv6 found\n";

			for my $IP_address (@IPAddresses)
			{
				print "\$IP_address=$IP_address\n";
			}
		}
	}

	@{$ref_IPAddresses}=@AllIPAddresses;
	$Result=1;

	return $Result;
}

#===============================================================================
# Name:
#	FilterApplications
# Description:
#	Filters applications
# Input parameters:
#	Ini file name
#	Reference to original applications array
#	Reference to filtered applications array
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub FilterApplications($\@\@)
{
	my $FileName = $_[0];
	my $ref_original_array = $_[1];
	my $ref_filtered_array = $_[2];
	my @original_array = @{$ref_original_array};
	my @filtered_array = ();
	my $Result = 0;
	my $Debug = 0;

	my $Filtering_can_be_done=1;
	my @IPAddresses=();

	Trim(\$LocalHostname);

	if (!defined($LocalHostname) or (defined($LocalHostname) and length($LocalHostname)) == 0)
	{
		$Filtering_can_be_done=0;
	}
	else
	{
		Trim(\$Domain);

		if (!defined($Domain) or (defined($Domain) and length($Domain)) == 0)
		{
			$Filtering_can_be_done=0;
		}
		else
		{
			my $Result = GetAllIPAddresses(@IPAddresses);

			if ($Result == 0)
			{
				$Filtering_can_be_done=0;
			}
		}
	}

	if ($Filtering_can_be_done == 0)
	{
		return $Result;
	}

	for my $app (@original_array)
	{
		my %IniSectionData;
		my $app_name=$app;

		$app_name=~s/^\[|\]$//g;  # clip off brackets, if any

		%IniSectionData=PARSEINI($FileName,$app_name);

		if (!%IniSectionData)
		{
			return $Result;
		}

		if (!defined($IniSectionData{host}))
		{
			return $Result;
		}

		# try first FQDN then short hostname, then IP addresses
		# use case insensitive comparison
		my $host = "$LocalHostname.$Domain";

		if ($Debug == 1)
		{
			print "\$IniSectionData{host}=$IniSectionData{host}\n";
			print "\$host=$host\n";
		}

		if("\L$IniSectionData{host}\E" eq "\L$host\E")
		{
			push(@filtered_array,$app);
		}
		else
		{
			$host = $LocalHostname;

			if ($Debug == 1)
			{
				print "\$host=$host\n";
			}

			if("\L$IniSectionData{host}\E" eq "\L$host\E")
			{
				push(@filtered_array,$app);
			}
			else
			{
				for my $IP_address (@IPAddresses)
				{
					$host = $IP_address;

					if ($Debug == 1)
					{
						print "\$host=$host\n";
					}

					if("\L$IniSectionData{host}\E" eq "\L$host\E")
					{
						push(@filtered_array,$app);
					}
				}
			}
		}
	}

	@{$ref_filtered_array} = @filtered_array;
	$Result = 1;

	return $Result;
}

#===============================================================================
# Name:
#	CreateSilentLog
# Description:
#	Create silent log
# Input parameters:
#	Silent result ($install_common::Silent_result_success or $install_common::Silent_result_error).
#	Error message
#	Action ($install_common::Silent_action_conntinue or $install_common::Silent_action_exit)
# Return value:
#	Returns 1 on success, 0 on failure. Exits with 1 for $install_common::Silent_action_exit
#===============================================================================

sub CreateSilentLog($$$)
{
	my $Silent_result = $_[0];
	my $Message = $_[1];
	my $Silent_action = $_[2];
	my $Result=0;
	local *OUT;
	my $TargetDir;
	my $TargetFile = install_common::Get_silent_mode_log_file_path();

	($TargetDir=$TargetFile)=~s#/[\w\.]+/?$##;

	if( (-w $TargetDir))
	{
		$Result=open(OUT, ">$TargetFile");

		if (!$Result)
		{
			if ($Silent_action == $install_common::Silent_action_exit)
			{
				exit 1;
			}

			return 0;
		}

		my $line="[$Silent_result_file_GenesysProductInfo_section_name]\n";
		print OUT $line;

		$line="$Silent_result_file_File_key_name=ResultFile\n";
		print OUT $line;

		$line="$Silent_result_file_IPName_key_name=$IP_description_info{ProductName}\n";
		print OUT $line;

		$line="$Silent_result_file_IPVersion_key_name=$IP_description_info{ProductVersion}\n";
		print OUT $line;

		$line="$Silent_result_file_IPBuildNumber_key_name=$IP_description_info{ProductBuildNumber}\n";
		print OUT $line;

		$line="$Silent_result_file_IPLanguage_key_name=$IP_description_info{ProductLanguage}\n";
		print OUT $line;

		$line="[$Silent_result_file_Result_section_name]\n";
		print OUT $line;

		$line="$Silent_result_file_ResultCode_key_name=$Silent_result\n";
		print OUT $line;

		$line="$Silent_result_file_Error_key_name=$Message\n";
		print OUT $line;

		$line="$Silent_result_file_Reboot_key_name=N\n";
		print OUT $line;

		$Result=close(OUT);

		if (!$Result)
		{
			if ($Silent_action == $install_common::Silent_action_exit)
			{
				exit 1;
			}

			return 0;
		}

		if ($Silent_action == $install_common::Silent_action_exit)
		{
			exit 1;
		}

		$Result = 1;
	}
	else
	{
		print "Unable to create file in $TargetDir directory because of insufficient permissions.\n";

		if ($Silent_action == $install_common::Silent_action_exit)
		{
			exit 1;
		}
	}

	return $Result;
}

#===============================================================================
# Ini file subroutines
#===============================================================================

#===============================================================================
# Name:
#	CreateEmptyFile
# Description:
#	Creates empty file
# Input parameters:
#	File path
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CreateEmptyFile($)
{
	my $FilePath=$_[0];
	my $Result=0;
	local *OUT;
	my $ConfFile = $FilePath;
	my $ConfDir;

	($ConfDir=$ConfFile)=~s#/\w+/*$##;

	if ($ConfDir eq $ConfFile)
	{
		# file has . in name
		my $nPos=rindex($ConfDir,"/");

		if ($nPos != -1)
		{
			$ConfDir=substr($ConfDir,0,$nPos);
		}
	}

	if (!(-e $ConfDir))
	{
		system("$install_common::MKDIR $ConfDir");

		if($? != 0)
		{
			print "\nUnable to create directory $ConfDir : $!\n";
			return $Result;
		}
	}

	if( (-w $ConfDir))
	{
		open (OUT, ">$ConfFile") || return $Result;
		close OUT || return $Result;

		$Result = 1;
	}
	else
	{
		print "Unable to create file in $ConfDir directory because of insufficient permissions.\n";
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetIniFileKeyValue
# Description:
#	Gets ini file key value
# Input parameters:
#	Ini file path
#	Section name
#	Key name
#	Reference to key value
#	Reference to error code (undefined-no error,0-file not found,1-file not readable,2-section or section keys not found,
#		3-key not found)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetIniFileKeyValue($$$$$)
{
	my $file_path=$_[0];
	my $section_name=$_[1];
	my $key_name=$_[2];
	my $ref_key_value=$_[3];
	my $ref_error_code=$_[4];
	my $Result=0;

	$$ref_error_code=undef;

	if ( -f $file_path)
	{
		if ( -r $file_path)
		{
			my %ini_file_data = install_common::PARSEINI($file_path,$section_name,$comments_characters);

			if (%ini_file_data)
			{
				if ($ini_file_data{$key_name})
				{
					$$ref_key_value=$ini_file_data{$key_name};
					$Result=1;
				}
				else
				{
					$$ref_error_code=$IniFile_error_key_not_found;

					if ($debug_print==1)
					{
						print "Key $key_name not found in file $file_path.\n";
					}
				}
			}
			else
			{
				$$ref_error_code=$IniFile_error_section_or_section_keys_not_found;

				if ($debug_print==1)
				{
					print "Section $section_name or section keys not found in file $file_path.\n";
				}
			}
		}
		else
		{
			$$ref_error_code=$IniFile_error_file_not_readable;
			print "File $file_path not readable.\n";
		}
	}
	else
	{
		$$ref_error_code=$IniFile_error_file_not_found;

		if ($debug_print==1)
		{
			print "File $file_path not found.\n";
		}
	}

	if (defined($$ref_error_code))
	{
		$Result=0;
	}
	else
	{
		$Result=1;
	}

	return $Result;
}

#===============================================================================
# Name:
#	SetIniFileKeyValue
# Description:
#	Gets ini file key value
# Input parameters:
#	Ini file path
#	Section name
#	Key name
#	Key value (if undefined, key is removed)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub SetIniFileKeyValue($$$$)
{
	my $file_path=$_[0];
	my $section_name=$_[1];
	my $key_name=$_[2];
	my $key_value=$_[3];
	my $Result=0;

	if ( -f $file_path)
	{
		my %ini_file_data=();
		$Result=GetIniFileKeyValues($file_path,$section_name,%ini_file_data,$install_common::case_insensitive_mode);

		if ($Result == 1)
		{
			if ($ini_file_data{$key_name})
			{
				#print "update value\n";

				# update value
				$Result=UpdateIniFileValue($file_path,$IniFileValue_Update,$section_name,$key_name,$key_value);
			}
			else
			{
				#print "create value\n";

				# create value
				$Result=UpdateIniFileValue($file_path,$IniFileValue_Create,$section_name,$key_name,$key_value);
			}
		}
		else
		{
			#print "create value\n";

			# create value
			$Result=UpdateIniFileValue($file_path,$IniFileValue_Create,$section_name,$key_name,$key_value);
		}
	}
	else
	{
		#############################
		# create data file and value

		# create empty file
		$Result=CreateEmptyFile($file_path);

		if ($Result==1)
		{
			# create value
			$Result=UpdateIniFileValue($file_path,$IniFileValue_Create,$section_name,$key_name,$key_value);
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetIniFileKeyValues
# Description:
#	Returns key values from ini file
# Input parameters:
#	Ini file path
#	Ini file section name
#	Reference to hash
#	Case-insensitive comparison mode
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetIniFileKeyValues($$\%$)
{
	my $file_path=$_[0];
	my $section_name=$_[1];
	my $ref_hash=$_[2];
	%{$ref_hash}=();
	my $comparison_mode=$_[3];
	my $Result=0;

	if ( -f $file_path)
	{
		if ( -r $file_path)
		{
			my %ini_file_data = install_common::PARSEINI($file_path,$section_name,$comments_characters,$comparison_mode);

			if (%ini_file_data)
			{
				%{$ref_hash}=%ini_file_data;

				$Result=1;
			}
			else
			{
				if ($debug_print==1)
				{
					print "[$section_name] section data not found in file $file_path.\n";
				}
			}
		}
		else
		{
			print "File $file_path not readable.\n";
		}
	}
	else
	{
		print "File $file_path not found.\n";
	}

	return $Result;
}

#===============================================================================
# Name:
#	UpdateIniFileValue
# Description:
#	Updates or creates ini file value (file should already exist)
# Input parameters:
#	Ini file path
#	Ini file update mode (create or update)
#	Ini file section name
#	Ini file key name
#	Ini file key value
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub UpdateIniFileValue($$$$$)
{
	my $file_path=$_[0];
	my $IniFileUpdateMode=$_[1];
	my $section_name=$_[2];
	my $key_name=$_[3];
	my $key_value=$_[4];

	my $Result=0;

	if ($IniFileUpdateMode == $IniFileValue_Update)
	{
		my $done=0;
		local (*IN, *OUT);
		my $ConfFile = $file_path;

		if ( -w $ConfFile)
		{
			my $BackupName=$ConfFile."_backup";
			rename ($ConfFile, "$BackupName") || return $Result;
			open (IN, "$BackupName") || return $Result;
			open (OUT, ">$ConfFile") || return $Result;
			my $do_print=0;
			my $section_found=0;

			while (<IN>)
			{
				$do_print=1;

				if(/^\[$section_name\]/)
				{
					$section_found=1;
				}

				if (($section_found == 1) && ($done == 0))
				{
					if(/^$key_name=/)
					{
						$do_print=0;

						if (defined($key_value))
						{
							my $line="$key_name=$key_value\n";
							print OUT $line;
						}

						$done=1;
					}
				}

				if ($do_print == 1)
				{
					print OUT;
				}
			}

			close IN || return $Result;
			close OUT || return $Result;
			unlink($BackupName);

			if ($done == 1)
			{
				$Result=1;
			}
			else
			{
				$Result=0;
			}
		}
		else
		{
			print "Unable to edit $ConfFile because of insufficient file permissions.\n";
		}
	}
	elsif ($IniFileUpdateMode == $IniFileValue_Create)
	{
		# check if we need to create section $section_name

		my $section_found=0;
		$Result=DoesSectionExist($file_path,$section_name,\$section_found);

		if ($Result == 0)
		{
			return $Result;
		}

		if ($section_found == 0)
		{
			$Result=CreateSection($file_path,$section_name);

			if ($Result == 0)
			{
				return $Result;
			}
		}

		# add key with value to section

		local (*IN, *OUT);
		my $ConfFile = $file_path;
		my $ConfDir;

		($ConfDir=$ConfFile)=~s#/\w+/*$##;

		if( (-w $ConfDir))
		{
			if( (-w $ConfFile))
			{
				my $done=0;
				my $BackupName=$ConfFile."_backup";
				rename ($ConfFile, "$BackupName") || return $Result;
				open (IN, "$BackupName") || return $Result;
				open (OUT, ">$ConfFile") || return $Result;
				my $do_print=0;

				while (<IN>)
				{
					$do_print=1;

					if(/^\[$section_name\]/)
					{
						$do_print=0;

						my $line="[$section_name]\n";
						print OUT $line;

						$line="$key_name=$key_value\n";
						print OUT $line;

						$done=1;
					}

					if ($do_print == 1)
					{
						print OUT;
					}
				}

				close IN || return $Result;
				close OUT || return $Result;
				unlink($BackupName);

				if ($done == 1)
				{
					$Result=1;
				}
				else
				{
					$Result=0;
				}
			}
			else
			{
				print "Unable to edit $file_path because of insufficient file permissions.\n";
			}
		}
		else
		{
			print "Unable to create file in $ConfDir directory because of insufficient permissions.\n";
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	DoesSectionExist
# Description:
#	Checks for section existence (file should already exist)
# Input parameters:
#	Ini file path
#	Ini file section name
#	Reference to section flag existence (0-not found, 1-found)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub DoesSectionExist($$$)
{
	my $file_path=$_[0];
	my $section_name=$_[1];
	my $ref_found_flag=$_[2];
	my $Result=0;

	local *IN;
	open (IN, "$file_path") || return $Result;
	my $section_found=0;

	while (<IN>)
	{
		if(/^\[$section_name\]/)
		{
			$section_found=1;
			last;
		}
	}

	close IN || return $Result;

	$Result=1;

	if ($section_found == 1)
	{
		$$ref_found_flag=1;
	}
	else
	{
		$$ref_found_flag=0;
	}

	return $Result;
}

#===============================================================================
# Name:
#	CreateSection
# Description:
#	Creates section (file should already exist)
# Input parameters:
#	Ini file path
#	Ini file section name
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CreateSection($$)
{
	my $file_path=$_[0];
	my $section_name=$_[1];
	my $Result=0;

	my $done=0;
	local (*IN, *OUT);

	if ( -w $file_path)
	{
		my $BackupName=$file_path."_backup";
		rename ($file_path, "$BackupName") || return $Result;
		open (IN, "$BackupName") || return $Result;
		open (OUT, ">$file_path") || return $Result;
		my $section_found=0;

		while (<IN>)
		{
			print OUT;

			if (eof(IN))
			{
				my $line="[$section_name]\n";
				print OUT $line;

				$done=1;
			}
		}

		if ($done == 0)
		{
			# empty file

			my $line="[$section_name]\n";
			print OUT $line;

			$done=1;
		}

		close IN || return $Result;
		close OUT || return $Result;
		unlink($BackupName);

		if ($done == 1)
		{
			$Result=1;
		}
		else
		{
			$Result=0;
		}
	}
	else
	{
		print "Unable to edit $file_path because of insufficient file permissions.\n";
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetDomainName
# Description:
#	Gets domain name by host name
# Input parameters:
#	Host name
#	Reference to domain name
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub GetDomainName($$)
{
	my $HostName = $_[0];
	my $ref_DomainName = $_[1];
	my $AF_INET_value=2;

	my $iaddr = gethostbyname($HostName);

	if ($? != 0)
	{
		return 0;
	}

	my $domain_name = gethostbyaddr($iaddr,$AF_INET_value);

	if ($? != 0)
	{
		return 0;
	}

	# delete hostname
	$domain_name =~ s/^[^.]+.//;

	if (length($domain_name) == 0)
	{
		return 0;
	}

	$$ref_DomainName = $domain_name;

	return 1;
}

#===============================================================================
# Name:
#	GetDomainNameNslookup
# Description:
#	Gets domain name by host name via nslookup
# Input parameters:
#	Host name
#	Reference to domain name
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub GetDomainNameNslookup($$)
{
	my $HostName = $_[0];
	my $ref_DomainName = $_[1];
	my $Result=0;

	my @DirectoriesArray=("/bin","/usr/bin","/usr/sbin");
	my $CommandName="nslookup";
	my $CommandPath="";

	if(! ($CommandPath=FINDCOMMAND($CommandName,@DirectoriesArray)) )
	{
		return 0;
	}

	my $command="$CommandPath $HostName | grep $HostName | grep \"can't find\"";
	my @output=();

	open(OUT, "$command |") || return 0;
	@output=<OUT>;
	close OUT;

	my $number_of_lines = scalar @output;

	if ($number_of_lines != 0)
	{
		return $Result;
	}

	$command="$CommandPath $HostName | grep Name: | grep $HostName | cut -d: -f2 | cut -d. -f2-";
	@output=();

	open(OUT, "$command |") || return 0;
	@output=<OUT>;
	close OUT;

	for my $line (@output)
	{
		chomp $line;
		Trim(\$line);

		if (defined($line) && (length($line) > 0))
		{
			$$ref_DomainName=$line;
			$Result=1;
			last;
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	SetDomainName
# Description:
#	Sets domain name
# Input parameters:
#	Domain name
# Return value:
#	None.
#===============================================================================

sub SetDomainName($)
{
	$Domain=$_[0];
}

#===============================================================================
# Name:
#	IsValidIPAddress
# Description:
#	Checks "ipv4 address" format of string
# Input parameters:
#	String to check
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub IsValidIPAddress($)
{
	my $address=$_[0];
	my $Result=0;

	Trim(\$address);

	my @address_parts = split(/\./, $address);
	my $array_size = scalar @address_parts;

	if ($array_size == 4)
	{
		###############################
		# check IP address format

		#verify content of each part

		my $bad_value_found=0;

		for my $elem (@address_parts)
		{
			if ( $elem =~ /\D/)
			{
				# not digit value
				$bad_value_found=1;
			}
		}

		if ($bad_value_found == 0)
		{
			$Result=1;
		}
		else
		{
			$Result=0;
		}
	}
	else
	{
		$Result=0;
	}

	return $Result;
}


#===============================================================================
# Name:
#	IsValidIPv6Address
# Description:
#	Checks "ipv6 address" format of string
# Input parameters:
#	String to check
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub IsValidIPv6Address($)
{
	my $address=$_[0];
	my $Result=0;

	Trim(\$address);

	if ($address =~ /^$Regexp::IPv6::IPv6_re$/)
	{
		$Result=1;
	}

	return $Result;
}

#===============================================================================
# Name:
#	VerifyHostname
# Description:
#	Verifies hostname format
# Input parameters:
#	Hostname to check
#	Verbose operation mode flag (1 - verbose, 0 - silent)
#	Optional additional information for printing in case of error
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub VerifyHostname($$;$)
{
	my $Hostname=$_[0];
	my $VerboseMode=$_[1];
	my $Result=0;

	# check presence of optional argument
	my $AdditionalPrintInfo_index=2;
	my $AdditionalPrintInfo_use=0;
	my $AdditionalPrintInfo_data="";

	if (($#_ >= $AdditionalPrintInfo_index) && defined($_[$AdditionalPrintInfo_index]))
	{
		$AdditionalPrintInfo_use=1;
		$AdditionalPrintInfo_data=$_[$AdditionalPrintInfo_index];
	}

	# verify format
	if ($Hostname =~ /$NotHostnamePattern/ )
	{
		if ($VerboseMode == 1)
		{
			print "Invalid input, $PossibleHostFormat_prompt.\n";

			if ($AdditionalPrintInfo_use == 1)
			{
				print $AdditionalPrintInfo_data;
			}
		}

		return $Result;
	}

	# verify format we have (IP address or DNS name)
	if (IsValidIPAddress($Hostname) == 0)
	{
		# check DNS name
		if ( !($Hostname =~ /^$AlphaNumericPattern$HostnamePattern/) )
		{
			if ($VerboseMode == 1)
			{
				print "Invalid input: $PossibleDNSNameFormat_prompt.\n";

				if ($AdditionalPrintInfo_use == 1)
				{
					print $AdditionalPrintInfo_data;
				}
			}

			return $Result;
		}
		elsif ($Hostname =~ /$NotAllowedTrailingPattern$/)
		{
			if ($VerboseMode == 1)
			{
				print "Invalid input: $PossibleDNSNameFormat_prompt.\n";

				if ($AdditionalPrintInfo_use == 1)
				{
					print $AdditionalPrintInfo_data;
				}
			}

			return $Result;
		}
	}

	$Result=1;

	return $Result;
}

#===============================================================================
# Name:
#	AdaptMessageToSilentMode
# Description:
#	Adapts message to silent mode removing leading and trailing "\n";
# Input parameters:
#	Reference to varable with string to adapt
# Return value:
#	None.
#===============================================================================

sub AdaptMessageToSilentMode($)
{
	if (Get_silent_mode() == 1)
	{
		my $ref_string=$_[0];
		my $string=$$ref_string;

		for ($string)
		{
			s/^\n+//;
			s/\n+$//;
		}

		$$ref_string=$string;
	}
}

#===============================================================================
# Name:
#	Init
# Description:
#	Init initializes this library, should be called from client script before any
#	other calls to function from this library.
#	Function returns 0.
#===============================================================================

sub Init()
{
	INITCOMMON();
	FINDGUNZIP();
	FindTar();
	FindLs();
	FindCommands();
	FindUname();
	InitPlatform();
	GetStartupDirectory();

	umask 0027;

	# Flush well and flush often
	my $original = select STDOUT; $|=1;
	select STDERR; $|=1;
	select $original;

	$SIG{INT} = \&CatchInterruptSignal;

	return 0;
}

#===============================================================================
# Initialize package
#===============================================================================

1;
