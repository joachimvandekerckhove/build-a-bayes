### Plots and outputs

## Standardized plotting
pax = seq(0, 1, .001)

blue <- rgb(0.3, 0.3, 1.0, alpha=0.5)
red  <- rgb(1.0, 0.3, 0.3, alpha=0.5)
grey <- rgb(0.2, 0.2, 0.2, alpha=0.6)

uci.blue <- rgb( .00, .39, .64)
uci.gold <- rgb( .96, .81, .30)

dark.blue <- rgb(0.3, 0.3, 1.0)
dark.red  <- rgb(1.0, 0.3, 0.3)

dark.gray  <- rgb(0.35, 0.35, 0.35)
light.gray <- rgb(0.85, 0.85, 0.85)

dark.gray  <- rgb(0, 0, 0)
light.gray <- rgb(0.85, 0.85, 0.85)

get.color <- function(i) {
  o = list()
  if (is.null(i) || i$prf) {
    o$col.set = c(light.gray, dark.gray)  # printer friendly
    o$border.color = 'black'
  } else {
    o$col.set = c(uci.gold, uci.blue)  # go anteaters
    o$border.color = NA
  }
  o
}

plot.normal.pdf <- function(n, i, type){
  fcn = n[[type]]
  p  =  fcn$get.input(i)
  nax = n$parameter.domain()
  
  yax0 = fcn$yax0(nax, p)
  yax1 = fcn$yax1(nax, p)
  
  may0 <- max(yax0)
  may1 <- max(yax1)
  rang <- max(may0, may1)
  
  matplot (nax, 
           cbind(fcn$yax0(nax, p), fcn$yax1(nax, p)), 
           xlab = n$pxlab,
           ylab = n$pylab,
           ylim=c(-rang*0.05, rang*1.35),
           type="l", lwd=3, lty=1:2, col = get.color(i)$col.set)
  
  if(is.null(fcn$legend)) { 
    fcn$legend <- c(expression('H'[0]), expression('H'[1])) 
    }

  legend("topleft",
         legend = rev(fcn$legend),
         col = rev(get.color(i)$col.set), 
         lwd=3, lty=2:1, bty = "n")
}
plot.normal.data <- function(n, i, type){
  fcn = n[[type]]
  p  =  fcn$get.input(i)
  nax = n$data.domain()
  
  yax0 = fcn$mrg0(nax, p)
  yax1 = fcn$mrg1(nax, p)
  
  may0 <- max(yax0)
  may1 <- max(yax1)
  rang <- max(may0, may1)
  
  matplot (nax, 
           cbind(yax0, yax1), 
           xlab = n$dxlab,
           ylab = n$dylab,
           ylim=c(-rang*0.05, rang*1.35),
           type="l", lwd=3, lty=1:2, col = get.color(i)$col.set)
  abline(v = p$data, col = "black", lwd=3)

  if(is.null(fcn$legend)) { 
    fcn$legend <- c(expression('H'[0]), expression('H'[1])) 
  }
  
  legend("topleft",
         legend = rev(fcn$legend),
         col = rev(get.color(i)$col.set), 
         lwd=3, lty=2:1, bty = "n")
}
plot.bino.pdf <- function(b, i, type){
  fcn = b[[type]]
  p  =  fcn$get.input(i)
  bax = b$parameter.domain()
  
  yax0 = fcn$yax0(bax, p)
  yax1 = fcn$yax1(bax, p)
  
  may0 <- max(yax0)
  may1 <- max(yax1)
  rang <- max(may0, may1)
  
  matplot (bax, 
           cbind(yax0, yax1), 
           xlab = b$pxlab,
           ylab = b$pylab,
           ylim=c(-rang*0.05, rang*1.35),
           type="l", lwd=3, lty=1:2, col = get.color(i)$col.set)
  
  if(is.null(fcn$legend)) { 
    fcn$legend <- c(expression('H'[0]), expression('H'[1])) 
  }
  
  legend("topleft",
         legend = rev(fcn$legend),
         col = rev(get.color(i)$col.set), 
         lwd=3, lty=2:1, bty = "n")
}
plot.bino.data <- function(b, i, type){
  fcn = b[[type]]
  p   = fcn$get.input(i)
  bax = b$data.domain(p$N)

  yax0 = fcn$mrg0(bax, p)
  yax1 = fcn$mrg1(bax, p)
  
  mbx = rep(0, p$N)
  mbx[p$wins+1] = max(yax0[p$wins+1], yax1[p$wins+1])
    
  if (p$N < 500) {
#    barplot(yax0, 1, space=.0, col=blue, names.arg = bax,
#            xlab = b$dxlab,
#            ylab = b$dylab,
#            border = NA)
#    barplot(yax1, 1, space=.0, col=red , add=TRUE, border=NA)
#    usr = par("usr")
#    mbx[p$wins+1] = usr[4]
#    barplot(mbx , 1, space=.0, col=grey, add=TRUE, border=NA) 
    
    may0 <- max(yax0)
    may1 <- max(yax1)
    rang <- may0 + may1
    arfrac <- 1/36
    arlen <- 8
    
    barplot( yax1, 1, space=.1, col=get.color(i)$col.set[2], names.arg=bax, border=get.color(i)$border.color,
             xlab = b$dxlab,
             ylab = b$dylab,
             ylim=c(-may0-rang*0.25, may1+rang*0.75))
    barplot(-yax0, 1, space=.1, col=get.color(i)$col.set[1] , add=TRUE, border=get.color(i)$border.color)
    abline(h=0)
    
    d = p$wins
    x0 = d*1.1 + .65
    arrows(x0,  yax1[d+1]+rang*(arlen*arfrac), x0,  yax1[d+1]+rang*(arfrac)*3, .1, lwd = 2)
    arrows(x0, -yax0[d+1]-rang*(arlen*arfrac), x0, -yax0[d+1]-rang*(arfrac)*3, .1, lwd = 2)
    
  } else {
    matplot(bax, cbind (yax0, yax1), 
            xlab = b$dxlab,
            ylab = b$dylab,
            type="l", lwd=3, lty=1:2, col="black")
    title(main="Note: If N > 500, the plot becomes a line.",
          col.main = "red",
          cex.main = 0.75)
    abline(v=p$data, col="red", lwd=3)
  } 

  if(is.null(fcn$legend)) { 
    fcn$legend <- c(expression('H'[0]), expression('H'[1])) 
  }
  
  legend("topleft", 
         legend = rev(fcn$legend),
         fill = rev(get.color(i)$col.set), 
         bty = "n")
}
plot.lilo <- function(n, i, type) {
  fcn = n[[type]]
  p  =  fcn$get.input(i)
  bf = get.bf(fcn, p)

  post = 1/ (1 + bf$value * (1-p$p)/p$p)

  matplot (pax, 1 / (1 + bf$value * (1 - pax) / pax), 
           xlab = expression(paste(plain("prior probability: P("), 'H'[0], ")")),
           ylab = expression(paste(plain("posterior probability: P("), 'H'[0], "|x)")),
           ylim = c(0,1),
           type="l", lwd=3, lty=1:2, col = "black")
  abline(v = p$p, col = "red", lwd=3)
  abline(h = post, col = "red", lwd=3)

  if (post < .5)
    yloc = post + .08
  else
    yloc = post - .08
  text(.1, y = yloc, labels = sprintf('%.3f', post), col = "red")

  if (p$p < .5)
    xloc = p$p + .04
  else
    xloc = p$p - .04
  text(x = xloc, .1, labels = sprintf('%.3f', p$p), col = "red", srt = -90)
#seq_along(x$x), adj = NULL,
#     pos = NULL, offset = 0.5, vfont = NULL,
#     cex = 1, col = NULL, font = NULL, ...)
}


## Standardized text output
text.bf <- function(n, i, type) {
  fcn = n[[type]]
  p  =  fcn$get.input(i)
  bf = get.bf(fcn, p)

  if (bf$value < 1) {
    bfx = 1/bf$value
    mod = "null"
    bfw = bf$y0
    bfl = bf$y1
  }
  else {
    bfx = bf$value
    mod = "alternative"
    bfw = bf$y1
    bfl = bf$y0
  }
  sprintf("At the observed data (x = %g; N = %g),
           the Bayes factor favoring the %s is %.4g / %.4g = %.4g.", 
           p$data, p$N, mod, bfw, bfl, bfx)
}
text.post <- function(n, i, type) {
  fcn = n[[type]]
  p  =  fcn$get.input(i)
  bf = get.bf(fcn, p)

  sprintf("The probability that the null is true is %.2f.", 
          1/ (1 + bf$value * (1-p$p)/p$p))
}

## Calculations
get.bf <- function(fcn, p) {
    bf = list(
           y0 = fcn$mrg0(p$data, p),
           y1 = fcn$mrg1(p$data, p)
         )
    bf$value = bf$y1 / bf$y0
    bf
}


