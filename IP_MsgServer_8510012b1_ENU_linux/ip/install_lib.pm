#===============================================================================
#	Genesys Production
#	Copyright (C) 2002-2016 Genesys Telecommunications Laboratories, Inc.
#===============================================================================
#	Description:	Common functions for Unix-based product installation scripts
#
#	History of changes:
#		2016-07-28, version 2.72, AlxNik
#			Update CheckJavaVersionUsingPath, CheckJavaVersion, CheckJreVersion:
#			simplify compare using CompareVersionsEx.
#
#		2016-07-27, version 2.71, AlxNik
#			Update CheckJavaVersionUsingPath, CheckJavaVersion, CheckJreVersion:
#			compare using CompareVersionsEx.
#
#		2015-12-07, version 2.70, AlxNik
#			Update CheckJavaVersionUsingPath.
#
#		2015-11-30, version 2.69, AlxNik
#			Update CheckJavaVersionUsingPath.
#
#		2015-11-30, version 2.68, AlxNik
#			Add Client Side Port support for TSrvMiV5000.
#
#		2015-11-23, version 2.67, AlxNik
#			Update CheckJavaVersionUsingPath.
#
#		2015-10-19, version 2.66, AlxNik
#			Format.
#
#		2015-05-28, version 2.65, AlxNik
#			Add CheckJavaVersionUsingPath similar to install_ics::CheckJavaVersionUsingPath.
#
#		2015-05-01, version 2.64, AlxNik
#			Add GetGAXDirectory,CheckGAXDirectory,DeployGAXApp.
#
#		2014-12-02, version 2.63, AlxNik
#			Move CompareVersionsEx,CompareRHEVersions to install_common, but
#			keep stubs for keeping all clients unchanged.
#
#		2014-08-27, version 2.62, AlxNik
#			Update ProcessLicenseAgreement: make license section optional.
#
#		2014-05-13, version 2.61, AlxNik
#			Add ReadConfigValueEx.
#
#		2014-05-13, version 2.60, AlxNik
#			Update ReadConfigValue.
#
#		2014-02-20, version 2.59, AlxNik
#			Update GetJarPath.
#
#		2013-10-14, version 2.58, AlxNik
#			Add Client Side Port support for vpCTIConnect.
#
#		2013-10-09, version 2.57, AlxNik
#			Add CheckJreVersion.
#
#		2013-10-07, version 2.56, AlxNik
#			Enable Client Side Port support for eSIntSrvProxy.
#
#		2013-09-18, version 2.55, AlxNik
#			Add CreateDBClientLinks and use in CreateLinkEx.
#
#		2013-06-24, version 2.54, AlxNik
#			Disable message about GCTISetup.ini.
#
#		2013-05-28, version 2.53, AlxNik
#			Add Client Side Port support for ICon.
#
#		2013-04-17, version 2.52, AlxNik
#			Disable Client Side Port support for eSIntSrvProxy.
#
#		2013-04-17, version 2.51, AlxNik
#			Add Client Side Port support for eSIntSrvProxy.
#
#		2013-02-26, version 2.50, AlxNik
#			Add Client Side Port support for eSTrainingSrv.
#
#		2013-02-13, version 2.49, AlxNik
#			Add Client Side Port support for eSEmailSrvJava,eSContSrvProxy,eSContSrv.
#
#		2013-02-07, version 2.48, AlxNik
#			Add Client Side Port support for MWARSMPGateway.
#
#		2013-01-17, version 2.47, AlxNik
#			Add Client Side Port support for LicenseRepoMngr.
#
#		2013-01-07, version 2.46, AlxNik
#			Update VerifyOS, add Ubuntu support.
#
#		2012-06-26, version 2.45, AlxNik
#			Add Client Side Port support for GMS.
#
#		2012-06-18, version 2.44, AlxNik
#			Add DisableClientSidePortSupport and EnableClientSidePortSupport.
#
#		2012-06-08, version 2.43, AlxNik
#			Add Client Side Port support for SIPProxy.
#
#		2012-06-05, version 2.42, AlxNik
#			Use localeVersion when it is available, compensate the compatibility
#			mode for cfgutility 7.5.000.xx and CS 8.1.1.
#
#		2012-03-08, version 2.41, AlxNik
#			Add ProcessReturnCode.
#
#		2012-01-25, version 2.40, AlxNik
#			Add Mac OS X 10.6.8 (Snow Leopard) support.
#
#		2012-01-09, version 2.39, AlxNik
#			Add Client Side Port support for vpMRCPProxy.
#
#		2011-12-08, version 2.38, AlxNik
#			Add Client Side Port support for vpCiscoUCMCnt.
#
#		2011-11-14, version 2.37, AlxNik
#			Add Client Side Port support for InfoMart.
#
#		2011-11-13, version 2.36, AlxNik
#			Update CreateDirectoryLink.
#
#		2011-09-16, version 2.35, AlxNik
#			Add GetRamSize.
#
#		2011-09-12, version 2.34, AlxNik
#			Add Client Side Port support for GREngine.
#
#		2011-08-31, version 2.33, AlxNik
#			Add Read_MediaAppTemplates_data,GetMediaAppTemplatesInfo.
#
#		2011-08-11, version 2.32, AlxNik
#			Add InitLaunchPath,GetLaunchPath.
#
#		2011-07-22, version 2.31, AlxNik
#			Update ReadHostDBID (replace install_common::GetIPAddress by
#			install_common::GetAllIPAddresses).
#
#		2011-07-21, version 2.30, AlxNik
#			Add GetMediaIPsInfo,Read_MediaIPs_data,GetMediaInfo,Read_Media_data,
#			GetMediaBase,Read_Media_Base.
#
#		2011-07-14, version 2.29, AlxNik
#			Update CreateLinkEx.
#
#		2011-07-14, version 2.28, AlxNik
#			Add Client Side Port support for eSSMSSrv,SocialMsgSrv,eSClassificSrv.
#
#		2011-06-28, version 2.27, AlxNik
#			Add CreateDirectoryLink.
#
#		2011-06-26, version 2.26, AlxNik
#			Add IPv6 support.
#
#		2011-06-06, version 2.25, AlxNik
#			Add support for alternative apptype in GenericInstall.
#			Add CheckComponent_ClientSidePort_Support prototype.
#
#		2011-05-05, version 2.24, AlxNik
#			Update Client Side Port support for StatServer.
#
#		2011-04-29, version 2.23, AlxNik
#			Add Client Side Port support for StatServer.
#
#		2011-04-26, version 2.22, AlxNik
#			Update UpdateLicenseForItaniumModel (disable customization).
#
#		2011-04-05, version 2.21, AlxNik
#			Update VerifyOS (Linux version checking).
#
#		2011-02-25, version 2.20, AlxNik
#			Add GetHomeDirectory.
#
#		2011-02-15, version 2.19, AlxNik
#			Add Client Side Port support for TSrvCSTA,CSTAConnectBW.
#
#		2011-02-07, version 2.18, AlxNik
#			Add SetupTargetDirEx.
#
#		2011-01-31, version 2.17, AlxNik
#			Add Client Side Port support for GAX, add GetTomcatDirectory.
#
#		2011-01-12, version 2.16, AlxNik
#			Add Client Side Port support for GRATool and vpPolicySrv.
#
#		2010-11-04, version 2.15, AlxNik
#			Add support for Aspect T-Server 8.0.1 changes.
#
#		2010-08-09, version 2.14, AlxNik
#			Update GenericInstall.
#
#		2010-07-21, version 2.13, AlxNik
#			Update Get_LibraryPath.
#
#		2010-07-12, version 2.12, AlxNik
#			Update GenericInstall for Itanium.
#
#		2010-07-06, version 2.11, AlxNik
#			Add Client Side Port support for vpReportServer.
#
#		2010-06-25, version 2.10, AlxNik
#			Add Client Side Port support for vpPSTNConnect, vpAppGateway,
#			vpMediaControl, vpCallControl.
#
#		2010-06-21, version 2.09, AlxNik
#			Add Client Side Port support for vpResMngr.
#
#		2010-04-30, version 2.08, AlxNik
#			Add DeleteLines.
#
#		2010-04-15, version 2.07, AlxNik
#			Add support for Client Side Port for TSrvCiscoUCCE.
#
#		2010-02-10, version 2.06, AlxNik
#			Add CompareRHEVersions.
#
#		2010-02-08, version 2.05, AlxNik
#			Add support for Client Side Port for eSInteractSrv.
#
#		2010-02-08, version 2.04, AlxNik
#			Add support for Client Side Port for eSChatSrv.
#
#		2010-02-08, version 2.03, AlxNik
#			Add SetupTargetDir function.
#
#		2010-01-22, version 2.02, AlxNik
#			Add uninstallation data and functions.
#
#		2010-01-05, version 2.01, AlxNik
#			Add support for Client Side Port for TSrvCoral.
#
#		2009-12-23, version 2.00, AlxNik
#			Add support for Client Side Port for TSrvRealDXiCCL.
#
#		2009-10-29, version 1.99, AlxNik
#			Add support for Client Side Port for NetTSrvISCP and NetTSrvSR3511.
#
#		2009-10-13, version 1.98, AlxNik
#			Add support for Client Side Port for TSrvCTILess.
#
#		2009-08-21, version 1.97, AlxNik
#			Avoid if possible all license questions during upgrade (ER 234311319).
#
#		2009-08-10, version 1.96, AlxNik
#			Update UpdateLCAData and UpdateLCADataEx to support $TargetDir
#			with spaces.
#
#		2009-05-15, version 1.95, AlxNik
#			Add support for Aspect T-Server 8.x changes.
#
#		2009-04-16, version 1.94, AlxNik
#			Add support for Client Side Port for IVRIServer.
#
#		2008-12-16, version 1.93, AlxNik
#			Add support for uninstall data.
#
#		2008-09-05, version 1.92, AlxNik
#			Update GetCSLoginInfo (recording data for
#			$ClientSidePort_mode_support_standard mode).
#
#		2008-08-26, version 1.91, AlxNik
#			Synchronize UpdateLCADataEx with UpdateLCAData,
#			CreateRunFileEx with CreateRunFile,
#			MakeRunFileEx with MakeRunFile.
#
#		2008-08-22, version 1.90, AlxNik
#			Add Get_LibraryPath_Name, Get_LibraryPath,
#			UpdateLCADataEx (install_ics::UpdateLCAData),
#			CreateRunFileEx (install_ics::CreateRunFile),
#			MakeRunFileEx (install_ics::MakeRunFile)
#
#		2008-07-24, version 1.89, AlxNik
#			Update CheckJavaVersion.
#
#		2008-07-18, version 1.88, AlxNik
#			Update EULA support.
#
#		2008-07-18, version 1.87, AlxNik
#			Add $Silent_response_file_InstallPath_key_name standard support in
#			silent mode.
#
#		2008-07-07, version 1.86, AlxNik
#			Move all IP description variables to install_common.
#			Add release_notes directory support.
#
#		2008-06-09, version 1.85, AlxNik
#			Add EULA support.
#
#		2008-05-01, version 1.84, AlxNik
#			Add re-branding support.
#
#		2008-03-12, version 1.83, AlxNik
#			Add support for AIX 64 bit by CCADataSourcer 7.2.1.
#
#		2008-03-12, version 1.82, AlxNik
#			Use $install_common::NotHostnamePattern,
#			$install_common::PossibleHostFormat_prompt.
#			Use install_common::AskHostname in GetCSLoginInfo.
#
#		2008-01-21, version 1.81, AlxNik
#			Change support for Client Side Port for TSrvIntecomE.
#
#		2008-01-17, version 1.80, AlxNik
#			Change support for Client Side Port for TSrvCiscoCM.
#
#		2007-12-20, version 1.79, AlxNik
#			Change support for Client Side Port for Tier1 T-Servers.
#
#		2007-12-14, version 1.78, AlxNik
#			Add detailed diagnostic for ConfigServer requests (ER 165285025).
#
#		2007-12-10, version 1.77, AlxNik
#			Add support for Client Side Port for Tier1 T-Servers.
#
#		2007-12-03, version 1.76, AlxNik
#			Add support for Client Side Port for OCServer.
#
#		2007-11-20, version 1.75, AlxNik
#			Add support for Client Side Port for URServer and CustomServer.
#
#		2007-11-20, version 1.74, AlxNik
#			Add support for Client Side Port,
#			move IsValidIPAddress to install_common.
#
#		2007-09-26, version 1.73, AlxNik
#			Add checking for $ip_description_filename presence.
#
#		2007-09-24, version 1.72, AlxNik
#			Add support for standard 64-bit processing (ER 146219031).
#
#		2007-09-04, version 1.71, AlxNik
#			Update CreateRunFile and UpdateLCAData.
#
#		2007-07-23, version 1.70, AlxNik
#			Add DeleteDescriptionFiles.
#
#		2007-05-07, version 1.69, AlxNik
#			Update ReadHostDBID.
#
#		2007-04-25, version 1.68, AlxNik
#			Update CreateRunFile (ER 122356641).
#
#		2007-01-26, version 1.67, AlxNik
#			Add support for single client application in GCTISetup.ini file (ER 95807581).
#
#		2006-12-20, version 1.66, AlxNik
#			Add support for single application in GCTISetup.ini file (ER 95807572).
#
#		2006-11-21, version 1.65, AlxNik
#			Add checking for OS version (ER 73190105), add CompareVersionsEx.
#
#		2006-11-14, version 1.64, AlxNik
#			Add checking for application data (ER 79363336).
#
#		2006-11-01, version 1.63, AlxNik
#			Update DefaultInstall.
#
#		2006-10-10, version 1.62, AlxNik
#			Update AskAboutLicense.
#
#		2006-10-10, version 1.61, AlxNik
#			Add support for comments in files used for silent mode.
#
#		2006-10-04, version 1.60, AlxNik
#			Save name of used host in ReadHostDBID.
#
#		2006-09-29, version 1.59, AlxNik
#			Add support for multi-component installations.
#
#		2006-09-26, version 1.58, AlxNik
#			Update DefineApplicationName: process flag for client application,
#			use silent mode data.
#
#		2006-09-12, version 1.57, AlxNik
#			Update GetCSLoginInfo: use install_common::AskNumber for port.
#
#		2006-09-11, version 1.56, AlxNik
#			Messages changes (ER 65712591).
#
#		2006-09-01, version 1.55, AlxNik
#			Update UpdateLCAData.
#
#		2006-08-30, version 1.54, AlxNik
#			Update GetCSLoginInfo.
#
#		2006-08-24, version 1.53, AlxNik
#			Update CheckJavaVersion.
#
#		2006-07-27, version 1.52, AlxNik
#			Add AskForExistingPath.
#
#		2006-07-27, version 1.51, AlxNik
#			Add AIX 64-bit mode support.
#
#		2006-07-26, version 1.50, AlxNik
#			Add applications sorting from GCTISetup.ini.
#
#		2006-07-20, version 1.49, AlxNik
#			Add DefaultInstallExS,AskOptions functions.
#
#		2006-07-03, version 1.48, AlxNik
#			Add $ErrorReadingInformationFromConfigurationServerMessage item.
#
#		2006-06-29, version 1.47, AlxNik
#			Add PrintInstallationHeaderEx, PrintInstallationFooterEx.
#
#		2006-06-05, version 1.46, AlxNik
#			Update application version in Config Server starting from 7.5 family.
#
#		2006-06-05, version 1.45, AlxNik
#			Update GetApplicationData function, move CreateSilentLog to
#			install_common, add AskAboutLicense.
#
#		2006-04-19, version 1.44, AlxNik
#			Add GetOption function,
#			replace SetupLicenseMode, SetupFreeSpaceCheckingMode,
#			SetupApplicationsHostFilteringMode,
#			SetupConfiguredApplicationTypeMode by GetOperationMode.
#
#		2006-04-06, version 1.43, AlxNik
#			Add GetOperationMode, GetOperationModeEx functions.
#
#		2006-03-03, version 1.42, AlxNik
#			Add UpdateConfigValues function.
#
#		2006-02-23, version 1.41, AlxNik
#			Add SetConfiguredApplicationType function.
#
#		2006-02-02, version 1.40, AlxNik
#			Change $LicensePath processing: modify GetApplicationData to save
#			$LicensePath, modify UpdateLCAData to use $LicensePath if necessary,
#			add GetLicensePath function.
#
#		2006-02-01, version 1.39, AlxNik
#			Add GetConfigurationServerInfo, UseConfiguredApplicationType,
#			SetupConfiguredApplicationTypeMode, GetApplicationType functions.
#
#		2006-01-27, version 1.38, AlxNik
#			Add SetupApplicationsHostFilteringMode function,
#			move GetIPAddress to install_common.
#
#		2006-01-16, version 1.37, AlxNik
#			Add Init function for wrapping install_common::Init(),
#			add SetupFreeSpaceCheckingMode function.
#
#		2006-01-05, version 1.36, AlxNik
#			Add ReadConfigValue.
#
#		2005-10-28, version 1.35, AlxNik
#			Add GetJarPath.
#
#		2005-09-22, version 1.34, AlxNik
#			Update CheckJavaVersion.
#
#		2005-06-16, version 1.33, AlxNik
#			Add CheckJavaVersion from install_ics_web.pm.
#
#		2005-06-01, version 1.32, AlxNik
#			Process encrypted passwords.
#
#		2005-04-21, version 1.31, AlxNik
#			Add IsVersionFromFamily function.
#
#		2005-02-16, version 1.30, AlxNik
#			Update APPLICENSE: allow to specify FQDN and IP address as host name.
#
#		2005-01-10, version 1.29, AlxNik
#			Define CreateLink via CreateLinkEx, add ProcessLinksData.
#
#		2005-01-07, version 1.28, AlxNik
#			Add IsValidIPAddress function.
#
#		2004-12-17, version 1.27, AlxNik
#			Correct APPLICENSE (order of port,host).
#
#		2004-12-03, version 1.26, AlxNik
#			Change APPLICENSE, change pattern for printing "\n".
#
#		2004-11-24, version 1.25, AlxNik
#			Replace ip_description.xml by $ip_description_filename,
#			replace ospatchlist.txt by $ospatchlist_filename.
#
#		2004-11-24, version 1.24, AlxNik
#			Add CreateLinkEx function.
#
#		2004-11-03, version 1.23, AlxNik
#			Add CompareVersions function.
#
#		2004-08-12, version 1.22, AlxNik
#			Update CheckBoxDialog packages
#
#		2004-08-04, version 1.21, AlxNik
#			Remove $FieldWidth printing in CheckBoxDialog packages
#
#		2004-07-26, version 1.20, AlxNik
#			Add ComponentsInfo and CheckBoxDialog packages.
#
#		2004-06-12, version 1.19, AlxNik
#			Add MoveDescriptionFiles and GetIPDescriptionsSubdirname functions.
#
#		2004-05-11, version 1.18, AlxNik
#			Update CopyDescriptionFiles function.
#
#		2004-03-08, version 1.17, AlxNik
#			Add CopyDescriptionFiles function.
#
#		2004-02-06, version 1.16, AlxNik
#			Update prompt for "command line" in UpdateLCAData (ER 41960).
#
#		2003-11-04, version 1.15, AlxNik
#			Add function BackupDirectory.
#
#		2003-10-23, version 1.14, AlxNik
#			Add GetData_from_IP_description and GetApplicaionNameFromStartupFile
#			functions.
#
#		2003-08-25, version 1.13, AlxNik
#			Add optional parameter for DefineApplicationName function.
#
#		2003-07-07, version 1.12, AlxNik
#			Add GetSelection function.
#
#		2003-04-01, version 1.11, AlxNik
#			Change format of $PRODUCT string
#
#		2003-02-27, version 1.10, AlxNik
#			Use ip_description.xml after update ip_description.pm to version 1.04,
#			update prompt for GCTISetup.ini file (ER 35718)
#
#		2003-02-25, version 1.09, AlxNik
#			Stop using ip_description.xml
#
#		2003-02-24, version 1.08, AlxNik
#			Use ip_description.xml
#
#		2003-02-21, version 1.07, AlxNik
#			Add support for reading IP address from Config Server (ER 35829)
#
#		2003-01-03, version 1.06, AlxNik
#			Use BITS with optional parameter
#
#		2002-12-12, version 1.05, AlxNik
#			Use nicknames for comments
#
#		2002-11-11, version 1.04, AlxNik
#			Add DefaultInstallEx, MakeLicensePath, GetConfigServerData, CreateRunFile,
#			modify MakeRunFile - process MAKERUNSH error,
#			add all necessary prototypes to ensure compile-time argument checking,
#			add GenericInstall function.
#
#		2002-05-31, version 1.03, AlxNik
#			use subroutines with prototypes
#
#		2002-05-30, version 1.02, AlxNik
#			modify calls to PARSEINI - return undefined hash on error
#			modify calls to ENUMINI - return undefined scalar on error
#			modify calls to ENUMAPPSLIST - return undefined scalar on error
#
#		2002-05-26, version 1.01, AlxNik
#			port to ActivePerl 5.6.1
#			port to package install_common.pm
#			reformat
#			modify calls to ENUMAPPSLIST - use different parameters
#
#		2002-05-25, version 1.00, AlxNik
#			First release
#===============================================================================

use strict;
use warnings;
use v5.6.1;

use install_common 1.92;
use ip_description 1.11;
use Socket 1.72;

package install_lib;

our $VERSION;
$VERSION = 2.72;

#===============================================================================
# Constants and variables
#===============================================================================

my $ip_descriptions_subdirname="ip_docs";

# Licensing
my $License_mode_legacy=1;
my $License_mode_standard=2;
my $License_mode=$License_mode_standard; # default mode is $License_mode_standard
my $StartingVersionForStandardLicenseMode="7.1.000.00";

# Links
my $Link_created_unknown=-1;
my $Link_created_no=0;
my $Link_created_yes=1;
my $Link_created_flag=$Link_created_unknown;

my $Bits_number_unknown=1;
my $Bits_number=$Bits_number_unknown;

# Free disk space checking
my $Free_disk_space_checking_mode_legacy=1;
my $Free_disk_space_checking_mode_standard=2;
my $Free_disk_space_checking_mode=$Free_disk_space_checking_mode_legacy; # default mode is $Free_disk_space_checking_mode_legacy
my $StartingVersionForStandard_Free_Disk_Space_Checking_Mode="7.5.000.00";

# Applications host filtering
my $App_host_filtering_mode_legacy=1;
my $App_host_filtering_mode_standard=2;
my $App_host_filtering_mode=$App_host_filtering_mode_legacy; # default mode is $App_host_filtering_mode_legacy
my $StartingVersionForStandard_App_Host_Filtering_Mode="7.5.000.00";

# Configured application type mode
my $Configured_app_type_mode_legacy=1;	# don't use
my $Configured_app_type_mode_standard=2;		# use
my $Configured_app_type_mode=$Configured_app_type_mode_legacy; # default mode is $Configured_app_type_legacy
my $StartingVersionForStandard_Configured_App_Type_Mode="7.5.000.00";

# Silent mode support
my $Silent_mode_support_legacy=1;
my $Silent_mode_support_standard=2;
my $Silent_mode_support=$Silent_mode_support_legacy; # default mode is $Silent_mode_support_legacy
my $StartingVersionForStandard_Silent_Mode_Support="7.5.000.00";

# Silent mode options
my $Silent_option_name="-s";
my $Record_option_name="-r";
my $Silent_Path_Response_option_name="-fr";
my $Silent_Path_Log_option_name="-fl";

# Silent response file data
my $Silent_response_file_ConfigServer_section_name="ConfigServer";
my $Silent_response_file_Host_key_name="Host";
my $Silent_response_file_Port_key_name="Port";
my $Silent_response_file_User_key_name="User";
my $Silent_response_file_ApplicationName_key_name="ApplicationName";
my $Silent_response_file_ApplicationNameClient_key_name="ApplicationNameClient";
my $Silent_response_file_Password_key_name="Password";
my $Silent_response_file_xPassword_key_name="xPassword";
my $Silent_response_file_ClientSidePort_key_name="transport-port";
my $Silent_response_file_ClientSideIPAddress_key_name="transport-address";

my $Silent_response_file_License_section_name="License";
my $Silent_response_file_LicenseAgreement_key_name="LicenseAgreement";
my $Silent_response_file_UseLicense_key_name="UseLicense";
my $Silent_response_file_AccessType_key_name="AccessType";
my $Silent_response_file_LicenseManager_Host_key_name="Host";
my $Silent_response_file_LicenseManager_Port_key_name="Port";
my $Silent_response_file_License_File_key_name="File";
my %Silent_License_info=();

my $LicenseAcceptance_NotAccepted_value="NotAccepted";
my $LicenseAcceptance_Accepted_value="Accepted";

my $LicenseUsage_Required_value="Required";
my $LicenseUsage_NotRequired_value="NotRequired";

my $LicenseType_Manager_value="LicenseManager";
my $LicenseType_File_value="LicenseFile";

# Application version update mode
my $App_version_update_mode_legacy=1;
my $App_version_update_mode_standard=2;
my $App_version_update_mode=$App_version_update_mode_legacy; # default mode is $App_version_update_mode_legacy
my $StartingVersionForStandard_App_version_update_Mode="7.5.000.00";
my $StartingConfigServer_version_for_Application_version_update="7.5.000.00";
my $Application_version="";

my $ErrorReadingInformationFromConfigurationServerMessage="Unable to read information from the Configuration Server.";

# AIX 5.x 64-bit mode support
my $AIX_64_bit_mode_support_legacy=1;
my $AIX_64_bit_mode_support_standard=2;
my $AIX_64_bit_mode_support=$AIX_64_bit_mode_support_legacy; # default mode is $AIX_64_bit_mode_support_legacy
my $StartingVersionForStandard_AIX_64_bit_Mode_Support="7.5.000.00";
my $StartingVersionForStandard_CCADataSourcer_AIX_64_bit_Mode_Support="7.2.100.02";
my $DataSourcer_NickName="CCADataSourcer";

# GCTISetup.ini application data checking mode
my $ApplicationDataChecking_mode_support_legacy=1;
my $ApplicationDataChecking_mode_support_standard=2;
my $ApplicationDataChecking_mode_support=$ApplicationDataChecking_mode_support_legacy; # default mode is $ApplicationDataChecking_mode_support_legacy
my $StartingVersionForStandard_ApplicationDataChecking_Mode_Support="7.5.000.00";

# OS version checking mode
my $OSVersionChecking_mode_support_legacy=1;
my $OSVersionChecking_mode_support_standard=2;
my $OSVersionChecking_mode_support=$OSVersionChecking_mode_support_legacy; # default mode is $OSVersionChecking_mode_support_legacy
my $StartingVersionForStandard_OSVersionChecking_Mode_Support="7.5.000.00";

# Multi-component data
our $McData_ComponentId_FieldName="component_id";
our $McData_SelectedFlag_FieldName="selected_flag";
our $McData_TarName_FieldName="tar_name";
our $McData_ComponenDirectory_FieldName="component_directory";

our $McData_UseComponentDirectory=1;
our $McData_DoNotUseComponentDirectory=2;
my $McData_debug=0;

# ReadHostDBID data
our $UsedHost="";

# Single application in GCTISetup.ini file processing
my $SingleAppInIniFile_mode_legacy=1;
my $SingleAppInIniFile_mode_standard=2;
my $SingleAppInIniFile_mode=$SingleAppInIniFile_mode_legacy; # default mode is $SingleAppInIniFile_mode_legacy
my $StartingVersionForStandard_SingleAppInIniFile_Mode="7.5.000.00";

# Standard 64-bit modules mode support (don't ask to install 64-bit modules on 32-bit OS)
my $Module_64_bit_mode_support_legacy=1;
my $Module_64_bit_mode_support_standard=2;
my $Module_64_bit_mode_support=$Module_64_bit_mode_support_legacy; # default mode is $Module_64_bit_mode_support_legacy
my $StartingVersionForStandard_Module_64_bit_Mode_Support="8.0.000.00";

# Client Side Port support
my $ClientSidePort_mode_support_legacy=1;
my $ClientSidePort_mode_support_standard=2;
my $ClientSidePort_mode_support=$ClientSidePort_mode_support_legacy; # default mode is $ClientSidePort_mode_support_legacy
my $StartingVersionForStandard_ClientSidePort_Mode_Support="7.6.000.00";

my @ClientSidePort_ComponentsInfo=(
	{
		IP_Nickname => "URServer",
		Starting_SupportVersion => "7.6.001.01",
	},
	{
		IP_Nickname => "CustomServer",
		Starting_SupportVersion => "7.6.000.02",
	},
	{
		IP_Nickname => "OCServer",
		Starting_SupportVersion => "7.6.000.08",
	},
	{
		IP_Nickname => "TSrvDMS100",
		Starting_SupportVersion => "7.6.005.01",
	},
	{
		IP_Nickname => "TSrvG3",
		Starting_SupportVersion => "7.6.005.01",
	},
	{
		IP_Nickname => "TSrvIntecomE",
		Starting_SupportVersion => "7.6.006.83",
	},
	{
		IP_Nickname => "TSrvNEAX",
		Starting_SupportVersion => "7.6.002.07",
	},
	{
		IP_Nickname => "TSrvSpectrum",
		Starting_SupportVersion => "7.6.009.08",
	},
	{
		IP_Nickname => "TSrvSuccession",
		Starting_SupportVersion => "7.6.005.01",
	},
	{
		IP_Nickname => "TSrvA4400",
		Starting_SupportVersion => "7.6.001.03",
	},
	{
		IP_Nickname => "TSrvAspect",
		Starting_SupportVersion => "7.6.001.03",
	},
	{
		IP_Nickname => "TSrvMD110",
		Starting_SupportVersion => "7.6.005.01",
	},
	{
		IP_Nickname => "TSrvHip4000III",
		Starting_SupportVersion => "7.6.005.01",
	},
	{
		IP_Nickname => "TSrvHic300Hi4000",
		Starting_SupportVersion => "7.6.005.01",
	},
	{
		IP_Nickname => "TSrvAvayaTSAPI",
		Starting_SupportVersion => "7.6.001.02",
	},
	{
		IP_Nickname => "TSrvHuaweiNGN",
		Starting_SupportVersion => "7.6.000.00",
	},
	{
		IP_Nickname => "NetTSrvSprint",
		Starting_SupportVersion => "7.6.000.05",
	},
	{
		IP_Nickname => "NetTSrvDT",
		Starting_SupportVersion => "7.6.000.04",
	},
	{
		IP_Nickname => "NetTSrvCRSP",
		Starting_SupportVersion => "7.6.000.04",
	},
	{
		IP_Nickname => "NetTSrvATT",
		Starting_SupportVersion => "7.6.000.05",
	},
	{
		IP_Nickname => "NetTSrvNGSN",
		Starting_SupportVersion => "7.6.000.04",
	},
	{
		IP_Nickname => "NetTSrvGenSpec",
		Starting_SupportVersion => "7.6.000.05",
	},
	{
		IP_Nickname => "NetTSrvWorldCom",
		Starting_SupportVersion => "7.6.000.04",
	},
	{
		IP_Nickname => "TSrvCiscoCM",
		Starting_SupportVersion => "7.6.005.01",
	},
	{
		IP_Nickname => "IVRIServer",
		Starting_SupportVersion => "8.0.000.01",
	},
	{
		IP_Nickname => "TSrvCTILess",
		Starting_SupportVersion => "7.6.000.01",
	},
	{
		IP_Nickname => "NetTSrvISCP",
		Starting_SupportVersion => "8.0.000.05",
	},
	{
		IP_Nickname => "NetTSrvSR3511",
		Starting_SupportVersion => "8.0.000.08",
	},
	{
		IP_Nickname => "TSrvRealDXiCCL",
		Starting_SupportVersion => "8.0.000.00",
	},
	{
		IP_Nickname => "TSrvCoral",
		Starting_SupportVersion => "8.0.000.00",
	},
	{
		IP_Nickname => "eSChatSrv",
		Starting_SupportVersion => "8.0.100.06",
	},
	{
		IP_Nickname => "eSInteractSrv",
		Starting_SupportVersion => "8.0.100.12",
	},
	{
		IP_Nickname => "TSrvCiscoUCCE",
		Starting_SupportVersion => "8.0.000.00",
	},
	{
		IP_Nickname => "vpResMngr",
		Starting_SupportVersion => "8.1.300.00",
	},
	{
		IP_Nickname => "vpPSTNConnect",
		Starting_SupportVersion => "8.1.300.00",
	},
	{
		IP_Nickname => "vpAppGateway",
		Starting_SupportVersion => "8.1.300.00",
	},
	{
		IP_Nickname => "vpMediaControl",
		Starting_SupportVersion => "8.1.300.00",
	},
	{
		IP_Nickname => "vpCallControl",
		Starting_SupportVersion => "8.1.300.00",
	},
	{
		IP_Nickname => "vpReportServer",
		Starting_SupportVersion => "8.1.300.00",
	},
	{
		IP_Nickname => "GRATool",
		Starting_SupportVersion => "8.1.000.00",
	},
	{
		IP_Nickname => "vpPolicySrv",
		Starting_SupportVersion => "8.1.400.00",
	},
	{
		IP_Nickname => "GAX",
		Starting_SupportVersion => "8.1.000.00",
	},
	{
		IP_Nickname => "TSrvCSTA",
		Starting_SupportVersion => "8.0.100.00",
	},
	{
		IP_Nickname => "CSTAConnectBW",
		Starting_SupportVersion => "8.0.100.00",
	},
	{
		IP_Nickname => "StatServer",
		Starting_SupportVersion => "8.1.000.07",
	},
	{
		IP_Nickname => "eSSMSSrv",
		Starting_SupportVersion => "8.1.000.00",
	},
	{
		IP_Nickname => "SocialMsgSrv",
		Starting_SupportVersion => "8.1.000.00",
	},
	{
		IP_Nickname => "eSClassificSrv",
		Starting_SupportVersion => "8.1.000.00",
	},
	{
		IP_Nickname => "GREngine",
		Starting_SupportVersion => "8.1.000.00",
	},
	{
		IP_Nickname => "InfoMart",
		Starting_SupportVersion => "8.1.100.00",
	},
	{
		IP_Nickname => "vpCiscoUCMCnt",
		Starting_SupportVersion => "8.1.500.00",
	},
	{
		IP_Nickname => "vpMRCPProxy",
		Starting_SupportVersion => "8.1.400.00",
	},
	{
		IP_Nickname => "SIPProxy",
		Starting_SupportVersion => "8.1.100.00",
	},
	{
		IP_Nickname => "GMS",
		Starting_SupportVersion => "8.1.000.31",
	},
	{
		IP_Nickname => "LicenseRepoMngr",
		Starting_SupportVersion => "8.1.100.06",
	},
	{
		IP_Nickname => "MWARSMPGateway",
		Starting_SupportVersion => "8.5.000.00",
	},
	{
		IP_Nickname => "eSEmailSrvJava",
		Starting_SupportVersion => "8.1.300.00",
	},
	{
		IP_Nickname => "eSContSrvProxy",
		Starting_SupportVersion => "8.1.300.00",
	},
	{
		IP_Nickname => "eSContSrv",
		Starting_SupportVersion => "8.1.300.00",
	},
	{
		IP_Nickname => "eSTrainingSrv",
		Starting_SupportVersion => "8.1.300.00",
	},
	{
		IP_Nickname => "eSIntSrvProxy",
		Starting_SupportVersion => "8.1.300.02",
	},
	{
		IP_Nickname => "ICon",
		Starting_SupportVersion => "8.1.100.25",
	},
	{
		IP_Nickname => "vpCTIConnect",
		Starting_SupportVersion => "8.1.400.00",
	},
	{
		IP_Nickname => "TSrvMiV5000",
		Starting_SupportVersion => "8.1.000.00",
	},
);

# ConfigServer requests diagnostic support
my $ConfigServerRequestsDiagnostic_mode_support_legacy=1;
my $ConfigServerRequestsDiagnostic_mode_support_standard=2;
my $ConfigServerRequestsDiagnostic_mode_support=$ConfigServerRequestsDiagnostic_mode_support_legacy; # default mode is $ConfigServerRequestsDiagnostic_mode_support_legacy
my $StartingVersionForStandard_ConfigServerRequestsDiagnostic_Mode_Support="8.0.000.00";

# Configuration Install Utility error codes
my $CIU_rcSuccess=0;
my $CIU_rcServerNotFound=1; # invalid host
my $CIU_rcLoginIncorrect=3; # invalid login (user/password or both)
my $CIU_rcObjectNotFound=10; # object not found
my $CIU_rcConnWriteError=20; # invalid port

# Re-branding data
my $Vendor="";

# $Silent_response_file_InstallPath_key_name support in silent mode
my $InstallPathInSilentMode_support_legacy=1;
my $InstallPathInSilentMode_support_standard=2;
my $InstallPathInSilentMode_support=$InstallPathInSilentMode_support_legacy; # default mode is $InstallPathInSilentMode_support_legacy
my $StartingVersionForStandard_InstallPathInSilentMode_Support="8.0.000.00";

# EULA
my $UseEULAFile=0;

# Uninstall data support (GA)
my $UninstallData_support_legacy=1;
my $UninstallData_support_standard=2;
my $UninstallData_support=$UninstallData_support_legacy; # default mode is $UninstallData_support_legacy
my $StartingVersionForStandard_UninstallData_support="8.0.000.00";

# Aspect T-Server 8.x changes
my $AspectTServer_support_legacy=1;
my $AspectTServer_support_standard=2;
my $AspectTServer_support=$AspectTServer_support_legacy; # default mode is $AspectTServer_support_legacy
my $StartingVersionForStandard_AspectTServer_support="8.0.000.07";

# Aspect T-Server 8.0.1 changes
my $AspectTServer_AllPlatforms_support_legacy=1;
my $AspectTServer_AllPlatforms_support_standard=2;
my $AspectTServer_AllPlatforms_support=$AspectTServer_AllPlatforms_support_legacy; # default mode is $AspectTServer_AllPlatforms_support_legacy
my $StartingVersionFor_AspectTServer_AllPlatforms_support="8.0.100.03";

# License questions during upgrade 8.x changes
my $LicenseQuestionsDuringUpgrade_support_legacy=1;
my $LicenseQuestionsDuringUpgrade_support_standard=2;
my $LicenseQuestionsDuringUpgrade_support=$LicenseQuestionsDuringUpgrade_support_legacy; # default mode is $LicenseQuestionsDuringUpgrade_support_legacy
my $StartingVersionForStandard_LicenseQuestionsDuringUpgrade_support="8.0.000.00";
my $LicenseDataInConfigServer_found=0;

# Uninstall data
my $Component_Uninstall_DirectoryName="uninstall";
my $Common_Uninstall_ScriptName="uninstall.sh";
my $Component_Uninstall_ScriptName="uninstall_custom.sh";
my $Component_Uninstall_Directory_Detected=0;

# Alternative apptype support
my @AlternativeAppType_ComponentsInfo=(
	{
		IP_Nickname => "CSTAConnectBW",
		Starting_SupportVersion => "8.0.101.01",
		Starting_SupportVersion_ConfigServer => "8.1.000.00",
		LegacyAppType => "77", #CFGHAProxy
		StandardAppType => "172", #CFGCSTAConnector
	},
);

# IPv6 support
my $IPv6_support_legacy=1;
my $IPv6_support_standard=2;
my $IPv6_support=$IPv6_support_legacy; # default mode is $IPv6_support_legacy
my $StartingVersionForStandard_IPv6_support="8.1.000.00";

# ResolveHost data
my $HostResolutionType_IPv4_Only=1;
my $HostResolutionType_IPv6_Only=2;
my $HostResolutionType_IPv4_and_IPv6=3;

our $MediaInfo_filename="MediaInfo.xml";

# LaunchPath data
my $LaunchPath_filename="launch_directory.txt";
my $LaunchPath="";

# GAX data
my $GAX_name="GAX";
my $JettyDirectory="webapp/WEB-INF/lib";
my $Silent_response_file_GAX_Directory_key_name="GAX_Directory";

# Silent response file data
my $Silent_response_file_JavaData_section_name="JavaData";
my $Silent_response_file_JavaPath_key_name="JavaPath";

#===============================================================================
# Prototypes
#===============================================================================

sub MakeRunFile($$$);
sub MakeRunFileEx($$$$);
sub MakeLicensePath($);
sub GetConfigServerData(\%$$);
sub CreateRunFile(\%$$$$$);
sub CreateRunFileEx(\%$$$$$$);
sub Read_IP_description($$$);
sub UpdateProductData($$);
sub UseLegacyLicenseMode();
sub UseStandardLicenseMode();
sub GetSelection($$\@);
sub Set_Link_created_flag($);
sub Get_Link_created_flag();
sub Was_Link_created();
sub Set_Bits_number($);
sub Get_Bits_number();
sub ProcessLinksData($\@);
sub GetConfigurationServerInfo(\%$\%);
sub CreateSilentLog($$$);
sub ProcessLicenseAgreement($);
sub GetConfigServerConnectionProblemMessage($);
sub UpdateApplicationVersion(\%$$);

sub DetectComponentsSelection(\@$);
sub SetComponentsSelection(\@$);
sub RemoveTars(\@$);
sub InstallComponent(\@$$$$$);
sub Read_IP_description_OS_data($\@);
sub Process_Configuration_Install_Utility_Error($\%);
sub UpdateApplicationUninstallData(\%$$;$);

sub CheckComponent_ClientSidePort_Support($$\@);
sub CheckForAlternativeAppType(\%$$);
sub CheckComponent_AlternativeAppType_Support($$\@$$$$);

sub GetIPAddresses($\@$);

sub GetMediaBase($\@$$);
sub Read_Media_Base(\@$);
sub GetMediaIPsInfo($\@);
sub Read_MediaIPs_data(\@);
sub GetMediaInfo($\@);
sub Read_Media_data(\@);
sub GetMediaAppTemplatesInfo($\@);
sub Read_MediaAppTemplates_data(\@);

sub Process_Configuration_Install_Utility_Object_Not_Found_Error_IP_address($$$\@);

sub CreateDirectoryLink($;$);

#===============================================================================
# Subroutines
#===============================================================================

#===============================================================================
# Name:
#	UseLegacyLicenseMode
# Description:
#	Switches to legacy license mode
# Input parameters:
#	None.
# Return value:
#	None.
#===============================================================================

sub UseLegacyLicenseMode()
{
	$License_mode=$License_mode_legacy;
}

#===============================================================================
# Name:
#	UseStandardLicenseMode
# Description:
#	Switches to standard license mode
# Input parameters:
#	None.
# Return value:
#	None.
#===============================================================================

sub UseStandardLicenseMode()
{
	$License_mode=$License_mode_standard;
}

#===============================================================================
# Name:
#	APPLICENSE
# Description:
#	Takes path to file and flag for asking for
#	path as its arguments. If asking is specified,
#	and path is empty, function asks for new path and tries to verify it.
# Input parameters:
#	Path to file
#	Flag for asking path, if path is empty
# Return value:
#	Path to file.
#===============================================================================

sub APPLICENSE($$)
{
	my $LicensePath = $_[0];
	my $UseLicense = $_[1];

	my $FullPath_prompt_legacy="Please enter the full path to the license file =>";
	my $FullPath_prompt="Please enter the full path to the license file, with the exact file name =>";
	my $NewPath_prompt_legacy="Do you wish to enter a new license path (y/n)?";
	my $NewPath_prompt="Do you wish to enter a new path to the license file (y/n)?";
	my $LicenseManager_prompt="Please enter the License Manager";
	my $LicenseManager_host="host name";
	my $LicenseManager_port="port number";
	my $MissingFile_prompt_legacy="Warning: license file does not exist.";
	my $MissingFile_prompt="Warning: the specified license file does not exist.";
	my $LicenseManagerReenter_prompt="Do you wish to enter a new License Manager";
	my $YesNo_prompt="(y/n)?";
	my $FormatWarning_prompt="Warning: entered data is not in valid";
	my $Format_prompt="format";
	my $PossibleHostFormat_prompt="($install_common::PossibleHostFormat_prompt)";
	my $PossiblePortFormat_prompt="(should be a number)";

	GetOperationMode($StartingVersionForStandardLicenseMode,$License_mode_legacy,$License_mode_standard,\$License_mode);

	if ($License_mode == $License_mode_legacy)
	{
		if ($UseLicense)
		{
			if (install_common::Get_silent_mode() == 0)
			{
				while (! $LicensePath)
				{
					$LicensePath=install_common::ASK("\n$FullPath_prompt_legacy");

					if (! -f $LicensePath)
					{
						print "$MissingFile_prompt_legacy\n";

						if ( (install_common::ASK($NewPath_prompt_legacy, "y", "n")) eq "y" )
						{
							$LicensePath="";
						}
					}
				}
			}
			else
			{
				my $value=$Silent_License_info{$Silent_response_file_AccessType_key_name};

				if (!defined($value))
				{
					my $Message="Key $Silent_response_file_AccessType_key_name in section $Silent_response_file_License_section_name was not found.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}

				if ($value ne $LicenseType_File_value)
				{
					my $Message="Invalid value for key $Silent_response_file_AccessType_key_name in section $Silent_response_file_License_section_name.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}

				$value=$Silent_License_info{$Silent_response_file_License_File_key_name};

				if (!defined($value))
				{
					my $Message="Key $Silent_response_file_License_File_key_name in section $Silent_response_file_License_section_name was not found.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}

				$LicensePath=$value;

				if (! -f $LicensePath)
				{
					my $Message="License file $LicensePath was not found.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}
			}
		}

		if ($LicensePath)
		{
			$LicensePath="-l \\\"$LicensePath\\\"";
		}
	}
	elsif ($License_mode == $License_mode_standard)
	{
		if ($UseLicense)
		{
			if (install_common::Get_silent_mode() == 0)
			{
				if ( (install_common::IsOverwriteMode) &&
					($LicenseQuestionsDuringUpgrade_support == $LicenseQuestionsDuringUpgrade_support_standard) &&
					($LicenseDataInConfigServer_found == 1))
				{
					# we don't need any license questions
				}
				else
				{
					my $Question="\nPlease select the format for your license location. Enter the number:\n";
					$Question=$Question . "1) Full path to the license file\n";
					$Question=$Question . "2) License Manager port and host\n";
					$Question=$Question . "=>";
					my $DefaultSelection=undef;
					my @SelectionsList=(1,2);

					my $Selection=GetSelection($Question,$DefaultSelection,@SelectionsList);

					if ($Selection == 1)
					{
						while (! $LicensePath)
						{
							$LicensePath=install_common::ASK("\n$FullPath_prompt");

							if (! -f $LicensePath)
							{
								print "\n$MissingFile_prompt\n";

								if ( (install_common::ASK($NewPath_prompt, "y", "n")) eq "y" )
								{
									$LicensePath="";
								}
							}
						}

						if (install_common::Get_record_mode() == 1)
						{
							my $Filepath = install_common::Get_silent_mode_response_file_path();
							my $Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_License_section_name,$Silent_response_file_AccessType_key_name,$LicenseType_File_value);
							$Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_License_section_name,$Silent_response_file_License_File_key_name,$LicensePath);
						}
					}
					elsif ($Selection == 2)
					{
						my $host=undef;

						while (! $host)
						{
							$host=install_common::ASK("\n$LicenseManager_prompt $LicenseManager_host =>");

							if ($host =~ /$install_common::NotHostnamePattern/ )
							{
								print "\n$FormatWarning_prompt $LicenseManager_host $Format_prompt $PossibleHostFormat_prompt.\n";

								if ( (install_common::ASK("$LicenseManagerReenter_prompt $LicenseManager_host $YesNo_prompt", "y", "n")) eq "y" )
								{
									$host="";
								}
								else
								{
									print "\n";
								}
							}
						}

						my $port=undef;

						while (! $port)
						{
							$port=install_common::ASK("$LicenseManager_prompt $LicenseManager_port =>");

							if ($port =~ /\D/)
							{
								print "\n$FormatWarning_prompt $LicenseManager_port $Format_prompt $PossiblePortFormat_prompt.\n";

								if ( (install_common::ASK("$LicenseManagerReenter_prompt $LicenseManager_port $YesNo_prompt", "y", "n")) eq "y" )
								{
									$port="";
									print "\n";
								}
							}
						}

						$LicensePath="$port\@$host";

						if (install_common::Get_record_mode() == 1)
						{
							my $Filepath = install_common::Get_silent_mode_response_file_path();
							my $Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_License_section_name,$Silent_response_file_AccessType_key_name,$LicenseType_Manager_value);
							$Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_License_section_name,$Silent_response_file_LicenseManager_Host_key_name,$host);
							$Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_License_section_name,$Silent_response_file_LicenseManager_Port_key_name,$port);
						}
					}
				}
			}
			else
			{
				my $value=$Silent_License_info{$Silent_response_file_AccessType_key_name};

				if (!defined($value))
				{
					my $Message="Key $Silent_response_file_AccessType_key_name in section $Silent_response_file_License_section_name was not found.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}

				if (($value ne $LicenseType_File_value) && ($value ne $LicenseType_Manager_value))
				{
					my $Message="Invalid value for key $Silent_response_file_AccessType_key_name in section $Silent_response_file_License_section_name.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}

				if ($value eq $LicenseType_File_value)
				{
					$value=$Silent_License_info{$Silent_response_file_License_File_key_name};

					if (!defined($value))
					{
						my $Message="Key $Silent_response_file_License_File_key_name in section $Silent_response_file_License_section_name was not found.";
						install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
					}

					$LicensePath=$value;

					if (! -f $LicensePath)
					{
						my $Message="License file $LicensePath was not found.";
						install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
					}
				}
				else
				{
					# $LicenseType_Manager_value
					my $FormatWarning_prompt="entered data is not in valid";

					my $value=$Silent_License_info{$Silent_response_file_LicenseManager_Host_key_name};

					if (!defined($value))
					{
						my $Message="Key $Silent_response_file_LicenseManager_Host_key_name in section $Silent_response_file_License_section_name was not found.";
						install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
					}

					$value=$Silent_License_info{$Silent_response_file_LicenseManager_Port_key_name};

					if (!defined($value))
					{
						my $Message="Key $Silent_response_file_LicenseManager_Port_key_name in section $Silent_response_file_License_section_name was not found.";
						install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
					}

					my $host=$Silent_License_info{$Silent_response_file_LicenseManager_Host_key_name};

					if ($host =~ /[^0-9a-zA-Z-\.]+/ )
					{
						my $Message="Key $Silent_response_file_LicenseManager_Host_key_name value: $FormatWarning_prompt $LicenseManager_host $Format_prompt $PossibleHostFormat_prompt";
						install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
					}

					my $port=$Silent_License_info{$Silent_response_file_LicenseManager_Port_key_name};

					if ($port =~ /\D/)
					{
						my $Message="Key $Silent_response_file_LicenseManager_Port_key_name value: $FormatWarning_prompt $LicenseManager_port $Format_prompt $PossiblePortFormat_prompt";
						install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
					}

					$LicensePath="$port\@$host";
				}
			}
		}

		if ($LicensePath)
		{
			$LicensePath="-l \\\"$LicensePath\\\"";
		}
	}

	return $LicensePath;
}

#===============================================================================
# Name:
#	MakeConfigServerPasswordOption
# Description:
#	Converts Config Server password into Config Server password option.
# Input parameters:
#	Config Server password
#	Config Server xpassword
# Return value:
#	Config Server password option.
#===============================================================================

sub MakeConfigServerPasswordOption($$)
{
	my $ConfigServerPasswordOption;
	my $password = $_[0];
	my $xpassword = $_[1];

	# this allows for the case of null password

	if (defined($password) and $password ne "")
	{
		$ConfigServerPasswordOption="-pw \"$password\"";
	}
	elsif (defined($xpassword) and $xpassword ne "")
	{
		$ConfigServerPasswordOption="-epw \"$xpassword\"";
	}
	else
	{
		$ConfigServerPasswordOption="";
	}

	return $ConfigServerPasswordOption;
}

#===============================================================================
# Name:
#	GetCSLoginInfo
# Description:
#	Gets Config Server login parameters from GCTISetup.ini,
#	or from the user.
# Input parameters:
#	Name of .ini file
#	Reference to Config Server password option
#	Display message about missing $INIFILE file option
# Return value:
#	Hash of Config Server login parameters.
#===============================================================================

sub GetCSLoginInfo($$;$)
{
	my $INIFILE = $_[0];
	my $DisplayIniFileMessage = undef;

	if (defined($_[2]))
	{
		$DisplayIniFileMessage = $_[2];
	}

	my %IniSectionData;
	%IniSectionData=install_common::PARSEINI($INIFILE,$install_common::WizardIniFile_GeneralSection);

	if (!%IniSectionData)
	{
		if (install_common::Get_silent_mode() == 0)
		{
			my $Message="\nUnable to find configuration information.\n";
			$Message=$Message . "Either you have not used configuration wizards and the\n";
			$Message=$Message . "$INIFILE file was not created or the file is corrupted.\n\n";

			$DisplayIniFileMessage=0;

			if (defined($DisplayIniFileMessage))
			{
				if ($DisplayIniFileMessage == 1)
				{
					print $Message;
				}
				else
				{
					print "\n";
				}
			}
			else
			{
				print $Message;
			}

			print "Please enter the following information about your Configuration Server:\n\n";
			$IniSectionData{host}=install_common::AskHostname("Configuration Server Hostname =>");
			$IniSectionData{port}=install_common::AskNumber("Network port =>");
			$IniSectionData{appname}="ITCUtility";  # default
			$IniSectionData{user}=install_common::ASK("User name =>");
			system("stty -echo");
			$IniSectionData{password}=install_common::ASKNULL("Password =>");
			system("stty echo");
			print "\n";

			if ($ClientSidePort_mode_support == $ClientSidePort_mode_support_standard)
			{
				print "\nClient Side Port Configuration\n";
				print "Select the option below to use a Client Side Port. If you select this option,\n";
				print "the application can use Client Side Port number for initial connection to\n";
				print "Configuration Server.\n\n";

				if ( (install_common::ASK("Do you want to use Client Side Port option (y/n)?", "y", "n")) eq "y" )
				{
					$IniSectionData{'transport-port'}=install_common::AskNumber("Client Side Port port =>");

					my @addresses=();
					my $addresses_type;
					GetIPAddresses($IniSectionData{host},@addresses,\$addresses_type);
					my $array_size=scalar @addresses;

					if ($array_size >= 1)
					{
						print "Client Side IP Address (optional), the following values can be used\n";

						for my $elem (@addresses)
						{
							print "$elem\n";
						}

						$IniSectionData{'transport-address'}=install_common::AskNullIPAddress(" =>",$addresses_type);
					}
					else
					{
						$IniSectionData{'transport-address'}=install_common::AskNullIPAddress("Client Side IP Address (optional) =>",$addresses_type);
					}
				}
			}
			else
			{
				$IniSectionData{'transport-port'}="";
				$IniSectionData{'transport-address'}="";
			}
		}
		else
		{
			%IniSectionData=();
			my $Filepath = install_common::Get_silent_mode_response_file_path();

			if (!-f $Filepath)
			{
				my $Message="File $Filepath was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			%IniSectionData=install_common::PARSEINI($Filepath,$Silent_response_file_ConfigServer_section_name,$install_common::comments_characters);

			if (!%IniSectionData)
			{
				my $Message="Section $Silent_response_file_ConfigServer_section_name was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			my $value=$IniSectionData{$Silent_response_file_Host_key_name};

			if (!defined($value))
			{
				my $Message="Key $Silent_response_file_Host_key_name in section $Silent_response_file_ConfigServer_section_name was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			$IniSectionData{host}=$value;

			$value=$IniSectionData{$Silent_response_file_Port_key_name};

			if (!defined($value))
			{
				my $Message="Key $Silent_response_file_Port_key_name in section $Silent_response_file_ConfigServer_section_name was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			$IniSectionData{port}=$value;

			$value=$IniSectionData{$Silent_response_file_User_key_name};

			if (!defined($value))
			{
				my $Message="Key $Silent_response_file_User_key_name in section $Silent_response_file_ConfigServer_section_name was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			$IniSectionData{user}=$value;

			$value=$IniSectionData{$Silent_response_file_Password_key_name};
			my $value_x=$IniSectionData{$Silent_response_file_xPassword_key_name};

			if (!defined($value) && !defined($value_x))
			{
				my $Message="Key $Silent_response_file_Password_key_name or $Silent_response_file_xPassword_key_name in section $Silent_response_file_ConfigServer_section_name was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			$IniSectionData{password}=$value;
			$IniSectionData{xpassword}=$value_x;

			if ($ClientSidePort_mode_support == $ClientSidePort_mode_support_standard)
			{
				$value=$IniSectionData{$Silent_response_file_ClientSidePort_key_name};

				if (!defined($value))
				{
					# transport-port is optional (Client Side Port feature might be not used)
					$value = "";
				}
				else
				{
					install_common::Trim(\$value);

					if (($value eq "") || ($value eq "\"\""))
					{
						$value = "";
					}
				}

				$IniSectionData{'transport-port'}=$value;

				$value=$IniSectionData{$Silent_response_file_ClientSideIPAddress_key_name};

				if (!defined($value))
				{
					# transport-address is optional
					$value = "";
				}
				else
				{
					install_common::Trim(\$value);

					if (($value eq "") || ($value eq "\"\""))
					{
						$value = "";
					}
				}

				$IniSectionData{'transport-address'}=$value;
			}

			$IniSectionData{appname}="ITCUtility";  # default
		}
	}
	else
	{
		$IniSectionData{appname}="ITCUtility";

		if (defined($IniSectionData{'transport-port'}))
		{
			my $value=$IniSectionData{'transport-port'};
			install_common::Trim(\$value);

			if (($value eq "") || ($value eq "\"\""))
			{
				$IniSectionData{'transport-port'}="";
			}
		}
		else
		{
			$IniSectionData{'transport-port'}="";
		}

		if (defined($IniSectionData{'transport-address'}))
		{
			my $value=$IniSectionData{'transport-address'};
			install_common::Trim(\$value);

			if (($value eq "") || ($value eq "\"\""))
			{
				$IniSectionData{'transport-address'}="";
			}
		}
		else
		{
			$IniSectionData{'transport-address'}="";
		}
	}

	my $CSPasswordOption=MakeConfigServerPasswordOption($IniSectionData{password},$IniSectionData{xpassword});

	my $reCSPasswordOption = $_[1];
	$$reCSPasswordOption = $CSPasswordOption;

	if (install_common::Get_record_mode() == 1)
	{
		my $Filepath = install_common::Get_silent_mode_response_file_path();
		my $Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_ConfigServer_section_name,$Silent_response_file_Host_key_name,$IniSectionData{host});
		$Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_ConfigServer_section_name,$Silent_response_file_Port_key_name,$IniSectionData{port});
		$Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_ConfigServer_section_name,$Silent_response_file_User_key_name,$IniSectionData{user});

		if (defined($IniSectionData{xpassword}) and ($IniSectionData{xpassword} ne "") )
		{
			$Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_ConfigServer_section_name,$Silent_response_file_xPassword_key_name,$IniSectionData{xpassword});
		}
		else
		{
			$Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_ConfigServer_section_name,$Silent_response_file_Password_key_name,$IniSectionData{password});
		}

		$Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_ConfigServer_section_name,$Silent_response_file_ApplicationName_key_name,"undefined");

		if ($ClientSidePort_mode_support == $ClientSidePort_mode_support_standard)
		{
			if (defined($IniSectionData{'transport-port'}) and ($IniSectionData{'transport-port'} ne ""))
			{
				$Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_ConfigServer_section_name,$Silent_response_file_ClientSidePort_key_name,$IniSectionData{'transport-port'});
			}

			if (defined($IniSectionData{'transport-address'}) and ($IniSectionData{'transport-address'} ne ""))
			{
				$Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_ConfigServer_section_name,$Silent_response_file_ClientSideIPAddress_key_name,$IniSectionData{'transport-address'});
			}
		}
	}

	return %IniSectionData;
}

#===============================================================================
# Name:
#	ReadHostDBID
# Description:
#	Reads Host DBID from Config Server.
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Local host name
#	Domain name
#	Config Server password option
# Return value:
#	Host DBID or undefined value.
#===============================================================================

sub ReadHostDBID(\%$$$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $LocalHostname = $_[1];
	my $Domain = $_[2];
	my $CSPasswordOption = $_[3];
	my $hostdbid;

	# try first FQDN then short hostname, then IP address
	$UsedHost="$LocalHostname.$Domain";
	my %CSData=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a 0 -at 10 -d -flk name -flv $LocalHostname.$Domain -fn dbid");

	if($CSData{retcode} != 0)
	{
		if ($ConfigServerRequestsDiagnostic_mode_support == $ConfigServerRequestsDiagnostic_mode_support_standard)
		{
			Process_Configuration_Install_Utility_Error($CSData{retcode},%IniSectionData);
		}

		$UsedHost=$LocalHostname;
		%CSData=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a 0 -at 10 -d -flk name -flv $LocalHostname -fn dbid");

		if($CSData{retcode} != 0)
		{
			if ($ConfigServerRequestsDiagnostic_mode_support == $ConfigServerRequestsDiagnostic_mode_support_standard)
			{
				Process_Configuration_Install_Utility_Error($CSData{retcode},%IniSectionData);
			}

			my @IPAddresses=();
			my $Result = install_common::GetAllIPAddresses(@IPAddresses);

			if ($Result == 1)
			{
				my $IP_address_found=0;

				for my $IP_address (@IPAddresses)
				{
					$UsedHost=$IP_address;
					%CSData=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a 0 -at 10 -d -flk name -flv $IP_address -fn dbid");

					if($CSData{retcode} == 0)
					{
						$IP_address_found=1;
						last;
					}
				}

				if ($IP_address_found == 0)
				{
					if ($ConfigServerRequestsDiagnostic_mode_support == $ConfigServerRequestsDiagnostic_mode_support_standard)
					{
						Process_Configuration_Install_Utility_Error($CSData{retcode},%IniSectionData);
						Process_Configuration_Install_Utility_Object_Not_Found_Error_IP_address($CSData{retcode},$LocalHostname,$Domain,@IPAddresses);
					}
				}
			}
			else
			{
				if ($ConfigServerRequestsDiagnostic_mode_support == $ConfigServerRequestsDiagnostic_mode_support_standard)
				{
					my $IP_address="";
					Process_Configuration_Install_Utility_Object_Not_Found_Error($CSData{retcode},$LocalHostname,$Domain,$IP_address);
				}
			}
		}
	}

	if($CSData{retcode} == 0)
	{
		$hostdbid=$CSData{DBID};
	}

	return $hostdbid;
}

#===============================================================================
# Name:
#	DefineApplicationName
# Description:
#	Defines Config Server application name for installation.
# Input parameters:
#	Name of .ini file
#	Reference to hash of Config Server login parameters
#	Reference to hash of application data
#	Config Server password option
#	Config Server application type
#	Host DBID
#	Flag for client application, without a host (optional), "TRUE" means "client"
# Return value:
#	Application name or undefined value.
#===============================================================================

sub DefineApplicationName($\%\%$$$;$)
{
	my $INIFILE = $_[0];
	my $refIniSectionData = $_[1];
	my %IniSectionData = %{$refIniSectionData};
	my $refMyApp = $_[2];
	my %MyApp = %{$refMyApp};
	my $CSPasswordOption = $_[3];
	my $APPTYPE = $_[4];
	my $hostdbid = $_[5];

	# find out which application to install. If neither method works, $MyApp
	# is set to undefined

	my $Client=0;

	if ($#_== 6)
	{
		if ($_[6] eq "TRUE")
		{
			$Client=1;
		}
	}

	if ($Client == 1)
	{
		if ($App_host_filtering_mode == $App_host_filtering_mode_standard)
		{
			install_common::Disable_app_host_filtering();
		}
	}

	my $MyApp=install_common::ENUMINI($INIFILE);

	if ($Client == 1)
	{
		if ($App_host_filtering_mode == $App_host_filtering_mode_standard)
		{
			install_common::Enable_app_host_filtering();
		}
	}

	if (!defined($MyApp))
	{
		my $cmd_line = "-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a 0 -at 9 -d -flk host_dbid -flv $hostdbid -flk app_type -flv $APPTYPE -fn name";

		if ($Client == 1)
		{
			$cmd_line = "-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a 0 -at 9 -d -flk app_type -flv $APPTYPE -fn name";
		}

		$MyApp=install_common::ENUMAPPSLIST($cmd_line);

		if (!$MyApp && (install_common::Get_silent_mode() == 1))
		{
			my %IniSectionData_local=();

			my $Filepath = install_common::Get_silent_mode_response_file_path();

			if (!-f $Filepath)
			{
				my $Message="File $Filepath was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			%IniSectionData_local=install_common::PARSEINI($Filepath,$Silent_response_file_ConfigServer_section_name,$install_common::comments_characters);

			if (!%IniSectionData_local)
			{
					my $Message="Section $Silent_response_file_ConfigServer_section_name was not found.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			my $value="";

			if ($Client == 1)
			{
				$value=$IniSectionData_local{$Silent_response_file_ApplicationNameClient_key_name};

				if (!defined($value))
				{
					my $Message="Key $Silent_response_file_ApplicationNameClient_key_name in section $Silent_response_file_ConfigServer_section_name was not found.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}
			}
			else
			{
				$value=$IniSectionData_local{$Silent_response_file_ApplicationName_key_name};

				if (!defined($value))
				{
					my $Message="Key $Silent_response_file_ApplicationName_key_name in section $Silent_response_file_ConfigServer_section_name was not found.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}
			}

			$MyApp=$value;
		}
	}
	else
	{
		if ($ApplicationDataChecking_mode_support == $ApplicationDataChecking_mode_support_standard)
		{
			# check if $MyApp exists
			my %cfgread=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a 0 -at 9 -d -flk name -flv \"$MyApp\"");

			if($cfgread{retcode} != 0)
			{
				if (install_common::Get_silent_mode() == 0)
				{
					print "\nWarning: Application \"$MyApp\" specified in $INIFILE\nfile doesn't exist in Configuration Server.\n";
				}

				$MyApp = undef;
			}

			if (defined($MyApp))
			{
				%MyApp=install_common::PARSEINI($INIFILE, $MyApp);

				if ($Client == 0)
				{
					# check if DBID for $MyApp exists and is valid

					if (defined($MyApp{dbid}))
					{
						if ($MyApp{dbid} != $cfgread{DBID})
						{
							if (install_common::Get_silent_mode() == 0)
							{
								print "\nWarning: DB ID ($MyApp{dbid}) for application \"$MyApp\" in file $INIFILE\ndoesn't match the DB ID ($cfgread{DBID}) for application \"$MyApp\" in Configuration Server.\n";
							}

							$MyApp=undef;
						}
					}
					else
					{
						if (install_common::Get_silent_mode() == 0)
						{
							print "\nWarning: file $INIFILE doesn't contain DB ID for application \"$MyApp\"\n";
						}

						$MyApp=undef;
					}

					# check if host for $MyApp is valid (host should exist - we did host filterning)
					if (defined($MyApp))
					{
						if (defined($MyApp{host}))
						{
							my $hostDBID=$cfgread{"serverInfo#hostDBID"};
							my %cfgread_host=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a 0 -at 10 -d -flk dbid -flv $hostDBID");

							if($cfgread_host{retcode} != 0)
							{
								if (install_common::Get_silent_mode() == 0)
								{
									print "\nWarning: Host with DB ID $hostDBID for application \"$MyApp\" specified in $INIFILE\nfile doesn't exist in Configuration Server.\n";
								}

								$MyApp = undef;
							}
							else
							{
								# check host name
								my $cfg_hostname=$cfgread_host{name};

								if("\L$MyApp{host}\E" ne "\L$cfg_hostname\E")
								{
									if (install_common::Get_silent_mode() == 0)
									{
										print "\nWarning: host name ($MyApp{host}) for application \"$MyApp\" in file $INIFILE\ndoesn't match the host name ($cfg_hostname) for application \"$MyApp\" in Configuration Server.\n";
									}

									$MyApp = undef;
								}
							}
						}
						else
						{
							if (install_common::Get_silent_mode() == 0)
							{
								print "\nWarning: file $INIFILE doesn't contain host for application \"$MyApp\"\n";
							}

							$MyApp=undef;
						}
					}
				}

				# check if application type for $MyApp is valid
				if (defined($MyApp))
				{
					if (defined($IniSectionData{SetupType}))
					{
						if ($IniSectionData{SetupType} != $APPTYPE)
						{
							if (install_common::Get_silent_mode() == 0)
							{
								print "\nWarning: application type ($IniSectionData{SetupType}) for application \"$MyApp\" in file $INIFILE\ndoesn't match expected application type ($APPTYPE) for application \"$MyApp\" in this IP.\n";
							}

							$MyApp=undef;
						}
					}
				}

				if (defined($MyApp))
				{
					%{$refMyApp} = %MyApp;
				}
			}
		}
		else
		{
			%MyApp=install_common::PARSEINI($INIFILE, $MyApp);
			%{$refMyApp} = %MyApp;
		}
	}

	if (install_common::Get_record_mode() == 1)
	{

		if ($Client == 1)
		{
			my $Filepath = install_common::Get_silent_mode_response_file_path();
			my $Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_ConfigServer_section_name,$Silent_response_file_ApplicationNameClient_key_name,$MyApp);
		}
		else
		{
			my $Filepath = install_common::Get_silent_mode_response_file_path();
			my $Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_ConfigServer_section_name,$Silent_response_file_ApplicationName_key_name,$MyApp);
		}
	}

	return $MyApp;
}

#===============================================================================
# Name:
#	GetApplicationData
# Description:
#	Defines Config Server application data.
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Reference to hash of application data
#	Application name
#	Config Server password option
#	Reference to application command line
#	Reference to application DBID
#	Default application command line
# Return value:
#	Application target directory or undefined value.
#===============================================================================

sub GetApplicationData(\%\%$$$$$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $refMyApp = $_[1];
	my %MyApp = %{$refMyApp};
	my $MyApp = $_[2];
	my $CSPasswordOption = $_[3];
	my $refCommLine = $_[4];
	my $refAppDbid = $_[5];
	my $COMMLINE = $_[6];

	my $TargetDir;
	my %cfgread;
	my $AppDbid;
	my $CommLine = $$refCommLine;

	if( !defined($MyApp))
	{
		if (install_common::Get_silent_mode() == 0)
		{
			# In this case, neither confserv nor INI file can be read
			print "\nUnable to determine Application Name for the package being installed.\n";
			print "Proceeding from this point may result in Configuration\n";
			print "Server data being out of sync with the actual configuration.\n";
			print "This means that it will have to be updated manually.\n";

			if(install_common::ASK(("Do you wish to proceed (y/n)?","y","n")) eq "y")
			{
				$TargetDir=install_common::ASK("\nEnter full path for install =>");
			}
			else
			{
				die "Exiting install.\n";
			}
		}
		else
		{
			# should be already executed in DefineApplicationName
			my $Message="Key $Silent_response_file_ApplicationName_key_name in section $Silent_response_file_ConfigServer_section_name was not found.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}
	else
	{
		if(!%MyApp)
		{
			# INI file not read, go to Configuration Server

			%cfgread=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a 0 -at 9 -d -fn dbid -flk name -flv \"$MyApp\"");
			if($cfgread{retcode} == 0)
			{
				$AppDbid=$cfgread{DBID};
				%cfgread=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a $AppDbid -at 9 -d -fn workDirectory -fn CommandLineArguments");

				if($cfgread{retcode} == 0)
				{
					$TargetDir=$cfgread{workDirectory};

					# get license path
					if($cfgread{CommandLineArguments})
					{
						my $CommandLineArguments = $cfgread{CommandLineArguments};
						my $LicensePath="";

						if (GetLicensePath($CommandLineArguments,\$LicensePath) == 1)
						{
							$$refIniSectionData{LicensePath} = $LicensePath;

							if ($LicenseQuestionsDuringUpgrade_support == $LicenseQuestionsDuringUpgrade_support_standard)
							{
								$LicenseDataInConfigServer_found=1;
							}
						}
					}
				}
			}
		}
		else
		{	# this is the case when INI file is read, get values below
			$CommLine=$COMMLINE;  # choose the constant from beginning
			$TargetDir=$MyApp{dir}; # do we have key "dir"?
			$AppDbid=$MyApp{dbid};

			if ( !defined($TargetDir) or $TargetDir eq "")
			{
				# try to get TargetDir from Configuration Server

				%cfgread=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a 0 -at 9 -d -fn dbid -flk name -flv \"$MyApp\"");
				if($cfgread{retcode} == 0)
				{
					$AppDbid=$cfgread{DBID};
					%cfgread=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a $AppDbid -at 9 -d -fn workDirectory -fn CommandLineArguments");

					if($cfgread{retcode} == 0)
					{
						$TargetDir=$cfgread{workDirectory};

						# get license path
						if($cfgread{CommandLineArguments})
						{
							my $CommandLineArguments = $cfgread{CommandLineArguments};
							my $LicensePath="";

							if (GetLicensePath($CommandLineArguments,\$LicensePath) == 1)
							{
								$$refIniSectionData{LicensePath} = $LicensePath;

								if ($LicenseQuestionsDuringUpgrade_support == $LicenseQuestionsDuringUpgrade_support_standard)
								{
									$LicenseDataInConfigServer_found=1;
								}
							}
						}
					}
				}
			}
		}
	}

	$$refCommLine = $CommLine;
	$$refAppDbid = $AppDbid;

	return $TargetDir;
}

#===============================================================================
# Name:
#	UpdateLCAData
# Description:
#	Defines Config Server application data.
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Application name
#	Config Server password option
#	Application command line
#	Application DBID
#	Application target directory
#	Reference to application command line arguments
#	License path
# Return value:
#	1.
#===============================================================================

sub UpdateLCAData(\%$$$$$$$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $MyApp = $_[1];
	my $CSPasswordOption = $_[2];
	my $CommLine = $_[3];
	my $AppDbid = $_[4];
	my $TargetDir = $_[5];
	my $refCommandLineArguments = $_[6];
	my $CommandLineArguments = $$refCommandLineArguments;
	my $LicensePath = $_[7];

	my $CommLineArgs;

	if( defined($MyApp))
	{
		if (install_common::IsOverwriteMode)
		{
			if (defined($IniSectionData{LicensePath}))
			{
				$LicensePath = $IniSectionData{LicensePath};
			}
		}

		$CommLineArgs="\"-host $IniSectionData{host} -port $IniSectionData{port} -app \\\"$MyApp\\\" $LicensePath\"";
		$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" $LicensePath"; # to show to the user, license path looks a little funny

		if ($ClientSidePort_mode_support == $ClientSidePort_mode_support_standard)
		{
			if (exists($IniSectionData{'transport-port'}) && ($IniSectionData{'transport-port'} ne ""))
			{
				if ($IniSectionData{'transport-address'} eq "")
				{
					if ($LicensePath ne "")
					{
						$CommLineArgs="\"-host $IniSectionData{host} -port $IniSectionData{port} -app \\\"$MyApp\\\" $LicensePath -transport-port $IniSectionData{'transport-port'}\"";
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" $LicensePath -transport-port $IniSectionData{'transport-port'}";
					}
					else
					{
						$CommLineArgs="\"-host $IniSectionData{host} -port $IniSectionData{port} -app \\\"$MyApp\\\" -transport-port $IniSectionData{'transport-port'}\"";
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" -transport-port $IniSectionData{'transport-port'}";
					}
				}
				else
				{
					if ($LicensePath ne "")
					{
						$CommLineArgs="\"-host $IniSectionData{host} -port $IniSectionData{port} -app \\\"$MyApp\\\" $LicensePath -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}\"";
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" $LicensePath -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}";
					}
					else
					{
						$CommLineArgs="\"-host $IniSectionData{host} -port $IniSectionData{port} -app \\\"$MyApp\\\" -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}\"";
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}";
					}
				}
			}
		}

		my %cfgwrt=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a $AppDbid -at 9 -fn workDirectory -fv \"$TargetDir\" -fn commandLine -fv ./$CommLine -fn CommandLineArguments -fv $CommLineArgs -fn state -fv 1");

		$$refCommandLineArguments = $CommandLineArguments;

		if($cfgwrt{retcode}!=0)
		{
			if (install_common::Get_silent_mode() == 0)
			{
				print "\nUnable to write to the Configuration Server. The following information\n";
				print "must be added to it manually:\n\n";
				print "Working Directory: $TargetDir\n";
				print "Command line: ./$CommLine\n";
				print "Command line arguments: $CommandLineArguments\n";
			}
			else
			{
				my $Message="Unable to write to the Configuration Server. The following information must be added to it manually: Working Directory, Command line, Command line arguments";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
		else
		{
			UpdateApplicationVersion(%IniSectionData,$CSPasswordOption,$AppDbid);
			UpdateApplicationUninstallData(%IniSectionData,$CSPasswordOption,$AppDbid);
		}
	}
	else
	{
		$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"<application name>\" $LicensePath";

		if ($ClientSidePort_mode_support == $ClientSidePort_mode_support_standard)
		{
			if (exists($IniSectionData{'transport-port'}) && ($IniSectionData{'transport-port'} ne ""))
			{
				if ($IniSectionData{'transport-address'} eq "")
				{
					if ($LicensePath ne "")
					{
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" $LicensePath -transport-port $IniSectionData{'transport-port'}";
					}
					else
					{
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" -transport-port $IniSectionData{'transport-port'}";
					}
				}
				else
				{
					if ($LicensePath ne "")
					{
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" $LicensePath -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}";
					}
					else
					{
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}";
					}
				}
			}
		}

		$$refCommandLineArguments = $CommandLineArguments;
	}

	return 1;
}

#===============================================================================
# Name:
#	UpdateLCADataEx
# Description:
#	Defines Config Server application data.
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Application name
#	Config Server password option
#	Application command line
#	Application DBID
#	Application target directory
#	Reference to application command line arguments
#	License path
#	Command-line arguments prefix
# Return value:
#	1.
#	The same (without $ClientSidePort_mode_support) as UpdateLCAData but doesn't add "./" before $CommLine
#===============================================================================

sub UpdateLCADataEx(\%$$$$$$$$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $MyApp = $_[1];
	my $CSPasswordOption = $_[2];
	my $CommLine = $_[3];
	my $AppDbid = $_[4];
	my $TargetDir = $_[5];
	my $refCommandLineArguments = $_[6];
	my $CommandLineArguments = $$refCommandLineArguments;
	my $LicensePath = $_[7];
	my $CommandLineArgumentsPrefix = $_[8];

	my $CommLineArgs;

	if( defined($MyApp))
	{
		if (install_common::IsOverwriteMode)
		{
			if (defined($IniSectionData{LicensePath}))
			{
				$LicensePath = $IniSectionData{LicensePath};
			}
		}

		$CommLineArgs="\"$CommandLineArgumentsPrefix -host $IniSectionData{host} -port $IniSectionData{port} -app \\\"$MyApp\\\" $LicensePath\"";
		$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" $LicensePath"; # to show to the user, license path looks a little funny

		if ($ClientSidePort_mode_support == $ClientSidePort_mode_support_standard)
		{
			if (exists($IniSectionData{'transport-port'}) && ($IniSectionData{'transport-port'} ne ""))
			{
				if ($IniSectionData{'transport-address'} eq "")
				{
					if ($LicensePath ne "")
					{
						$CommLineArgs="\"$CommandLineArgumentsPrefix -host $IniSectionData{host} -port $IniSectionData{port} -app \\\"$MyApp\\\" $LicensePath -transport-port $IniSectionData{'transport-port'}\"";
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" $LicensePath -transport-port $IniSectionData{'transport-port'}";
					}
					else
					{
						$CommLineArgs="\"$CommandLineArgumentsPrefix -host $IniSectionData{host} -port $IniSectionData{port} -app \\\"$MyApp\\\" -transport-port $IniSectionData{'transport-port'}\"";
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" -transport-port $IniSectionData{'transport-port'}";
					}
				}
				else
				{
					if ($LicensePath ne "")
					{
						$CommLineArgs="\"$CommandLineArgumentsPrefix -host $IniSectionData{host} -port $IniSectionData{port} -app \\\"$MyApp\\\" $LicensePath -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}\"";
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" $LicensePath -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}";
					}
					else
					{
						$CommLineArgs="\"$CommandLineArgumentsPrefix -host $IniSectionData{host} -port $IniSectionData{port} -app \\\"$MyApp\\\" -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}\"";
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}";
					}
				}
			}
		}

		my %cfgwrt=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a $AppDbid -at 9 -fn workDirectory -fv \"$TargetDir\" -fn commandLine -fv $CommLine -fn CommandLineArguments -fv $CommLineArgs -fn state -fv 1");

		$$refCommandLineArguments = $CommandLineArguments;

		if($cfgwrt{retcode}!=0)
		{
			if (install_common::Get_silent_mode() == 0)
			{
				print "\nUnable to write to the Configuration Server. The following information\n";
				print "must be added to it manually:\n\n";
				print "Working Directory: $TargetDir\n";
				print "Command line: $CommLine\n";
				print "Command line arguments: $CommandLineArguments\n";
			}
			else
			{
				my $Message="Unable to write to the Configuration Server. The following information must be added to it manually: Working Directory, Command line, Command line arguments";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
		else
		{
			UpdateApplicationVersion(%IniSectionData,$CSPasswordOption,$AppDbid);
			UpdateApplicationUninstallData(%IniSectionData,$CSPasswordOption,$AppDbid);
		}
	}
	else
	{
		$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"<application name>\" $LicensePath";

		if ($ClientSidePort_mode_support == $ClientSidePort_mode_support_standard)
		{
			if (exists($IniSectionData{'transport-port'}) && ($IniSectionData{'transport-port'} ne ""))
			{
				if ($IniSectionData{'transport-address'} eq "")
				{
					if ($LicensePath ne "")
					{
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" $LicensePath -transport-port $IniSectionData{'transport-port'}";
					}
					else
					{
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" -transport-port $IniSectionData{'transport-port'}";
					}
				}
				else
				{
					if ($LicensePath ne "")
					{
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" $LicensePath -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}";
					}
					else
					{
						$CommandLineArguments="-host $IniSectionData{host} -port $IniSectionData{port} -app \"$MyApp\" -transport-port $IniSectionData{'transport-port'} -transport-address $IniSectionData{'transport-address'}";
					}
				}
			}
		}

		$$refCommandLineArguments = $CommandLineArguments;
	}

	return 1;
}

#===============================================================================
# Name:
#	UpdateApplicationVersion
# Description:
#	Updates Config Server application version
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Config Server password option
#	Application DBID
# Return value:
#	1.
#===============================================================================

sub UpdateApplicationVersion(\%$$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $CSPasswordOption = $_[1];
	my $AppDbid = $_[2];

	if ( $App_version_update_mode == $App_version_update_mode_standard)
	{
		my %VersionInfo = ();
		my $ResultInfo = GetConfigurationServerInfo(%IniSectionData,$CSPasswordOption,%VersionInfo);

		if ($ResultInfo == 0)
		{
			if (install_common::Get_silent_mode() == 0)
			{
				print "\nUnable to read Configuration Server version. The following information\n";
				print "must be added to it manually if required:\n\n";
				print "Application version: $Application_version\n";
			}
			else
			{
				my $Message="Unable to read Configuration Server version.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			return 1;
		}

		my $CompareResult;
		my $ResultVersion=CompareVersions($VersionInfo{serverVersion},$StartingConfigServer_version_for_Application_version_update,\$CompareResult);

		if ($ResultVersion == 0)
		{
			# something is wrong

			if (install_common::Get_silent_mode() == 0)
			{
				print "\nUnable to verify Configuration Server version. The following information\n";
				print "must be added to it manually if required:\n\n";
				print "Application version: $Application_version\n";
			}
			else
			{
				my $Message="Unable to verify Configuration Server version.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}

			return 1;
		}

		my $UpdateVersion;

		if ($CompareResult < 0)
		{
			$UpdateVersion=0;
		}
		else
		{
			$UpdateVersion=1;
		}

		if ($UpdateVersion == 1)
		{
			my %cfgwrt=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a $AppDbid -at 9 -fn version -fv $Application_version");

			if($cfgwrt{retcode}!=0)
			{
				if (install_common::Get_silent_mode() == 0)
				{
					print "\nUnable to write to the Configuration Server. The following information\n";
					print "must be added to it manually:\n\n";
					print "Application version: $Application_version\n";
				}
				else
				{
					my $Message="Unable to write to the Configuration Server. The following information must be added to it manually: Application version";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}
			}
		}
	}

	return 1;
}

#===============================================================================
# Name:
#	UpdateApplicationUninstallData
# Description:
#	Updates Config Server application uninstall data
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Config Server password option
#	Application DBID
#	Optional parameter - custom uninstall command
# Return value:
#	1.
#===============================================================================

sub UpdateApplicationUninstallData(\%$$;$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $CSPasswordOption = $_[1];
	my $AppDbid = $_[2];

	# check presence of optional argument
	my $OptionalUninstalCommand_index=3;
	my $OptionalUninstalCommand_use=0;
	my $OptionalUninstalCommand_data="";

	if (($#_ >= $OptionalUninstalCommand_index) && defined($_[$OptionalUninstalCommand_index]))
	{
		$OptionalUninstalCommand_use=1;
		$OptionalUninstalCommand_data=$_[$OptionalUninstalCommand_index];
	}

	if ($UninstallData_support == $UninstallData_support_standard)
	{
		my $uninstall_data="";

		if ($OptionalUninstalCommand_use == 0)
		{
			$uninstall_data="rm -rf $install_common::InstallationDirectory";
		}
		else
		{
			$uninstall_data=$OptionalUninstalCommand_data;
		}

		my %cfgwrt=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -a $AppDbid -at 9 -fn userProperties#sml#uninstall -fv '$uninstall_data'");

		if($cfgwrt{retcode}!=0)
		{
			if (install_common::Get_silent_mode() == 0)
			{
				print "\nUnable to write to the Configuration Server. The following information\n";
				print "must be added to it manually:\n\n";
				print "annex#sml#uninstall: $uninstall_data\n";
			}
			else
			{
				my $Message="Unable to write to the Configuration Server. The following information must be added to it manually: Application version";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}

	return 1;
}

#===============================================================================
# Name:
#	DefaultInstall
# Description:
#	Perform default installation without using Config Server
# Input parameters:
#	Product name
#	Tar file name
#	Default command line
# Return value:
#	1.
#===============================================================================

sub DefaultInstall($$$)
{
	my $PRODUCT = $_[0];
	my $TARFILE = $_[1];
	my $COMMLINE = $_[2];

	if (install_common::Get_silent_mode() == 1)
	{
		install_common::CreateSilentLog($install_common::Silent_result_error,$ErrorReadingInformationFromConfigurationServerMessage,$install_common::Silent_action_exit);
	}

	my $Message="";
	GetConfigServerConnectionProblemMessage(\$Message);
	print $Message;

	if((install_common::ASK("Do you wish to continue (y/n)?","y","n")) eq "n")
	{
		die "Exiting install.\n";
	}
	else
	{
		my $TargetDir=install_common::PREPTARGET();
		my $sourcedir=`$install_common::PWD`;
		chomp $sourcedir;

		if (! (install_common::DATAMOVE($TARFILE, $TargetDir)) )
		{
			die "Failed to extract $TARFILE\n";
		}

		chdir $TargetDir;

		if (! (-l $COMMLINE) )
		{
			# if it has been installed before
			my $bits=install_common::BITS($COMMLINE);

			if( ($bits==32) || ($bits==64) )
			{
				system("$install_common::LN -s $COMMLINE\_$bits $COMMLINE");

				if($?!=0)
				{
					die "Failed to create symbolic link to $bits bit executable: $!\n";
				}
			}

			if ( ! install_common::MAKERUNSH("./$COMMLINE -host <config server hostname> -port <config server port> -app \"<application name>\" <full path to license file>", $TargetDir) )
			{
				print "\nError writing $install_common::StartupFileName\n\n";
			}
			else
			{
				print "$TargetDir/$install_common::StartupFileName created to start the product.\n";
				print "Please edit it to specify the correct parameters.\n\n";
			}
		}

		print "\nInstallation of $PRODUCT completed successfully.\n\n";
	}

	return 1;
}

#===============================================================================
# Name:
#	DefaultInstallEx
# Description:
#	Perform default installation without using Config Server
# Input parameters:
#	Product name
#	Tar file name
#	Default command line
#	Reference to hash of Config Server login parameters
#	Flag for using license
# Return value:
#	1.
#===============================================================================

sub DefaultInstallEx($$$\%$)
{
	my $PRODUCT = $_[0];
	my $TARFILE = $_[1];
	my $COMMLINE = $_[2];
	my $refIniSectionData = $_[3];
	my %IniSectionData = %{$refIniSectionData};
	my $UseLicense = $_[4];

	if (install_common::Get_silent_mode() == 1)
	{
		install_common::CreateSilentLog($install_common::Silent_result_error,$ErrorReadingInformationFromConfigurationServerMessage,$install_common::Silent_action_exit);
	}

	my $Message="";
	GetConfigServerConnectionProblemMessage(\$Message);
	print $Message;

	if((install_common::ASK("Do you wish to continue (y/n)?","y","n")) eq "n")
	{
		die "Exiting install.\n";
	}
	else
	{
		my $TargetDir=install_common::PREPTARGET();
		my $sourcedir=`$install_common::PWD`;
		chomp $sourcedir;

		if (! (install_common::DATAMOVE($TARFILE, $TargetDir)) )
		{
			die "Failed to extract $TARFILE\n";
		}

		chdir $TargetDir;

		if (! (-l $COMMLINE) )
		{
			# if it has been installed before
			my $bits=install_common::BITS($COMMLINE);

			if( ($bits==32) || ($bits==64) )
			{
				system("$install_common::LN -s $COMMLINE\_$bits $COMMLINE");

				if($?!=0)
				{
					die "Failed to create symbolic link to $bits bit executable: $!\n";
				}
			}

			my ($host,$port);
			GetConfigServerData(%IniSectionData,\$host,\$port);

			my $LicensePath = MakeLicensePath($UseLicense);

			my $CommLine = $COMMLINE;
			my $CommandLineArguments = "-host $host -port $port -app \"<application name>\" $LicensePath";

			if ( MakeRunFile($CommandLineArguments,$TargetDir,$CommLine))
			{
				print "\n$TargetDir/$install_common::StartupFileName created to start the product.\n";
				print "Please edit it to specify the correct parameters.\n\n";
			}
		}

		print "\nInstallation of $PRODUCT has completed successfully.\n\n";
	}

	return 1;
}

#===============================================================================
# Name:
#	DefaultInstallExS
# Description:
#	Perform default installation without using Config Server (with redirection)
# Input parameters:
#	Product name
#	Tar file name
#	Default command line
#	Reference to hash of Config Server login parameters
#	Flag for using license
# Return value:
#	1.
#===============================================================================

sub DefaultInstallExS($$$\%$)
{
	my $PRODUCT = $_[0];
	my $TARFILE = $_[1];
	my $COMMLINE = $_[2];
	my $refIniSectionData = $_[3];
	my %IniSectionData = %{$refIniSectionData};
	my $UseLicense = $_[4];

	if (install_common::Get_silent_mode() == 1)
	{
		install_common::CreateSilentLog($install_common::Silent_result_error,$install_lib::ErrorReadingInformationFromConfigurationServerMessage,$install_common::Silent_action_exit);
	}

	my $Message="";
	install_lib::GetConfigServerConnectionProblemMessage(\$Message);
	print $Message;

	if((install_common::ASK("Do you wish to continue (y/n)?","y","n")) eq "n")
	{
		die "Exiting install.\n";
	}

	return 1;
}

#===============================================================================
# Name:
#	CheckForBackup
# Description:
#	Checks for existence of backup
# Input parameters:
#	Target dir
#	Reference to backup flag
# Return value:
#	1.
#===============================================================================

sub CheckForBackup($$)
{
	my $TargetDir = $_[0];
	my $refDo_backup = $_[1];
	my $do_backup = $$refDo_backup;

	local *BDH1;
	my @backupcheck = ();

	$do_backup=0;
	opendir BDH1, $TargetDir;
	@backupcheck=readdir BDH1;
	closedir BDH1;

	if ($#backupcheck > 1)
	{
		$do_backup=1;
	}

	$$refDo_backup = $do_backup;

	return 1;
}

#===============================================================================
# Name:
#	CreateLink
# Description:
#	Creates link for 32 or 64 bit application
# Input parameters:
#	Command line
# Return value:
#	1.
#===============================================================================

sub CreateLink($)
{
	my $COMMLINE = $_[0];
	my @COMMLINE_Satellites=();

	CreateLinkEx($COMMLINE,\@COMMLINE_Satellites);

	return 1;
}

#===============================================================================
# Name:
#	CreateLinkEx
# Description:
#	Creates link for 32 or 64 bit application and it's satellites
# Input parameters:
#	Command line
#	Reference to satellites array
# Return value:
#	1.
#===============================================================================

sub CreateLinkEx($$)
{
	my $COMMLINE = $_[0];
	my $ref_Satellites = $_[1];
	my @Satellites = @{$ref_Satellites};
	my $bits;

	Set_Link_created_flag($Link_created_no);
	Set_Bits_number($Bits_number_unknown);

	if (! (-l $COMMLINE))
	{
		# if it wasn't already installed
		$bits=install_common::BITS($COMMLINE);
		if( ($bits==32) || ($bits==64) )
		{
			system("$install_common::LN -s $COMMLINE\_$bits $COMMLINE");

			if($?!=0)
			{
				if (install_common::Get_silent_mode() == 0)
				{
					die "Failed to create symbolic link to $bits bit executable: $!\n";
				}
				else
				{
					my $Message="Failed to create symbolic link to $bits bit executable: $!";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}
			}

			Set_Link_created_flag($Link_created_yes);
			Set_Bits_number($bits);

			for my $Satellite (@Satellites)
			{
				my $target_file="$Satellite\_$bits";

				if ( -e $target_file)
				{
					system("$install_common::LN -s $Satellite\_$bits $Satellite");

					if($?!=0)
					{
						if (install_common::Get_silent_mode() == 0)
						{
							die "Failed to create symbolic link to $bits bit executable: $!\n";
						}
						else
						{
							my $Message="Failed to create symbolic link to $bits bit executable: $!";
							install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
						}
					}
				}
			}

			# DB client links
			CreateDBClientLinks($bits);
		}
	}
	else
	{
		local *OUT;

		my $command="$install_common::LS -la $COMMLINE";
		my @output=();

		my $Result=open (OUT, "$command |");

		if (!defined($Result))
		{
			if (install_common::Get_silent_mode() == 0)
			{
				die "Failed to list symbolic link\n";
			}
			else
			{
				my $Message="Failed to list symbolic link";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}

		@output=<OUT>;
		close OUT;

		for my $line (@output)
		{
			chomp $line;
			install_common::Trim(\$line);

			if (length($line) != 0)
			{
				my @elements = split(/->/, $line);
				my $size=scalar @elements;

				if ($size >= 2)
				{
					my $command_line=$elements[1];
					install_common::Trim(\$command_line);

					if ($command_line =~ /$COMMLINE\_32/)
					{
						Set_Bits_number(32);
					}
					elsif ($command_line =~ /$COMMLINE\_64/)
					{
						Set_Bits_number(64);
					}
				}
			}

			last;
		}
	}

	return 1;
}

#===============================================================================
# Name:
#	CreateDBClientLinks
# Description:
#	Creates DB client links
# Input parameters:
#	Bits number (32 or 64)
# Return value:
#	1.
#===============================================================================

sub CreateDBClientLinks($)
{
	my $bits = $_[0];
	my $dbclient_oracle_name="dbclient_oracle";
	my $dbclient_db2_name="dbclient_db2";
	my $dbclient_postgre_name="dbclient_postgre";

	my $platform = install_common::FINDPLAT();

	# oracle
	my $dbclient_name=$dbclient_oracle_name;

	if ($platform eq "linux")
	{
		my $target_file="$dbclient_name\_$bits";

		if ( -e $target_file)
		{
			system("$install_common::LN -s $dbclient_name\_$bits $dbclient_name");
			my $ReturnCode=$?;
			my $Message="Failed to create symbolic link to $bits bit executable: $!";
			ProcessReturnCode($ReturnCode,$Message);
		}
	}
	elsif (($platform eq "solaris") || ($platform eq "aix"))
	{
		$bits=64;
		my $target_file="$dbclient_name\_$bits";

		if ( -e $target_file)
		{
			system("$install_common::LN -s $dbclient_name\_$bits $dbclient_name");
			my $ReturnCode=$?;
			my $Message="Failed to create symbolic link to $bits bit executable: $!";
			ProcessReturnCode($ReturnCode,$Message);
		}
	}

	# db2
	$dbclient_name=$dbclient_db2_name;

	if ($platform eq "linux")
	{
		my $target_file="$dbclient_name\_$bits";

		if ( -e $target_file)
		{
			system("$install_common::LN -s $dbclient_name\_$bits $dbclient_name");
			my $ReturnCode=$?;
			my $Message="Failed to create symbolic link to $bits bit executable: $!";
			ProcessReturnCode($ReturnCode,$Message);
		}
	}
	elsif (($platform eq "solaris") || ($platform eq "aix"))
	{
		$bits=64;
		my $target_file="$dbclient_name\_$bits";

		if ( -e $target_file)
		{
			system("$install_common::LN -s $dbclient_name\_$bits $dbclient_name");
			my $ReturnCode=$?;
			my $Message="Failed to create symbolic link to $bits bit executable: $!";
			ProcessReturnCode($ReturnCode,$Message);
		}
	}

	# postgre
	$dbclient_name=$dbclient_postgre_name;

	if ($platform eq "linux")
	{
		my $target_file="$dbclient_name\_$bits";

		if ( -e $target_file)
		{
			system("$install_common::LN -s $dbclient_name\_$bits $dbclient_name");
			my $ReturnCode=$?;
			my $Message="Failed to create symbolic link to $bits bit executable: $!";
			ProcessReturnCode($ReturnCode,$Message);
		}
	}
	elsif (($platform eq "solaris") || ($platform eq "aix"))
	{
		# nothing to do
	}

	return 1;
}

#===============================================================================
# Name:
#	CreateDirectoryLink
# Description:
#	Creates link for 32 or 64 bit directory and other directories
# Input parameters:
#	Main directory name
#	Optional parameter - bits number (32 or 64)
# Return value:
#	1.
#===============================================================================

sub CreateDirectoryLink($;$)
{
	my $DirectoryName = $_[0];
	my $bits;

	# check presence of optional argument
	my $OptionalBitsNumber_index=1;
	my $OptionalBitsNumber_use=0;
	my $OptionalBitsNumber_data="";

	if (($#_ >= $OptionalBitsNumber_index) && defined($_[$OptionalBitsNumber_index]))
	{
		$OptionalBitsNumber_use=1;
		$OptionalBitsNumber_data=$_[$OptionalBitsNumber_index];
	}

	Set_Link_created_flag($Link_created_no);
	Set_Bits_number($Bits_number_unknown);

	if (! (-l $DirectoryName))
	{
		# if it wasn't already installed
		my @directories=();

		if ($OptionalBitsNumber_use == 1)
		{
			$bits=$OptionalBitsNumber_data;
			install_common::Record_BITS($bits);
		}
		else
		{
			$bits=install_common::DirectoryBITS($DirectoryName,@directories);
		}

		if( ($bits==32) || ($bits==64) )
		{
			system("$install_common::LN -s $DirectoryName\_$bits $DirectoryName");

			if($?!=0)
			{
				if (install_common::Get_silent_mode() == 0)
				{
					die "Failed to create symbolic link to $bits bit directory: $!\n";
				}
				else
				{
					my $Message="Failed to create symbolic link to $bits bit directory: $!";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}
			}

			Set_Link_created_flag($Link_created_yes);
			Set_Bits_number($bits);

			my $suffix32="_32";
			my $basedir;

			for my $Satellite (@directories)
			{
				($basedir)=($Satellite =~ /(\S*)$suffix32$/);
				my $target_file="$basedir\_$bits";

				if ( -e $target_file)
				{
					system("$install_common::LN -s $basedir\_$bits $basedir");

					if($?!=0)
					{
						if (install_common::Get_silent_mode() == 0)
						{
							die "Failed to create symbolic link to $bits bit executable: $!\n";
						}
						else
						{
							my $Message="Failed to create symbolic link to $bits bit executable: $!";
							install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
						}
					}
				}
			}
		}
	}

	return 1;
}

#===============================================================================
# Name:
#	ProcessLinksData
# Description:
#	Processes links data
# Input parameters:
#	Bits number
#	Reference to links info array
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub ProcessLinksData($\@)
{
	my $bits=$_[0];
	my $ref_LinksInfoArray=$_[1];
	my @LinksInfoArray = @{$ref_LinksInfoArray};
	my $Result=0;

	my $Platform = install_common::FINDPLAT();

	for my $elem (@LinksInfoArray)
	{
		#print "Platform_name=$elem->{Platform_name}\n";
		#print "Bits_number=$elem->{Bits_number}\n";

		if (($elem->{Platform_name} eq $Platform) && ($elem->{Bits_number} == $bits))
		{
			# delete links

			for my $link_record (@{$elem->{Links}})
			{
				#print "link_record filename=$link_record->{filename}\n";

				#print "printing links\n";
				my @links=@{$link_record->{links}};

				for my $link (@links)
				{
					#print "\tlink=$link\n";

					if (-l $link)
					{
						system("$install_common::RM $link");

						if ($? != 0)
						{
							return $Result;
						}
					}
				}
			}

			# create links

			for my $link_record (@{$elem->{Links}})
			{
				my $filename=$link_record->{filename};
				my @links=@{$link_record->{links}};

				if (-f $filename)
				{
					for my $link (@links)
					{
						system("$install_common::LN -s $filename $link");

						if ($? != 0)
						{
							return $Result;
						}
					}
				}
			}
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	Set_Link_created_flag
# Description:
#	Sets Link_created_flag
# Input parameters:
#	Link_created value
# Return value:
#	None.
#===============================================================================

sub Set_Link_created_flag($)
{
	my $value=$_[0];
	$Link_created_flag=$value;
}

#===============================================================================
# Name:
#	Get_Link_created_flag
# Description:
#	Gets Link_created_flag
# Input parameters:
#	None.
# Return value:
#	Link_created value
#===============================================================================

sub Get_Link_created_flag()
{
	return $Link_created_flag;
}

#===============================================================================
# Name:
#	Was_Link_created
# Description:
#	Checks if link was created
# Input parameters:
#	None.
# Return value:
#	1 if link was created, 0 if not.
#===============================================================================

sub Was_Link_created()
{
	if ($Link_created_flag == $Link_created_yes)
	{
		return 1;
	}

	return 0;
}

#===============================================================================
# Name:
#	Set_Bits_number
# Description:
#	Sets Bits_number
# Input parameters:
#	Bits_number value
# Return value:
#	None.
#===============================================================================

sub Set_Bits_number($)
{
	my $value=$_[0];
	$Bits_number=$value;
}

#===============================================================================
# Name:
#	Get_Bits_number
# Description:
#	Gets Bits_number
# Input parameters:
#	None.
# Return value:
#	Bits_number value
#===============================================================================

sub Get_Bits_number()
{
	return $Bits_number;
}

#===============================================================================
# Name:
#	MakeRunFile
# Description:
#	Calls MAKERUNSH for creation of $install_common::StartupFileName file
# Input parameters:
#	Command line
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub MakeRunFile($$$)
{
	my $CommandLineArguments = $_[0];
	my $TargetDir = $_[1];
	my $CommLine = $_[2];

	$CommandLineArguments=~s/\\//g;  # remove backslashes from command line arguments for $install_common::StartupFileName

	if (! (-e "$TargetDir/$install_common::StartupFileName"))
	{
		if ( ! install_common::MAKERUNSH("./$CommLine $CommandLineArguments", $TargetDir) )
		{
			if (install_common::Get_silent_mode() == 0)
			{
				print "\nError writing $install_common::StartupFileName\n\n";
				return 0;
			}
			else
			{
				my $Message="Error writing $install_common::StartupFileName";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}

	return 1;
}

#===============================================================================
# Name:
#	MakeRunFileEx
# Description:
#	Calls MAKERUNSH for creation of $install_common::StartupFileName file
# Input parameters:
#	Command line arguments
#	Target dir
#	Command line
#	Command line prefix
# Return value:
#	Returns 1 on success, 0 on failure.
#
# Comment:
#	The same as MakeRunFile, but has additional argument
#	"Command line prefix"
#===============================================================================

sub MakeRunFileEx($$$$)
{
	my $CommandLineArguments = $_[0];
	my $TargetDir = $_[1];
	my $CommLine = $_[2];
	my $CommLinePrefix = $_[3];

	$CommandLineArguments=~s/\\//g;  # remove backslashes from command line arguments for run.sh

	if (! (-e "$TargetDir/$install_common::StartupFileName"))
	{
		if ( ! install_common::MAKERUNSH("$CommLinePrefix ./$CommLine $CommandLineArguments", $TargetDir) )
		{
			if (install_common::Get_silent_mode() == 0)
			{
				print "\nError writing $install_common::StartupFileName\n\n";
				return 0;
			}
			else
			{
				my $Message="Error writing $install_common::StartupFileName";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}

	return 1;
}

#===============================================================================
# Name:
#	MakeLicensePath
# Description:
#	Creats license path
# Input parameters:
#	Flag for using license
# Return value:
#	License path
#===============================================================================

sub MakeLicensePath($)
{
	my $UseLicense = $_[0];
	my $LicensePath;

	if ($UseLicense == 0)
	{
		$LicensePath="";
	}
	else
	{
		$LicensePath = "-l <full path to license file>";
	}

	return $LicensePath;
}

#===============================================================================
# Name:
#	GetConfigServerData
# Description:
#	Returns Config ServerData data
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Reference to Config Server host
#	Reference to Config Server port
# Return value:
#	1
#===============================================================================

sub GetConfigServerData(\%$$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $refHost = $_[1];
	my $refPort = $_[2];

	$$refHost = "<config server hostname>";
	$$refPort = "<config server port>";

	if (defined($IniSectionData{host}))
	{
		$$refHost = $IniSectionData{host};
	}

	if (defined($IniSectionData{port}))
	{
		$$refPort = $IniSectionData{port};
	}

	return 1;
}

#===============================================================================
# Name:
#	CreateRunFile
# Description:
#	Calls MakeRunFile for creation of $install_common::StartupFileName file
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Application name or undefined value
#	Command line
#	Command line arguments
#	Target directory
#	Flag for using license
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CreateRunFile(\%$$$$$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $MyApp = $_[1];
	my $CommLine = $_[2];
	my $CommandLineArguments = $_[3];
	my $TargetDir = $_[4];
	my $UseLicense = $_[5];

	my $nResult = 0;

	if (! (-e "$TargetDir/$install_common::StartupFileName"))
	{
		if (defined($MyApp))
		{
			$nResult = MakeRunFile($CommandLineArguments,$TargetDir,$CommLine);
		}
		else
		{
			if (defined($CommandLineArguments) && ($CommandLineArguments ne ""))
			{
				# use provided $CommandLineArguments
			}
			else
			{
				my $LicensePath = MakeLicensePath($UseLicense);

				my ($host,$port);
				GetConfigServerData(%IniSectionData,\$host,\$port);

				$CommandLineArguments = "-host $host -port $port -app \"<application name>\" $LicensePath";
			}

			$nResult = MakeRunFile($CommandLineArguments,$TargetDir,$CommLine);

			if ($nResult == 1)
			{
				if (install_common::Get_silent_mode() == 0)
				{
					print "\n$TargetDir/$install_common::StartupFileName created to start the product.\n";
					print "Please edit it to specify the correct parameters.\n";
				}
			}
		}
	}
	else
	{
		$nResult = 1;
	}

	return $nResult;
}

#===============================================================================
# Name:
#	CreateRunFileEx
# Description:
#	Calls MakeRunFile for creation of $install_common::StartupFileName file
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Application name or undefined value
#	Command line
#	Command line arguments
#	Target directory
#	Flag for using license
#	Command line prefix
# Return value:
#	Returns 1 on success, 0 on failure.
#
# Comment:
#	The same as CreateRunFile, but has additional argument
#	"Command line prefix" for MakeRunFileEx
#===============================================================================

sub CreateRunFileEx(\%$$$$$$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $MyApp = $_[1];
	my $CommLine = $_[2];
	my $CommandLineArguments = $_[3];
	my $TargetDir = $_[4];
	my $UseLicense = $_[5];
	my $CommLinePrefix = $_[6];

	my $nResult = 0;

	if (! (-e "$TargetDir/$install_common::StartupFileName"))
	{
		if (defined($MyApp))
		{
			$nResult = MakeRunFileEx($CommandLineArguments,$TargetDir,$CommLine,$CommLinePrefix);
		}
		else
		{
			if (defined($CommandLineArguments) && ($CommandLineArguments ne ""))
			{
				# use provided $CommandLineArguments
			}
			else
			{
				my $LicensePath = MakeLicensePath($UseLicense);

				my ($host,$port);
				GetConfigServerData(%IniSectionData,\$host,\$port);

				$CommandLineArguments = "-host $host -port $port -app \"<application name>\" $LicensePath";
			}

			$nResult = MakeRunFileEx($CommandLineArguments,$TargetDir,$CommLine,$CommLinePrefix);

			if ($nResult == 1)
			{
				if (install_common::Get_silent_mode() == 0)
				{
					print "\n$TargetDir/$install_common::StartupFileName created to start the product.\n";
					print "Please edit it to specify the correct parameters.\n";
				}
			}
		}
	}
	else
	{
		$nResult = 1;
	}

	return $nResult;
}

#===============================================================================
# Name:
#	GenericInstall
# Description:
#	Generic installation sequence
#	install_lib prefix was kept for using the text ouside the install_lib
# Input parameters:
#	Command line
#	Application type
#	Product name
#	Tar file name
#	Ini file name
#	Product version
#	Flag for using license
# Return value:
#	Returns 1.
#===============================================================================

sub GenericInstall($$$$$$$)
{
	my $COMMLINE = $_[0];
	my $APPTYPE = $_[1];
	my $PRODUCT = $_[2];
	my $TARFILE = $_[3];
	my $INIFILE = $_[4];
	my $ProductVersion = $_[5];
	my $UseLicense = $_[6];

	my $TargetDir="";
	my $MyApp="";
	my %MyApp=();
	my $sourcedir="";
	my $hostdbid="";
	my $CommLine="";
	my $AppDbid="";
	my $CommandLineArguments="";
	my $CSPasswordOption="";
	my $LocalHostname="";
	my $Domain="";
	my %gsec=();
	my $LicensePath="";
	my $debug_print=0;

	UpdateProductData(\$PRODUCT,\$ProductVersion);
	PrintInstallationHeader($ProductVersion,$PRODUCT);
	ProcessLicenseAgreement($UseLicense);

	if ($debug_print == 1)
	{
		if (install_common::IsSocket6Loaded() == 0)
		{
			print "Socket6 is not loaded\n";
		}
		else
		{
			print "Socket6 is loaded\n";
		}
	}

	$LocalHostname=install_common::GETHOSTNAME();  # get the hostname
	$Domain=install_common::GETDOMAINNAME();

	%gsec = install_lib::GetCSLoginInfo($INIFILE,\$CSPasswordOption);
	$hostdbid=install_lib::ReadHostDBID(%gsec,$LocalHostname,$Domain,$CSPasswordOption);

	if(!defined($hostdbid))
	{
		install_lib::DefaultInstallEx($PRODUCT,$TARFILE,$COMMLINE,%gsec,$UseLicense);
		#exit 0; # for main script
		return 1;
	}

	CheckForAlternativeAppType(%gsec,$CSPasswordOption,\$APPTYPE);

	# find out which application to install. If neither method works, $MyApp
	# is set to undefined
	$MyApp=install_lib::DefineApplicationName($INIFILE, %gsec, %MyApp, $CSPasswordOption, $APPTYPE, $hostdbid);

	$CommLine=$COMMLINE;
	$TargetDir=install_lib::GetApplicationData(%gsec, %MyApp, $MyApp, $CSPasswordOption, \$CommLine, \$AppDbid, $COMMLINE);

	# verify target dir
	$TargetDir=install_common::PREPTARGET($TargetDir);

	# perform data move
	$sourcedir=`$install_common::PWD`;
	chomp $sourcedir;

	install_common::DATAMOVE($TARFILE, $TargetDir);
	chdir $TargetDir;

	install_lib::CreateLink($COMMLINE);

	install_lib::UpdateLicenseForItaniumModel(\$UseLicense);

	if (!(-e "$install_common::StartupFileName"))
	{
		$LicensePath = install_lib::APPLICENSE($LicensePath,$UseLicense);
	}

	chdir $sourcedir;  # so it can find $CFGUTIL

	install_lib::UpdateLCAData(%gsec, $MyApp, $CSPasswordOption, $CommLine, $AppDbid, $TargetDir, \$CommandLineArguments, $LicensePath);
	install_lib::CreateRunFile(%gsec,$MyApp,$CommLine,$CommandLineArguments,$TargetDir,$UseLicense);

	PrintInstallationFooter($PRODUCT);

	return 1;
}

#===============================================================================
# Name:
#	Read_IP_description
# Description:
#	Reads product name and product family version from $ip_description_filename
# Input parameters:
#	Reference to product name
#	Reference to product family version
#	Reference to product version
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub Read_IP_description($$$)
{
	my $refProductName = $_[0];
	my $refProductFamilyVersion = $_[1];
	my $refProductVersion = $_[2];
	my $Result;
	my $Error=0;
	my $ProductName="";
	my $ProductFamilyVersion="";
	my $ProductVersion="";
	my $ip_description_pathname="";

	my $sourcedir=`$install_common::PWD`;
	chomp $sourcedir;
	$ip_description_pathname=$sourcedir."/".$install_common::ip_description_filename;

	$Result = ip_description::getProductFamilyVersion($ip_description_pathname,\$ProductFamilyVersion);

	if ($Result == 1)
	{
		$$refProductFamilyVersion = $ProductFamilyVersion;
	}
	else
	{
		$Error=1;
	}

	$Result = ip_description::getProductVersion($ip_description_pathname,\$ProductVersion);

	if ($Result == 1)
	{
		$$refProductVersion = $ProductVersion;
	}
	else
	{
		$Error=1;
	}

	$Result = ip_description::getProductLongName($install_common::ip_description_filename,\$ProductName);

	if ($Result == 1)
	{
		$$refProductName = $ProductName;
	}
	else
	{
		$Error=1;
	}

	if ($Error == 0)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

#===============================================================================
# Name:
#	Read_IP_description_details
# Description:
#	Reads build number and language from $ip_description_filename
# Input parameters:
#	Reference to build number
#	Reference to language
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub Read_IP_description_details($$)
{
	my $refBuildNumber = $_[0];
	my $refLanguage = $_[1];
	my $Result;
	my $Error=0;
	my $BuildNumber="";
	my $Language="";
	my $ip_description_pathname="";

	my $sourcedir=`$install_common::PWD`;
	chomp $sourcedir;
	$ip_description_pathname=$sourcedir."/".$install_common::ip_description_filename;

	$Result = ip_description::getProductBuildNumber($ip_description_pathname,\$BuildNumber);

	if ($Result == 1)
	{
		$$refBuildNumber = $BuildNumber;
	}
	else
	{
		$Error=1;
	}

	$Result = ip_description::getProductLanguage($ip_description_pathname,\$Language);

	if ($Result == 1)
	{
		$$refLanguage = $Language;
	}
	else
	{
		$Error=1;
	}

	if ($Error == 0)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

#===============================================================================
# Name:
#	Read_IP_description_OS_data
# Description:
#	Reads OS data from $ip_description_filename
# Input parameters:
#	OS type ($ip_description::OS_common,$ip_description::OS_RHEL,$ip_description::OS_Ubuntu)
#	Reference to versions list
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub Read_IP_description_OS_data($\@)
{
	my $OS_type = $_[0];
	my $ref_Versions = $_[1];
	my $Result;
	my $ip_description_pathname="";

	my $sourcedir=`$install_common::PWD`;
	chomp $sourcedir;
	$ip_description_pathname=$sourcedir."/".$install_common::ip_description_filename;

	if (!-f $ip_description_pathname)
	{
		return 0;
	}

	my $ip_description_string=`cat $ip_description_pathname`;
	my @versions=();
	$Result=ip_description::GetPlatformsVersions($ip_description_string,$OS_type,@versions);

	if ($Result == 1)
	{
		@{$ref_Versions}=@versions;
		return 1;
	}
	else
	{
		return 0;
	}
}

#===============================================================================
# Name:
#	UpdateProductData
# Description:
#	Updates "product name" and "product version" with data from $ip_description_filename
# Input parameters:
#	Reference to product name
#	Reference to product version
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub UpdateProductData($$)
{
	my $refProductName = $_[0];
	my $refProductVersion = $_[1];
	my $Error=0;

	my $ProductName_IP_description="";
	my $ProductFamilyVersion_IP_description="";
	my $ProductVersion_IP_description="";
	my $Result=Read_IP_description(\$ProductName_IP_description,\$ProductFamilyVersion_IP_description,\$ProductVersion_IP_description);

	if ($Result == 1)
	{
		$$refProductName = $ProductName_IP_description . ", version " . $ProductVersion_IP_description;
		$$refProductVersion = $ProductFamilyVersion_IP_description;
		$Application_version=$ProductVersion_IP_description;
	}
	else
	{
		$Error=1;
	}

	if ($Error == 0)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

#===============================================================================
# Name:
#	GetSelection
# Description:
#	GetSelection enables to select one of choices from array by number.
# Input parameters:
#	Question to ask
#	Default answer (if indef, no default selection can be done)
#	Array of choices
# Return value:
#	Element from array of choices
#===============================================================================

sub GetSelection($$\@)
{
	my $Question=$_[0];
	my $DefaultAnswer=$_[1];
	my $ref_Choices=$_[2];

	my $size = scalar @$ref_Choices;

	print "$Question";

	while(<STDIN>)
	{
		chomp;

		if($_)
		{
			if (!(install_common::IsNumberOrNotEmptyDigitString($_) && ($_>=1) && ($_<=$size)))
			{
				print "\nInvalid response\n\n";
				print "$Question";
				next;
			}

			my @array= @$ref_Choices;
			return $array[$_-1];
		}
		else
		{
			if ($DefaultAnswer)
			{
				return $DefaultAnswer;
			}
			else
			{
				print "\nInvalid response\n\n";
				print "$Question";
				next;
			}
		}
	}
}

#===============================================================================
# Name:
#	GetData_from_IP_description
# Description:
#	Reads product nickname and product version from $ip_description_filename
# Input parameters:
#	Directory with $ip_description_filename file
#	Reference to product nickname
#	Reference to product version
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetData_from_IP_description($$$)
{
	my $TargetDir = $_[0];
	my $refProductNickname = $_[1];
	my $refProductVersion = $_[2];
	my $Result;
	my $Error=0;
	my $ProductNickname="";
	my $ProductVersion="";
	my $ip_description_pathname="";

	$ip_description_pathname=$TargetDir."/".$install_common::ip_description_filename;

	$Result = ip_description::getProductNickname($ip_description_pathname,\$ProductNickname);

	if ($Result == 1)
	{
		$$refProductNickname = $ProductNickname;
	}
	else
	{
		$Error=1;
	}

	$Result = ip_description::getProductVersion($ip_description_pathname,\$ProductVersion);

	if ($Result == 1)
	{
		$$refProductVersion = $ProductVersion;
	}
	else
	{
		$Error=1;
	}

	if ($Error == 0)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

#===============================================================================
# Name:
#	GetApplicaionNameFromStartupFile
# Description:
#	Reads application name from startup file
# Input parameters:
#	Directory with startup file
#	Reference to application name
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetApplicaionNameFromStartupFile($$)
{
	my $TargetDir = $_[0];
	my $refApplicationName = $_[1];
	my $Result=0;
	my $ApplicationName="";

	my $StartupFilePath="$TargetDir/$install_common::StartupFileName";

	if ( !(-e $StartupFilePath))
	{
		return $Result;
	}

	# get first not comment line from file and extract application name

	local *IN;

	open(IN, "$StartupFilePath") || return $Result;

	while (<IN>)
	{
		my $line = $_;
		chomp($line);

		if($line !~ /^\s*#/)
		{
			my $app_option="-app";

			if($line =~ /$app_option/ )
			{
				# extract application name
				$line =~ /$app_option (.*)/;
				my $buffer = $1;

				install_common::Trim(\$buffer);

				if (length($buffer) == 0)
				{
					return $Result;
				}

				if($buffer =~ /^"/ )
				{
					# get word inside "

					$buffer =~ /^"(.*)".*/;
					$ApplicationName = $1;
				}
				else
				{
					# get first word

					$buffer =~ /^(\w*).*/;
					$ApplicationName = $1;
				}

				if (length($ApplicationName) == 0)
				{
					return $Result;
				}

				$Result=1;
				last;
			}
		}
	}

	close(IN) || return $Result;

	$$refApplicationName = $ApplicationName;

	return $Result;
}

#===============================================================================
# Name:
#	BackupDirectory
# Description:
#	Backups directory
# Input parameters:
#	Target dir
#	Flag for backup mode: 0 - copy, 1 - move
#	Flag for backup directory location: 0 - inside target directory,
#									1 - on the same lavel as target directory
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

our $Backup_mode_copy=0;
our $Backup_mode_move=1;
our $Backup_dir_location_inside=0;
our $Backup_dir_location_outside=1;

sub BackupDirectory($$$)
{
	my $TargetDir = $_[0];
	my $Backup_mode_flag = $_[1];
	my $Backup_dir_location = $_[2];

	my $Result=0;

	local *DH;
	my @fnames;
	my $fname;
	my @time_list;
	my $cwd=`$install_common::PWD`;

	chomp $cwd;

	if(!$cwd)
	{
		return $Result;
	}

	chdir $TargetDir || return $Result;
	opendir DH, "." or return $Result;
	@fnames=readdir DH;
	closedir DH;

	if($#fnames <= 1)
	{
		# case where directory is empty
		chdir $cwd;

		$Result=1;
		return $Result;
	}
	else
	{
		@time_list=localtime(time);
		my $backup_dir=sprintf("backup_%.4d-%.2d-%.2d_%.2d-%.2d-%.2d",(1900+$time_list[5]),($time_list[4]+1),$time_list[3],$time_list[2],$time_list[1],$time_list[0]);

		if ($Backup_dir_location == $Backup_dir_location_inside)
		{
			if ( (! -d $TargetDir ) || (! -w $TargetDir ) )
			{
				chdir $cwd;
				return $Result;
			}

			mkdir "$TargetDir/$backup_dir", 0700 || return $Result;

			foreach $fname (@fnames)
			{
				next if ( ($fname eq ".") || ($fname eq "..") || ($fname eq $backup_dir) );

				if ($Backup_mode_flag == $Backup_mode_copy)
				{
					if (-d $fname)
					{
						system "$install_common::CP -r \"$fname\" \"$backup_dir\"";
					}
					else
					{
						system "$install_common::CP \"$fname\" \"$backup_dir\"";
					}
				}
				elsif ($Backup_mode_flag == $Backup_mode_move)
				{
					system "$install_common::MV \"$fname\" \"$backup_dir\"";
				}

				if ($? != 0)
				{
					chdir $cwd;
					return $Result;
				}
			}
		}
		elsif ($Backup_dir_location == $Backup_dir_location_outside)
		{
			my $ParentDir=`$install_common::dirname_cmd $TargetDir`;

			if ($? != 0)
			{
				chdir $cwd;
				return $Result;
			}

			chomp $ParentDir;

			if ( ! -w $ParentDir )
			{
				chdir $cwd;
				return $Result;
			}

			my $CurrentDir=`$install_common::basename_cmd $TargetDir`;

			if ($? != 0)
			{
				chdir $cwd;
				return $Result;
			}

			chomp $CurrentDir;

			my $BackupDir="$ParentDir/$CurrentDir"."_"."$backup_dir";

			mkdir "$BackupDir", 0700 || return $Result;

			system("$install_common::MV \"$TargetDir\"/* \"$BackupDir\"");

			if ($? != 0)
			{
				chdir $cwd;
				return $Result;
			}
		}

		chdir $cwd || return $Result;

		$Result = 1;
		return $Result;
	}

	chdir $cwd; # shouldn't reach here

	return $Result;
}

#===============================================================================
# Name:
#	CopyDescriptionFiles
# Description:
#	Copies description files
# Input parameters:
#	Target directory
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CopyDescriptionFiles($)
{
	my $TargetDir = $_[0];
	my $Result = 0;

	if(-f "$install_common::ip_description_filename")
	{
		system("$install_common::CP $install_common::ip_description_filename \"$TargetDir\"");

		if($?!=0)
		{
			return $Result;
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
		system("$install_common::CP *.html \"$TargetDir\"");
	}

	if(-f "$install_common::ospatchlist_filename")
	{
		system("$install_common::CP $install_common::ospatchlist_filename \"$TargetDir\"");

		if($?!=0)
		{
			return $Result;
		}
	}

	if(-f "$install_common::EULA_filename")
	{
		system("$install_common::CP $install_common::EULA_filename \"$TargetDir\"");

		if($?!=0)
		{
			return $Result;
		}
	}

	if(-d "$install_common::release_notes_dirname")
	{
		system("$install_common::CP -r $install_common::release_notes_dirname \"$TargetDir\"");

		if($?!=0)
		{
			return $Result;
		}
	}

	$Result = 1;

	return $Result;
}

#===============================================================================
# Name:
#	DeleteDescriptionFiles
# Description:
#	Deletes description files
# Input parameters:
#	Target directory
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub DeleteDescriptionFiles($)
{
	my $TargetDir = $_[0];
	my $Result = 0;
	my $Path = "";

	$Path = "$TargetDir/$install_common::ip_description_filename";

	if(-f $Path)
	{
		system("$install_common::RM $Path");

		if($?!=0)
		{
			return $Result;
		}
	}

	$Path = "$TargetDir/$install_common::ospatchlist_filename";

	if(-f $Path)
	{
		system("$install_common::RM $Path");

		if($?!=0)
		{
			return $Result;
		}
	}

	$Path = "$TargetDir/$install_common::read_me_html_filename";

	if(-f $Path)
	{
		system("$install_common::RM $Path");

		if($?!=0)
		{
			return $Result;
		}
	}

	$Path = "$TargetDir/$install_common::EULA_filename";

	if(-f $Path)
	{
		system("$install_common::RM $Path");

		if($?!=0)
		{
			return $Result;
		}
	}

	$Path = "$TargetDir/$install_common::release_notes_dirname";

	if(-f $Path)
	{
		system("$install_common::RM -r $Path");

		if($?!=0)
		{
			return $Result;
		}
	}

	$Result = 1;

	return $Result;
}

#===============================================================================
# Name:
#	MoveDescriptionFiles
# Description:
#	Moves description files
# Input parameters:
#	Target directory
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub MoveDescriptionFiles($)
{
	my $TargetDir = $_[0];
	my $Result = 0;

	if(! -d "$TargetDir")
	{
		system("$install_common::MKDIR \"$TargetDir\"");

		if($?!=0)
		{
			return $Result;
		}
	}

	if(-f "$install_common::ip_description_filename")
	{
		system("$install_common::MV $install_common::ip_description_filename \"$TargetDir\"");

		if($?!=0)
		{
			return $Result;
		}
	}

	# move html files like release_notes.html and read_me.html

	local *DH1;
	opendir DH1, "." or return 0;
	my @files_html=grep /\.html$/, readdir DH1;
	return 0 if $?;
	closedir DH1;

	if ( $#files_html > -1)
	{
		system("$install_common::MV *.html \"$TargetDir\"");
	}

	if(-f "$install_common::ospatchlist_filename")
	{
		system("$install_common::MV $install_common::ospatchlist_filename \"$TargetDir\"");

		if($?!=0)
		{
			return $Result;
		}
	}

	if(-f "$install_common::EULA_filename")
	{
		system("$install_common::MV $install_common::EULA_filename \"$TargetDir\"");

		if($?!=0)
		{
			return $Result;
		}
	}

	if(-d "$install_common::release_notes_dirname")
	{
		system("$install_common::MV $install_common::release_notes_dirname \"$TargetDir\"");

		if($?!=0)
		{
			return $Result;
		}
	}

	$Result = 1;

	return $Result;
}

#===============================================================================
# Name:
#	GetIPDescriptionsSubdirname
# Description:
#	Gets IP descriptions sub-dir name
# Input parameters:
#	None
# Return value:
#	Returns IP descriptions sub-dir name.
#===============================================================================

sub GetIPDescriptionsSubdirname()
{
	return $ip_descriptions_subdirname;
}

#===============================================================================
# ComponentsInfo class
#===============================================================================

package ComponentsInfo;

{
#===============================================================================
# Constants
#===============================================================================

my $Field_name_Name="Name";
my $Field_name_Selected="Selected";
our $Mode_update=0;
our $Mode_init=1;

#===============================================================================
# Name:
#	info
# Description:
#	Set/get instance data
# Input parameters:
#	Data to set or none.
# Return value:
#	Instance data
#===============================================================================

my $info = sub
{
	&{ $_[0] }("INFO", @_[1 .. $#_ ] )
};

#===============================================================================
# Name:
#	FormatData
# Description:
#	Returns formated data
# Input parameters:
#	Reference to hash
# Return value:
#	Formated data as string
#===============================================================================

my $FormatData = sub($$)
{
	my $type = shift;
	my $refData=$_[0];

	my $formated_data = "";
	$formated_data = $refData->{$Field_name_Name} . ",$refData->{$Field_name_Selected}";

	return $formated_data;
};

#===============================================================================
# Name:
#	None
# Description:
#	Initialize data
# Input parameters:
#	None
# Return value:
#	None
#===============================================================================

my $initialize = sub()
{
	my $type = shift;

	my @ComponentsInfo=(
		{
			$Field_name_Name => "dummy 1",
			$Field_name_Selected => "1",
		},
		{
			$Field_name_Name => "dummy 2",
			$Field_name_Selected => "1",
		},
	);

	$type->$info(\@ComponentsInfo);
};

#===============================================================================
# Name:
#	new
# Description:
#	Create ComponentsInfo instance
# Input parameters:
#	None
# Return value:
#	Instance of ComponentsInfo
#===============================================================================

sub new()
{
	my $type = shift;
	my $class = ref($type) || $type;
	my $self =
	{
		INFO => undef
	};

	my $closure = sub
	{
		my $field = shift;
		@_ and $self->{$field} = shift;
		$self->{$field};
	};

	bless $closure, $class;
	$closure->$initialize();
	return $closure;
}

#===============================================================================
# Name:
#	GetAllDescriptions
# Description:
#	Gets all descriptions
# Input parameters:
#	Reference to array of descriptions
# Return value:
#	None
#===============================================================================

sub GetAllDescriptions($$)
{
	my $type = shift;
	my $ref_descriptions = $_[0];

	my $ref_ComponentsInfo=$type->$info();
	my @ComponentsInfo=@{$ref_ComponentsInfo};

	my @descriptions=();

	for my $elem (@ComponentsInfo)
	{
		my $description=$type->$FormatData($elem);
		push(@descriptions,$description);
	}

	@{$ref_descriptions}=@descriptions;

	return;
}

#===============================================================================
# Name:
#	None
# Description:
#	Updates one data element
# Input parameters:
#	Reference to array of ComponentsInfo related elements
#	String representation of data
#	Set mode ($Mode_update or $Mode_init)
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

my $UpdateElement = sub($$$$)
{
	my $type = shift;
	my $ref_ComponentsInfo=$_[0];
	my @ComponentsInfo=@{$ref_ComponentsInfo};
	my $DataString=$_[1];
	my $mode=$_[2];

	##############################
	# parse string

	install_common::Trim(\$DataString);

	my @elements = split(/,/, $DataString);
	my $size=scalar @elements;

	if ($size != 2)
	{
		print "Error in UpdateElement (DataString)\n";
		return;
	}

	my $NameValue=$elements[0];
	my $Value=$elements[1];

	if ($mode == $Mode_update)
	{
		##############################
		# update element

		my $found=0;

		for my $elem (@ComponentsInfo)
		{
			if ($elem->{$Field_name_Name} eq $NameValue)
			{
				$elem->{$Field_name_Selected} = $Value;
				$found=1;
				last;
			}
		}

		if ($found == 0)
		{
			print "Error in UpdateElement (Not found)\n";
			return 0;
		}
	}
	else
	{
		##############################
		# add element

		my %map;
		$map{$Field_name_Name} = $NameValue;
		$map{$Field_name_Selected} = $Value;
		push(@ComponentsInfo,\%map);

		@{$ref_ComponentsInfo}=@ComponentsInfo;
	}

	return 1;
};

#===============================================================================
# Name:
#	SetAllDescriptions
# Description:
#	Sets all descriptions
# Input parameters:
#	Reference to array of descriptions
#	Set mode ($Mode_update or $Mode_init)
# Return value:
#	None
#===============================================================================

sub SetAllDescriptions($$$)
{
	my $type = shift;
	my $ref_descriptions=$_[0];
	my @descriptions=@{$ref_descriptions};
	my $mode=$_[1];

	my $ref_ComponentsInfo=$type->$info();
	my @ComponentsInfo=@{$ref_ComponentsInfo};

	if ($mode == $Mode_init)
	{
		@ComponentsInfo=();
	}

	for my $elem (@descriptions)
	{
		$type->$UpdateElement(\@ComponentsInfo,$elem,$mode);
	}

	$type->$info(\@ComponentsInfo);
	return;
}

#===============================================================================
# Name:
#	IsComponentSelected
# Description:
#	Checks if component is selected
# Input parameters:
#	Component name
#	Reference to selected flag (when return code is 1, value of flag is 1-selected, 0-not selected)
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub IsComponentSelected($$$)
{
	my $type = shift;
	my $ComponentName=$_[0];
	my $refSelected=$_[1];

	my $ref_ComponentsInfo=$type->$info();
	my @ComponentsInfo=@{$ref_ComponentsInfo};

	$$refSelected = 0;
	my $ComponentFound=0;

	for my $elem (@ComponentsInfo)
	{
		if ($elem->{$Field_name_Name} eq $ComponentName)
		{
			$ComponentFound=1;

			if (($elem->{$Field_name_Selected} == 1))
			{
				$$refSelected = 1;
			}

			last;
		}
	}

	if ($ComponentFound == 0)
	{
		return 0;
	}

	return 1;
}
}

#===============================================================================
# CheckBoxDialog class
#===============================================================================

package CheckBoxDialog;

{

#===============================================================================
# Constants
#===============================================================================

my $FieldWidth=10;

#===============================================================================
# Name:
#	SetFieldWidth
# Description:
#	GetMultipleSelectionCustom enables to select several choices from array by number.
# Input parameters:
#	General title
#	First title
#	Reference to array of choices
# Return value:
#	None
#===============================================================================

sub SetFieldWidth($$)
{
	my $type = shift;
	my $FieldWidth_param=$_[0];

	$FieldWidth=$FieldWidth_param;
}

#===============================================================================
# Name:
#	None
# Description:
#	Formats input string
# Input parameters:
#	String in "string,[0|1]" format
# Return value:
#	Formated string
#===============================================================================

my $FormatCheckBoxData = sub($$)
{
	my $type = shift;
	my $String= $_[0];

	##############################
	# parse string

	install_common::Trim(\$String);

	my @elements = split(/,/, $String);
	my $size=scalar @elements;

	if ($size != 2)
	{
		return "Error";
	}

	my $buffer="";
	my $char="X";

	if ($elements[1] == 0)
	{
		$char=" ";
	}

	my $format_string=sprintf("%%-%ds\t[%%s]",$FieldWidth);
	$buffer=sprintf($format_string,$elements[0],$char);
	return $buffer;
};

#===============================================================================
# Name:
#	DisplayMultipleSelectionCustom
# Description:
#	Displays available multiple choices
# Input parameters:
#	Question to ask
#	First title
#	Reference to array of choices
# Return value:
#	None
#===============================================================================

my $DisplayMultipleSelectionCustom = sub($$$$)
{
	my $type = shift;
	my $Question=$_[0];
	my $Title_1=$_[1];
	my $ref_Choices=$_[2];

	print "$Question\n";
	print "$Title_1\n";

	my @array=@{$ref_Choices};
	my $size= scalar @array;

	my $Count=1;

	for my $elem (@array)
	{
		my $display_string=$type->$FormatCheckBoxData($elem);
		my $formated_string=sprintf("%2d) %s",$Count,$display_string);
		print "$formated_string\n";
		$Count++;
	}

	print "Please enter \"1\"-\"$size\" values and press ENTER to make changes in selection.\n";
	print "Press ENTER to continue.\n";
};

#===============================================================================
# Name:
#	None
# Description:
#	Updates choices array
# Input parameters:
#	Reference to array of choices
#	Index to update
# Return value:
#	None
#===============================================================================

my $UpdateMultipleSelectionCustom=sub($$$)
{
	my $type = shift;
	my $ref_Choices=$_[0];
	my $Index=$_[1];

	my $size = scalar @$ref_Choices;

	my $ref_array;

	if ($Index >= 0 && $Index <= $size-1)
	{
		$ref_array=$ref_Choices;
	}
	else
	{
		return;
	}

	# update data

	my $string=$ref_array->[$Index];

	##############################
	# parse string

	install_common::Trim(\$string);

	my @elements = split(/,/, $string);
	$size=scalar @elements;

	if ($size != 2)
	{
		print "Error in UpdateMultipleSelectionCustom\n";
		return;
	}

	if ($elements[1] == 0)
	{
		$elements[1] = 1;
	}
	else
	{
		$elements[1] = 0;
	}

	$string = sprintf("%s,%s",$elements[0],$elements[1]);
	$ref_array->[$Index]=$string;
};

#===============================================================================
# Name:
#	GetMultipleSelectionCustom
# Description:
#	GetMultipleSelectionCustom enables to select several choices from array by number.
# Input parameters:
#	General title
#	First title
#	Reference to array of choices
# Return value:
#	None
#===============================================================================

sub GetMultipleSelectionCustom($$$\@)
{
	my $type = shift;
	my $Title=$_[0];
	my $Title_1=$_[1];
	my $ref_Choices_1=$_[2];

	my $size1 = scalar @$ref_Choices_1;
	my $size = $size1;

	$type->$DisplayMultipleSelectionCustom($Title,$Title_1,$ref_Choices_1);

	while(<STDIN>)
	{
		chomp;

		if($_)
		{
			if (!(install_common::IsNumberOrNotEmptyDigitString($_) && ($_>=1) && ($_<=$size)))
			{
				print "\nInvalid response\n\n";
				$type->$DisplayMultipleSelectionCustom($Title,$Title_1,$ref_Choices_1);
				next;
			}

			$type->$UpdateMultipleSelectionCustom($ref_Choices_1,$_-1);
			$type->$DisplayMultipleSelectionCustom($Title,$Title_1,$ref_Choices_1);
			next;
		}
		else
		{
			return;
		}
	}
}
}

package install_lib;

#===============================================================================
# Name:
#	CompareVersions
# Description:
#	Compares versions
# Input parameters:
#	Version1 value (for example 7.0.000.00)
#	Version2 value (for example 7.0.000.00)
#	Reference to compare result (<0 Version1 is less then Version2,
#								  0 Version1 is equal to Version2,
#								 >0 Version1 is greater than Version2)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CompareVersions($$$)
{
	my $Version_01=$_[0];
	my $Version_02=$_[1];
	my $ref_Result=$_[2];
	my $Result=0;
	my $Expected_array_size=4;

	############################

	install_common::Trim(\$Version_01);
	install_common::Trim(\$Version_02);

	############################
	# check for validity

	my @version_parts_01 = split(/\./, $Version_01);
	my $array_size = scalar @version_parts_01;

	if ($array_size != $Expected_array_size)
	{
		return $Result;
	}

	my @version_parts_02 = split(/\./, $Version_02);
	$array_size = scalar @version_parts_02;

	if ($array_size != $Expected_array_size)
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
	# compare

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

	return $Result;
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

	$Result=install_common::CompareVersionsEx($Version_01,$Version_02,$ref_Result);

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

	$Result=install_common::CompareRHEVersions($Version_01,$Version_02,$ref_Result);

	return $Result;
}

#===============================================================================
# Name:
#	IsVersionFromFamily
# Description:
#	Performs check for provided family
# Input parameters:
#	Version value (for example 7.0.000.00)
#	Family value (for example 7, 7.0, 7.0.1, 7.0.10, 7.0.100, 7.0.100.0, 7.0.000.00)
# Return value:
#	1 - if family is the same as provided, 0 - otherwise.
#===============================================================================

sub IsVersionFromFamily($$)
{
	my $VersionToCheck = $_[0];
	my $VersionPrefix = $_[1];
	my $Family_found=0;

	if ($VersionToCheck =~ /^$VersionPrefix/ )
	{
		$Family_found=1;
	}

	if ($Family_found == 1)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

#===============================================================================
# Name:
#	CompareJavaVersion
# Description:
#	Compare Java version
# Input parameters:
#	Java version
#	Min Java version
#	Max Java version (not included in the range of useful versions) (may be undef)
#	Reference to min Java version compare result (like in CompareVersionsEx)
#	Reference to max Java version compare result (like in CompareVersionsEx)
#	Flag for processing errors (0 - die, 1- return 0)
#	Alternative Java version for comparison with Max Java version (when Max Java version
#		 is included in the range of useful versions) (optional)
# Return value:
#	Returns 1 on success, 0 on failure. Can also return 1 on success or die.
#===============================================================================

my $ErrorProcessingDie = 0;
my $ErrorProcessingReturn = 1;

sub CompareJavaVersion($$$$$$;$)
{
	my $JavaVersion = $_[0];
	my $MinJavaVersion = $_[1];
	my $MaxJavaVersion = $_[2];
	my $ref_MinJavaVersion_CompareResult = $_[3];
	my $ref_MaxJavaVersion_CompareResult = $_[4];
	my $ErrorProcessing = $_[5];

	# check presence of optional argument
	my $OptionalJavaVersion_index=6;
	my $OptionalJavaVersion_use=0;
	my $OptionalJavaVersion_data="";

	if (($#_ >= $OptionalJavaVersion_index) && defined($_[$OptionalJavaVersion_index]))
	{
		$OptionalJavaVersion_use=1;
		$OptionalJavaVersion_data=$_[$OptionalJavaVersion_index];
	}

	my $JavaVersion_m = $JavaVersion;
	my $MinVersion_m = $MinJavaVersion;
	$JavaVersion_m =~ s/_/\./g;
	$MinVersion_m =~ s/_/\./g;
	my $VersionCompare_Result=0;
	my $Result=install_common::CompareVersionsEx($JavaVersion_m,$MinVersion_m,\$VersionCompare_Result);

	if ($Result == 0)
	{
		if ($ErrorProcessing == 0)
		{
			my $Message="\nUnexpected Java version $JavaVersion\n";

			if (install_common::Get_silent_mode() == 0)
			{
				die "$Message";
			}
			else
			{
				install_common::AdaptMessageToSilentMode(\$Message);
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
		else
		{
			return 0;
		}
	}

	$$ref_MinJavaVersion_CompareResult = $VersionCompare_Result;

	if (!defined($MaxJavaVersion))
	{
		return 1;
	}

	if ($OptionalJavaVersion_use == 1)
	{
		$JavaVersion_m = $OptionalJavaVersion_data;
		$JavaVersion_m =~ s/_/\./g;
	}

	my $MaxVersion_m = $MaxJavaVersion;
	$MaxVersion_m =~ s/_/\./g;
	my $VersionCompare_Result_max=0;
	$Result=install_common::CompareVersionsEx($JavaVersion_m,$MaxVersion_m,\$VersionCompare_Result_max);

	if ($Result == 0)
	{
		if ($ErrorProcessing == 0)
		{
			my $Message="\nUnexpected Java version $JavaVersion\n";

			if (install_common::Get_silent_mode() == 0)
			{
				die "$Message";
			}
			else
			{
				install_common::AdaptMessageToSilentMode(\$Message);
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
		else
		{
			return 0;
		}
	}

	$$ref_MaxJavaVersion_CompareResult = $VersionCompare_Result_max;

	return 1;
}

#===============================================================================
# Name:
#	CheckJavaVersion
# Description:
#	Checks Java version
# Input parameters:
#	Min Java version
#	Max Java version (not included in the range of useful versions)
# Return value:
#	1 or die.
#===============================================================================

sub CheckJavaVersion($;$)
{
	my $MinVersion = $_[0];
	my $MaxVersion = undef;

	if ($_[1])
	{
		$MaxVersion = $_[1];
	}

	my $jpath;
	my $jver;

	# locate the java executable and check its version

	if (!$ENV{JAVA_HOME})
	{
		my $Message="\nJAVA_HOME environment variable is not set. This software\n";
		$Message=$Message . "requires a Java installation of version $MinVersion or higher.\n";
		$Message=$Message . "Please install Java, set JAVA_HOME, and run this\n";
		$Message=$Message . "script again.\n\n";

		if (install_common::Get_silent_mode() == 0)
		{
			die "$Message";
		}
		else
		{
			install_common::AdaptMessageToSilentMode(\$Message);
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}

	if (-x "$ENV{JAVA_HOME}/bin/java")
	{
		$jpath="$ENV{JAVA_HOME}/bin/java";
	}
	elsif (-x "$ENV{JAVA_HOME}/bin/jre")
	{
		$jpath="$ENV{JAVA_HOME}/bin/jre";
	}
	else
	{
		my $Message="\nUnable to find java/jre executable in $ENV{JAVA_HOME}/bin\n";
		$Message=$Message . "Please check your Java installation and run this script again.\n\n";

		if (install_common::Get_silent_mode() == 0)
		{
			die "$Message";
		}
		else
		{
			install_common::AdaptMessageToSilentMode(\$Message);
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}

	(undef, undef, $jver)=split /\s/, `$jpath -version 2>&1`;
	$jver=~s/\"//g;

	if (!defined($MaxVersion))
	{
		my $VersionCompare_Result=0;
		CompareJavaVersion($jver,$MinVersion,undef,\$VersionCompare_Result,undef,$ErrorProcessingDie);

		#if ($jver lt $MinVersion)
		if ($VersionCompare_Result < 0)
		{
			my $Message="\nThe installed Java version is $jver. This software requires\n";
			$Message=$Message . "version $MinVersion or higher. Please update your Java installation\n";
			$Message=$Message . "and run this script again.\n\n";

			if (install_common::Get_silent_mode() == 0)
			{
				die "$Message";
			}
			else
			{
				install_common::AdaptMessageToSilentMode(\$Message);
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}
	else
	{
		my $VersionCompare_Result=0;
		my $VersionCompare_Result_max=0;
		CompareJavaVersion($jver,$MinVersion,$MaxVersion,\$VersionCompare_Result,\$VersionCompare_Result_max,$ErrorProcessingDie);

		#if (($jver lt $MinVersion) || ($jver ge $MaxVersion))
		if (($VersionCompare_Result < 0) || ($VersionCompare_Result_max >= 0))
		{
			my $Message="\nThe installed Java version is $jver. This software requires\n";
			$Message=$Message . "version $MinVersion or higher but less then version $MaxVersion. Please update your Java installation\n";
			$Message=$Message . "and run this script again.\n\n";

			if (install_common::Get_silent_mode() == 0)
			{
				die "$Message";
			}
			else
			{
				install_common::AdaptMessageToSilentMode(\$Message);
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}

	return 1;
}


#===============================================================================
# Name:
#	CheckJreVersion
# Description:
#	Checks JRE version
# Input parameters:
#	Min JRE version
#	Max JRE version (not included in the range of useful versions)
# Return value:
#	1 or die.
#===============================================================================

sub CheckJreVersion($;$)
{
	my $MinVersion = $_[0];
	my $MaxVersion = undef;

	if ($_[1])
	{
		$MaxVersion = $_[1];
	}

	my $jpath;
	my $jver;

	# locate the java executable and check its version

	if (!$ENV{JRE_HOME})
	{
		my $Message="\nJRE_HOME environment variable is not set. This software\n";
		$Message=$Message . "requires a JRE installation of version $MinVersion or higher.\n";
		$Message=$Message . "Please install JRE, set JRE_HOME, and run this\n";
		$Message=$Message . "script again.\n\n";

		if (install_common::Get_silent_mode() == 0)
		{
			die "$Message";
		}
		else
		{
			install_common::AdaptMessageToSilentMode(\$Message);
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}

	if (-x "$ENV{JRE_HOME}/bin/java")
	{
		$jpath="$ENV{JRE_HOME}/bin/java";
	}
	elsif (-x "$ENV{JRE_HOME}/bin/jre")
	{
		$jpath="$ENV{JRE_HOME}/bin/jre";
	}
	else
	{
		my $Message="\nUnable to find java/jre executable in $ENV{JRE_HOME}/bin\n";
		$Message=$Message . "Please check your JRE installation and run this script again.\n\n";

		if (install_common::Get_silent_mode() == 0)
		{
			die "$Message";
		}
		else
		{
			install_common::AdaptMessageToSilentMode(\$Message);
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}

	(undef, undef, $jver)=split /\s/, `$jpath -version 2>&1`;
	$jver=~s/\"//g;

	if (!defined($MaxVersion))
	{
		my $VersionCompare_Result=0;
		CompareJavaVersion($jver,$MinVersion,undef,\$VersionCompare_Result,undef,$ErrorProcessingDie);

		#if ($jver lt $MinVersion)
		if ($VersionCompare_Result < 0)
		{
			my $Message="\nThe installed JRE version is $jver. This software requires\n";
			$Message=$Message . "version $MinVersion or higher. Please update your JRE installation\n";
			$Message=$Message . "and run this script again.\n\n";

			if (install_common::Get_silent_mode() == 0)
			{
				die "$Message";
			}
			else
			{
				install_common::AdaptMessageToSilentMode(\$Message);
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}
	else
	{
		my $VersionCompare_Result=0;
		my $VersionCompare_Result_max=0;
		CompareJavaVersion($jver,$MinVersion,$MaxVersion,\$VersionCompare_Result,\$VersionCompare_Result_max,$ErrorProcessingDie);

		#if (($jver lt $MinVersion) || ($jver ge $MaxVersion))
		if (($VersionCompare_Result < 0) || ($VersionCompare_Result_max >= 0))
		{
			my $Message="\nThe installed JRE version is $jver. This software requires\n";
			$Message=$Message . "version $MinVersion or higher but less then version $MaxVersion. Please update your JRE installation\n";
			$Message=$Message . "and run this script again.\n\n";

			if (install_common::Get_silent_mode() == 0)
			{
				die "$Message";
			}
			else
			{
				install_common::AdaptMessageToSilentMode(\$Message);
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}

	return 1;
}

#===============================================================================
# Name:
#	CheckJavaVersionUsingPath
# Description:
#	Checks Java version using path (similar to install_ics::::CheckJavaVersion, but with $CheckJavaJDK option)
# Input parameters:
#	Reference to Java path (not the Java home path)
#	Min Java version
#	Max Java version (not included in the range of useful versions)
#	Optional flag for aborting on Java verification problem (1-abort,other-don't abort)
# Return value:
#	None or die. Empty Java path means that Java wasn't found.
#===============================================================================

our $ActionOnJavaVerificationProblem_abort = 1;
our $CheckJavaJDK = 0;
our $IncludeMaxVersion = 0;

sub CheckJavaVersionUsingPath($$;$$)
{
	my $ref_Java_path=$_[0];
	my $MinVersion=$_[1];
	my $MaxVersion=undef;
	my $AbortOnJavaVerificationProblem=undef;

	if ($_[2])
	{
		$MaxVersion = $_[2];
	}

	if ($_[3])
	{
		$AbortOnJavaVerificationProblem = $_[3];
	}

	my $jpath;
	my $jver;
	my $JavaVerificationProblem=0;

	if (install_common::Get_silent_mode() == 0)
	{
		my $done=0;

		while (!$done)
		{
			if ($JavaVerificationProblem == 1)
			{
				if (!defined($AbortOnJavaVerificationProblem) ||
					(defined($AbortOnJavaVerificationProblem) && ($AbortOnJavaVerificationProblem != $ActionOnJavaVerificationProblem_abort)))
				{
					my $Message="\nSupported version of Java is not found. The installation will continue without binding to Java.\n";
					$Message=$Message . "Do you want to continue (y/n)?";

					if((install_common::ASK($Message,"y","n")) eq "n")
					{
						install_common::CatchInterruptSignal();
					}
					else
					{
						$$ref_Java_path="";
						$done=1;
						next;
					}
				}
				else
				{
					my $Message="\nSupported version of Java is not found.\n";
					install_common::CatchInterruptSignal();
				}
			}

			my $Java_path=install_common::ASK("\nPlease enter absolute path for directory with Java executable =>");

			if (!install_common::IsValidPath($Java_path))
			{
				print "Invalid path.\n";
				$JavaVerificationProblem=1;
				next;
			}

			if (!(-e $Java_path))
			{
				print "Specified path doesn't exist.\n";
				$JavaVerificationProblem=1;
				next;
			}

			if (!(-d $Java_path))
			{
				print "Specified path is not a directory.\n";
				$JavaVerificationProblem=1;
				next;
			}

			if (!(-r $Java_path))
			{
				print "Specified path is not readable.\n";
				$JavaVerificationProblem=1;
				next;
			}

			# locate the java executable and check its version

			if (-x "$Java_path/java")
			{
				$jpath="$Java_path/java";
			}
			else
			{
				my $Message="\nUnable to find java executable in $Java_path\n";
				print "$Message";
				$JavaVerificationProblem=1;
				next;
			}

			if ($CheckJavaJDK == 1)
			{
				if (-x "$Java_path/javac")
				{
					# do nothing
				}
				else
				{
					my $Message="\nUnable to find JDK javac executable in $Java_path\n";
					print "$Message";
					$JavaVerificationProblem=1;
					next;
				}
			}

			my ($word_01,$word_02);
			($word_01, $word_02, $jver)=split /\s/, `$jpath -version 2>&1`;

			if (($word_01 ne "java") && ($word_02 ne "version"))
			{
				my $Message=`$jpath -version 2>&1`;
				print "$Message";
				$JavaVerificationProblem=1;
				next;
			}

			$jver=~s/\"//g;

			if (!defined($MaxVersion))
			{
				my $VersionCompare_Result=0;
				my $Result = CompareJavaVersion($jver,$MinVersion,undef,\$VersionCompare_Result,undef,$ErrorProcessingReturn);

				if ($Result == 0)
				{
					my $Message="\nUnexpected Java version $jver\n";
					print "$Message";
					$JavaVerificationProblem=1;
					next;
				}

				#if ($jver lt $MinVersion)
				if ($VersionCompare_Result < 0)
				{
					my $Message="\nThe installed JRE/JDK version is $jver. This software requires\n";
					$Message=$Message . "version $MinVersion or higher.\n";
					print "$Message";
					$JavaVerificationProblem=1;
					next;
				}
			}
			else
			{
				if ($IncludeMaxVersion == 0)
				{
					my $VersionCompare_Result=0;
					my $VersionCompare_Result_max=0;
					my $Result = CompareJavaVersion($jver,$MinVersion,$MaxVersion,\$VersionCompare_Result,\$VersionCompare_Result_max,$ErrorProcessingReturn);

					if ($Result == 0)
					{
						my $Message="\nUnexpected Java version $jver\n";
						print "$Message";
						$JavaVerificationProblem=1;
						next;
					}

					#if (($jver lt $MinVersion) || ($jver ge $MaxVersion))
					if (($VersionCompare_Result < 0) || ($VersionCompare_Result_max >= 0))
					{
						my $Message="\nThe installed JRE/JDK version is $jver. This software requires\n";
						$Message=$Message . "version $MinVersion or higher but less then version $MaxVersion.\n";
						print "$Message";
						$JavaVerificationProblem=1;
						next;
					}
				}
				else
				{
					my $length_jver = length($jver);
					my $length_MaxVersion = length($MaxVersion);
					my $jver_max=$jver;

					if ($length_jver > $length_MaxVersion)
					{
						# truncate $jver to match the $MaxVersion to have "1.8.0_31" equal to version 1.8.
						$jver_max=substr($jver,0,$length_MaxVersion);
					}

					my $VersionCompare_Result=0;
					my $VersionCompare_Result_max=0;
					my $Result = CompareJavaVersion($jver,$MinVersion,$MaxVersion,\$VersionCompare_Result,\$VersionCompare_Result_max,$ErrorProcessingReturn,$jver_max);

					if ($Result == 0)
					{
						my $Message="\nUnexpected Java version $jver\n";
						print "$Message";
						$JavaVerificationProblem=1;
						next;
					}

					#if (($jver lt $MinVersion) || ($jver_max gt $MaxVersion))
					if (($VersionCompare_Result < 0) || ($VersionCompare_Result_max > 0))
					{
						my $Message="\nThe installed JRE/JDK version is $jver. This software requires\n";
						$Message=$Message . "version $MinVersion or higher but less or equal then version $MaxVersion.\n";
						print "$Message";
						$JavaVerificationProblem=1;
						next;
					}
				}
			}

			$done=1;
			$$ref_Java_path=$Java_path;
		}
	}
	else
	{
		my $Filepath = install_common::Get_silent_mode_response_file_path();

		if (!-f $Filepath)
		{
			my $Message="File $Filepath was not found.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}

		my %IniSectionData=install_common::PARSEINI($Filepath,$Silent_response_file_JavaData_section_name,$install_common::comments_characters);

		if (!%IniSectionData)
		{
			my $Message="Section $Silent_response_file_JavaData_section_name was not found.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}

		my $value=$IniSectionData{$Silent_response_file_JavaPath_key_name};

		if (!defined($value))
		{
			my $Message="Key $Silent_response_file_JavaPath_key_name in section $Silent_response_file_JavaData_section_name was not found.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}

		install_common::Trim(\$value);

		$$ref_Java_path=$value;
	}

	if (install_common::Get_record_mode() == 1)
	{
		my $Filepath = install_common::Get_silent_mode_response_file_path();
		my $Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_JavaData_section_name,$Silent_response_file_JavaPath_key_name,$$ref_Java_path);
	}

	return;
}

#===============================================================================
# Name:
#	GetJarPath
# Description:
#	Gets jar home
# Input parameters:
#	None.
# Return value:
#	Jar path or die.
#===============================================================================

sub GetJarPath()
{
	my $jpath;

	# locate the jar executable

	if (!$ENV{JAVA_HOME})
	{
		my $Message="\nJAVA_HOME environment variable is not set.\n";
		$Message=$Message . "Please set JAVA_HOME, and run this\n";
		$Message=$Message . "script again.\n\n";

		if (install_common::Get_silent_mode() == 0)
		{
			die "$Message";
		}
		else
		{
			install_common::AdaptMessageToSilentMode(\$Message);
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}

	if (-x "$ENV{JAVA_HOME}/bin/jar")
	{
		$jpath="$ENV{JAVA_HOME}/bin/jar";
	}
	else
	{
		my $Message="\nUnable to find jar executable in $ENV{JAVA_HOME}/bin\n";
		$Message=$Message . "Please check your Java installation and run this script again.\n\n";

		if (install_common::Get_silent_mode() == 0)
		{
			die "$Message";
		}
		else
		{
			install_common::AdaptMessageToSilentMode(\$Message);
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}

	return $jpath;
}

#===============================================================================
# Name:
#	ReadConfigValue
# Description:
#	Reads specified config value from file (format: key value)
# Input parameters:
#	File path.
#	Value name
#	Reference to variable for found value.
#	Reference to variable for value.
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub ReadConfigValue($$$$)
{
	my $File_path=$_[0];
	my $Value_name=$_[1];
	my $ref_found=$_[2];
	my $ref_Value=$_[3];
	my $Result=0;

	local *IN;

	if ( -r $File_path)
	{
		my $line="";
		my $Value_token=$Value_name;
		my $Value_token_found=0;

		open (IN, "$File_path") || return $Result;

		while (<IN>)
		{
			if(/^$Value_token/)
			{
				$line=$_;
				my ($value) = ($line =~ /^$Value_token (.*)$/);
				$$ref_Value = $value;

				$Value_token_found=1;
				last;
			}
		}

		close IN || return $Result;

		if ($Value_token_found == 1)
		{
			$$ref_found=1;
		}
		else
		{
			$$ref_found=0;
		}

		$Result=1;
	}
	else
	{
		if (install_common::Get_silent_mode() == 0)
		{
			print "Unable to read file $File_path\n";
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	ReadConfigValueEx
# Description:
#	Reads specified config value from file (format: key[ ]=[ ]value)
# Input parameters:
#	File path.
#	Value name
#	Reference to variable for found value.
#	Reference to variable for value.
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub ReadConfigValueEx($$$$)
{
	my $File_path=$_[0];
	my $Value_name=$_[1];
	my $ref_found=$_[2];
	my $ref_Value=$_[3];
	my $Result=0;

	local *IN;

	if ( -r $File_path)
	{
		my $line="";
		my $Value_token=$Value_name;
		my $Value_token_found=0;

		open (IN, "$File_path") || return $Result;

		while (<IN>)
		{
			if(/^$Value_token/)
			{
				$line=$_;
				my ($name, $value)=split(/=/,$line);
				$$ref_Value = $value;

				$Value_token_found=1;
				last;
			}
		}

		close IN || return $Result;

		if ($Value_token_found == 1)
		{
			$$ref_found=1;
		}
		else
		{
			$$ref_found=0;
		}

		$Result=1;
	}
	else
	{
		if (install_common::Get_silent_mode() == 0)
		{
			print "Unable to read file $File_path\n";
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	UpdateConfigValues
# Description:
#	UpdateConfigValues takes two or three arguments. The first argument is a
#	string containing the path of file to be edited. The second argument
#	is a reference to a hash with the key names which are tokens to be
#	found and replaced by the corresponding value. Edits are performed
#	in place unless there is a third argument, the path of the file to
#	which to write them instead. Searches are case-sensitive and multiple
#	substitutions will be made per line.
#	See install_common::EDITFILE for similar functionality.
# Input parameters:
#	File path (file to update or file to read if third parameter exists).
#	Reference to a hash with the key names which are tokens to be
#		found and replaced by the corresponding value.
#	File path (file to update).
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub UpdateConfigValues($\%;$)
{
	my ($file_original, $file_alternative);
	my %replacements=%{$_[1]};
	my $key;
	local (*FH1, *FH2);

	if (!$_[2])
	{
		$file_alternative=$_[0];
		$file_original=$_[0] . time;
		rename ($file_alternative, $file_original) || return 0;
	}
	else
	{
		$file_original=$_[0];
		$file_alternative=$_[2];
	}

	open(FH1,"<$file_original") || return 0;
	open(FH2,">$file_alternative") || return 0;

	while(<FH1>)
	{
		foreach $key (keys %replacements)
		{
			if (/^$key/)
			{
				$_ = "$replacements{$key}\n";
			}
		}
		print FH2 $_;
	}

	close FH1 || return 0;
	close FH2 || return 0;

	if(!$_[2])
	{
		unlink $file_original || return 0;
	}

	return 1;
}

#===============================================================================
# Name:
#	GetConfigurationServerInfo
# Description:
#	Gets version information from Config Server.
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Config Server password option
#	Reference to hash of version information
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub GetConfigurationServerInfo(\%$\%)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $CSPasswordOption = $_[1];
	my $refVersionInfo = $_[2];
	my %VersionInfo = ();
	my $Result = 0;

	my %CSData=install_common::READCFGSERV("-h $IniSectionData{host} -p $IniSectionData{port} -t 20 -al $IniSectionData{appname} -u $IniSectionData{user} $CSPasswordOption -lv");

	if($CSData{retcode} != 0)
	{
		return $Result;
	}

	if($CSData{retcode} == 0)
	{
		$VersionInfo{serverVersion} = $CSData{serverVersion};
		$VersionInfo{schemaVersion} = $CSData{schemaVersion};

		if (defined($CSData{localeVersion}))
		{
			$VersionInfo{serverVersion} = $CSData{localeVersion};
		}
		else
		{
			# cfgutility 7.5.000.xx will get serverVersion=7.5.000.00 from CS 8.1.1, so the serverVersion should be replaced by schemaVersion, if serverVersion < schemaVersion
			my $CompareResult;
			my $ResultVersion=CompareVersions($VersionInfo{serverVersion},$VersionInfo{schemaVersion},\$CompareResult);

			if ($ResultVersion == 0)
			{
				# do nothing
			}
			else
			{
				if ($CompareResult < 0)
				{
					# $VersionInfo{serverVersion} < $VersionInfo{schemaVersion}
					$VersionInfo{serverVersion} = $VersionInfo{schemaVersion};
				}
			}
		}

		%{$refVersionInfo} = %VersionInfo;

		$Result = 1;
	}

	return $Result;
}

#===============================================================================
# Name:
#	UseConfiguredApplicationType
# Description:
#	Checks is configured application type should be used
# Input parameters:
#	None.
# Return value:
#	1 when configured application type should be used, 0 otherwise.
#===============================================================================

sub UseConfiguredApplicationType()
{
	if ($Configured_app_type_mode == $Configured_app_type_mode_standard)
	{
		return 1;
	}

	return 0;
}

#===============================================================================
# Name:
#	SetConfiguredApplicationType
# Description:
#	Sets configured application type
# Input parameters:
#	None.
# Return value:
#	None.
#===============================================================================

sub SetConfiguredApplicationType()
{
	$Configured_app_type_mode = $Configured_app_type_mode_standard;
}

#===============================================================================
# Name:
#	GetApplicationType
# Description:
#	Gets application type (used when we need select one from several application types).
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Config Server password option
#	Reference to application type variable
#	Starting version for alternative application type in IP
#	Starting version for alternative application type in Config Server
#	Application type (legacy)
#	Application type (alternative)
# Return value:
#	1 on success, 0 on failure.
#	Failure means that one application type can't be selected and user should
#	do the selection interactively.
#	Success means that application type was selected or we even don't need this,
#	in any case the user input is not required.
#===============================================================================

sub GetApplicationType(\%$$$$$$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $CSPasswordOption = $_[1];
	my $ref_ApplicationType = $_[2];
	my $StartingVersionFor_Alternative_App_Type = $_[3];
	my $StartingVersionFor_Alternative_App_Type_In_Config_Server = $_[4];
	my $App_Type_legacy = $_[5];
	my $App_Type_Alternative = $_[6];
	my $Result = 0;

	if (UseConfiguredApplicationType() == 1)
	{
		if (defined($IniSectionData{SetupType}))
		{
			$$ref_ApplicationType = $IniSectionData{SetupType};
			$Result = 1;
		}
		else
		{
			my ($Product_Name,$Product_FamilyVersion,$Product_Version);
			my $ResultDescription=Read_IP_description(\$Product_Name,\$Product_FamilyVersion,\$Product_Version);

			if ($ResultDescription == 0)
			{
				# something is wrong, maybe we need to select
				return $Result;
			}

			my $CompareResult;
			my $ResultVersion=CompareVersions($Product_Version,$StartingVersionFor_Alternative_App_Type,\$CompareResult);

			if ($ResultVersion == 0)
			{
				# something is wrong, maybe we need to select
				return $Result;
			}

			if ($CompareResult < 0)
			{
				# don't need to select anything.
				$Result = 1;
				return $Result;
			}
			else
			{
				my %VersionInfo = ();
				my $ResultInfo = GetConfigurationServerInfo(%IniSectionData,$CSPasswordOption,%VersionInfo);

				if ($ResultInfo == 0)
				{
					return $Result;
				}

				my $CompareResult;
				$ResultVersion=CompareVersions($VersionInfo{serverVersion},$StartingVersionFor_Alternative_App_Type_In_Config_Server,\$CompareResult);

				if ($ResultVersion == 0)
				{
					# something is wrong, maybe we need to select
					return $Result;
				}

				if ($CompareResult < 0)
				{
					$$ref_ApplicationType = $App_Type_legacy;
				}
				else
				{
					$$ref_ApplicationType = $App_Type_Alternative;
				}

				$Result = 1;
			}
		}
	}
	else
	{
		return $Result;
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetLicensePath
# Description:
#	Gets license path
# Input parameters:
#	Apllication command line
#	Reference to license path
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub GetLicensePath($$)
{
	my $CommandLine = $_[0];
	my $ref_LicensePath = $_[1];
	my $license_option = "-l";
	my $Result = 0;

	if ($CommandLine =~ /$license_option .*/ )
	{
		# extract license path
		$CommandLine =~ /$license_option (.*)/;
		my $buffer = $1;

		install_common::Trim(\$buffer);

		if (length($buffer) == 0)
		{
			return $Result;
		}

		if($buffer =~ /^"/ )
		{
			# get everything inside ""

			$buffer =~ /^"(.*)".*/;
			$$ref_LicensePath = $1;
			$$ref_LicensePath = "-l \\\"$$ref_LicensePath\\\"";

			$Result = 1;
		}
		else
		{
			# should be inside ""
			return $Result;
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetOperationMode
# Description:
#	Gets operation mode
# Input parameters:
#	Start version of feature
#	Value of operation mode without feature
#	Value of operation mode with feature
#	Reference to operation mode
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetOperationMode($$$$)
{
	my $Start_version_of_feature=$_[0];
	my $Value_of_operation_mode_without_feature=$_[1];
	my $Value_of_operation_mode_with_feature=$_[2];
	my $ref_Operation_mode=$_[3];
	my $Result=0;

	# set default
	$$ref_Operation_mode=$Value_of_operation_mode_without_feature;

	my ($product_name,$product_family_version,$product_version);
	$Result=install_lib::Read_IP_description(\$product_name,\$product_family_version,\$product_version);

	if ($Result == 0)
	{
		return $Result;
	}

	my $CompareResult;
	$Result=CompareVersions($product_version,$Start_version_of_feature,\$CompareResult);

	if ($Result == 0)
	{
		return $Result;
	}

	$Result=1;

	if ($CompareResult < 0)
	{
		$$ref_Operation_mode=$Value_of_operation_mode_without_feature;
	}
	else
	{
		$$ref_Operation_mode=$Value_of_operation_mode_with_feature;
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetOperationModeEx
# Description:
#	Gets operation mode (similar to GetOperationMode, but uses finite interval
#						for mode)
# Input parameters:
#	Start version of feature
#	Next to stop version of feature
#	Value of operation mode without feature
#	Value of operation mode with feature
#	Reference to operation mode
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetOperationModeEx($$$$$)
{
	my $Start_version_of_feature=$_[0];
	my $Next_to_stop_version_of_feature=$_[1];
	my $Value_of_operation_mode_without_feature=$_[2];
	my $Value_of_operation_mode_with_feature=$_[3];
	my $ref_Operation_mode=$_[4];
	my $Result=0;

	$Result=GetOperationMode($Start_version_of_feature,$Value_of_operation_mode_without_feature,$Value_of_operation_mode_with_feature,$ref_Operation_mode);

	if ($Result == 0)
	{
		return $Result;
	}

	if ($$ref_Operation_mode == $Value_of_operation_mode_without_feature)
	{
		$Result=1;
	}
	else
	{
		# check if we inside the interval
		$Result=GetOperationMode($Next_to_stop_version_of_feature,$Value_of_operation_mode_with_feature,$Value_of_operation_mode_without_feature,$ref_Operation_mode);
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetOption
# Description:
#	Gets option and option parameter (if any)
# Input parameters:
#	Reference to list of options
#	Option name for processing
#	Reference to option found flag (0-not found, 1-found)
#	Reference to option parameter (undefined if not found)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetOption(\@$$$)
{
	my $ref_Options=$_[0];
	my @Options=@$ref_Options;
	my $Option_name=$_[1];
	my $ref_Option_found_flag=$_[2];
	$$ref_Option_found_flag=0;
	my $ref_Option_parameter=$_[3];
	$$ref_Option_parameter=undef;
	my $Result=1;
	my $Count = 0;
	my $Size = scalar(@Options);

	for my $elem (@Options)
	{
		if ($elem eq $Option_name)
		{
			$$ref_Option_found_flag=1;

			if (($Count+1) <= ($Size-1))
			{
				$$ref_Option_parameter = $Options[$Count+1];
			}

			last;
		}

		$Count++;
	}

	return $Result;
}

#===============================================================================
# Name:
#	SetupSilentMode
# Description:
#	Setup silent mode
# Input parameters:
#	None.
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub SetupSilentMode()
{
	my $Result=0;
	my $Option_found_flag=0;
	my $Option_parameter="";

	$Result=GetOption(@ARGV,$Silent_option_name,\$Option_found_flag,\$Option_parameter);

	if ($Result == 0)
	{
		return $Result;
	}

	if ($Option_found_flag == 1)
	{
		# silent mode
		$Result=GetOption(@ARGV,$Silent_Path_Log_option_name,\$Option_found_flag,\$Option_parameter);

		if ($Option_found_flag == 1)
		{
			if (defined($Option_parameter))
			{
				install_common::Set_silent_mode_log_file_path($Option_parameter);
			}
			else
			{
				return 0;
			}
		}
		else
		{
			install_common::Set_silent_mode_log_file_path("");
		}

		$Result=GetOption(@ARGV,$Silent_Path_Response_option_name,\$Option_found_flag,\$Option_parameter);

		if ($Option_found_flag == 1)
		{
			if (defined($Option_parameter))
			{
				install_common::Set_silent_mode_response_file_path($Option_parameter);
			}
			else
			{
				return 0;
			}
		}
		else
		{
			install_common::Set_silent_mode_response_file_path("");
		}

		install_common::Set_silent_mode(1);
		InitSilentModeIPData();
		install_common::Verify_silent_mode_response_file_path();
		$Result=1;
	}
	else
	{
		$Result=GetOption(@ARGV,$Record_option_name,\$Option_found_flag,\$Option_parameter);

		if ($Result == 0)
		{
			return $Result;
		}

		if ($Option_found_flag == 1)
		{
			$Result=GetOption(@ARGV,$Silent_Path_Response_option_name,\$Option_found_flag,\$Option_parameter);

			if ($Option_found_flag == 1)
			{
				if (defined($Option_parameter))
				{
					install_common::Set_silent_mode_response_file_path($Option_parameter);
				}
				else
				{
					return 0;
				}
			}
			else
			{
				install_common::Set_silent_mode_response_file_path("");
			}

			install_common::Set_record_mode(1);

			my $Filepath = install_common::Get_silent_mode_response_file_path();
			$Result = install_common::CreateEmptyFile($Filepath);

			if ($Result == 0)
			{
				return $Result;
			}

			$Result=1;
		}
		else
		{
			$Result=1;
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	CreateCharsString
# Description:
#	Creates string from input set of characters duplicated specified number
#	of times
# Input parameters:
#	Input string containing characters
#	Number of times to duplicate input string
#	Reference to output string
# Return value:
#	None.
#===============================================================================

sub CreateCharsString($$$)
{
	my $InputStr=$_[0];
	my $Count=$_[1];
	my $ref_OutputStr=$_[2];
	my $Buffer="";

	for (my $i = 0; $i < $Count; $i++)
	{
		$Buffer = $Buffer . $InputStr;
	}

	$$ref_OutputStr=$Buffer;
}

#===============================================================================
# Name:
#	CreateInstallationHeader
# Description:
#	Creates installation header
# Input parameters:
#	Product family version
#	Reference to installation header
# Return value:
#	None.
#===============================================================================

sub CreateInstallationHeader($$)
{
	my $ProductFamilyVersion=$_[0];
	my $ref_InstallationHeader=$_[1];

	my ($TopLine,$MiddleLine,$BottomLine);
	$MiddleLine = "* Welcome to the $Vendor $ProductFamilyVersion Installation Script *";
	my $length = length($MiddleLine);
	CreateCharsString("*",$length,\$TopLine);
	$BottomLine=$TopLine;

	$$ref_InstallationHeader = "$TopLine\n$MiddleLine\n$BottomLine\n";
}

#===============================================================================
# Name:
#	PrintInstallationHeader
# Description:
#	Prints installation header
# Input parameters:
#	Product family version.
#	Product name with version.
# Return value:
#	None.
#===============================================================================

sub PrintInstallationHeader($$)
{
	my $ProductFamilyVersion = $_[0];
	my $PRODUCT = $_[1];

	if (install_common::Get_silent_mode() == 0)
	{
		my $InstallationHeader;
		CreateInstallationHeader($ProductFamilyVersion,\$InstallationHeader);
		print "$InstallationHeader\n";

		print "Installing $PRODUCT\n";
	}

	VerifyIPVersion();
	VerifyOS();
}

#===============================================================================
# Name:
#	PrintInstallationHeaderEx
# Description:
#	Prints installation header
# Input parameters:
#	Uninstallation flag (0-installing,1-uninstalling)
#	Product family version.
#	Product name (with version)
#	Product name (without version)
# Return value:
#	None.
#===============================================================================

sub PrintInstallationHeaderEx($$$$)
{
	my $UninstallMode=$_[0];
	my $ProductFamilyVersion = $_[1];
	my $Product_Name_and_version=$_[2];
	my $Product_Name=$_[3];

	if (install_common::Get_silent_mode() == 0)
	{
		my $InstallationHeader;
		CreateInstallationHeader($ProductFamilyVersion,\$InstallationHeader);
		print "$InstallationHeader\n";

		if ($UninstallMode == 0)
		{
			print "Installing $Product_Name_and_version\n";
		}
		else
		{
			print "Uninstalling $Product_Name\n";
		}
	}

	VerifyIPVersion();
	VerifyOS();
}

#===============================================================================
# Name:
#	PrintInstallationFooter
# Description:
#	Prints installation footer
# Input parameters:
#	Product name with version.
# Return value:
#	None.
#===============================================================================

sub PrintInstallationFooter($)
{
	my $PRODUCT = $_[0];

	if (install_common::Get_silent_mode() == 0)
	{
		print "\nInstallation of $PRODUCT has completed successfully.\n\n";
	}
	else
	{
		my $Message="";
		install_common::CreateSilentLog($install_common::Silent_result_success,$Message,$install_common::Silent_action_conntinue);
	}
}

#===============================================================================
# Name:
#	PrintInstallationFooterEx
# Description:
#	Prints installation footer
# Input parameters:
#	Uninstallation flag (0-installing,1-uninstalling)
#	Product name (with version)
#	Product name (without version)
# Return value:
#	None.
#===============================================================================

sub PrintInstallationFooterEx($$$)
{
	my $UninstallMode=$_[0];
	my $Product_Name_and_version=$_[1];
	my $Product_Name=$_[2];

	if (install_common::Get_silent_mode() == 0)
	{
		if ($UninstallMode == 0)
		{
			print "\nInstallation of $Product_Name_and_version has completed successfully.\n\n";
		}
		else
		{
			print "\nUninstallation of $Product_Name has completed successfully.\n\n";
		}
	}
	else
	{
		my $Message="";
		install_common::CreateSilentLog($install_common::Silent_result_success,$Message,$install_common::Silent_action_conntinue);
	}
}

#===============================================================================
# Name:
#	InitSilentModeIPData
# Description:
#	Inita silent mode IP data
# Input parameters:
#	None
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub InitSilentModeIPData()
{
	my $Result=0;
	my $Error=0;
	my $ProductName_IP_description="";
	my $ProductFamilyVersion_IP_description="";
	my $ProductVersion_IP_description="";
	$Result=Read_IP_description(\$ProductName_IP_description,\$ProductFamilyVersion_IP_description,\$ProductVersion_IP_description);

	if ($Result == 0)
	{
		$Error=1;
	}
	else
	{
		$install_common::IP_description_info{ProductName}=$ProductName_IP_description;
		$install_common::IP_description_info{ProductVersion}=$ProductVersion_IP_description;
	}

	my $ProductBuildNumber_IP_description="";
	my $ProductLanguage_IP_description="";
	$Result=Read_IP_description_details(\$ProductBuildNumber_IP_description,\$ProductLanguage_IP_description);

	if ($Result == 0)
	{
		$Error=1;
	}
	else
	{
		$install_common::IP_description_info{ProductBuildNumber}=$ProductBuildNumber_IP_description;
		$install_common::IP_description_info{ProductLanguage}=$ProductLanguage_IP_description;
	}

	if ($Error == 0)
	{
		$Result=1;
	}
	else
	{
		$Result=0;
	}

	return $Result;
}

#===============================================================================
# Name:
#	UseEULA
# Description:
#	Turn on the EULA usage.
# Input parameters:
#	None.
# Return value:
#	None.
#===============================================================================

sub UseEULA()
{
	$UseEULAFile = 1;
}

#===============================================================================
# Name:
#	ProcessLicenseAgreement
# Description:
#	Processes license agreement.
# Input parameters:
#	UseLicense flag
# Return value:
#	Returns 1 on success, 0 on failure. In case of failure die can be used.
#===============================================================================

sub ProcessLicenseAgreement($)
{
	my $UseLicense = $_[0];
	my $Result = 0;
	my %IniSectionData=();

	# init %Silent_License_info

	if (install_common::Get_silent_mode() == 1)
	{
		# useful for $UseLicense=0 too, possible case of optional licensing

		my $Filepath = install_common::Get_silent_mode_response_file_path();

		if (!-f $Filepath)
		{
			my $Message="File $Filepath was not found.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}

		%IniSectionData=install_common::PARSEINI($Filepath,$Silent_response_file_License_section_name,$install_common::comments_characters);

		if (!%IniSectionData)
		{
			if ($UseLicense == 1)
			{
				my $Message="Section $Silent_response_file_License_section_name was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
			else
			{
				# license section is optional, use safe initialization
				$IniSectionData{$Silent_response_file_LicenseAgreement_key_name}=$LicenseAcceptance_Accepted_value;
				$IniSectionData{$Silent_response_file_UseLicense_key_name}=$LicenseUsage_NotRequired_value;
			}
		}

		%Silent_License_info=%IniSectionData;
	}

	if ($UseLicense == 1)
	{
		if (install_common::Get_silent_mode() == 1)
		{
			my $value=$IniSectionData{$Silent_response_file_LicenseAgreement_key_name};

			if (!defined($value))
			{
				my $Message="Key $Silent_response_file_LicenseAgreement_key_name in section $Silent_response_file_License_section_name was not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
			else
			{
				if ($value ne $LicenseAcceptance_Accepted_value)
				{
					my $Message="Key $Silent_response_file_LicenseAgreement_key_name value is not equal to $LicenseAcceptance_Accepted_value.";
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}
			}

			$Result = 1;
		}
		else
		{
			if (-f $install_common::EULA_filename)
			{
				if ( (install_common::ASK("\n$install_common::EULA_prompt", "y", "n")) eq "y" )
				{
					$Result = 1;
				}
				else
				{
					print "\n\n$install_common::InstallationTerminationMessage\n";
					exit 1;
				}
			}
			else
			{
				if ($UseEULAFile == 1)
				{
					my $Message="File $install_common::EULA_filename was not found.";
					print "\n$Message\n";
					die "\n$install_common::InstallationTerminationMessage\n";
				}
				else
				{
					# License agreement can be implicit - without EULA file in IP
					$Result = 1;
				}
			}
		}

		if (install_common::Get_record_mode() == 1)
		{
			my $Filepath = install_common::Get_silent_mode_response_file_path();
			my $Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_License_section_name,$Silent_response_file_LicenseAgreement_key_name,$LicenseAcceptance_Accepted_value);
		}
	}
	else
	{
		# license section is optional: the absence means
		# LicenseAgreement=Accepted
		# UseLicense=NotRequired
		$Result = 1;
	}

	return $Result;
}

#===============================================================================
# Name:
#	AskAboutLicense
# Description:
#	Asks about using optional license
# Input parameters:
#	Product name
#	Reference to UseLicense
# Return value:
#	1.
#===============================================================================

sub AskAboutLicense($$)
{
	my $ProductName = $_[0];
	my $refUseLicense = $_[1];

	if (install_common::Get_silent_mode() == 0)
	{
		my $Message="\nDo you plan to use $ProductName functionality that requires license (y/n)?\n";

		if((install_common::ASK($Message,"y","n")) eq "y")
		{
			$$refUseLicense = 1;
		}

		if (install_common::Get_record_mode() == 1)
		{
			my $value=$LicenseUsage_NotRequired_value;

			if ($$refUseLicense == 1)
			{
				$value=$LicenseUsage_Required_value;
			}

			my $Filepath = install_common::Get_silent_mode_response_file_path();
			my $Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_License_section_name,$Silent_response_file_UseLicense_key_name,$value);
		}
	}
	else
	{
		my $value=$Silent_License_info{$Silent_response_file_UseLicense_key_name};

		if (!defined($value))
		{
			my $Message="Key $Silent_response_file_UseLicense_key_name in section $Silent_response_file_License_section_name was not found.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}

		if (($value ne $LicenseUsage_Required_value) && ($value ne $LicenseUsage_NotRequired_value))
		{
			my $Message="Invalid value of key $Silent_response_file_UseLicense_key_name in section $Silent_response_file_License_section_name.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}

		if ($value eq $LicenseUsage_Required_value)
		{
			$$refUseLicense = 1;
		}
		else
		{
			$$refUseLicense = 0;
		}
	}

	return 1;
}

#===============================================================================
# Name:
#	GetConfigServerConnectionProblemMessage
# Description:
#	Gets message about Config Server connection problem
# Input parameters:
#	Reference to message
# Return value:
#	Returns 1.
#===============================================================================

sub GetConfigServerConnectionProblemMessage($)
{
	my $ref_message=$_[0];
	my $message="";

	$message="\n$ErrorReadingInformationFromConfigurationServerMessage\n";
	$message=$message . "Proceeding from this point may result in Configuration\n";
	$message=$message . "Server data being out of sync with the actual configuration.\n";
	$message=$message . "This means that it will have to be updated manually.\n\n";

	$$ref_message=$message;

	return 1;
}

#===============================================================================
# Name:
#	AskOptions
# Description:
#	Asks about options.
# Input parameters:
#	Options prompt
#	Name of first option
#	Name of second option
#	Silent mode section name
#	Silent mode key name
# Return value:
#	Selected option.
#===============================================================================

sub AskOptions($$$$$)
{
	my $Version_prompt = $_[0];
	my $Option_one = $_[1];
	my $Option_two = $_[2];
	my $Silent_mode_section_name = $_[3];
	my $Silent_mode_key_name = $_[4];

	my $Selected_option;

	if (install_common::Get_silent_mode() == 0)
	{
		print "\n$Version_prompt\n";
		print "by number:\n";
		print "1. $Option_one\n";
		print "2. $Option_two\n";
		if ( (install_common::ASK ("=>", "1", "2")) eq "1")
		{
			$Selected_option = $Option_one;
		}
		else
		{
			$Selected_option = $Option_two;
		}
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

		%IniSectionData=install_common::PARSEINI($Filepath,$Silent_mode_section_name,$install_common::comments_characters);

		if (!%IniSectionData)
		{
			my $Message="Section $Silent_mode_section_name was not found.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}

		my $value=$IniSectionData{$Silent_mode_key_name};

		if (!defined($value))
		{
			my $Message="Key $Silent_mode_key_name in section $Silent_mode_section_name was not found.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}

		if ($value == 1)
		{
			$Selected_option = $Option_one;
		}
		else
		{
			$Selected_option = $Option_two;
		}
	}

	if (install_common::Get_record_mode() == 1)
	{
		my $value=0;

		if ($Selected_option eq $Option_one)
		{
			$value=1;
		}
		else
		{
			$value=2;
		}

		my $Filepath = install_common::Get_silent_mode_response_file_path();
		my $Result = install_common::SetIniFileKeyValue($Filepath,$Silent_mode_section_name,$Silent_mode_key_name,$value);
	}

	return $Selected_option;
}

#===============================================================================
# Name:
#	SetupAIX64BitMode
# Description:
#	Setups support for AIX 64-bit mode
# Input parameters:
#	None
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub SetupAIX64BitMode()
{
	my $Result=0;

	my $platform = install_common::FINDPLAT();
	my $platform_version = install_common::FINDPLATVER();

	if ( ($platform eq "aix") && ($platform_version =~ /^5/) )
	{
		if ( !(-e $install_common::ospatchlist_filename))
		{
			return $Result;
		}

		local *IN;
		my $header="AIX version";
		my $header_found=0;
		my $version_found=0;

		open(IN, "$install_common::ospatchlist_filename") || return $Result;

		while (<IN>)
		{
			my $line = $_;
			chomp($line);

			if($line =~ /$header/ )
			{
				$header_found=1;
				next;
			}

			if (($header_found == 1) && ($version_found == 0))
			{
				$version_found=1;

				install_common::Trim(\$line);

				if (length($line) == 0)
				{
					close(IN) || return $Result;
					return $Result;
				}

				if ($line =~ /^5/)
				{
					$Result=1;
					next;
				}
			}
		}

		close(IN) || return $Result;

	}

	return $Result;
}

#===============================================================================
# Name:
#	AskForExistingPath
# Description:
#	Asks for existing path in absolute format
# Input parameters:
#	Prompt used for path selection
# Return value:
#	Existing path.
#===============================================================================

sub AskForExistingPath($)
{
	my $Prompt=$_[0];

	my $TargetPath="";

	if (install_common::Get_silent_mode() == 0)
	{
		my $DirectorySelected = 0;

		while (!$DirectorySelected)
		{
			$TargetPath = install_common::ASK($Prompt);

			if ( !($TargetPath =~ m{^/}) || ($TargetPath =~ m{~|\.+/|/\.+}) )
			{
				print "Invalid path. Please enter a full path name.\n";
				next;
			}

			if (!-e $TargetPath)
			{
				print "Invalid path. Please enter a full path name.\n";
			}
			else
			{
				$DirectorySelected = 1;
			}
		}
	}

	return $TargetPath;
}

#===============================================================================
# Multi-component functions
#===============================================================================

#===============================================================================
# Name:
#	DetectComponentsSelection
# Description:
#	Detects components selection
# Input parameters:
#	Refrence to @components_data (updated on return)
#	Components string
# Return value:
#	None.
#===============================================================================

sub DetectComponentsSelection(\@$)
{
	my $ref_components_data=$_[0];
	my $components_string=$_[1];

	install_common::Trim(\$components_string);

	if (length($components_string) == 0)
	{
		return;
	}

	my @components_list = split(/$install_common::Silent_response_file_Components_key_value_delimiter/, $components_string);

	my $array_size=scalar @components_list;

	if ($array_size == 0)
	{
		return;
	}

	for my $elem (@{$ref_components_data})
	{
		my $array_size = scalar grep(/$elem->{$McData_ComponentId_FieldName}/,@components_list);

		if ($array_size == 1)
		{
			${$elem->{$McData_SelectedFlag_FieldName}}=1;
		}

		if ($McData_debug == 1)
		{
			print "component=$elem->{$McData_ComponentId_FieldName}\tselected=${$elem->{$McData_SelectedFlag_FieldName}}\n";
		}
	}
}

#===============================================================================
# Name:
#	SetComponentsSelection
# Description:
#	Sets components selection
# Input parameters:
#	Refrence to @components_data (not updated on return)
#	Refrence to components string
# Return value:
#	None.
#===============================================================================

sub SetComponentsSelection(\@$)
{
	my $ref_components_data=$_[0];
	my $ref_components_string=$_[1];

	$$ref_components_string="";

	for my $elem (@{$ref_components_data})
	{
		if ($McData_debug == 1)
		{
			print "component=$elem->{$McData_ComponentId_FieldName}\tselected=${$elem->{$McData_SelectedFlag_FieldName}}\n";
		}

		if (${$elem->{$McData_SelectedFlag_FieldName}} == 1)
		{
			if (length($$ref_components_string) != 0)
			{
				$$ref_components_string = $$ref_components_string . ";";
			}

			$$ref_components_string = $$ref_components_string . $elem->{$McData_ComponentId_FieldName};
		}
	}

	if ($McData_debug == 1)
	{
		print "components_string=$$ref_components_string\n";
	}
}

#===============================================================================
# Name:
#	RemoveTars
# Description:
#	Removes tars
# Input parameters:
#	Refrence to @components_data (not updated on return)
#	Target directory
# Return value:
#	None.
#===============================================================================

sub RemoveTars(\@$)
{
	my $ref_components_data=$_[0];
	my $TargetDir=$_[1];

	for my $elem (@{$ref_components_data})
	{
		if ($McData_debug == 1)
		{
			print "component=$elem->{$McData_ComponentId_FieldName}\ttar_name=$elem->{$McData_TarName_FieldName}\n";
		}

		my $tar_name=$elem->{$McData_TarName_FieldName};

		if (-e "$TargetDir/$tar_name")
		{
			system("$install_common::RM $TargetDir/$tar_name");
		}
	}
}

#===============================================================================
# Name:
#	InstallComponent
# Description:
#	Installs component
# Input parameters:
#	Refrence to @components_data (not updated on return)
#	Component ID
#	Target directory
#	Extract command
#	Extract command options
#	Install option ($McData_UseComponentDirectory or $McData_DoNotUseComponentDirectory)
# Return value:
#	None.
#===============================================================================

sub InstallComponent(\@$$$$$)
{
	my $ref_components_data=$_[0];
	my $Component_ID=$_[1];
	my $TargetDir=$_[2];
	my $UnpackCommand=$_[3];
	my $UnpackCommandOptions=$_[4];
	my $InstallOption=$_[5];

	my $found=0;
	my $Component_Directory="";
	my $Component_Tar="";

	for my $elem (@{$ref_components_data})
	{
		if ($elem->{$McData_ComponentId_FieldName} eq $Component_ID)
		{
			if ($McData_debug == 1)
			{
				print "component=$elem->{$McData_ComponentId_FieldName}\ttar_name=$elem->{$McData_TarName_FieldName}\toption=$InstallOption\n";
			}

			$found=1;
			$Component_Directory=$elem->{$McData_ComponenDirectory_FieldName};
			$Component_Tar=$elem->{$McData_TarName_FieldName};
			last;
		}
	}

	if ($found == 1)
	{
		if ($InstallOption == $McData_UseComponentDirectory)
		{
			if (-e "$TargetDir/$Component_Directory")
			{
				# do nothing
			}
			else
			{
				system("$install_common::MKDIR $Component_Directory");
			}

			chdir $Component_Directory;
			system("$UnpackCommand $UnpackCommandOptions ../$Component_Tar");

			chdir $TargetDir;
			system("$install_common::RM $Component_Tar");
		}
		elsif ($InstallOption == $McData_DoNotUseComponentDirectory)
		{
			system("$UnpackCommand $UnpackCommandOptions $Component_Tar");
			system("$install_common::RM $Component_Tar");
		}
	}
}

#===============================================================================
# Name:
#	VerifyIPVersion
# Description:
#	Verifies IP version from GCTISetup.ini file
# Return value:
#	None or dies.
#===============================================================================

sub VerifyIPVersion()
{
	if ($ApplicationDataChecking_mode_support == $ApplicationDataChecking_mode_support_standard)
	{
		if (-f $install_common::WizardIniFile)
		{
			my %IniSectionData;
			%IniSectionData=install_common::PARSEINI($install_common::WizardIniFile,$install_common::WizardIniFile_GeneralSection);

			if (!%IniSectionData)
			{
				my $Message="Section $install_common::WizardIniFile_GeneralSection was not found in file $install_common::WizardIniFile.";

				if (install_common::Get_silent_mode() == 0)
				{
					print "\n$Message\n";
					die "\n$install_common::InstallationTerminationMessage\n";
				}
				else
				{
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}
			}
			else
			{
				if (defined($IniSectionData{Version}))
				{
					my $ProductName_IP_description="";
					my $ProductFamilyVersion_IP_description="";
					my $ProductVersion_IP_description="";
					my $Result=Read_IP_description(\$ProductName_IP_description,\$ProductFamilyVersion_IP_description,\$ProductVersion_IP_description);

					if ($Result == 1)
					{
						if ($IniSectionData{Version} ne $ProductVersion_IP_description)
						{
							my $Message="Version $IniSectionData{Version} specified in $install_common::WizardIniFile\nfile doesn't match the IP version $ProductVersion_IP_description.";

							if (install_common::Get_silent_mode() == 0)
							{
								print "\n$Message\n";
								die "\n$install_common::InstallationTerminationMessage\n";
							}
							else
							{
								install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
							}
						}
					}
					else
					{
						# ignore missing data
					}
				}
				else
				{
					my $Message="Version value is not specified in $install_common::WizardIniFile file.";

					if (install_common::Get_silent_mode() == 0)
					{
						print "\n$Message\n";
						die "\n$install_common::InstallationTerminationMessage\n";
					}
					else
					{
						install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
					}
				}
			}
		}
	}
}

#===============================================================================
# Name:
#	VerifyOS
# Description:
#	Verifies OS name and version
# Return value:
#	None or dies.
#===============================================================================

sub VerifyOS()
{
	if ($OSVersionChecking_mode_support == $OSVersionChecking_mode_support_legacy)
	{
		return;
	}

	my $debug_print=0;
	my @versions=();

	my $Result=Read_IP_description_OS_data($ip_description::OS_common,@versions);

	if ($Result == 0)
	{
		return;
	}

	my $platform=install_common::FINDPLAT();
	my $platform_version=install_common::FINDPLATVER();

	if ($debug_print == 1)
	{
		print "\$platform=$platform \$platform_version=$platform_version\n";
	}

	if (($platform eq "none") || (!defined($platform_version)))
	{
		return;
	}

	if ($platform eq "osf")
	{
		# V4.0

		if ($platform_version =~ /^V/)
		{
			($platform_version) = ($platform_version =~ /^V(.*)/);
		}
	}

	if ($platform eq "hpux")
	{
		# B.11.00

		if ($platform_version =~ /^B\./)
		{
			($platform_version) = ($platform_version =~ /^B\.(.*)/);
		}
	}

	if ($platform eq "linux")
	{
		# 2.4.21-4.ELsmp

		if ($platform_version =~ /^\d+\.\d+/)
		{
			($platform_version) = ($platform_version =~ /^(\d+\.\d+)/);
		}

		if ($platform_version =~ /-/)
		{
			($platform_version) = ($platform_version =~ /([\d\.]*)-.*/);
		}

		my $RHLVersion = install_common::GetRHLVersion();

		if (defined($RHLVersion))
		{
			if ($debug_print == 1)
			{
				print "\$RHLVersion=$RHLVersion\n";
			}

			$platform_version=$RHLVersion;

			my $Result=Read_IP_description_OS_data($ip_description::OS_RHEL,@versions);

			if ($Result == 0)
			{
				return;
			}
		}
		else
		{
			my $UbuntuVersion = install_common::GetUbuntuVersion();

			if (defined($UbuntuVersion))
			{
				if ($debug_print == 1)
				{
					print "\$UbuntuVersion=$UbuntuVersion\n";
				}

				$platform_version=$UbuntuVersion;

				my $Result=Read_IP_description_OS_data($ip_description::OS_Ubuntu,@versions);

				if ($Result == 0)
				{
					return;
				}
			}
		}
	}

	if ($platform eq "solaris")
	{
		# 5.6

		if ($platform_version =~ /^5\./)
		{
			($platform_version) = ($platform_version =~ /^5\.(.*)/);
		}
	}

	if ($debug_print == 1)
	{
		print "\$platform=$platform \$platform_version=$platform_version\n";
	}

	my $less_version_count=0;

	for my $version (@versions)
	{
		if (($platform eq "hpux") || ($platform eq "osf"))
		{
			# 11i v2
			# 4.0F

			if ($version =~ /[\d\.]*[a-zA-Z]*.*/)
			{
				($version) = ($version =~ /([\d\.]*)[a-zA-Z]*.*/);
			}
		}

		if ($debug_print == 1)
		{
			print "\$version=$version\n";
		}

		my $compare_result=0;
		$Result=CompareVersionsEx($platform_version,$version,\$compare_result);

		if ($Result == 1)
		{
			if ($compare_result < 0)
			{
				$less_version_count++;
			}
		}
	}

	my $version_size = scalar @versions;

	if ($less_version_count == $version_size)
	{
		my $Message="OS version $platform_version is not supported.\nPlease check $install_common::ip_description_filename file for list of supported versions.";

		if (install_common::Get_silent_mode() == 0)
		{
			print "\n$Message\n";
			die "\n$install_common::InstallationTerminationMessage\n";
		}
		else
		{
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}
}

#===============================================================================
# Name:
#	Check_ClientSidePort_SupportByComponent
# Description:
#	Checks Client Side Port support by component uning product nickname and
#	version from $ip_description_filename
# Input parameters:
#	Reference to support flag (flag is updated on return as 0-not supported,
#		1-supported)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub Check_ClientSidePort_SupportByComponent($)
{
	my $refSupported = $_[0];
	my $Result;
	my $Error=0;
	my $ProductNickname="";
	my $ProductVersion="";
	my $ip_description_pathname="";

	$ip_description_pathname=$install_common::ip_description_filename;

	$Result = ip_description::getProductNickname($ip_description_pathname,\$ProductNickname);

	if ($Result != 1)
	{
		$Error=1;
	}

	$Result = ip_description::getProductVersion($ip_description_pathname,\$ProductVersion);

	if ($Result != 1)
	{
		$Error=1;
	}

	if ($Error == 1)
	{
		return 0;
	}

	$$refSupported = CheckComponent_ClientSidePort_Support($ProductNickname,$ProductVersion,@ClientSidePort_ComponentsInfo);

	return 1;
}

#===============================================================================
# Name:
#	CheckComponent_ClientSidePort_Support
# Description:
#	Checks Client Side Port support by component uning product nickname and
#		version
# Input parameters:
#	Component nickname
#	Component version
#	Reference to @ClientSidePort_ComponentsInfo
# Return value:
#	Returns 1 on success (supported), 0 on failure (not supported).
#===============================================================================

sub CheckComponent_ClientSidePort_Support($$\@)
{
	my $ProductNickname = $_[0];
	my $ProductVersion = $_[1];
	my $ref_ClientSidePort_ComponentsInfo_Array=$_[2];
	my @ClientSidePort_ComponentsInfo_Array = @{$ref_ClientSidePort_ComponentsInfo_Array};
	my $Result=0;

	for my $elem (@ClientSidePort_ComponentsInfo_Array)
	{
		if ($elem->{IP_Nickname} eq $ProductNickname)
		{
			my $CompareResult;
			$Result=CompareVersions($ProductVersion,$elem->{Starting_SupportVersion},\$CompareResult);

			if ($Result == 0)
			{
				return $Result;
			}

			if ($CompareResult < 0)
			{
				$Result = 0;
			}
			else
			{
				$Result = 1;
			}

			last;
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	Process_Configuration_Install_Utility_Error
# Description:
#	Process Configuration Install Utility error codes
# Input parameters:
#	Error code
# Return value:
#	Returns 1 on success, 0 on failure. May also die.
#===============================================================================

sub Process_Configuration_Install_Utility_Error($\%)
{
	my $ErrorCode=$_[0];
	my $refIniSectionData=$_[1];
	my %IniSectionData=%{$refIniSectionData};
	my $Result=0;

	if ($ErrorCode == $CIU_rcServerNotFound)
	{
		# invalid host
		#my $Message="Configuration Server host was not found.";
		my $Message="Invalid host ($IniSectionData{host}) or port ($IniSectionData{port}) for Configuration Server connection.";

		if (install_common::Get_silent_mode() == 1)
		{
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
		else
		{
			print "\n$Message\n";
			die "\n$install_common::InstallationTerminationMessage\n";
		}
	}
	elsif ($ErrorCode == $CIU_rcLoginIncorrect)
	{
		# invalid login (user/password or both)
		my $Message="Invalid login for Configuration Server. Please verify user name ($IniSectionData{user}) and password.";

		if (install_common::Get_silent_mode() == 1)
		{
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
		else
		{
			print "\n$Message\n";
			die "\n$install_common::InstallationTerminationMessage\n";
		}
	}
	elsif ($ErrorCode == $CIU_rcConnWriteError)
	{
		# invalid port
		my $Message="Invalid port ($IniSectionData{port}) for Configuration Server connection.";

		if (install_common::Get_silent_mode() == 1)
		{
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
		else
		{
			print "\n$Message\n";
			die "\n$install_common::InstallationTerminationMessage\n";
		}
	}
	else
	{
		# ignore this return code
		$Result=1;
	}

	return $Result;
}

#===============================================================================
# Name:
#	Process_Configuration_Install_Utility_Object_Not_Found_Error
# Description:
#	Process Configuration Install Utility $CIU_rcObjectNotFound error code
# Input parameters:
#	Error code
#	Local host name
#	Domain name
#	IP address
# Return value:
#	Returns 1 on success, 0 on failure. May also die.
#===============================================================================

sub Process_Configuration_Install_Utility_Object_Not_Found_Error($$$$)
{
	my $ErrorCode=$_[0];
	my $LocalHostname=$_[1];
	my $Domain=$_[2];
	my $IP_address=$_[3];
	my $Result=0;

	if ($ErrorCode == $CIU_rcObjectNotFound)
	{
		# object not found
		my $FQDN="$LocalHostname.$Domain";

		my $Message="The hostname was not found in Configuration Server configuration using all following names:\n";
		$Message=$Message . "\thostname - $LocalHostname\n";
		$Message=$Message . "\tFully Qualified Domain Name - $FQDN";

		install_common::Trim(\$IP_address);

		if (length($IP_address) > 0)
		{
			$Message=$Message . "\n";
			$Message=$Message . "\tIP address - $IP_address";
		}

		if (install_common::Get_silent_mode() == 1)
		{
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
		else
		{
			print "\n$Message\n";
			die "\n$install_common::InstallationTerminationMessage\n";
		}
	}
	else
	{
		# ignore this return code
		$Result=1;
	}

	return $Result;
}

#===============================================================================
# Name:
#	Process_Configuration_Install_Utility_Object_Not_Found_Error_IP_address
# Description:
#	Process Configuration Install Utility $CIU_rcObjectNotFound error code
#	(for) list of IP_addresses
# Input parameters:
#	Error code
#	Local host name
#	Domain name
#	List of IP addresses
# Return value:
#	Returns 1 on success, 0 on failure. May also die.
#===============================================================================

sub Process_Configuration_Install_Utility_Object_Not_Found_Error_IP_address($$$\@)
{
	my $ErrorCode=$_[0];
	my $LocalHostname=$_[1];
	my $Domain=$_[2];
	my $ref_IPAddresses=$_[3];
	my @IPAddresses=@{$ref_IPAddresses};
	my $Result=0;

	if ($ErrorCode == $CIU_rcObjectNotFound)
	{
		# object not found
		my $FQDN="$LocalHostname.$Domain";

		my $Message="The hostname was not found in Configuration Server configuration using all following names:\n";
		$Message=$Message . "\thostname - $LocalHostname\n";
		$Message=$Message . "\tFully Qualified Domain Name - $FQDN";

		for my $IP_address (@IPAddresses)
		{
			install_common::Trim(\$IP_address);

			if (length($IP_address) > 0)
			{
				$Message=$Message . "\n";
				$Message=$Message . "\tIP address - $IP_address";
			}
		}

		if (install_common::Get_silent_mode() == 1)
		{
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
		else
		{
			print "\n$Message\n";
			die "\n$install_common::InstallationTerminationMessage\n";
		}
	}
	else
	{
		# ignore this return code
		$Result=1;
	}

	return $Result;
}

#===============================================================================
# Name:
#	CheckExclusionsFor_AIX_64_bit_mode_support
# Description:
#	Checks exclusions for AIX 64 bit support by component uning product nickname and
#	version from $ip_description_filename
# Input parameters:
#	Value of operation mode without feature
#	Value of operation mode with feature
#	Reference to operation mode (updated on return)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CheckExclusionsFor_AIX_64_bit_mode_support($$$)
{
	my $Value_of_operation_mode_without_feature=$_[0];
	my $Value_of_operation_mode_with_feature=$_[1];
	my $ref_Operation_mode=$_[2];
	my $Result=0;
	my $Error=0;
	my $ProductNickname="";
	my $ProductVersion="";
	my $ip_description_pathname="";

	# set default
	$$ref_Operation_mode=$Value_of_operation_mode_without_feature;

	$ip_description_pathname=$install_common::ip_description_filename;

	$Result = ip_description::getProductNickname($ip_description_pathname,\$ProductNickname);

	if ($Result != 1)
	{
		$Error=1;
	}

	$Result = ip_description::getProductVersion($ip_description_pathname,\$ProductVersion);

	if ($Result != 1)
	{
		$Error=1;
	}

	if ($Error == 1)
	{
		return 0;
	}

	if ($ProductNickname eq $DataSourcer_NickName)
	{
		my $CompareResult;
		$Result=CompareVersions($ProductVersion,$StartingVersionForStandard_CCADataSourcer_AIX_64_bit_Mode_Support,\$CompareResult);

		if ($Result == 0)
		{
			return $Result;
		}

		$Result=1;

		if ($CompareResult < 0)
		{
			$$ref_Operation_mode=$Value_of_operation_mode_without_feature;
		}
		else
		{
			$$ref_Operation_mode=$Value_of_operation_mode_with_feature;
		}
	}
	else
	{
		$$ref_Operation_mode=$Value_of_operation_mode_without_feature;
	}

	return 1;
}

#===============================================================================
# RebrandingInfo class
#===============================================================================

package RebrandingInfo;

{

#===============================================================================
# Constants
#===============================================================================

my $Field_name_Vendor="Vendor";
my $Field_name_Nicknames="Nicknames";
my $DefaultVendor="Genesys";

#===============================================================================
# Name:
#	info
# Description:
#	Set/get instance data
# Input parameters:
#	Data to set or none.
# Return value:
#	Instance data
#===============================================================================

my $info = sub
{
	&{ $_[0] }("INFO", @_[1 .. $#_ ] )
};

#===============================================================================
# Name:
#	None
# Description:
#	Initialize data
# Input parameters:
#	None
# Return value:
#	None
#===============================================================================

my $initialize = sub()
{
	my $type = shift;

	my @RebrandingInfo=(
		{
			$Field_name_Vendor => "Siemens",
			$Field_name_Nicknames => ['NicknameS1','NicknameS2'],
		},
		{
			$Field_name_Vendor => "IBM",
			$Field_name_Nicknames => ['NicknameIBM1','NicknameIBM2'],
		},
	);

	$type->$info(\@RebrandingInfo);
};

#===============================================================================
# Name:
#	new
# Description:
#	Create ComponentsInfo instance
# Input parameters:
#	None
# Return value:
#	Instance of ComponentsInfo
#===============================================================================

sub new()
{
	my $type = shift;
	my $class = ref($type) || $type;
	my $self =
	{
		INFO => undef
	};

	my $closure = sub
	{
		my $field = shift;
		@_ and $self->{$field} = shift;
		$self->{$field};
	};

	bless $closure, $class;
	$closure->$initialize();
	return $closure;
}

#===============================================================================
# Name:
#	GetVendor
# Description:
#	Gets vendor name
# Input parameters:
#	Nickname
#	Reference to vendor name (is updated on return)
# Return value:
#	None
#===============================================================================

sub GetVendor($$$)
{
	my $type = shift;
	my $Nickname = $_[0];
	my $ref_Vendor = $_[1];

	my $ref_RebrandingInfo=$type->$info();
	my @RebrandingInfo=@{$ref_RebrandingInfo};
	my $found = 0;

	for my $elem (@RebrandingInfo)
	{
		for my $RebrandedIPNickname (@{$elem->{$Field_name_Nicknames}})
		{
			if ($RebrandedIPNickname eq $Nickname)
			{
				$found = 1;
				last;
			}
		}

		if ($found == 1)
		{
			$$ref_Vendor = $elem->{$Field_name_Vendor};
			last;
		}
	}

	if ($found == 0)
	{
		$$ref_Vendor = $DefaultVendor;
	}

	return;
}
}

package install_lib;

#===============================================================================
# Name:
#	InitRebrandingData
# Description:
#	Initializes re-branding data
# Return value:
#	Function returns 0.
#===============================================================================

sub InitRebrandingData()
{
	my $ProductNickname="";

	my $Result = ip_description::getProductNickname($install_common::ip_description_filename,\$ProductNickname);

	if ($Result != 1)
	{
		$ProductNickname="dummy";
	}

	my $Rebranding_Info=new RebrandingInfo::;
	my $IPVendor="";
	$Rebranding_Info->GetVendor($ProductNickname,\$IPVendor);
	$Vendor=$IPVendor;

	return 0;
}

#===============================================================================
# Name:
#	Get_LibraryPath_Name
# Description:
#	Returns library path name specific for current platform.
# Input parameters:
#	None
# Return value:
#	Library path name or empty string for unknown platform.
#===============================================================================

sub Get_LibraryPath_Name()
{
	my $Library_Path_Name="";
	my $Library_Path_Name_Solaris="LD_LIBRARY_PATH";
	my $Library_Path_Name_AIX="LIBPATH";
	my $Library_Path_Name_HP_UX="SHLIB_PATH";

	my $platform=install_common::FINDPLAT();

	if (($platform eq "solaris") || ($platform eq "osf") || ($platform eq "linux"))
	{
		$Library_Path_Name=$Library_Path_Name_Solaris;
	}
	elsif ($platform eq "hpux")
	{
		$Library_Path_Name=$Library_Path_Name_HP_UX;
	}
	elsif ($platform eq "aix")
	{
		$Library_Path_Name=$Library_Path_Name_AIX;
	}

	return $Library_Path_Name;
}

#===============================================================================
# Name:
#	Get_LibraryPath
# Description:
#	Returns library path.
# Input parameters:
#	Path to use
#	Append flag (0-set, 1-append)
#	Append mode flag (0-append before, 1-append after)
#	Library path mode flag (0-use value, 1-use variable)
#	Reference to library path for LCA (used when "Library path mode flag"=1, in
#		this case the returned via return library path should be used only for
#		$install_common::StartupFileName)
# Return value:
#	Library path (may be empty if wrong flags are used or Path is empty).
#===============================================================================

our $LibraryPath_append_flag_set=0;
our $LibraryPath_append_flag_append=1;
our $LibraryPath_append_mode_flag_before=0;
our $LibraryPath_append_mode_flag_after=1;
our $LibraryPath_libpath_mode_flag_value=0;
our $LibraryPath_libpath_mode_flag_variable=1;

sub Get_LibraryPath($$$$$)
{
	my $Path=$_[0];
	my $LibraryPath_append_flag=$_[1];
	my $LibraryPath_append_mode=$_[2];
	my $LibraryPath_libpath_mode=$_[3];
	my $ref_LibraryPath_LCA=$_[4];
	my $Library_Path="";
	my $Library_Path_Name="";

	# check parameters

	install_common::Trim(\$Path);

	if ($Path eq "")
	{
		return $Library_Path;
	}

	if (($LibraryPath_append_flag != $LibraryPath_append_flag_set) &&
		($LibraryPath_append_flag != $LibraryPath_append_flag_append))
	{
		return $Library_Path;
	}

	if (($LibraryPath_append_flag == $LibraryPath_append_flag_set) &&
		(($LibraryPath_append_mode != $LibraryPath_append_mode_flag_before) ||
		 ($LibraryPath_append_mode != $LibraryPath_append_mode_flag_after)))
	{
		return $Library_Path;
	}

	$Library_Path_Name=Get_LibraryPath_Name();

	if ($LibraryPath_append_flag == $LibraryPath_append_flag_set)
	{
		# set

		if ($LibraryPath_libpath_mode == $LibraryPath_libpath_mode_flag_value)
		{
			$Library_Path = "$Library_Path_Name=" . $Path;
		}
		else
		{
			$Library_Path = "\$$Library_Path_Name=" . $Path;
		}
	}
	else
	{
		# append

		if ($LibraryPath_libpath_mode == $LibraryPath_libpath_mode_flag_value)
		{
			if ($ENV{$Library_Path_Name})
			{
				if ($LibraryPath_append_mode == $LibraryPath_append_mode_flag_before)
				{
					$Library_Path = "$Library_Path_Name=" . $Path . ":" . $ENV{$Library_Path_Name};
				}
				else
				{
					$Library_Path = "$Library_Path_Name=" . $ENV{$Library_Path_Name} . ":" . $Path;
				}
			}
			else
			{
				# set
				$Library_Path = "$Library_Path_Name=" . $Path;
			}
		}
		else
		{
			if ($LibraryPath_append_mode == $LibraryPath_append_mode_flag_before)
			{
				$Library_Path = "$Library_Path_Name=" . $Path . ":" . "\$$Library_Path_Name";
				$$ref_LibraryPath_LCA = "$Library_Path_Name=" . $Path . ":" . "\\\$$Library_Path_Name";
			}
			else
			{
				$Library_Path = "$Library_Path_Name=" . "\$$Library_Path_Name" . ":" . $Path;
				$$ref_LibraryPath_LCA = "$Library_Path_Name=" . "\\\$$Library_Path_Name" . ":" . $Path;
			}
		}
	}

	return $Library_Path;
}

#===============================================================================
# Name:
#	GetUninstallDirectoryName
# Description:
#	Gets uninstall directory name
# Input parameters:
#	None
# Return value:
#	Uninstall directory name
#===============================================================================

sub GetUninstallDirectoryName()
{
	return $Component_Uninstall_DirectoryName;
}

#===============================================================================
# Name:
#	GetCommonUninstallScriptName
# Description:
#	Gets common uninstall script name
# Input parameters:
#	None
# Return value:
#	Common uninstall script name
#===============================================================================

sub GetCommonUninstallScriptName()
{
	return $Common_Uninstall_ScriptName;
}

#===============================================================================
# Name:
#	GetUninstallScriptName
# Description:
#	Gets uninstall script name
# Input parameters:
#	None
# Return value:
#	Uninstall script name
#===============================================================================

sub GetUninstallScriptName()
{
	return $Component_Uninstall_ScriptName;
}

#===============================================================================
# Name:
#	CopyUninstallDirectory
# Description:
#	Copies uninstall directory if it exists.
# Input parameters:
#	Application target directory
#	Reference to flag indicating the precence of uninstall directory copy in
#		application target directory
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CopyUninstallDirectory($$)
{
	my $TargetDir=$_[0];
	my $refUninstallDataDetected=$_[1];

	$$refUninstallDataDetected=0;

	if ( -d $Component_Uninstall_DirectoryName )
	{
		my $TargetDir_UninstallDirectory="$TargetDir/$Component_Uninstall_DirectoryName";

		if ( -d $TargetDir_UninstallDirectory )
		{
			system("$install_common::RM -r $TargetDir_UninstallDirectory");

			if($? != 0)
			{
				my $Message="Unable to delete directory $TargetDir_UninstallDirectory: $!";
				if (install_common::Get_silent_mode() == 0)
				{
					print "\n$Message\n";
					return 0;
				}
				else
				{
					install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
				}
			}
		}

		system("$install_common::CP -r $Component_Uninstall_DirectoryName $TargetDir");

		if($? != 0)
		{
			my $Message="Unable to copy directory $Component_Uninstall_DirectoryName to $TargetDir: $!";
			if (install_common::Get_silent_mode() == 0)
			{
				print "\n$Message\n";
				return 0;
			}
			else
			{
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}

		$$refUninstallDataDetected=1;
	}
	else
	{
		$$refUninstallDataDetected=0;
	}

	return 1;
}

#===============================================================================
# Name:
#	SetupTargetDir
# Description:
#	Setups TargetDir
# Input parameters:
#	Reference to target directory
#	Target sub-directory name (for example "bin")
# Return value:
#	None.
#===============================================================================

sub SetupTargetDir($$)
{
	my $ref_TargetDir=$_[0];
	my $Sub_Directory=$_[1];
	my $TargetDir=$$ref_TargetDir;

	if (!install_common::IsValidPath($TargetDir))
	{
		$TargetDir="";
	}
	else
	{
		install_common::Trim(\$TargetDir);
		my $RIndex=rindex($TargetDir,$Sub_Directory);

		if ($RIndex > 0)
		{
			if ($RIndex == (length($TargetDir) - length($Sub_Directory)) )
			{
				$TargetDir=substr($TargetDir,0,$RIndex-1);
			}
		}
	}

	$$ref_TargetDir=$TargetDir;
}

#===============================================================================
# Name:
#	SetupTargetDirEx
# Description:
#	Setups TargetDir (with default directory)
# Input parameters:
#	Reference to target directory
#	Default directory
#	Target sub-directory name (for example "bin")
# Return value:
#	None.
#===============================================================================

sub SetupTargetDirEx($$$)
{
	my $ref_TargetDir=$_[0];
	my $DefaultDirectory=$_[1];
	my $Sub_Directory=$_[2];
	my $TargetDir=$$ref_TargetDir;

	SetupTargetDir(\$TargetDir,$Sub_Directory);

	if ($TargetDir eq "")
	{
		$TargetDir=$DefaultDirectory;
	}

	$$ref_TargetDir=$TargetDir;
}

#===============================================================================
# Name:
#	DeleteLines
# Description:
#	DeleteLines takes two or three arguments. The first argument is a
#	string containing the path of file to be edited. The second argument
#	is a reference to a list with line values to be found and deleted.
#	Edits are performed in place unless there is a third argument, the path
#	of the file to which to write them instead.
#	Searches are case-sensitive.
#	See install_common::EDITFILE for similar functionality.
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub DeleteLines($\@;$)
{
	my ($name1, $name2);
	my @lines=@{$_[1]};
	my $line;
	local (*FH1, *FH2);

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
		my $current_line=$_;
		chomp $current_line;
		my $line_found=0;

		foreach $line (@lines)
		{
			if ($current_line eq $line)
			{
				$line_found=1;
				last;
			}
		}

		if ($line_found == 0)
		{
			print FH2 "$current_line\n";
		}
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
#	UpdateLicenseForItaniumModel
# Description:
#	Updates license for Itanium model.
# Input parameters:
#	Reference to license flag (set to 0-don't use license or 1-use license on return)
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub UpdateLicenseForItaniumModel($)
{
	my $ref_UseLicense=$_[0];
	my $Result=0;

	my $Itanium=0;
	$Result=install_common::GetItaniumModel(\$Itanium);

	if ($Result == 1)
	{
		 if ($Itanium == 1)
		 {
			#$$ref_UseLicense=0;
			# do nothing
		 }
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetTomcatDirectory
# Description:
#	Detects Tomcat directory
# Input parameters:
#	None
# Return value:
#	Path to Tomcat directory, can die in silent mode.
#===============================================================================

sub GetTomcatDirectory()
{
	my $ServletDir="";

	# try to determine Tomcat location

	my $home_found=0;
	my $Tomcat_home_environment_variable_name="CATALINA_HOME";

	if ($ENV{$Tomcat_home_environment_variable_name})
	{
		if (-x "$ENV{$Tomcat_home_environment_variable_name}")
		{
			$ServletDir="$ENV{$Tomcat_home_environment_variable_name}";
			$home_found=1;
		}
		else
		{
			if (install_common::Get_silent_mode() != 0)
			{
				my $Message="$ENV{$Tomcat_home_environment_variable_name} directory is not found.";
				install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
			}
		}
	}
	else
	{
		if (install_common::Get_silent_mode() != 0)
		{
			my $Message="$Tomcat_home_environment_variable_name environment variable is not defined.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}

	if ($home_found eq 0)
	{
		$ServletDir=install_common::ASK("Please enter the full path to your\nTomcat installation =>");
		print "\n";
	}

	while (! -e "$ServletDir/conf/server.xml")
	{
		if (install_common::Get_silent_mode() == 0)
		{
			print "Unable to locate your Tomcat installation.\n";
			$ServletDir=install_common::ASK("Please enter the full path to it =>");
			print "\n";
		}
		else
		{
			my $Message="$ServletDir/conf/server.xml file is not found.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}

	$ENV{$Tomcat_home_environment_variable_name}=$ServletDir;

	return $ServletDir;
}

#===============================================================================
# Name:
#	GetHomeDirectory
# Description:
#	Determins home directory using specified environment variable.
# Input parameters:
#	Name of home environment variable.
# Return value:
#	Home directory or die.
#===============================================================================

sub GetHomeDirectory($)
{
	my $HomeDirectory_EnvironmentVariableName=$_[0];
	my $HomeDirectory="";
	my $ErrorMessage = "";
	my $ErrorHeader = "\nThe following configuration problems were detected:\n\n";
	my $ErrorFooter = "\nPlease correct above problems and run installation again.\n";

	if (!$ENV{$HomeDirectory_EnvironmentVariableName})
	{
		$ErrorMessage = $ErrorMessage . "$HomeDirectory_EnvironmentVariableName environment variable is not defined.\n";
	}

	if (length($ErrorMessage) != 0)
	{
		$ErrorMessage = $ErrorHeader . $ErrorMessage . $ErrorFooter;

		if (install_common::Get_silent_mode() == 0)
		{
			die $ErrorMessage;
		}
		else
		{
			my $Message="$HomeDirectory_EnvironmentVariableName environment variable is not defined.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}
	}

	$HomeDirectory = $ENV{$HomeDirectory_EnvironmentVariableName};

	return $HomeDirectory;
}

#===============================================================================
# Name:
#	CheckForAlternativeAppType
# Description:
#	Checks for alternative apptype.
# Input parameters:
#	Reference to hash of Config Server login parameters
#	Config Server password option
#	Reference to apptype
# Return value:
#	1 on success, 0 on failure.
#===============================================================================

sub CheckForAlternativeAppType(\%$$)
{
	my $refIniSectionData = $_[0];
	my %IniSectionData = %{$refIniSectionData};
	my $CSPasswordOption = $_[1];
	my $refAppType = $_[2];
	my $Result=0;

	my $sourcedir=`$install_common::PWD`;
	chomp $sourcedir;
	my ($ProductNickname,$ProductVersion);
	my $Result_GetData=GetData_from_IP_description($sourcedir,\$ProductNickname,\$ProductVersion);

	if ($Result_GetData == 0)
	{
		return $Result;
	}

	my ($Starting_SupportVersion,$Starting_SupportVersion_ConfigServer,$LegacyAppType,$StandardAppType);
	$Result_GetData=CheckComponent_AlternativeAppType_Support($ProductNickname,$ProductVersion,@AlternativeAppType_ComponentsInfo,
			\$Starting_SupportVersion,\$Starting_SupportVersion_ConfigServer,\$LegacyAppType,\$StandardAppType);

	if ($Result_GetData == 0)
	{
		return $Result;
	}

	$Result_GetData = GetApplicationType(%IniSectionData,$CSPasswordOption,$refAppType,$Starting_SupportVersion,
			$Starting_SupportVersion_ConfigServer,$LegacyAppType,$StandardAppType);

	if ($Result_GetData == 0)
	{
		$$refAppType = $LegacyAppType;
	}

	$Result=1;

	return $Result;
}

#===============================================================================
# Name:
#	CheckComponent_AlternativeAppType_Support
# Description:
#	Checks alternative apptype support by component uning product nickname and
#		version
# Input parameters:
#	Component nickname
#	Component version
#	Reference to @AlternativeAppType_ComponentsInfo
#	Reference to Starting_SupportVersion
#	Reference to Starting_SupportVersion_ConfigServer
#	Reference to LegacyAppType
#	Reference to StandardAppType
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub CheckComponent_AlternativeAppType_Support($$\@$$$$)
{
	my $ProductNickname = $_[0];
	my $ProductVersion = $_[1];
	my $ref_AlternativeAppType_ComponentsInfo_Array=$_[2];
	my @AlternativeAppType_ComponentsInfo_Array = @{$ref_AlternativeAppType_ComponentsInfo_Array};
	my $ref_Starting_SupportVersion=$_[3];
	my $ref_Starting_SupportVersion_ConfigServer=$_[4];
	my $ref_LegacyAppType=$_[5];
	my $ref_StandardAppType=$_[6];
	my $Result=0;

	for my $elem (@AlternativeAppType_ComponentsInfo_Array)
	{
		if ($elem->{IP_Nickname} eq $ProductNickname)
		{
			my $CompareResult;
			$Result=CompareVersions($ProductVersion,$elem->{Starting_SupportVersion},\$CompareResult);

			if ($Result == 0)
			{
				return $Result;
			}

			if ($CompareResult < 0)
			{
				$Result = 0;
			}
			else
			{
				$$ref_Starting_SupportVersion=$elem->{Starting_SupportVersion};
				$$ref_Starting_SupportVersion_ConfigServer=$elem->{Starting_SupportVersion_ConfigServer};
				$$ref_LegacyAppType=$elem->{LegacyAppType};
				$$ref_StandardAppType=$elem->{StandardAppType};
				$Result = 1;
			}

			last;
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetIPAddresses
# Description:
#	Gets required set of IP addresses
# Input parameters:
#	Hostname
#	Reference to array of IP addresses
#	Reference to type of IP addresses on array
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetIPAddresses($\@$)
{
	my $Hostname=$_[0];
	my $ref_IPAddresses=$_[1];
	my @IPAddresses=@{$ref_IPAddresses};
	my $ref_IPAddressesType=$_[2];
	my $Result=0;
	my $IPv6_EnvironmentVariableName="GCTI_CONN_IPV6_ON";
	my $IPv6_is_on=0;
	my $debug_print=0;

	if ($IPv6_support == $IPv6_support_standard)
	{
		if (!$ENV{$IPv6_EnvironmentVariableName})
		{
			# nothing to do

			if ($debug_print == 1)
			{
				print "IPv6_is_off\n";
			}
		}
		else
		{
			$IPv6_is_on=1;

			if ($debug_print == 1)
			{
				print "IPv6_is_on\n";
			}
		}

		if ($IPv6_is_on == 1)
		{
			# only one from $Use_IPv4 and $Use_IPv6 should be set
			my $Use_IPv4=0;
			my $Use_IPv6=0;
			my $ResolutionType=0;
			my $Result_Resolve=ResolveHost($Hostname,\$ResolutionType);

			if ($Result_Resolve == 1)
			{
				if ($ResolutionType == $HostResolutionType_IPv4_Only)
				{
					if ($debug_print == 1)
					{
						print "HostResolutionType_IPv4_Only Use_IPv4\n";
					}

					$Use_IPv4=1;
				}
				elsif ($ResolutionType == $HostResolutionType_IPv6_Only)
				{
					if ($debug_print == 1)
					{
						print "HostResolutionType_IPv6_Only Use_IPv6\n";
					}

					$Use_IPv6=1;
				}
				elsif ($ResolutionType == $HostResolutionType_IPv4_and_IPv6)
				{
					if ($debug_print == 1)
					{
						print "HostResolutionType_IPv4_and_IPv6 Use_IPv4\n";
					}

					$Use_IPv4=1;
				}

				if ($Use_IPv4 == 1)
				{
					install_common::GetIPAddresses(@IPAddresses);
					@{$ref_IPAddresses}=@IPAddresses;
					$$ref_IPAddressesType=$install_common::IPAddrressType_v4;
					$Result=1;
				}
				elsif ($Use_IPv6 == 1)
				{
					install_common::GetIPv6Addresses(@IPAddresses);
					@{$ref_IPAddresses}=@IPAddresses;
					$$ref_IPAddressesType=$install_common::IPAddrressType_v6;
					$Result=1;
				}
			}
			else
			{
				if ($debug_print == 1)
				{
					print "not resolved\n";
				}

				install_common::GetIPAddresses(@IPAddresses);
				@{$ref_IPAddresses}=@IPAddresses;
				$$ref_IPAddressesType=$install_common::IPAddrressType_v4;
				$Result=1;
			}
		}
		else
		{
			install_common::GetIPAddresses(@IPAddresses);
			@{$ref_IPAddresses}=@IPAddresses;
			$$ref_IPAddressesType=$install_common::IPAddrressType_v4;
			$Result=1;
		}
	}
	else
	{
		install_common::GetIPAddresses(@IPAddresses);
		@{$ref_IPAddresses}=@IPAddresses;
		$$ref_IPAddressesType=$install_common::IPAddrressType_v4;
		$Result=1;
	}

	return $Result;
}

#===============================================================================
# Name:
#	ResolveHost
# Description:
#	Resolves hostname to IP addresses and determins the type of resolution
# Input parameters:
#	Hostname
#	Reference to type of hostname resolution ($HostResolutionType*)
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub ResolveHost($$)
{
	my $Hostname=$_[0];
	my $ref_HostResolutionType=$_[1];
	my $Result=0;
	my $debug_print=0;

	if (install_common::IsSocket6Loaded() == 0)
	{
		if ($debug_print == 1)
		{
			print "Socket6 is not loaded\n";
		}

		return $Result;
	}
	else
	{
		if ($debug_print == 1)
		{
			print "Socket6 is loaded\n";
		}
	}

	my $AF_UNSPEC_value=Socket::AF_UNSPEC;

	if ($debug_print == 1)
	{
		print "\$AF_UNSPEC_value=$AF_UNSPEC_value\n";
	}

	my $AF_INET_value=Socket::AF_INET;

	if ($debug_print == 1)
	{
		print "\$AF_INET_value=$AF_INET_value\n";
	}

	my $AF_INET6_value=0;

	my $block = <<'BLOCK1';
	require Socket6;
	package install_lib;

	if ($debug_print == 1)
	{
		print "1\n";
	}

	$AF_INET6_value=Socket6::AF_INET6;

	if ($debug_print == 1)
	{
		print "\$AF_INET6_value=$AF_INET6_value\n";
		print "2\n";
	}
BLOCK1
	eval "$block";
	warn $@ if $@;

	if ($debug_print == 1)
	{
		print"\$block=$block\n";
	}

	my $IPv4_found=0;
	my $IPv6_found=0;
	my ($family, $socktype, $proto, $saddr, $canonname, @res);
	@res = Socket6::getaddrinfo($Hostname, '', $AF_UNSPEC_value);

	if (scalar(@res) >= 5)
	{
		while (scalar(@res) >= 5)
		{
			($family, $socktype, $proto, $saddr, $canonname, @res) = @res;

			if ($family == $AF_INET_value)
			{
				$IPv4_found=1;

				if ($debug_print == 1)
				{
					print "IPv4_found\n";
				}
			}
			elsif ($family == $AF_INET6_value)
			{
				$IPv6_found=1;

				if ($debug_print == 1)
				{
					print "IPv6_found\n";
				}
			}
			else
			{
				if ($debug_print == 1)
				{
					print "IPvx_found\n";
				}
			}
		}

		if (($IPv4_found == 1) || ($IPv6_found == 1))
		{
			$Result=1;

			if (($IPv4_found == 1) && ($IPv6_found == 1))
			{
				$$ref_HostResolutionType=$HostResolutionType_IPv4_and_IPv6;
			}
			elsif (($IPv4_found == 1) && ($IPv6_found == 0))
			{
				$$ref_HostResolutionType=$HostResolutionType_IPv4_Only;
			}
			else
			{
				$$ref_HostResolutionType=$HostResolutionType_IPv6_Only;
			}
		}
	}
	else
	{
		my $block = <<'BLOCK2';
		require Socket6;
		if ( $res[0] == Socket6::EAI_ADDRFAMILY )
		{
			print "EAI_ADDRFAMILY\n";
		}
		elsif ( $res[0] == Socket6::EAI_AGAIN )
		{
			print "EAI_AGAIN\n";
		}
		elsif ( $res[0] == Socket6::EAI_BADFLAGS )
		{
			print "EAI_BADFLAGS\n";
		}
		elsif ( $res[0] == Socket6::EAI_FAIL )
		{
			print "EAI_FAIL\n";
		}
		elsif ( $res[0] == Socket6::EAI_FAMILY )
		{
			print "EAI_FAMILY\n";
		}
		elsif ( $res[0] == Socket6::EAI_MEMORY )
		{
			print "EAI_MEMORY\n";
		}
		elsif ( $res[0] == Socket6::EAI_NODATA )
		{
			print "EAI_NODATA\n";
		}
		elsif ( $res[0] == Socket6::EAI_NONAME )
		{
			print "EAI_NONAME\n";
		}
		elsif ( $res[0] == Socket6::EAI_SERVICE )
		{
			print "EAI_SERVICE\n";
		}
		elsif ( $res[0] == Socket6::EAI_SOCKTYPE )
		{
			print "EAI_SOCKTYPE\n";
		}
		elsif ( $res[0] == Socket6::EAI_SYSTEM )
		{
			print "EAI_SYSTEM\n";
		}
		elsif ( $res[0] == Socket6::EAI_BADHINTS )
		{
			print "EAI_BADHINTS\n";
		}
		elsif ( $res[0] == Socket6::EAI_PROTOCOL )
		{
			print "EAI_PROTOCOL\n";
		}
		else
		{
			print "res=$res[0]\n";
		}
BLOCK2
		if ($debug_print == 1)
		{
			eval "$block";
			warn $@ if $@;

			print"\$block=$block\n";
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	GetMediaBase
# Description:
#	Gets the list of items info
# Input parameters:
#	String with content of MediaInfo.xml
#	Reference to list of hashes representing item info
#	Table name
#	Expected columns number
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetMediaBase($\@$$)
{
	my $info_string = $_[0];
	my $ref_Data = $_[1];
	my $tableName = $_[2];
	my $expected_columns_number = $_[3];
	my $element_start="<table name=\\\"$tableName\\\">";
	my $element_end="<\\\/table>";
	my $debug_print=0;

	my ($element_content) = ($info_string =~ /.*$element_start(.*?)$element_end.*/sm);

	if ($debug_print == 1)
	{
		print "\$element_content=\"$element_content\"\n";
	}

	install_common::Trim(\$element_content);

	if ($debug_print == 1)
	{
		print "\$element_content=\"$element_content\"\n";
	}

	my ($columns_str) = ($element_content =~ /.*?<col(.*)<\/col>.*?/sm);

	if ($debug_print == 1)
	{
		print "\$columns_str=\"$columns_str\"\n";
	}

	$columns_str =~ s/<col//smg;
	$columns_str =~ s/<\/col>//smg;
	$columns_str =~ s/^.*?>//smg;

	if ($debug_print == 1)
	{
		print "\$columns_str=\"$columns_str\"\n";
	}

	my @columns = split(/\n/, $columns_str);

	for my $elem (@columns)
	{
		$elem =~ s/\s*$//;

		if ($debug_print == 1)
		{
			print "column=\"$elem\"\n";
		}
	}

	my $columns_length = scalar @columns;

	if ($debug_print == 1)
	{
		print "*************** Typing elements:\n";
		for my $elem (@columns)
		{
			print "value=$elem\n";
		}
	}

	if ($columns_length != $expected_columns_number)
	{
		return 0;
	}

	my ($rows_str) = ($element_content =~ /.*?<row>(.*)<\/row>.*?/sm);

	if ($debug_print == 1)
	{
		print "\$rows_str=\"$rows_str\"\n";
	}

	my @rows = split(/\n/, $rows_str);

	if ($debug_print == 1)
	{
		print "*************** Typing elements:\n";
		for my $elem (@rows)
		{
			print "value=$elem\n";
		}
	}

	my @Data_rows=();
	for my $elem (@rows)
	{
		my @Data_columns=();
		my $str=$elem;
		install_common::Trim(\$str);
		my @Data_elems = split(/<\/td><td>/, $str);

		my $length = scalar @Data_elems;

		if ($columns_length != $length)
		{
			return 0;
		}

		my $count=0;

		if ($debug_print == 1)
		{
			print "*************** Typing elements:\n";
		}

		for my $elem (@Data_elems)
		{
			if ($count == 0)
			{
				my $str_tmp=$elem;
				$str_tmp =~ s/^<row><td>//;
				$str_tmp =~ s/^<td>//;
				$elem=$str_tmp;
			}

			if ($count == ($length-1))
			{
				my $str_tmp=$elem;
				$str_tmp =~ s/<\/td><\/row>$//;
				$str_tmp =~ s/<\/td>$//;
				$elem=$str_tmp;
			}

			if ($debug_print == 1)
			{
				print "value=$elem\n";
			}

			push(@Data_columns,$columns[$count],$elem);

			$count++;
		}

		my %Data_info=();
		%Data_info=splice(@Data_columns,0,($columns_length*2));
		push(@Data_rows,\%Data_info);
	}

	@{$ref_Data}=@Data_rows;

	return 1;
}

#===============================================================================
# Name:
#	GetMediaIPsInfo
# Description:
#	Gets the list of IPs info
# Input parameters:
#	String with content of MediaInfo.xml
#	Reference to list of hashes representing IP info
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

our $MediaIPs_ID="ID";
our $MediaIPs_IPNickname="IPNickname";
our $MediaIPs_Version="Version";
our $MediaIPs_LocaleId="LocaleId";
our $MediaIPs_Platform="Platform";
our $MediaIPs_Name="Name";
our $MediaIPs_BuildDate="BuildDate";
our $MediaIPs_BuildNumber="BuildNumber";
our $MediaIPs_ReleaseType="ReleaseType";
our $MediaIPs_Location="Location";
my $MediaIPs_columns=10;

sub GetMediaIPsInfo($\@)
{
	my $data_string = $_[0];
	my $ref_Data = $_[1];
	my $tablename = "InstallationPackage";

	my $Result=GetMediaBase($data_string,@{$ref_Data},$tablename,$MediaIPs_columns);

	return $Result;
}

#===============================================================================
# Name:
#	GetMediaAppTemplatesInfo
# Description:
#	Gets the list of AppTemplates info
# Input parameters:
#	String with content of MediaInfo.xml
#	Reference to list of hashes representing AppTemplates info
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

our $MediaAppTemplates_IPNickname="IPNickname";
our $MediaAppTemplates_File="File"; # filename
our $MediaAppTemplates_Location="Location";
our $MediaAppTemplates_AppType="AppType";
our $MediaAppTemplates_Name="Name"; # template name (Application Template of SIP Voicemail Server)
my $MediaAppTemplates_columns=5;

sub GetMediaAppTemplatesInfo($\@)
{
	my $data_string = $_[0];
	my $ref_Data = $_[1];
	my $tablename = "AppTemplate";

	my $Result=GetMediaBase($data_string,@{$ref_Data},$tablename,$MediaAppTemplates_columns);

	return $Result;
}

#===============================================================================
# Name:
#	Read_Media_Base
# Description:
#	Reads items data from $MediaInfo_filename
# Input parameters:
#	Reference to list of hashes representing items info
#	Items type
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

my $Media_InfoType_Propetrties=1;
my $Media_InfoType_IPs=2;
my $Media_InfoType_AppTemplates=3;

sub Read_Media_Base(\@$)
{
	my $ref_ItemsInfo = $_[0];
	my $InfoType = $_[1];
	my $Result;
	my $MediaInfo_pathname="";

	my $sourcedir=`$install_common::PWD`;
	chomp $sourcedir;
	$MediaInfo_pathname=$sourcedir."/".$MediaInfo_filename;

	if (!-f $MediaInfo_pathname)
	{
		return 0;
	}

	my $MediaInfo_pathname_string=`cat $MediaInfo_pathname`;
	my @ItemsInfo=();

	if ($InfoType == $Media_InfoType_IPs)
	{
		$Result=GetMediaIPsInfo($MediaInfo_pathname_string,@ItemsInfo);
	}
	elsif ($InfoType == $Media_InfoType_Propetrties)
	{
		$Result=GetMediaInfo($MediaInfo_pathname_string,@ItemsInfo);
	}
	elsif ($InfoType == $Media_InfoType_AppTemplates)
	{
		$Result=GetMediaAppTemplatesInfo($MediaInfo_pathname_string,@ItemsInfo);
	}
	else
	{
		$Result=0;
	}

	if ($Result == 1)
	{
		@{$ref_ItemsInfo}=@ItemsInfo;
		return 1;
	}
	else
	{
		return 0;
	}
}

#===============================================================================
# Name:
#	Read_MediaIPs_data
# Description:
#	Reads IPs data from $MediaInfo_filename
# Input parameters:
#	Reference to list of hashes representing IP info
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub Read_MediaIPs_data(\@)
{
	my $ref_IPsInfo = $_[0];
	my $Result=Read_Media_Base(@{$ref_IPsInfo},$Media_InfoType_IPs);
	return $Result;
}

#===============================================================================
# Name:
#	GetMediaInfo
# Description:
#	Gets the media info
# Input parameters:
#	String with content of MediaInfo.xml
#	Reference to list of hashes representing media info
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

our $Media_Property="Property";
our $Media_Value="Value";
my $Media_columns=2;

our $Media_Value_BuildDate="BuildDate";
our $Media_Value_Label="Label";
our $Media_Value_LocaleId="LocaleId";
our $Media_Value_MediaType="MediaType";
our $Media_Value_Name="Name";
our $Media_Value_Nickname="Nickname";
our $Media_Value_Version="Version";

sub GetMediaInfo($\@)
{
	my $data_string = $_[0];
	my $ref_Data = $_[1];
	my $tablename = "MediaProperties";

	my $Result=GetMediaBase($data_string,@{$ref_Data},$tablename,$Media_columns);

	return $Result;
}

#===============================================================================
# Name:
#	Read_Media_data
# Description:
#	Reads media data from $MediaInfo_filename
# Input parameters:
#	Reference to list of hashes representing media info
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub Read_Media_data(\@)
{
	my $ref_IPsInfo = $_[0];
	my $Result=Read_Media_Base(@{$ref_IPsInfo},$Media_InfoType_Propetrties);
	return $Result;
}

#===============================================================================
# Name:
#	Read_MediaAppTemplates_data
# Description:
#	Reads AppTemplates data from $MediaInfo_filename
# Input parameters:
#	Reference to list of hashes representing AppTemplates info
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub Read_MediaAppTemplates_data(\@)
{
	my $ref_AppTemplatesInfo = $_[0];
	my $Result=Read_Media_Base(@{$ref_AppTemplatesInfo},$Media_InfoType_AppTemplates);
	return $Result;
}

#===============================================================================
# Name:
#	InitLaunchPath
# Description:
#	Inits launch path
# Input parameters:
#	None
# Return value:
#	None.
#===============================================================================

sub InitLaunchPath()
{
	if ( -f $LaunchPath_filename )
	{
		my $sourcedir=`cat $LaunchPath_filename`;
		chomp $sourcedir;

		$LaunchPath=$sourcedir;
	}
	else
	{
		my $sourcedir=`$install_common::PWD`;
		chomp $sourcedir;

		$LaunchPath=$sourcedir;
	}
}

#===============================================================================
# Name:
#	GetLaunchPath
# Description:
#	Gets launch path
# Input parameters:
#	None
# Return value:
#	Launch path.
#===============================================================================

sub GetLaunchPath()
{
	return $LaunchPath;
}

#===============================================================================
# Name:
#	GetRamSize
# Description:
#	Gets RAM size
# Input parameters:
#	Reference to RAM size in MB
# Return value:
#	Returns 1 on success, 0 on failure.
#===============================================================================

sub GetRamSize($)
{
	my $ref_RamSize = $_[0];
	my $Result=0;

	my $platform=install_common::FINDPLAT();

	if ($platform eq "linux")
	{
		my $RamSizeString=`cat /proc/meminfo | grep MemTotal | cut -d: -f2`;
		chomp $RamSizeString;

		if ($RamSizeString =~ /kB/)
		{
			$RamSizeString =~ /\s*(\d*)\s*kB/;
			$RamSizeString = $1;
			my $float = $RamSizeString/1048576;
			$$ref_RamSize = sprintf("%.0f", $float);
			$Result=1;
		}
	}

	return $Result;
}

#===============================================================================
# Name:
#	ProcessReturnCode
# Description:
#	Processes return code
# Input parameters:
#	Return code
#	Error message
# Return value:
#	None on success, dies on failure.
#===============================================================================

sub ProcessReturnCode($$)
{
	my $ReturnCode=$_[0];
	my $ErrorMessage=$_[1];

	if ($ReturnCode != 0)
	{
		my $message=$ErrorMessage;

		if (install_common::Get_silent_mode() == 0)
		{
			print "\n$message";
			install_common::CatchInterruptSignal();
		}
		else
		{
			install_common::CreateSilentLog($install_common::Silent_result_error,$message,$install_common::Silent_action_exit);
		}
	}

	return;
}

#===============================================================================
# Name:
#	DisableClientSidePortSupport
# Description:
#	Disables standard processing of Client Side Port
#===============================================================================

sub DisableClientSidePortSupport()
{
	$ClientSidePort_mode_support=$ClientSidePort_mode_support_legacy;
}

#===============================================================================
# Name:
#	EnableClientSidePortSupport
# Description:
#	Enables standard processing of Client Side Port
#===============================================================================

sub EnableClientSidePortSupport()
{
	$ClientSidePort_mode_support=$ClientSidePort_mode_support_standard;
}

#===============================================================================
# Name:
#	DeployApp
# Description:
#	Deploys GAX Web App
# Input parameters:
#	Target directory
#	Deploy directory (Tomcat or GAX directory)
#	Tomcat deployment flag (1-Tomcat,0-GAX Jetty)
#	Libraries Names (for example, "*.jar")
# Return value:
#	None, dies on error.
#===============================================================================

sub DeployGAXApp($$$$)
{
	my $TargetDir=$_[0];
	my $DeployDirectory=$_[1];
	my $TomcatDeployment=$_[2];
	my $LibrariesNames=$_[3];
	my $ReturnCode=1;
	my $Message="";
	my $GAX_SubDirectoryName="gax";

	my $GAX_Lib_Directory="";

	if ($TomcatDeployment == 1)
	{
		$GAX_Lib_Directory="$DeployDirectory/webapps/$GAX_SubDirectoryName/WEB-INF/lib";
	}
	else
	{
		$GAX_Lib_Directory="$DeployDirectory/$JettyDirectory";

		if (!(-d $GAX_Lib_Directory))
		{
			return;
		}
	}

	if (install_common::Get_silent_mode() == 0)
	{
		$Message="Deploying to directory $GAX_Lib_Directory...";
		print "\n$Message\n";
	}

	if (!(-d $GAX_Lib_Directory))
	{
		$ReturnCode=1;
		$Message="Deployment directory $GAX_Lib_Directory was not found.";
		install_lib::ProcessReturnCode($ReturnCode,$Message);
	}

	system("$install_common::CP $TargetDir/$LibrariesNames $GAX_Lib_Directory");
	$ReturnCode=$?;
	$Message="Unable to copy files $TargetDir/$LibrariesNames to $GAX_Lib_Directory: $!";
	install_lib::ProcessReturnCode($ReturnCode,$Message);
}

#===============================================================================
# Name:
#	GetGAXDirectory
# Description:
#	Gets GAX directory
# Input parameters:
#	Reference to GAX directory
#	Silent response file component section name
# Return value:
#	1 or dies on error.
#===============================================================================

sub GetGAXDirectory($$)
{
	my $ref_GAXDirectory=$_[0];
	my $Silent_response_file_Component_section_name=$_[1];
	my $GAX_Directory_Prompt="Enter the full path to the $GAX_name installation directory";

	if (install_common::Get_silent_mode() == 0)
	{
		my $path=undef;

		while (! $path)
		{
			$path=install_common::ASK("\n$GAX_Directory_Prompt =>");

			if (-d $path)
			{
				$$ref_GAXDirectory=$path;
			}
			else
			{
				$path=undef;
				print "Invalid value\n";
			}
		}

		CheckGAXDirectory($$ref_GAXDirectory);
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

		%IniSectionData=install_common::PARSEINI($Filepath,$Silent_response_file_Component_section_name,$install_common::comments_characters);

		if (!%IniSectionData)
		{
			my $Message="Section $Silent_response_file_Component_section_name was not found.";
			install_common::CreateSilentLog($install_common::Silent_result_error,$Message,$install_common::Silent_action_exit);
		}

		my $value=$IniSectionData{$Silent_response_file_GAX_Directory_key_name};

		$$ref_GAXDirectory=$value;
		CheckGAXDirectory($$ref_GAXDirectory);
	}

	if (install_common::Get_record_mode() == 1)
	{
		my $Filepath = install_common::Get_silent_mode_response_file_path();
		my $Result = install_common::SetIniFileKeyValue($Filepath,$Silent_response_file_Component_section_name,$Silent_response_file_GAX_Directory_key_name,$$ref_GAXDirectory);
	}

	return 1;
}

#===============================================================================
# Name:
#	CheckGAXDirectory
# Description:
#	Checks GAX directory
# Input parameters:
#	GAX directory
# Return value:
#	None or dies on error.
#===============================================================================

sub CheckGAXDirectory($)
{
	my $GAXDirectory=$_[0];

	my $GAX_Lib_Directory="$GAXDirectory/$JettyDirectory";

	if (! -d $GAX_Lib_Directory)
	{
		my $ReturnCode=1;
		my $Message="$GAX_name plug-in directory ($GAX_Lib_Directory) was not found.";
		$Message=$Message . "\nThe installation will continue without binding plug-in to $GAX_name.\n";

		if (install_common::Get_silent_mode() == 0)
		{
			print "\n$Message";
		}
	}
}

#===============================================================================
# Name:
#	Init
# Description:
#	Init initializes this library, should be called from client script before any
#	other calls to function from this library.
#	Is used for tuning of install_common library.
# Return value:
#	Function returns 0.
#===============================================================================

sub Init()
{
	install_common::FindUname();

	{
		# verify $ip_description_filename presence
		my $sourcedir=`$install_common::PWD`;
		chomp $sourcedir;
		my $ip_description_pathname=$sourcedir."/".$install_common::ip_description_filename;

		if (! -f $ip_description_pathname)
		{
			my $Message="File $ip_description_pathname was not found.";
			print "\n$Message\n";
			die "\n$install_common::InstallationTerminationMessage\n";
		}
	}

	InitRebrandingData();

	# pre-processing actions
	GetOperationMode($StartingVersionForStandard_Free_Disk_Space_Checking_Mode,
		$Free_disk_space_checking_mode_legacy,$Free_disk_space_checking_mode_standard,
		\$Free_disk_space_checking_mode);

	if ($Free_disk_space_checking_mode == $Free_disk_space_checking_mode_legacy)
	{
		install_common::Disable_free_space_checking();
	}
	elsif ($Free_disk_space_checking_mode == $Free_disk_space_checking_mode_standard)
	{
		install_common::Enable_free_space_checking();
	}

	GetOperationMode($StartingVersionForStandard_App_Host_Filtering_Mode,
		$App_host_filtering_mode_legacy,$App_host_filtering_mode_standard,
		\$App_host_filtering_mode);

	if ($App_host_filtering_mode == $App_host_filtering_mode_legacy)
	{
		install_common::Disable_app_host_filtering();
	}
	elsif ($App_host_filtering_mode == $App_host_filtering_mode_standard)
	{
		install_common::Enable_app_host_filtering();
	}

	GetOperationMode($StartingVersionForStandard_Configured_App_Type_Mode,
		$Configured_app_type_mode_legacy,$Configured_app_type_mode_standard,
		\$Configured_app_type_mode);

	GetOperationMode($StartingVersionForStandard_Silent_Mode_Support,
		$Silent_mode_support_legacy,$Silent_mode_support_standard,
		\$Silent_mode_support);

	if ($Silent_mode_support == $Silent_mode_support_legacy)
	{
		install_common::Disable_silent_mode_support();
	}
	elsif ($Silent_mode_support == $Silent_mode_support_standard)
	{
		install_common::Enable_silent_mode_support();
		SetupSilentMode();
	}

	GetOperationMode($StartingVersionForStandard_App_version_update_Mode,
		$App_version_update_mode_legacy,$App_version_update_mode_standard,
		\$App_version_update_mode);

	GetOperationMode($StartingVersionForStandard_AIX_64_bit_Mode_Support,
		$AIX_64_bit_mode_support_legacy,$AIX_64_bit_mode_support_standard,
		\$AIX_64_bit_mode_support);

	if ($AIX_64_bit_mode_support == $AIX_64_bit_mode_support_legacy)
	{
		# check for exclusions
		CheckExclusionsFor_AIX_64_bit_mode_support($AIX_64_bit_mode_support_legacy,$AIX_64_bit_mode_support_standard,
			\$AIX_64_bit_mode_support);
	}

	if ($AIX_64_bit_mode_support == $AIX_64_bit_mode_support_legacy)
	{
		install_common::Disable_AIX_64_bit_mode_support();
	}
	elsif ($AIX_64_bit_mode_support == $AIX_64_bit_mode_support_standard)
	{
		if (SetupAIX64BitMode() == 1)
		{
			install_common::Enable_AIX_64_bit_mode_support();
		}
		else
		{
			install_common::Disable_AIX_64_bit_mode_support();
		}
	}

	GetOperationMode($StartingVersionForStandard_ApplicationDataChecking_Mode_Support,
		$ApplicationDataChecking_mode_support_legacy,$ApplicationDataChecking_mode_support_standard,
		\$ApplicationDataChecking_mode_support);

	GetOperationMode($StartingVersionForStandard_OSVersionChecking_Mode_Support,
		$OSVersionChecking_mode_support_legacy,$OSVersionChecking_mode_support_standard,
		\$OSVersionChecking_mode_support);

	GetOperationMode($StartingVersionForStandard_SingleAppInIniFile_Mode,
		$SingleAppInIniFile_mode_legacy,$SingleAppInIniFile_mode_standard,
		\$SingleAppInIniFile_mode);

	if ($SingleAppInIniFile_mode == $SingleAppInIniFile_mode_legacy)
	{
		install_common::DisableSingleAppInIniFileProcessing();
	}
	elsif ($SingleAppInIniFile_mode == $SingleAppInIniFile_mode_standard)
	{
		install_common::EnableSingleAppInIniFileProcessing();
	}

	GetOperationMode($StartingVersionForStandard_Module_64_bit_Mode_Support,
		$Module_64_bit_mode_support_legacy,$Module_64_bit_mode_support_standard,
		\$Module_64_bit_mode_support);

	if ($Module_64_bit_mode_support == $Module_64_bit_mode_support_legacy)
	{
		install_common::DisableStandard64bitProcessing();
	}
	elsif ($Module_64_bit_mode_support == $Module_64_bit_mode_support_standard)
	{
		install_common::EnableStandard64bitProcessing();
	}

	GetOperationMode($StartingVersionForStandard_ClientSidePort_Mode_Support,
		$ClientSidePort_mode_support_legacy,$ClientSidePort_mode_support_standard,
		\$ClientSidePort_mode_support);

	if ($ClientSidePort_mode_support == $ClientSidePort_mode_support_legacy)
	{
		install_common::DisableClientSidePortSupport();
	}
	elsif ($ClientSidePort_mode_support == $ClientSidePort_mode_support_standard)
	{
		my $Supported = 0;
		my $Result = Check_ClientSidePort_SupportByComponent(\$Supported);

		if (($Result == 1) && ($Supported == 1))
		{
			install_common::EnableClientSidePortSupport();
		}
		else
		{
			$ClientSidePort_mode_support = $ClientSidePort_mode_support_legacy;
			install_common::DisableClientSidePortSupport();
		}
	}

	GetOperationMode($StartingVersionForStandard_ConfigServerRequestsDiagnostic_Mode_Support,
		$ConfigServerRequestsDiagnostic_mode_support_legacy,$ConfigServerRequestsDiagnostic_mode_support_standard,
		\$ConfigServerRequestsDiagnostic_mode_support);

	GetOperationMode($StartingVersionForStandard_InstallPathInSilentMode_Support,
		$InstallPathInSilentMode_support_legacy,$InstallPathInSilentMode_support_standard,
		\$InstallPathInSilentMode_support);

	if ($InstallPathInSilentMode_support == $InstallPathInSilentMode_support_legacy)
	{
		install_common::DisableStandardInstallPathInSilentModeProcessing();
	}
	elsif ($InstallPathInSilentMode_support == $InstallPathInSilentMode_support_standard)
	{
		install_common::EnableStandardInstallPathInSilentModeProcessing();
	}

	GetOperationMode($StartingVersionForStandard_UninstallData_support,
		$UninstallData_support_legacy,$UninstallData_support_standard,
		\$UninstallData_support);

	if ($UninstallData_support == $UninstallData_support_legacy)
	{
		install_common::DisableStandardUninstallDataProcessing();
	}
	elsif ($UninstallData_support == $UninstallData_support_standard)
	{
		install_common::EnableStandardUninstallDataProcessing();
	}

	GetOperationMode($StartingVersionFor_AspectTServer_AllPlatforms_support,
		$AspectTServer_AllPlatforms_support_legacy,$AspectTServer_AllPlatforms_support_standard,
		\$AspectTServer_AllPlatforms_support);

	if ($AspectTServer_AllPlatforms_support == $AspectTServer_AllPlatforms_support_legacy)
	{
		install_common::DisableStandardAspectTServerAllPlatformsProcessing();
	}
	elsif ($AspectTServer_AllPlatforms_support == $AspectTServer_AllPlatforms_support_standard)
	{
		install_common::EnableStandardAspectTServerAllPlatformsProcessing();
	}

	if ($AspectTServer_AllPlatforms_support == $AspectTServer_AllPlatforms_support_legacy)
	{
		GetOperationMode($StartingVersionForStandard_AspectTServer_support,
			$AspectTServer_support_legacy,$AspectTServer_support_standard,
			\$AspectTServer_support);

		if ($AspectTServer_support == $AspectTServer_support_legacy)
		{
			install_common::DisableStandardAspectTServerProcessing();
		}
		elsif ($AspectTServer_support == $AspectTServer_support_standard)
		{
			install_common::EnableStandardAspectTServerProcessing();
		}
	}

	GetOperationMode($StartingVersionForStandard_LicenseQuestionsDuringUpgrade_support,
		$LicenseQuestionsDuringUpgrade_support_legacy,$LicenseQuestionsDuringUpgrade_support_standard,
		\$LicenseQuestionsDuringUpgrade_support);

	GetOperationMode($StartingVersionForStandard_IPv6_support,
		$IPv6_support_legacy,$IPv6_support_standard,
		\$IPv6_support);

	if ($IPv6_support == $IPv6_support_legacy)
	{
		install_common::DisableStandardIPv6Support();
	}
	elsif ($IPv6_support == $IPv6_support_standard)
	{
		install_common::EnableStandardIPv6Support();
	}

	install_common::Init();

	# post-processing actions
	InitLaunchPath();

	return 0;
}

1;
