#' Create an arbitrary HTML widget
#' 
#' @param outputId output variable which will be used in addressing from the
#' server
#' @param width Graph width. Must be a valid CSS unit (like "100%", "400px", 
#' "auto") or a number, which will be coerced to a string and have "px" 
#' appended.
#' @param height Graph height Must be a valid CSS unit (like "100%", "400px", 
#' "auto") or a number, which will be coerced to a string and have "px" 
#' appended.
#' @seealso \code{\link{renderWeather}}
#' @author Jeff Allen <jeff.allen@@trestletechnology.net>
#' @export
weatherWidgetOutput <- function(outputId, width, height) {
  tagList(
    singleton(tags$head(
      tags$script(src = 'shinyDash/base_widget_bindings.js')
    )),
    singleton(tags$head(
      tags$link(rel = 'stylesheet',
                type = 'text/css',
                href = 'shinyDash/weather/weather.css')
    )),
  
    tags$div(id = outputId, class = "weather_widget_output", style = 
               paste("width:", shiny:::validateCssUnit(width), ";", "height:", 
                     shiny:::validateCssUnit(height), ";"),
             tags$i(class="climacon icon-background"),
             tags$h1(id="title"),
             tags$h2(id="temp"),
             tags$p(id="condition")
          )
    
  )
}