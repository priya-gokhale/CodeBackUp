#!\C:\Perl64\bin\perl

use Mojolicious::Lite;
#use Mojo::Server::Daemon;
#use Mojo::IOLoop;
use db_connection;
use Data::Dumper;
use getDBData;

#print  " dbh = $::db_connection::dbh";
#print Dumper($::db_connection::dbh);
app->config(hypnotoad => {listen => ['http://localhost:5007']});

get '/' => { text => 'Hello World' };

 
get '/echo' => { text => q{
       <form method="POST"><input name="q"><input type="submit" value="Echo"></form>
}};
 
post '/echo' => sub {
    my $self = shift;
    $self->render( text => $self->param('q') );
};

get '/verifyLogin' => sub {
	my $self = shift;
	#use Data::Dumper;
	#print STDOUT " verifyLogin \n ";
	#print STDOUT Dumper($self);
    my $obj = getDBData->new();    # call the constructor w/a value
    my $verifyLogin = $obj->verifyUserLogin($self->param('username'),$self->param('password'));
    
    print STDOUT 'Login Successful'  ;
    
    #$self->render( text => $self->param('username') );
    $self->render( text => 'Login Successful' ) if $verifyLogin;
    
    return $verifyLogin;
};

#app->secrets(['secretpassphrase.']);
app->start;
=co
my $daemon
  = Mojo::Server::Daemon->new(app => app, listen => ['http://*:5007']);
$daemon->start;
#app->start('daemon', '-l', 'http://*:5183');
=cut