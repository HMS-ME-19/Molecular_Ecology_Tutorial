#!/bin/bash
#USAGE: bash BWA-Batch.sh 2 *.fq.gz
CHUNK=$1
COUNTER=0
FQ="${@:2}"
for i in $FQ; do
    if [ $COUNTER -eq 0 ]; then
    echo -e "#!/bin/bash\n#SBATCH --ntasks=1\n#SBATCH --cpus-per-task=10\n#SBATCH -t 1:00:00\n#SBATCH --mem 24000\n" > TEMPBATCH.sbatch; fi
    var1=${i:0:7}
    BASE=$( basename $var1 )
    echo "./bwa mem Symbiodinium_For_Class.fa ${BASE}forward.fq.gz ${BASE}reverse.fq.gz > ${BASE}align" >> TEMPBATCH.sbatch
    echo "grep -v '^@' ${BASE}align > ${BASE}no.header" >> TEMPBATCH.sbatch
    let COUNTER=COUNTER+1
    if [ $COUNTER -eq $CHUNK ]; then
    sbatch TEMPBATCH.sbatch
    COUNTER=0; fi
done
if [ $COUNTER -ne 0 ]; then
sbatch TEMPBATCH.sbatch; fi

