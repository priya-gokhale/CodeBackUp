#!\C:\Perl64\bin\perl

use CGI;
use DBI;
use strict;
use warnings;

# modules required for file upload
use CGI::Carp qw ( fatalsToBrowser ); 
use File::Basename; 

# module requires for session management
use CGI::Session ( '-ip_match' );

# module for common functions
use BaseModules;
use getDBData;

my $cgi = CGI->new;
# new session object, will get session ID from the query object
# will restore any existing session with the session ID in the query object
#my $session = CGI::Session->new($cgi);


# print the HTTP header and set the session ID cookie
#print $session->header();

# read the CGI params
my $username = $cgi->param("username");
my $password = $cgi->param("password");
my $action = $cgi->param("action");
my $uplaodFilePath = $cgi->param('filePath');

if ( $action eq 'login' ) {
	getUserLogin();		
}

elsif ($action eq 'upload'){
	#print STDOUT "\$uplaodFilePath = $uplaodFilePath";
	BaseModules::uploadFile($uplaodFilePath);
}
elsif($action eq 'logout')
  {
      #$session = CGI::Session->load() or die CGI::Session->errstr;
      #$session->delete();
      #print $session->header(-location=>'login.pl');
  }



sub getUserLogin {
	my $obj = getDBData->new();
	my $verifyLogin = $obj->verifyUserLogin($username, $password);

	#print STDOUT "\$action = $action and \$username = $username and \$password = $password ";

	# create a JSON string according to the database result
	my $json;
	if ($verifyLogin->{'Verifylogin'} == 1) {
		 #print STDOUT "IF verified \n "; 
		#$session = new CGI::Session();
		#my $session_id = $session->id();
		#print STDOUT "\$session_id = $session_id \n";
		$json = qq{{"result": "found", "message" : "login is successful" }};

	}
	else {
		$json = qq{{"result" : "notFound", "message" : "User does not exist" }};
	}
	
	# return JSON string
	print $cgi->header(-type => "application/json", -charset => "utf-8");
	print $json;
}

