#!\C:\Perl64\bin\perl

package BaseModules;
use strict;
use warnings;
use CGI;

my $cgi = CGI->new;

sub uploadFile {
my $uplaodFilePath = shift;
my $upload_dir = "E:/temp";
my $max_size = 30_000;

#print $cgi->header();

if ( $uplaodFilePath =~ /\.(exe|asp|php|jsp|cgi|pl|aspx|config|asax|asa)$/ ) {
	print STDOUT  "Invalid file extension. No executable file types permitted";
}

if ( length($uplaodFilePath) > 0  ) {

	#We are uploading a file with a name other than ""
	#get rid of the leading directories

	( my $file_name = $uplaodFilePath ) =~ s/.*\\//;
	my $upload_path = "$upload_dir/$file_name";
	
	#################################
	#if (! open(OUTFILE, ">$upload_dir/outfile.txt") ) {
	if (! open(OUTFILE, ">$upload_dir/$file_name") ) {	
	print STDOUT "Can't open $upload_dir/outfile.txt for writing - $!";
	#exit(-1);
	}
	#my $infile = "E:/testFile.txt";
	#open (INFILE, "<$infile") or die "Could not open $infile, $!";
	open (INFILE, "<$uplaodFilePath") or die "Could not open $uplaodFilePath, $!";
	# give some feedback to browser
	#print STDOUT "Saving the file to $upload_dir<br>\n";

		while (<INFILE>) {
			#print STDOUT "helloooo $_ \n";
		#while (<$fh>) {
		s/\r//;
		print OUTFILE "$_";
	}
	############################
	#close INFILE;
	close(OUTFILE);

    my $json;
	#if (-e "$upload_dir/outfile.txt"  ) {
	if (-e "$upload_dir/$file_name"  ) {
		$json = qq{{"result": "uploaded", "message" : "File uploaded successfully" }};

	}
	else {
		$json = qq{{"result" : "notuploaded", "message" : "File did not upload try again." }};
	}
	
	# return JSON string
	print $cgi->header(-type => "application/json", -charset => "utf-8");
	print $json;
	 
}
	
=co	
	$CGI::POST_MAX = 1024 * 5000; 
	my $safe_filename_characters = "a-zA-Z0-9_.-"; 
	my $upload_dir = "E:/temp"; 
	my $cgi = new CGI; 
	$uplaodFilePath = "E:/H1Questions.docx";
	my $filename = $uplaodFilePath; 
	my $email_address = $cgi->param("email_address"); 
	if ( !$filename ) { 
		#print $cgi->header(); 
		print STDOUT "There was a problem uploading your photo (try a smaller file)."; 
		exit; 
	} 
	my ( $name, $path, $extension ) = fileparse ( $filename, '..*' ); 
	$filename = $name . $extension; 
	$filename =~ tr/ /_/; 
	$filename =~ s/[^$safe_filename_characters]//g; 
	if ( $filename =~ /^([$safe_filename_characters]+)$/ ) { 
		$filename = $1; 
	} else { 
		die "Filename contains invalid characters"; 
	} 
	
	print STDOUT "filename = $filename ";
	my $upload_filehandle = $cgi->upload($uplaodFilePath); 
	print STDOUT "\$upload_filehandle = $upload_filehandle " ;
	open ( UPLOADFILE, ">$upload_dir/$filename" ) or die "$!"; 
	binmode UPLOADFILE; 
	while ( <$upload_filehandle> ) { 
		print UPLOADFILE; 
	} 
	close UPLOADFILE;
	my $json = qq{{"uploadSuccess" : "File uploaded is successfully"}};
	 
	# return JSON string
	print $cgi->header(-type => "application/json", -charset => "utf-8");
	print $json;	
=cut
	
}

1;