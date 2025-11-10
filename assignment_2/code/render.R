#### Just render everything without params ####
# purrr::map(
#   list.files("code", pattern = "\\.Rmd$", full.names = T),
#   ~ rmarkdown::render(.x, output_dir = "../output")
# )

#### Render file by file with params as assigment states ####
rmarkdown::render(
  "code/PCA_analysis.Rmd", 
  output_dir = "output"
)

rmarkdown::render(
  "code/DEG_analysis.Rmd", 
  output_dir = "output",
  params = list(
    alpha = 0.5,
    top_genes = 15
  )
)