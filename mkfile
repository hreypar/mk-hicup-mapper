# DESCRIPTION:
# mk module to run hicup_mapper
#
# USAGE:
# Single target execution: `mk <TARGET>` where TARGET is
# any line printed by the script `bin/targets`
#
# Multiple target execution in tandem `bin/targets | xargs mk`
#
# AUTHOR: HRG
#
# Load configuration file
< config.mk
#
# Run HiCUP mapper script
#
results/%.pair.sam:	data/%_R1.trunc.fastq.gz data/%_R2.trunc.fastq.gz
	mkdir -p `dirname $target`
	hicup_mapper \
		--threads $HM_THREADS_NUMBER \
		--bowtie2 $BOWTIE2_PATH \
		--index $BOWTIE2_INDEX_PATH \
		--outdir `dirname $target` \
		$prereq


