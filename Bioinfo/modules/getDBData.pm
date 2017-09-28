#!\C:\Perl64\bin\perl

package getDBData;
use strict;
use warnings;
#use CGI; 
#use DBI;
use db_connection;

#print $dbh;
#print STDOUT "inside getDBData module";

sub new {
	my $class = shift;
    my $self = {};        # the internal structure we'll use to represent
     				      # the data in our class is a hash reference
    bless( $self, $class );
    #$self->{'args'} = $args;    # give $self->{num} the supplied value
            					# $self->{num} is our internal number
    return $self;        		# a constructor always returns an blessed() object
	
}
sub verifyUserLogin {
	my $self = shift;    # $_[0] now contains the object on which the method was called
	my ($username, $password) = @_;
	#print STDOUT "\n \$username = $username and \$password = $password \n";
	my $query = "SELECT count(*) FROM users WHERE username = ? and password = ? ";
	#$username= "priya";
	#$password = "priya";
	my $sth = $dbh->prepare($query);
	$sth->execute($username, $password);
	my $count = $sth->fetchrow;
	#print STDOUT "\$count = $count \n";
	$self->{'Verifylogin'} = $count;
	
	return $self;
}

1;