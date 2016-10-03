This is a simple package that contains color palettes that I typically use to visualize data in R. There are currently two palettes:  cb.cols() generates colors from a colorblind-friendly palette, and nd.cols() generates the official university colors of Notre Dame. To visualize each palette, use the function col.options() after installing the package,

    devtools::install_github("dmcartor/dbmcols")
    library(dbmcols)
    col.options()
