### Model definitions

## Normal models
normal.definitions <- function() {
    normal = list()

    # Plot legends
    normal$point    $legend <- c('point null hypothesis'        , 'slab hypothesis')
    normal$interval $legend <- c('negligible-effect hypothesis' , 'slab hypothesis')
    normal$crud     $legend <- c('crud null hypothesis'         , 'slab hypothesis')
    normal$signed   $legend <- c('negative-effect hypothesis'   , 'positive-effect hypothesis')
    
    # Likelihood and marginal functions
    normal$point   $yax0 = function(x, p) { dpulse     (x, 0, 100)                         }
    normal$point   $yax1 = function(x, p) { dnorm      (x, 0, 1)                           }
    normal$point   $mrg0 = function(x, p) { dnorm      (x, 0, 1/sqrt(p$N))                 }
    normal$point   $mrg1 = function(x, p) { dnormnorm  (x, 0, 1, 1/sqrt(p$N))              }

    normal$interval$yax0 = function(x, p) { dinterval  (x, 0, p$eps)                       }
    normal$interval$yax1 = function(x, p) { dnorm      (x, 0, 1)                           }
    normal$interval$mrg0 = function(x, p) { dinternorm (x, 0, p$eps, 1/sqrt(p$N))          }
    normal$interval$mrg1 = function(x, p) { dnormnorm  (x, 0, 1, 1/sqrt(p$N))              }

    normal$crud    $yax0 = function(x, p) { dcrud      (x, p$tau)                          }
    normal$crud    $yax1 = function(x, p) { dnorm      (x, 0, 1)                           }
    normal$crud    $mrg0 = function(x, p) { dnormnorm  (x, 0, p$tau, 1/sqrt(p$N))          }
    normal$crud    $mrg1 = function(x, p) { dnormnorm  (x, 0, 1, 1/sqrt(p$N))              }

    normal$signed  $yax0 = function(x, p) { dhnorm     (x, left=T)                         }
    normal$signed  $yax1 = function(x, p) { dhnorm     (x, left=F)                         }
    normal$signed  $mrg0 = function(x, p) { dtnormnorm (x, 0, 1, 1/sqrt(p$N), left=T)      }
    normal$signed  $mrg1 = function(x, p) { dtnormnorm (x, 0, 1, 1/sqrt(p$N), left=F)      }

    # Get functions
    normal$point    $get.input = function(input){
      p = list(
        N    = input$normal.point.N,
        data = input$normal.point.data,
        p    = input$normal.point.prior
      )
      p
    }
    normal$interval $get.input = function(input){
      p = list(
        N    = input$normal.interval.N,
        data = input$normal.interval.data,
        p    = input$normal.interval.prior,
        eps  = input$normal.interval.eps
      )
      p
    }
    normal$crud     $get.input = function(input){
      p = list(
        N    = input$normal.crud.N,
        data = input$normal.crud.data,
        p    = input$normal.crud.prior,
        tau  = input$normal.crud.tau
      )
      p
    }
    normal$signed   $get.input = function(input){
      p = list(
        N    = input$normal.signed.N,
        data = input$normal.signed.data,
        p    = input$normal.signed.prior
      )
      p
    }

    # Plotting defaults
    normal$parameter.domain = function(N) { seq(-4, 4, .001) }
    normal$data.domain      = function(N) { seq(-4, 4, .001) }
    normal$pxlab = expression(paste(plain("value of parameter ("), mu, plain(") under two rival hypotheses")))
    normal$pylab = "density"
    normal$dxlab = "value of predicted data (x) under each hypothesis"
    normal$dylab = "density"
    
    normal
}


## Binomial models
bino.definitions <- function() {
    bino = list()

    # Plot legends
    bino$point    $legend <- c('point null hypothesis'        , 'slab hypothesis')
    bino$interval $legend <- c('negligible-effect hypothesis' , 'slab hypothesis')
    bino$custom   $legend <- c('point null hypothesis'        , 'interval hypothesis')
    bino$notched  $legend <- c('negligible-effect hypothesis' , 'non-negligible-effect hypothesis')
    bino$informed $legend <- c('point null hypothesis'        , 'prior-informed hypothesis')
    bino$pointvp  $legend <- c('point null hypothesis'        , 'competing-point hypothesis')
    bino$signed   $legend <- c('uniformly negative hypothesis', 'uniformly positive hypothesis')
    
    # Likelihood and marginal functions
    bino$point   $yax0 = function(x, p) { dpulse      (x, 0.5)                            }
    bino$point   $yax1 = function(x, p) { dunif       (x, 0.0,  1.0)                      }
    bino$point   $mrg0 = function(x, p) { dbinom      (x, p$N,  0.5)                      }
    bino$point   $mrg1 = function(x, p) { dbetabinom  (x, p$N,  0.5, 2.0)                 }

    bino$interval$yax0 = function(x, p) { dinterval   (x,  0.5, p$eps)                    }
    bino$interval$yax1 = function(x, p) { dunif       (x,  0.0, 1.0)                      }
    bino$interval$mrg0 = function(x, p) { dinterbinom (x, p$N , 0.5, p$eps)               }
    bino$interval$mrg1 = function(x, p) { dbetabinom  (x, p$N , 0.5, 2)                   }

    bino$custom  $yax0 = function(x, p) { dpulse      (x,  0.5)                           }
    bino$custom  $yax1 = function(x, p) { dunif       (x, p$loc, p$upc)                   }
    bino$custom  $mrg0 = function(x, p) { dbinom      (x, p$N ,  0.5)                     }
    bino$custom  $mrg1 = function(x, p) { dunifbinom  (x, p$N , p$loc, p$upc)             }

    bino$notched $yax0 = function(x, p) { dunif       (x, p$lon, p$upn)                   }
    bino$notched $yax1 = function(x, p) { dnotch      (x, p$lon, p$upn)                   }
    bino$notched $mrg0 = function(x, p) { dunifbinom  (x, p$N , p$lon, p$upn)             }
    bino$notched $mrg1 = function(x, p) { dnotchbinom (x, p$N , p$lon, p$upn)             }

    bino$informed$yax0 = function(x, p) { dpulse      (x,  0.5)                           }
    bino$informed$yax1 = function(x, p) { dbeta       (x, p$a , p$b )                     }
    bino$informed$mrg0 = function(x, p) { dbinom      (x, p$N ,  0.5)                     }
    bino$informed$mrg1 = function(x, p) { dbetabinom  (x, p$N , p$a/(p$a+p$b), (p$a+p$b)) }

    bino$pointvp $yax0 = function(x, p) { dpulse      (x,   0.5)                          }
    bino$pointvp $yax1 = function(x, p) { dpulse      (x, p$alt)                          }
    bino$pointvp $mrg0 = function(x, p) { dbinom      (x, p$N  ,   0.5)                   }
    bino$pointvp $mrg1 = function(x, p) { dbinom      (x, p$N  , p$alt)                   }

    bino$signed  $yax0 = function(x, p) { dunif       (x, 0.0, 0.5)                       }
    bino$signed  $yax1 = function(x, p) { dunif       (x, 0.5, 1.0)                       }
    bino$signed  $mrg0 = function(x, p) { dunifbinom  (x, p$N, 0.0, 0.5)                  }
    bino$signed  $mrg1 = function(x, p) { dunifbinom  (x, p$N, 0.5, 1.0)                  }

    # Get functions
    default.data = list(p=.9, wins=15, losses=10, data=15, N=25, eps=.03, loc=.5, upc=1.0, lon=.47, upn=.53, alt=.53, a=53, b=47)
    
    bino$point    $get.input = function(input){
      if(is.null(input)) { return(default.data) }
      p = list(
        wins   = input$bino.point.wins,
        losses = input$bino.point.losses,
        p      = input$bino.point.prior
      )
      p$data = p$wins
      p$N    = p$wins + p$losses
      p
    }
    bino$interval $get.input = function(input){
      if(is.null(input)) { return(default.data) }
      p = list(
        wins   = input$bino.interval.wins,
        losses = input$bino.interval.losses,
        p      = input$bino.interval.prior,
        eps    = input$bino.interval.eps
      )
      p$data = p$wins
      p$N    = p$wins + p$losses
      p
    }
    bino$custom   $get.input = function(input){
      if(is.null(input)) { return(default.data) }
      p = list(
        wins   = input$bino.custom.wins,
        losses = input$bino.custom.losses,
        p      = input$bino.custom.prior,
        loc    = input$bino.custom.lower,
        upc    = input$bino.custom.upper
      )
      p$data = p$wins
      p$N    = p$wins + p$losses
      p
    }
    bino$notched  $get.input = function(input){
      if(is.null(input)) { return(default.data) }
      p = list(
        wins   = input$bino.notched.wins,
        losses = input$bino.notched.losses,
        p      = input$bino.notched.prior,
        lon    = input$bino.notched.lower,
        upn    = input$bino.notched.upper
      )
      p$data = p$wins
      p$N    = p$wins + p$losses
      p
    }
    bino$informed $get.input = function(input){
      if(is.null(input)) { return(default.data) }
      p = list(
        wins   = input$bino.informed.wins,
        losses = input$bino.informed.losses,
        p      = input$bino.informed.prior,
        a      = input$bino.informed.a,
        b      = input$bino.informed.b
      )
      p$data = p$wins
      p$N    = p$wins + p$losses
      p
    }
    bino$pointvp  $get.input = function(input){
      if(is.null(input)) { return(default.data) }
      p = list(
        wins   = input$bino.pointvp.wins,
        losses = input$bino.pointvp.losses,
        p      = input$bino.pointvp.prior,
        alt    = input$bino.pointvp.alt
      )
      p$data = p$wins
      p$N    = p$wins + p$losses
      p
    }
    bino$signed   $get.input = function(input){
      if(is.null(input)) { return(default.data) }
      p = list(
        wins   = input$bino.signed.wins,
        losses = input$bino.signed.losses,
        p      = input$bino.signed.prior
      )
      p$data = p$wins
      p$N    = p$wins + p$losses
      p
    }

    # Plotting defaults
    bino$parameter.domain = function(N) { seq(0, 1, .001) }
    bino$data.domain      = function(N) { 0:N             }
    bino$pxlab = expression(paste(plain("value of parameter ("), theta, plain(") under two rival hypotheses")))
    bino$pylab = "density"
    bino$dxlab = "predicted number of wins under each hypothesis"
    bino$dylab = "probability"
    
    bino
}
