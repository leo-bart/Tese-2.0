END { 
  system ("make4ht -e mybuild.mk4 -um draft -c my.cfg tese_2p0.tex"); 
  system('zip -r allfiles.zip . -x *.cache*');
}