# Build-A-Bayes UI layout

landing <- "home"

#################################### Header
header <- dashboardHeader(
  title = "Build-A-Bayes"
)

#################################### Sidebar
sidebar <-   dashboardSidebar(
  sidebarMenu(
    menuItem("Home",                     tabName = landing,      icon = icon("home")),
    menuItem("Binomial distribution",    tabName = "point-b",    icon = icon("cube"),
      menuSubItem("Spike and slab",        tabName = "point-b",    icon = icon("bullseye")),
      menuSubItem("Interval and slab",     tabName = "interval-b", icon = icon("arrows-h")),
      menuSubItem("Point vs. interval",    tabName = "custom-b",   icon = icon("arrows-h")),
      menuSubItem("Non-negligibility",     tabName = "notched-b",  icon = icon("arrows-h")),
#      menuSubItem("Point vs. informed",    tabName = "informed-b", icon = icon("lightbulb-o")),
      menuSubItem("Point vs. point",       tabName = "pointvp-b",  icon = icon("bullseye")),
      menuSubItem("Directional hypotheses",tabName = "signed-b",   icon = icon("exchange"))
      ),
    menuItem("Normal distribution",      tabName = "point-n",    icon = icon("cubes"),
      menuSubItem("Spike and slab",        tabName = "point-n",    icon = icon("bullseye")),
      menuSubItem("Interval and slab",     tabName = "interval-n", icon = icon("arrows-h")),
      menuSubItem("Crud null",             tabName = "crud-n",     icon = icon("compress")),
      menuSubItem("Directional hypotheses",tabName = "signed-n",   icon = icon("exchange"))
      ),
    menuItem("Disclaimer",              tabName = "disclaimer",   icon = icon("exclamation-circle")),
    menuItem("License",                 tabName = "license",      icon = icon("info-circle")),
    materialSwitch(inputId = "prf", label = "Printer friendly", status = "primary", right = TRUE)
  ))

#################################### Tabs
home.tab <- tabItem(tabName = "home",
                    withMathJax(includeMarkdown("bab_intro.md")),
                    ("To use the app, choose one of the options from the menu on the left."))
lice.tab <- tabItem(tabName = "license",
                    withMathJax(includeMarkdown("bab_license.md")))
disc.tab <- tabItem(tabName = "disclaimer",
                    withMathJax(includeMarkdown("bab_disclaimer.md")))

###########################
## Normal distribution ##
###########################

# Point null tab content
normal.point.tab <- tabItem(tabName = "point-n",
                            withMathJax(includeMarkdown("bab_intro.md")),
                       h2("Spike and slab"), 
                       fluidRow(
                         box(
                           sliderInput("normal.point.data",
                                       "Data point",
                                       min = -4,
                                       max =  4,
                                       step = .01,
                                       value = 0.5),
                           width = 4
                         ), 
                         box(
                           sliderInput("normal.point.N",
                                       "Sample size",
                                       min = 1,
                                       max = 100,
                                       step = 1,
                                       value = 25),
                           width = 4
                         ), 
                         box(
                           sliderInput("normal.point.prior",
                                       "prior P(H0)",
                                       min = 0,
                                       max = 1,
                                       step = .01,
                                       value = .90),
                           width = 4
                         ),
                         box(
                           plotOutput("normal.point.pdf", height = 300),
                           width = 4
                         ),
                         box(
                           plotOutput("normal.point.pred", height = 300),
                           width = 4
                         ),
                         box(
                           plotOutput("normal.point.lilo", height = 300),
                           width = 4
                         ),
                         box(
                           textOutput("normal.point.bf", container = span),
                           width = 6
                         ),
                         box(
                           textOutput("normal.point.post", container = span),
                           width = 6
                         )
                       ))

# Interval null tab content
normal.interval.tab <- tabItem(tabName = "interval-n",
                               withMathJax(includeMarkdown("bab_intro.md")),
                               h2("Interval and slab"),
                          fluidRow(
                            box(
                              sliderInput("normal.interval.data",
                                          "Data point",
                                          min = -4,
                                          max =  4,
                                          step = .01,
                                          value = 0.5),
                              width = 3
                            ), 
                            box(
                              sliderInput("normal.interval.N",
                                          "Sample size",
                                          min = 1,
                                          max = 100,
                                          step = 1,
                                          value = 25),
                              width = 3
                            ), 
                            box(
                              sliderInput("normal.interval.eps",
                                          "Width of interval",
                                          min = .01,
                                          max = 8,
                                          step = .01,
                                          value = .1),
                              width = 3
                            ),
                            box(
                              sliderInput("normal.interval.prior",
                                          "prior P(H0)",
                                          min = 0,
                                          max = 1,
                                          step = .01,
                                          value = .90),
                              width = 3
                            ),
                            box(
                              plotOutput("normal.interval.pdf", height = 300),
                              width = 4
                            ),
                            box(
                              plotOutput("normal.interval.pred", height = 300),
                              width = 4
                            ),
                            box(
                              plotOutput("normal.interval.lilo", height = 300),
                              width = 4
                            ),
                            box(
                              textOutput("normal.interval.bf", container = span),
                              width = 6
                            ),
                            box(
                              textOutput("normal.interval.post", container = span),
                              width = 6
                            )
                          ))

# Crud null tab content
normal.crud.tab <- tabItem(tabName = "crud-n",
                           withMathJax(includeMarkdown("bab_intro.md")),
                           h2("Crud null"),
                      fluidRow(
                        box(
                          sliderInput("normal.crud.data",
                                      "Data point",
                                      min = -4,
                                      max =  4,
                                      step = .01,
                                      value = 0.5),
                          width = 3
                        ), 
                        box(
                          sliderInput("normal.crud.N",
                                      "Sample size",
                                      min = 1,
                                      max = 100,
                                      step = 1,
                                      value = 25),
                          width = 3
                        ), 
                        box(
                          sliderInput("normal.crud.tau",
                                      "Crud scale",
                                      min = .01,
                                      max = 2,
                                      step = .01,
                                      value = .1),
                          width = 3
                        ),
                        box(
                          sliderInput("normal.crud.prior",
                                      "prior P(H0)",
                                      min = 0,
                                      max = 1,
                                      step = .01,
                                      value = .90),
                          width = 3
                        ),
                        box(
                          plotOutput("normal.crud.pdf", height = 300),
                          width = 4
                        ),
                        box(
                          plotOutput("normal.crud.pred", height = 300),
                          width = 4
                        ),
                        box(
                          plotOutput("normal.crud.lilo", height = 300),
                          width = 4
                        ),
                        box(
                          textOutput("normal.crud.bf", container = span),
                          width = 6
                        ),
                        box(
                          textOutput("normal.crud.post", container = span),
                          width = 6
                        )
                      ))

# Signed null tab content
normal.signed.tab <- tabItem(tabName = "signed-n",
                             withMathJax(includeMarkdown("bab_intro.md")),
                             h2("Directional hypotheses"),
                        fluidRow(
                          box(
                            sliderInput("normal.signed.data",
                                        "Data point",
                                        min = -4,
                                        max =  4,
                                        step = .01,
                                        value = 0.5),
                            width = 4
                          ), 
                          box(
                            sliderInput("normal.signed.N",
                                        "Sample size",
                                        min = 1,
                                        max = 100,
                                        step = 1,
                                        value = 25),
                            width = 4
                          ), 
                          box(
                            sliderInput("normal.signed.prior",
                                        "prior P(H0)",
                                        min = 0,
                                        max = 1,
                                        step = .01,
                                        value = .90),
                            width = 4
                          ),
                          box(
                            plotOutput("normal.signed.pdf", height = 300),
                            width = 4
                          ),
                          box(
                            plotOutput("normal.signed.pred", height = 300),
                            width = 4
                          ),
                          box(
                            plotOutput("normal.signed.lilo", height = 300),
                            width = 4
                          ),
                          box(
                            textOutput("normal.signed.bf", container = span),
                            width = 6
                          ),
                          box(
                            textOutput("normal.signed.post", container = span),
                            width = 6
                          )
                        ))

###########################
## Binomial distribution ##
###########################

# Interval null tab content
bino.interval.tab <- tabItem(tabName = "interval-b",
                             withMathJax(includeMarkdown("bab_intro.md")),
                             h2("Interval and slab"),
                          fluidRow(
                            box(
                              sliderInput("bino.interval.wins",
                                          "Number of wins",
                                          min =  0,
                                          max =  200,
                                          step = 1,
                                          value = 15),
                              width = 3
                            ), 
                            box(
                              sliderInput("bino.interval.losses",
                                          "Number of losses",
                                          min = 0,
                                          max = 200,
                                          step = 1,
                                          value = 10),
                              width = 3
                            ), 
                            box(
                              sliderInput("bino.interval.eps",
                                          "Width of interval",
                                          min = 0.05,
                                          max = 1,
                                          step = .01,
                                          value = .06),
                              width = 3
                            ),
                            box(
                              sliderInput("bino.interval.prior",
                                          "prior P(H0)",
                                          min = 0,
                                          max = 1,
                                          step = .01,
                                          value = .90),
                              width = 3
                            ),
                            box(
                              plotOutput("bino.interval.pdf", height = 300),
                              width = 4
                            ),
                            box(
                              plotOutput("bino.interval.pred", height = 300),
                              width = 4
                            ),
                            box(
                              plotOutput("bino.interval.lilo", height = 300),
                              width = 4
                            ),
                            box(
                              textOutput("bino.interval.bf", container = span),
                              width = 6
                            ),
                            box(
                              textOutput("bino.interval.post", container = span),
                              width = 6
                            )
                          ))

# Custom interval
bino.custom.tab <- tabItem(tabName = "custom-b",
                           withMathJax(includeMarkdown("bab_intro.md")),
                           h2("Point vs. interval"),
                        fluidRow(
                          box(
                            sliderInput("bino.custom.wins",
                                        "Number of wins",
                                        min =  0,
                                        max =  200,
                                        step = 1,
                                        value = 15),
                            width = 2
                          ), 
                          box(
                            sliderInput("bino.custom.losses",
                                        "Number of losses",
                                        min = 0,
                                        max = 200,
                                        step = 1,
                                        value = 10),
                            width = 2
                          ), 
                          box(
                            sliderInput("bino.custom.lower",
                                        "Lower end of H1",
                                        min = 0,
                                        max = 1,
                                        step = .01,
                                        value = .5),
                            width = 3
                          ),
                          box(
                            sliderInput("bino.custom.upper",
                                        "Upper end of H1",
                                        min = 0,
                                        max = 1,
                                        step = .01,
                                        value = 1.0),
                            width = 3
                          ),
                          box(
                            sliderInput("bino.custom.prior",
                                        "prior P(H0)",
                                        min = 0,
                                        max = 1,
                                        step = .01,
                                        value = .90),
                            width = 2
                          ),
                          box(
                            plotOutput("bino.custom.pdf", height = 300),
                            width = 4
                          ),
                          box(
                            plotOutput("bino.custom.pred", height = 300),
                            width = 4
                          ),
                          box(
                            plotOutput("bino.custom.lilo", height = 300),
                            width = 4
                          ),
                          box(
                            textOutput("bino.custom.bf", container = span),
                            width = 6
                          ),
                          box(
                            textOutput("bino.custom.post", container = span),
                            width = 6
                          )
                        ))

# Notched interval
bino.notched.tab <- tabItem(tabName = "notched-b",
                            withMathJax(includeMarkdown("bab_intro.md")),
                            h2("Non-negligibility"),
                         fluidRow(
                           box(
                             sliderInput("bino.notched.wins",
                                         "Number of wins",
                                         min =  0,
                                         max =  200,
                                         step = 1,
                                         value = 15),
                             width = 2
                           ), 
                           box(
                             sliderInput("bino.notched.losses",
                                         "Number of losses",
                                         min = 0,
                                         max = 200,
                                         step = 1,
                                         value = 10),
                             width = 2
                           ), 
                           box(
                             sliderInput("bino.notched.lower",
                                         "Lower end of interval",
                                         min = 0,
                                         max = 1,
                                         step = .01,
                                         value = .47),
                             width = 3
                           ),
                           box(
                             sliderInput("bino.notched.upper",
                                         "Upper end of interval",
                                         min = 0,
                                         max = 1,
                                         step = .01,
                                         value = .53),
                             width = 3
                           ),
                           box(
                             sliderInput("bino.notched.prior",
                                         "prior P(H0)",
                                         min = 0,
                                         max = 1,
                                         step = .01,
                                         value = .90),
                             width = 2
                           ),
                           box(
                             plotOutput("bino.notched.pdf", height = 300),
                             width = 4
                           ),
                           box(
                             plotOutput("bino.notched.pred", height = 300),
                             width = 4
                           ),
                           box(
                             plotOutput("bino.notched.lilo", height = 300),
                             width = 4
                           ),
                           box(
                             textOutput("bino.notched.bf", container = span),
                             width = 6
                           ),
                           box(
                             textOutput("bino.notched.post", container = span),
                             width = 6
                           )
                         ))


# Informed alternative content
bino.informed.tab <- tabItem(tabName = "informed-b",
                             withMathJax(includeMarkdown("bab_intro.md")),
                             h2("Informed alternative"),
                        fluidRow(
                          box(
                            sliderInput("bino.informed.wins",
                                        "Number of wins",
                                        min =  0,
                                        max =  200,
                                        step = 1,
                                        value = 15),
                            width = 2
                          ), 
                          box(
                            sliderInput("bino.informed.losses",
                                        "Number of losses",
                                        min = 0,
                                        max = 200,
                                        step = 1,
                                        value = 10),
                            width = 2
                          ), 
                          box(
                            sliderInput("bino.informed.a",
                                        "Previous wins",
                                        min = 0,
                                        max = 1000,
                                        step = 1,
                                        value = 53),
                            width = 3
                          ),
                          box(
                            sliderInput("bino.informed.b",
                                        "Previous losses",
                                        min = 0,
                                        max = 1000,
                                        step = 1,
                                        value = 47),
                            width = 3
                          ),
                          box(
                            sliderInput("bino.informed.prior",
                                        "prior P(H0)",
                                        min = 0,
                                        max = 1,
                                        step = .01,
                                        value = .90),
                            width = 2
                          ),
                          box(
                            plotOutput("bino.informed.pdf", height = 300),
                            width = 4
                          ),
                          box(
                            plotOutput("bino.informed.pred", height = 300),
                            width = 4
                          ),
                          box(
                            plotOutput("bino.informed.lilo", height = 300),
                            width = 4
                          ),
                          box(
                            textOutput("bino.informed.bf", container = span),
                            width = 6
                          ),
                          box(
                            textOutput("bino.informed.post", container = span),
                            width = 6
                          )
                        ))


# Point null tab content
bino.point.tab <- tabItem(tabName = "point-b",
                          withMathJax(includeMarkdown("bab_intro.md")),
                          h2("Spike and slab"), 
                       fluidRow(
                         box(
                           sliderInput("bino.point.wins",
                                       "Number of wins",
                                       min =  0,
                                       max =  200,
                                       step = 1,
                                       value = 15),
                           width = 4
                         ), 
                         box(
                           sliderInput("bino.point.losses",
                                       "Number of losses",
                                       min = 0,
                                       max = 200,
                                       step = 1,
                                       value = 10),
                           width = 4
                         ), 
                         box(
                           sliderInput("bino.point.prior",
                                       "prior P(H0)",
                                       min = 0,
                                       max = 1,
                                       step = .01,
                                       value = .90),
                           width = 4
                         ),
                         box(
                           plotOutput("bino.point.pdf", height = 300),
                           width = 4
                         ),
                         box(
                           plotOutput("bino.point.pred", height = 300),
                           width = 4
                         ),
                         box(
                           plotOutput("bino.point.lilo", height = 300),
                           width = 4
                         ),
                         box(
                           textOutput("bino.point.bf", container = span),
                           width = 6
                         ),
                         box(
                           textOutput("bino.point.post", container = span),
                           width = 6
                         )
                       ))

# Point v. point tab content
bino.pointvp.tab <- tabItem(tabName = "pointvp-b",
                            withMathJax(includeMarkdown("bab_intro.md")),
                            h2("Point vs. point"), 
                       fluidRow(
                         box(
                           sliderInput("bino.pointvp.wins",
                                       "Number of wins",
                                       min =  0,
                                       max =  200,
                                       step = 1,
                                       value = 15),
                           width = 3
                         ), 
                         box(
                           sliderInput("bino.pointvp.losses",
                                       "Number of losses",
                                       min = 0,
                                       max = 200,
                                       step = 1,
                                       value = 10),
                           width = 3
                         ), 
                         box(
                           sliderInput("bino.pointvp.alt",
                                       "Win probability under the alternative hypothesis",
                                       min = 0,
                                       max = 1,
                                       step = .01,
                                       value = .53),
                           width = 3
                         ),
                         box(
                           sliderInput("bino.pointvp.prior",
                                       "prior P(H0)",
                                       min = 0,
                                       max = 1,
                                       step = .01,
                                       value = .90),
                           width = 3
                         ),
                         box(
                           plotOutput("bino.pointvp.pdf", height = 300),
                           width = 4
                         ),
                         box(
                           plotOutput("bino.pointvp.pred", height = 300),
                           width = 4
                         ),
                         box(
                           plotOutput("bino.pointvp.lilo", height = 300),
                           width = 4
                         ),
                         box(
                           textOutput("bino.pointvp.bf", container = span),
                           width = 6
                         ),
                         box(
                           textOutput("bino.pointvp.post", container = span),
                           width = 6
                         )
                       ))

# Signed null tab content
bino.signed.tab <- tabItem(tabName = "signed-b",
                           withMathJax(includeMarkdown("bab_intro.md")),
                           h2("Directional hypotheses"),
                        fluidRow(
                            box(
                              sliderInput("bino.signed.wins",
                                          "Number of wins",
                                          min =  0,
                                          max =  200,
                                          step = 1,
                                          value = 15),
                              width = 4
                            ), 
                            box(
                              sliderInput("bino.signed.losses",
                                          "Number of losses",
                                          min = 0,
                                          max = 200,
                                          step = 1,
                                          value = 10),
                              width = 4
                            ), 
                          box(
                            sliderInput("bino.signed.prior",
                                        "prior P(H0)",
                                        min = 0,
                                        max = 1,
                                        step = .01,
                                        value = .90),
                            width = 4
                          ),
                          box(
                            plotOutput("bino.signed.pdf", height = 300),
                            width = 4
                          ),
                          box(
                            plotOutput("bino.signed.pred", height = 300),
                            width = 4
                          ),
                          box(
                            plotOutput("bino.signed.lilo", height = 300),
                            width = 4
                          ),
                          box(
                            textOutput("bino.signed.bf", container = span),
                            width = 6
                          ),
                          box(
                            textOutput("bino.signed.post", container = span),
                            width = 6
                          )
                        ))

#################################### Body
body <- dashboardBody(
  tabItems(
    home.tab,
    normal.point.tab,
    normal.interval.tab,
    normal.crud.tab,
    normal.signed.tab,
    bino.point.tab,
    bino.interval.tab,
    bino.custom.tab,
    bino.notched.tab,
    bino.informed.tab,
    bino.pointvp.tab,
    bino.signed.tab,
    disc.tab,
    lice.tab
  ),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "cid.css")
  )
)


#################################### UI
ui <- dashboardPage(
  header,
  sidebar,
  body
)
