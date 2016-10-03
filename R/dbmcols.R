#' cb.cols
#'
#' Generate colors from a colorblind-friendly palette
#'
#' @param col Which color you want to use (black, orange, sky blue, green,
#' yellow, blue, vermillion, pink)
#' @param alpha Color transparency
#'
#' @return col Hex code for desired color
#'
#' @author Daniel B. McArtor (dmcartor@nd.edu) [aut, cre]
#'
#' @export
cb.cols <- function(col, alpha = 1.00){

  if(!all(col %in% 1:8)){
    stop("Invalid color selection. Please select from {1, ..., 8}")
  }

  cols <- data.frame(r = c(0.00, 0.90, 0.35, 0.00, 0.95, 0.00, 0.80, 0.80),
                     g = c(0.00, 0.60, 0.70, 0.60, 0.90, 0.45, 0.40, 0.60),
                     b = c(0.00, 0.00, 0.90, 0.50, 0.25, 0.70, 0.00, 0.70),
                     row.names = c('black','orange','skyblue','green','yellow',
                                   'blue', 'vermillion','pink'))
  rgb(cols[col,1], cols[col,2], cols[col,3], alpha)
}

#' nd.cols
#'
#' Get Notre Dame blue and gold
#'
#' @param col Which color you want to use; either a string ('blue', 'gold'), or
#' number (1 = 'blue', 2 = 'gold')
#' @param alpha Color transparency
#'
#' @return col Hex code for desired color
#'
#' @author Daniel B. McArtor (dmcartor@nd.edu) [aut, cre]
#'
#' @export
nd.cols <- function(col, alpha = 1.00){

  if(col == 'blue'){col <- 1}
  if(col == 'gold'){col <- 2}

  if(!(col %in% c(1,2))){
    stop("Invalid color selection. Please select from {1,2} or {'blue','gold'}")
  }

  if(col == 1){
    return(rgb(2/255, 43/255, 91/255, alpha))
  }

  if(col == 2){
    rgb(220/255, 180/255, 57/255, alpha)
  }

}


#' col.options
#'
#' Look at the output for the colorblind palettes available in this package
#'
#' @param alpha Color transparency
#'
#' @author Daniel B. McArtor (dmcartor@nd.edu) [aut, cre]
#'
#' @export
col.options <- function(alpha = 1){
  plot(NA, xlim = c(0, 9), ylim = c(0, 2),
       yaxt = 'n',
       bty = 'n',
       xaxt = 'n',
       main = 'DBM Colors',
       xlab = 'Color Index',
       ylab = '')
  for(k in 1:8){
    rect(xleft = k-0.25, ybottom = 1.25, xright = k+0.25, ytop = 1.75,
         col = cb.cols(k, alpha = alpha), border = rgb(0,0,0,0))
  }
  for(k in 1:2){
    rect(xleft = k-0.25, ybottom = 0.25, xright = k+0.25, ytop = 0.75,
         col = nd.cols(k, alpha = alpha), border = rgb(0,0,0,0))
  }
  axis(1, at = 1:8)
  par(xpd = T)
  text(x = c(0, 0), y = c(1.5, 0.5), labels = c('Colorblind', 'Notre Dame'))

}

