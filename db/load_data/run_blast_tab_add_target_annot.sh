BLASTRES=Hcit.orf.130207s1.pep_ALL.fasta.vs.nr.blast.fmt6.txt
#Hful.orf.130207s1.pep_ALL.fasta.vs.nr.blast.fmt6.txt

NRDB=/home/DB/blastdb/nr

FILE1=`basename $BLASTRES .txt`.ann.txt
ruby ~/dev/gists/3303961/blast_tab_add_target_annot.rb $BLASTRES $NRDB > $FILE1

FILE2=${FILE1/ann/ann2}
ruby ~/dev/gists/3366873/nr_taxinfo.rb $FILE1 $NRDB 1 > $FILE2

