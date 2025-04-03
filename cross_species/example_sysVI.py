import os
import tempfile

import matplotlib.pyplot as plt
import scanpy as sc
import pandas as pd
import seaborn as sb
import numpy as np
import torch
from rich import print
from scib_metrics.benchmark import Benchmarker

# Reproducibility
import scvi
from scvi.external import SysVI
scvi.settings.seed = 0

adata = sc.read_h5ad('/scratch365/eaboelno/cVAE_analysis/sysVI/NEW_adata_all_mergedHVG_CAPS.h5ad')

# Setup adata for training
SysVI.setup_anndata(
    adata=adata,
    batch_key="system",
    categorical_covariate_keys=["batch"],
)

# Initialise the model
model = SysVI(adata=adata)

# Train
max_epochs = 200
model.train(
    max_epochs=max_epochs,
    # Parameters used for checking losses
    log_every_n_steps=1,
    check_val_every_n_epoch=1,
    val_check_interval=1.0,
)

SYSVI_LATENT_KEY = "X_sysVI"
adata.obsm[SYSVI_LATENT_KEY] = model.get_latent_representation(adata=adata)

sc.pp.neighbors(adata, use_rep = 'X_sysVI', n_neighbors=30) #can go up if the dataset is very large
sc.tl.umap(adata, min_dist=0.2) #increase min_dist reduces general features
sc.tl.leiden(adata, resolution=1, key_added="sys_leiden_1")
sc.tl.leiden(adata, resolution=1.5, key_added="sys_leiden_1.5")
sc.tl.leiden(adata, resolution=2, key_added="sys_leiden_2")

# Save output
model.save('/scratch365/eaboelno/cVAE_analysis/sysVI/NEW_sysVI_all_merged_model')

adata.obsm['system'].columns = ['mouse-sn', 'mouse-sc', 'human-sn']
adata.write_h5ad('/scratch365/eaboelno/cVAE_analysis/sysVI/NEW_all_sysVI_intg.h5ad')

# Make detailed plot after N epochs
epochs_detail_plot = 100
steps_detail_plot = epochs_detail_plot * int(
    model.trainer.logger.history["loss_validation"].shape[0] / max_epochs
)
detail_plot = epochs_detail_plot

# Losses to plot
losses = [
    "loss_train",
    "reconstruction_loss_train",
    "kl_local_train",
    "z_distance_cycle_train",
]
fig, axs = plt.subplots(2, len(losses), figsize=(len(losses) * 3, 4))
for ax_i, l_train in enumerate(losses):
    l_val = l_train.replace("_train", "_validation")
    l_name = l_train.replace("_train", "")
    # Change idx of epochs to start with 1 so that below adjustment when
    # train on step which only works for val leads to appropriate multiplication
    l_val_values = model.trainer.logger.history[l_val].copy()
    l_val_values.index = l_val_values.index + 1
    l_train_values = model.trainer.logger.history[l_train].copy()
    l_train_values.index = l_train_values.index + 1
    # This happens if log on step as currently this works only for val loss
    if l_train_values.shape[0] < l_val_values.shape[0]:
        l_train_values.index = l_train_values.index * int(
            l_val_values.shape[0] / l_train_values.shape[0]
        )
    for l_values, c, alpha, dp in [
        # Train loss logged on epoch in either case now
        (l_train_values, "tab:blue", 1, epochs_detail_plot),
        (l_val_values, "tab:orange", 0.5, detail_plot),
    ]:
        axs[0, ax_i].plot(l_values.index, l_values.values.ravel(), c=c, alpha=alpha)
        axs[0, ax_i].set_title(l_name)
        axs[1, ax_i].plot(
            l_values.index[dp:], l_values.values.ravel()[dp:], c=c, alpha=alpha
        )

fig.tight_layout()

# Save the plot
plt.savefig('/scratch365/eaboelno/cVAE_analysis/sysVI/NEW_all_model_losses_plot.png')
