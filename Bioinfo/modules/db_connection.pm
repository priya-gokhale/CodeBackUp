#!\C:\Perl64\bin\perl
package db_connection;

use strict;
use warnings;
use Exporter;
our @ISA = 'Exporter';
our @EXPORT = qw($dbh);

our $var = 10; 
use DBI;

#print STDOUT "inside db_connection module";
 
my $dbName = "appDB";
 
my $dsn      = "dbi:mysql:dbname=$dbName";
my $user     = "root";
my $password = "";
our $dbh = DBI->connect($dsn, $user, $password, {
   PrintError       => 0,
   RaiseError       => 1,
   AutoCommit       => 1,
   FetchHashKeyName => 'NAME_lc',
});

# ...

 
$dbh->disconnect;