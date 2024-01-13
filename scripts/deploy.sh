#!/bin/bash
# Deploy all Solana Programs in a Folder to Testnet
# Set the parent folder containing Solana programs
parent_folder="../program"
# Iterate over each program folder
for program_folder in "$parent_folder"/*;do
    if [[ -d "$program_folder" && -f "$program_folder/src/main.rs" ]]; then
        program_name=$(basename "$program_folder")
        echo "Compiling and deploying $program_name..."
        solana compile "$program_folder"
        solana deploy "$program_folder"/target/deploy/"$program_name".so --testnet
        echo "Done."
    fi
done
echo "All Solana programs deployed to testnet."
