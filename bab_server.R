#################################### Server
server <- function(input, output) {

  #########################
  ## Normal distribution ##
  #########################

  norm <- normal.definitions()

  # Point computations
  output$normal.point.pdf     <- renderPlot({ plot.normal.pdf  (norm, input, "point"    ) })
  output$normal.point.pred    <- renderPlot({ plot.normal.data (norm, input, "point"    ) })
  output$normal.point.lilo    <- renderPlot({ plot.lilo        (norm, input, "point"    ) })
  output$normal.point.bf      <- renderText({ text.bf          (norm, input, "point"    ) })
  output$normal.point.post    <- renderText({ text.post        (norm, input, "point"    ) })

  # Interval computations
  output$normal.interval.pdf  <- renderPlot({ plot.normal.pdf  (norm, input, "interval" ) })
  output$normal.interval.pred <- renderPlot({ plot.normal.data (norm, input, "interval" ) })
  output$normal.interval.lilo <- renderPlot({ plot.lilo        (norm, input, "interval" ) })
  output$normal.interval.bf   <- renderText({ text.bf          (norm, input, "interval" ) })
  output$normal.interval.post <- renderText({ text.post        (norm, input, "interval" ) })
    
  # Crud computations
  output$normal.crud.pdf      <- renderPlot({ plot.normal.pdf  (norm, input, "crud"     ) })
  output$normal.crud.pred     <- renderPlot({ plot.normal.data (norm, input, "crud"     ) })
  output$normal.crud.lilo     <- renderPlot({ plot.lilo        (norm, input, "crud"     ) })
  output$normal.crud.bf       <- renderText({ text.bf          (norm, input, "crud"     ) })
  output$normal.crud.post     <- renderText({ text.post        (norm, input, "crud"     ) })
    
  # Signed computations
  output$normal.signed.pdf    <- renderPlot({ plot.normal.pdf  (norm, input, "signed"   ) })
  output$normal.signed.pred   <- renderPlot({ plot.normal.data (norm, input, "signed"   ) })
  output$normal.signed.lilo   <- renderPlot({ plot.lilo        (norm, input, "signed"   ) })
  output$normal.signed.bf     <- renderText({ text.bf          (norm, input, "signed"   ) })
  output$normal.signed.post   <- renderText({ text.post        (norm, input, "signed"   ) })
    

  ###########################
  ## Binomial distribution ##
  ###########################
  
  bino <- bino.definitions()

  # Point computations
  output$bino.point.pdf     <- renderPlot({ plot.bino.pdf  (bino, input, "point"    ) })
  output$bino.point.pred    <- renderPlot({ plot.bino.data (bino, input, "point"    ) })
  output$bino.point.lilo    <- renderPlot({ plot.lilo      (bino, input, "point"    ) })
  output$bino.point.bf      <- renderText({ text.bf        (bino, input, "point"    ) })
  output$bino.point.post    <- renderText({ text.post      (bino, input, "point"    ) })

  # Point v point computations
  output$bino.pointvp.pdf   <- renderPlot({ plot.bino.pdf  (bino, input, "pointvp"  ) })
  output$bino.pointvp.pred  <- renderPlot({ plot.bino.data (bino, input, "pointvp"  ) })
  output$bino.pointvp.lilo  <- renderPlot({ plot.lilo      (bino, input, "pointvp"  ) })
  output$bino.pointvp.bf    <- renderText({ text.bf        (bino, input, "pointvp"  ) })
  output$bino.pointvp.post  <- renderText({ text.post      (bino, input, "pointvp"  ) })

  # Interval computations
  output$bino.interval.pdf  <- renderPlot({ plot.bino.pdf  (bino, input, "interval" ) })
  output$bino.interval.pred <- renderPlot({ plot.bino.data (bino, input, "interval" ) })
  output$bino.interval.lilo <- renderPlot({ plot.lilo      (bino, input, "interval" ) })
  output$bino.interval.bf   <- renderText({ text.bf        (bino, input, "interval" ) })
  output$bino.interval.post <- renderText({ text.post      (bino, input, "interval" ) })

  # Notched interval computations
  output$bino.notched.pdf   <- renderPlot({ plot.bino.pdf  (bino, input, "notched"  ) })
  output$bino.notched.pred  <- renderPlot({ plot.bino.data (bino, input, "notched"  ) })
  output$bino.notched.lilo  <- renderPlot({ plot.lilo      (bino, input, "notched"  ) })
  output$bino.notched.bf    <- renderText({ text.bf        (bino, input, "notched"  ) })
  output$bino.notched.post  <- renderText({ text.post      (bino, input, "notched"  ) })
  
  # Custom interval computations
  output$bino.custom.pdf    <- renderPlot({ plot.bino.pdf  (bino, input, "custom"   ) })
  output$bino.custom.pred   <- renderPlot({ plot.bino.data (bino, input, "custom"   ) })
  output$bino.custom.lilo   <- renderPlot({ plot.lilo      (bino, input, "custom"   ) })
  output$bino.custom.bf     <- renderText({ text.bf        (bino, input, "custom"   ) })
  output$bino.custom.post   <- renderText({ text.post      (bino, input, "custom"   ) })
  
  # Informed prior computations
  output$bino.informed.pdf  <- renderPlot({ plot.bino.pdf  (bino, input, "informed" ) })
  output$bino.informed.pred <- renderPlot({ plot.bino.data (bino, input, "informed" ) })
  output$bino.informed.lilo <- renderPlot({ plot.lilo      (bino, input, "informed" ) })
  output$bino.informed.bf   <- renderText({ text.bf        (bino, input, "informed" ) })
  output$bino.informed.post <- renderText({ text.post      (bino, input, "informed" ) })

  # Signed computations
  output$bino.signed.pdf    <- renderPlot({ plot.bino.pdf  (bino, input, "signed"   ) })
  output$bino.signed.pred   <- renderPlot({ plot.bino.data (bino, input, "signed"   ) })
  output$bino.signed.lilo   <- renderPlot({ plot.lilo      (bino, input, "signed"   ) })
  output$bino.signed.bf     <- renderText({ text.bf        (bino, input, "signed"   ) })
  output$bino.signed.post   <- renderText({ text.post      (bino, input, "signed"   ) })

}
