     #!/perl/bin/perl
  
        use CGI::Carp qw(fatalsToBrowser);
        use DBI;
        use CGI qw/:standard/;
        use CGI;
        use POSIX;
        print "Content-Type: text/html\n\n";
        $|++;
  
        my $env=$ENV{QUERY_STRING};
        my@env=split(/=/, $env);
        my $page= $env[1];
        my ($results_per_page);
        if (!$limit) {
           $limit = 0;
            }
        my $dbh = DBI->connect(
             "dbi:SQLite:COMPANY.db",
             "", "",
             {
                 RaiseError => 1,
                 AutoCommit => 1
             }
         );
  
         my $query =$dbh->selectall_arrayref('SELECT * 
         FROM Employees');
         my $count=@$query ; 
         $results_per_page = 3;
         my $pagesrequired = ceil($count  / 
                $results_per_page);  
  
        [... PIECE OF CODE : 1 WHICH I WANT TO GET 
          REPLACED BY CODE:2 MENTIONED BELOW
              THIS CODE ,
          for (my $i = 0; $i <= $pagesrequired -1; $i++) {
          if ($i == 0) {
            if ($limit == 0) {
               print "<a href=\"Employees.cgi?&limit=0
                \">";
               print $i + 1;
               print "</a>";
              }
            else {
                print $i + 1;
              }
             }
  
           if ($i > 0) {
          if ($limit != ($i * $results_per_page)) {
             print " | <a href=\"Employees.cgi?&limit=";
             print ($i * $results_per_page);
             print "\">\n";
             print $i + 1,"</a>";
              }
          else {
             print " | ", $i + 1;
              }
            }
           }       ...]
           THIS CODE ENCLOSED BETWEEN [.. ..]GIVES THE
          PAGINATION FORMAT AS "1 2 3 4.SO ON".
           BUT I NEED TO GET THE FORMAT OF |< < > >| AS 
           THIS CODE BELOW GENERATES...I AM 
           NOT ABLE TO REPLACE THIS CODE WITH THAT OF THE
           ABOVE ONE, PLEASE HELP ME OUT.
  
          [...CODE :2
               WHERE DECLARATONS FOR BELOW ARE AS 
           FOLLOWS...
                 my $pageNum =$query->param('pageNum'); 
                 unless($pageNum) {
                      $pageNum=1;
                   } 
                 my $offset=$query->param('offset');
                         unless($offset) {
                         $offset=3;
                     }
               AND 
                 my $dbh = DBI->connect
                 ("dbi:SQLite:DEVICE.db","", "",
                 {
                 RaiseError => 1,
                 AutoCommit => 1
                  }
                  );
                  my $query =$dbh->selectall_arrayref
                  ('SELECT * FROM UsersList');
                  my $numOfRec=@$query ;
  
                  my $numofPages = ceil($numOfRec / 
                   $offset);  
  
                  /*HERE'S THE CODE WHICH I WANT TO 
                   REPLACE IN PLACE OF CODE:1*/
               if ( $pageNum > 0 ) {
              print q[<td><a href="Employees.cgi?pageNum=1
               ">|&lt;</a></td>];
              $pageN  = $pageNum - 1;
              print qq[<td><a href="Employees.cgi?
               pageNum=$pageN">&lt;</a></td>];
                 }
             else  {
                   print q[<td><span
               class="currentpage">|&lt;</span></td>];
                   print q[<td><span
              class="currentpage">&lt;</span></td>];
                   }
  
             if ( $pageNum < ( $numofPages - 1 )) {
                  $pageN  = $pageNum + 1;
#                  print qq[<td><a href="Employees.cgi?
#                    pageNum=$pageN">&gt;</a></td>];
#                  print qq[<td><a href="Employees.cgi?
#                   pageNum=$numofPages">&gt;|</a></td>];
#                 } 
#              else {
#             print q[<td><span
#                 class="currentpage">&gt;</span></td>];
#             print q[<td><span 
#                 class="currentpage">&gt;|</span></td>];
#                 }    ...]  THE END...
#  
#              /*REST OF THE CODE AND AN ERROR WHICH I 
#               GONA MENTION BELOW AT THAT PARTICULAR 
#               LINE */
#  
#               my $sth = $dbh->prepare("SELECT
#     EmployeeId,EmployeeName,Address,Company,Role,
#     Branch FROM Employees 
#                   limit ?,? ");
#              $sth->bind_param(1, undef,SQL_NUMERIC);
#              $sth->bind_param(2, undef,SQL_NUMERIC);
#            Line:64  $sth->execute
#                   ($page,$results_per_page); 
#           /* ERROR:DBD::SQLite::st execute 
#              failed: datatype mismatch at C:/Program
#              Files/Apache SoftwareFoundation/Apache2.2
#               /cgi-bin/Employee.cgi line 64.*/
#  
#               print start_html('Employee LIST'),
#               table({-border=>'1',width=>'100%'}),
#               Tr({-align=>'CENTER', -valign=>'TOP'},
#               [
#               th(["EmployeeId"
#                 ,"EmployeeName","Address","Company","Role
#                   ","Branch "] )
#               ]);
#              while (my ($EmployeeId
#       ,$EmployeeName,$Address,$Company,$Role,$Branch ) = 
#                    $sth->fetchrow_array()) {
#                     if ($UserName eq "") {
#                                $UserName="UNDEF";
#                                           }
#          print Tr ({-align=>'CENTER',},
#                 [
#                 td([$EmployeeId
#         ,$EmployeeName,$Address,$Company,$Role,
#               $Branch ]),
#                 ]);
#               }
