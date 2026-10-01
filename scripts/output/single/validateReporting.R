library(remind2)

gdx_name <- "fulldata.gdx"
gdx_ref_name <- "input_ref.gdx" # name of the ref for < cm_startyear
gdx_refpolicycost_name <- "input_refpolicycost.gdx" # name of the reference gdx (for policy cost calculation)


if (!exists("source_include")) {
  # Define arguments that can be read from command line
  outputdir <- "."
  lucode2::readArgs("outputdir", "gdx_name", "gdx_ref_name", "gdx_refpolicycost_name")
}
stopifnot(exists("outputdir"))

gdx <- file.path(outputdir, gdx_name)
gdx_ref <- file.path(outputdir, gdx_ref_name)
gdx_refpolicycost <- file.path(outputdir, gdx_refpolicycost_name)
if (!file.exists(gdx_ref)) gdx_ref <- NULL
if (!file.exists(gdx_refpolicycost)) gdx_refpolicycost <- NULL
remind_reporting_file <- file.path(outputdir, paste0("validate_remind2_before.mif"))
extra_data_path <- file.path(outputdir, "reporting")

if (!exists(remind_reporting_file)) {
  remind2::convGDX2MIF(gdx,
    file = remind_reporting_file,
    gdx_refpolicycost = gdx_refpolicycost,
    gdx_ref = gdx_ref,
    extraData = extra_data_path,
  )
}

LCOE_reporting_file <- file.path(outputdir, paste0("validate_lcoe_before.mif"))

if (!exists(LCOE_reporting_file)) {
  remind2::convGDX2CSV_LCOE(gdx, file = LCOE_reporting_file)
}
