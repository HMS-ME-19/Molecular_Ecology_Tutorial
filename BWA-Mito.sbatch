#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH -t 00:15:00
#SBATCH --mem 24000

./bwa mem Amil.mito.linear.fa 07.011.forward.fq.gz 07.011.reverse.fq.gz > 07.011.sam
samtools view -S -b 07.011.sam > 07.011.bam
samtools sort 07.011.bam 07.011.sort
samtools mpileup -uf Amil.mito.linear.fa 07.011.sort.bam | bcftools view -bvcg - > 07.011.var.raw.bcf
bcftools view 07.011.var.raw.bcf | perl vcfutils.pl varFilter -D250 > 07.011.var.flt.vcf


