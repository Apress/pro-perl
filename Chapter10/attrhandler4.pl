#!/usr/bin/perl
# attrhandler4.pl (p314)
use strict;
use warnings;
use Attribute::Handlers;

{
    package UNIVERSAL;
    use Fcntl qw(O_RDWR O_CREAT);

    sub Database : ATTR(HASH) {
        my ($pkg,$sym,$ref,$attr,$data)=@_;

        my ($file,$type,$mode,$perm);
        if (my $reftype=ref $data) {
            die "Data reference not an ARRAY"
                unless $reftype eq 'ARRAY';
            $file = shift @$data;
            $type = shift(@$data) || 'SDBM_File';
            $mode = shift(@$data) || O_RDWR|O_CREAT;
            $perm = shift(@$data) || 0666;
        } else {
            $file = $data;
            ($type,$mode,$perm)=('SDBM_File',O_RDWR|O_CREAT,0666);
        }

        eval "require ${type}" or
            die "${type} not found";

        tie %$ref, $type, $file, $mode, $perm;
    }
}

my %sdbm : Database(mysdbmfile);
$sdbm{key} = 'value';

my %gdbm : Database('mygdbmfile.dbm',GDBM_File);
$gdbm{key} = 'value';
