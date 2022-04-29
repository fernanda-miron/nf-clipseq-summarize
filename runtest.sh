input_paraclu="test/data/paraclu/annotated_exp1_rep1.10_200nt_2.peaks.bed.gz"
input_piranha="test/data/piranha/annotate_exp1_rep1.3nt_3nt.peaks.bed.gz"
output_directory="test/results"

echo -e "======\n Testing NF execution \n======" \
&& rm -rf $output_directory \
&& nextflow run main.nf \
	--input_paraclu $input_paraclu \
	--input_piranha $input_piranha \
	--output_dir $output_directory \
	-resume \
	-with-report $output_directory/`date +%Y%m%d_%H%M%S`_report.html \
	-with-dag $output_directory/`date +%Y%m%d_%H%M%S`.DAG.html \
&& echo -e "======\n Basic pipeline TEST SUCCESSFUL \n======"
