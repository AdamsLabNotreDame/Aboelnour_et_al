import scanpy as sc
import scvi

# Load data
adata = sc.read_h5ad('/scratch365/eaboelno/Macnair_biorxiv_MS/adata_hvg.h5ad')

# Set up and run model
scvi.model.SCVI.setup_anndata(adata, layer="counts", batch_key="sample_id_anon", continuous_covariate_keys=["nCount_RNA", "pct_mito"])

model = scvi.model.SCVI(adata, n_layers=2, n_latent=30, gene_likelihood="nb")

model.train(
    check_val_every_n_epoch=1,
    max_epochs=400,
    early_stopping_patience=20,
    early_stopping_monitor="elbo_validation",
)

model.save('/scratch365/eaboelno/Macnair_biorxiv_MS/Macnair_WM.model')

# Save output to adata
adata.obsm['X_scVI'] = model.get_latent_representation()

adata.layers['scvi_normalized'] = model.get_normalized_expression(library_size=1e4)

sc.pp.neighbors(adata, use_rep='X_scVI', n_neighbors=20)

sc.tl.umap(adata, min_dist=0.2)

sc.tl.leiden(adata, resolution=0.5, key_added="scVI_leiden_0.5")
sc.tl.leiden(adata, resolution=1, key_added="scVI_leiden_1")

adata.write_h5ad('/scratch365/eaboelno/Macnair_biorxiv_MS/WM_scVI_model.h5ad')
