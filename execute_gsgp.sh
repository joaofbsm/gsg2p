#!/bin/bash
#title          :execute_gsgp.sh
#description    :Execute GSGP for all specified datasets
#author         :Joao Francisco B. S. Martins
#date           :01.02.2018
#usage          :bash execute_gsgp.sh
#bash_version   :GNU bash, version 4.4.0(1)-release
#==============================================================================

datasets=("airfoil" "ccn" "ccun" "concrete" "energyCooling" "energyHeating" "parkinsons" "ppb" "towerData" "wineRed" "wineWhite" "yacht" "keijzer-1" "keijzer-2" "keijzer-3" "keijzer-4" "keijzer-6" "keijzer-7" "keijzer-8" "keijzer-9" "vladislavleva-1" "vladislavleva-2" "vladislavleva-3" "vladislavleva-4" "vladislavleva-5" "vladislavleva-7" "vladislavleva-8")
gsgp_path=$(pwd)"/gsgp/out/artifacts/gsgp_jar"
experiments_path=$(pwd)"/experiments/gsgp"
results_path=$(pwd)"/results/gsgp"
scripts_path=$(pwd)"/scripts"

mkdir -p "$results_path"

for dataset in "${datasets[@]}"
do
    echo "Executing $dataset"
    java -Xms512m -Xmx8g -jar "$gsgp_path"/gsgp.jar -p "$experiments_path"/"$dataset".txt > "$results_path"/"$dataset".txt
done