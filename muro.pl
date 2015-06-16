#!/usr/bin/perl -wT
use DBI;
use CGI qw(:standard);

my $n=param('n');
my $c=param('c');

$hostname='localhost';
$port=3306;
$username='pw1';
$password='epis';
$database='comentarios';
print "Content-type: text/html\n\n";
print "hay vida!";
$dsn="DBI:mysql:database=$database;host=$hostname;port=$port";

$dbh=DBI->connect($dsn, $username, $password) or die("No se pudo conectar!");
$sth=$dbh->prepare('INSERT INTO coment(nick, comen) VALUES (?,?)');
$sth->execute($n,$c);
$dbh->disconnect();
