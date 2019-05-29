# Molecular_Ecology_Tutorial
#To begin, login to Farmshare:
SUid@rice.stanford.edu

#Enter the following to change directories:

cd /home/suid

#Install BWA, enter:

git clone https://github.com/lh3/bwa.git

cd bwa

make

#Confirm that BWA successfully installed, enter:

./bwa

#You should see the help screen for bwa after you do this

Program: bwa (alignment via Burrows-Wheeler transformation)
Version: 0.7.17-r1198-dirty
Contact: Heng Li <lh3@sanger.ac.uk>

Usage:   bwa <command> [options]

Command: index         index sequences in the FASTA format
         mem           BWA-MEM algorithm
         fastmap       identify super-maximal exact matches
         pemerge       merge overlapping paired ends (EXPERIMENTAL)
         aln           gapped/ungapped alignment
         samse         generate alignment (single ended)
         sampe         generate alignment (paired ended)
         bwasw         BWA-SW for long queries

         shm           manage indices in shared memory
         fa2pac        convert FASTA to PAC format
         pac2bwt       generate BWT from PAC
         pac2bwtgen    alternative algorithm for generating BWT
         bwtupdate     update .bwt to the new format
         bwt2sa        generate SA from BWT and Occ

Note: To use BWA, you need to first index the genome with `bwa index'.
      There are three alignment algorithms in BWA: `mem', `bwasw', and
      `aln/samse/sampe'. If you are not sure which to use, try `bwa mem'
      first. Please `man ./bwa.1' for the manual.
#Next


#For 5.29.19:

#Goal is to assess relative proportions of Cladocopium and Durisdinium (formerly Clades "C" and "D" of the genus Symbiodinium) in corals from 3 different locations that vary in their bleaching resistance and overall symbiont loads
#Run a quick and dirty mapping against markers traditionally used to distinguish the two (ITS2 locus)
#Mapping using BWA requires an index, a set of sequences you are mapping to
#This index is the top 200 hits for "Symbiodinium C ITS2" and "Symbiodinium D ITS2" from NCBI genbank
#I already ran the indexing and created a set of files starting with "Symbiodinium_For_Class.fa"

#To map 
#change into directory containing bwa and copy it so that it will run in the folder we are working in:

cd /home/SUID/bwa
cp bwa /home/SUID/Molecular_Ecology_Tutorial

##Run bash script on the sequence files. These are corals from 3 locations around Palau: Luke's (East side of island), the 20's (Southwestern lagoon) and Ulong (A Forereef site).

bash BWA-Batch.sh 2 *.fq.gz

#Now count the number of times a sequence matched Cladocopium vs. Durisdinium:

bash CvsD.sh *.no.header










