import pandas as pd

# Read the data from the CSV file
data = pd.read_csv("datasets/Diff_genes_heatmap_NSIP-CHP.csv")  # Replace with your actual file path

# Define column names for log2 fold change and adjusted p-value (replace with actual names)
log2_fold_change_col = "log2.Fold.Change"
adj_pval_col = "Adj.Pval"

# Define the p-value cutoff
p_cutoff = 0.05

user_response = str(input("Enter the gene type filter: "))
# Filter for protein-coding genes (step 1)
protein_coding_data = data[data["Type"] == user_response]

# Filter for significant adjusted p-value (step 2)
filtered_data = protein_coding_data[protein_coding_data[adj_pval_col] < p_cutoff]

# Save the filtered data to a new CSV file
filtered_data.to_csv("filtered_data.csv", index=False)

print("Filtered data saved to filtered_data.csv")
