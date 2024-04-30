import pandas as pd
import matplotlib
matplotlib.use('Agg')  # Using the Agg backend for non-interactive plotting
import matplotlib.pyplot as plt
from sklearn.metrics import roc_auc_score, roc_curve

# Read the data from CSV
data = pd.read_csv("../../datasets/Diff_genes_heatmap_NSIP-CHP.csv")

# Filter columns starting with "NSIP" and "HEALTHY"
columns_to_use = [col for col in data.columns if col.startswith("NSIP") or col.startswith("CHP")]

# Calculate the mean significance value for each gene
data['mean_significance'] = data[columns_to_use].mean(axis=1)

# Filter genes with Type as "protein_coding"
data = data[data['Type'] == 'lncRNA']

# Assign labels based on the 'Regulation' column
labels = (data['Regulation'] == 'Up').astype(int)

# Calculate ROC AUC
auc = roc_auc_score(labels, data['mean_significance'])
print("AUC is: ", auc)

# Plot ROC curve
fpr, tpr, thresholds = roc_curve(labels, data['mean_significance'])
plt.plot(fpr, tpr, label=f'ROC curve (AUC = {auc:.2f})')
plt.plot([0, 1], [0, 1], linestyle='--', color='gray', label='Random')
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('ROC Curve')
plt.legend(loc='lower right')
plt.savefig('NC_curve.png')  # Save the plot as an image
