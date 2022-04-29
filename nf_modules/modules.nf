#!/usr/bin/env nextflow

/*Modulos de prueba para  nextflow */
results_dir = "./test/results"
intermediates_dir = "./test/results/intermediates"

process selecting_important_info {

publishDir "${results_dir}/cut_file", mode:"copy"

	input:
	path paraclu_file

	output:
	path cutedfile

	"""
	cut -f1-3,15 ${paraclu_file} > cutedfile
	"""
}

process cleaning_data {

publishDir "${results_dir}/clean_data", mode:"copy"

	input:
	path p1
	file rscript

	output:
	path clean_data

	"""
	Rscript --vanilla annotation.R ${p1}
	"""
}

process annotation_count {

publishDir "${results_dir}/final_count_results", mode:"copy"

	input:
	path p2

	output:
	path final_count

	"""
	cut -f4 clean_data | sort | uniq -c > final_count
	"""
}
