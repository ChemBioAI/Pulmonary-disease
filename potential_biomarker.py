from dataset_preprocessing import filtered_data
import pandas as pd

# Read the data from the CSV file
data = pd.read_csv("filtered_data.csv")  # Replace with your actual file path

# Identify the most significant gene (assuming top row)
most_significant_gene_row = data.iloc[1]  # Select the first row using indexing

# Check for empty filtered data (no significant genes)
if len(data) == 0:
  print("Warning: No significant genes found (filtered data is empty).")
else:
  # Print summary statistics for filtered data
  print(data.describe())

  # Access values using column names (assuming a single row)
  log2_fold_change = most_significant_gene_row["log2 Fold Change"]
  adjusted_pval = most_significant_gene_row["Adj.Pval"]
  gene_symbol = most_significant_gene_row["Symbol"]  # Assuming this is the column name for gene symbol


  print("Potential Biomarker:", gene_symbol)
  print("Log2 Fold Change:", log2_fold_change)
  print("Adjusted P-value:", adjusted_pval)
