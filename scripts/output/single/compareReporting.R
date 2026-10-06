library(piamutils)

if (!exists("source_include")) {
  # Define arguments that can be read from command line
  outputdir <- "."
  lucode2::readArgs("outputdir", "gdx_name", "gdx_ref_name", "gdx_refpolicycost_name")
}
stopifnot(exists("outputdir"))

a <- read.report(file.path(outputdir, "validate_remind2_before.mif"), as.list = FALSE)
b <- read.report(file.path(outputdir, "validate_remind2_after.mif"), as.list = FALSE)
piamutils::compareMagpieObject(a, b)

a <- read.csv(file.path(outputdir, "validate_lcoe_before.mif"), sep = ";")
b <- read.csv(file.path(outputdir, "validate_lcoe_after.mif"), sep = ";")
piamutils::compareMagpieObject(as.magpie(a), as.magpie(b))

