#!\C:\Perl64\bin\perl
use CGI;
use DBI;
use strict;
use warnings;
 
# read the CGI params
my $cgi = CGI->new;
my $username = $cgi->param("username");
my $password = $cgi->param("password");

=comment 
# connect to the database
my $dbh = DBI->connect("DBI:mysql:database=;host=;port=",  
  "", "") 
  or die $DBI::errstr;
 
# check the username and password in the database
 
my $statement = qq{SELECT id FROM users WHERE username=? and password=?};
my $sth = $dbh->prepare($statement)
  or die $dbh->errstr;
$sth->execute($username, $password)
  or die $sth->errstr;
my ($userID) = $sth->fetchrow_array;
=cut 

use getDBData;
my $obj = getDBData->new();    # call the constructor w/a value
my $verifyLogin = $obj->verifyUserLogin($username,$password);
    
#print STDOUT 'Login Successful'  ;
my $userID = $verifyLogin->{'Verifylogin'};
# create a JSON string according to the database result
my $json = $userID ?
  qq{{"success" : "login is successful", "userid" : "$userID"}} : 
  qq{{"error" : "username or password is wrong"}};
 
# return JSON string
print $cgi->header(-type => "application/json", -charset => "utf-8");

print $json;