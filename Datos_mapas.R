m <- leaflet(cr_covid)
pal <- colorBin("RdYlGn", cr_covid$confirmados, bins =7, pretty = TRUE, na.color = "white")
m %>%  addPolygons(
        fillColor = -pal(confirmados),
        weight = 1,
        opacity = 2,
        color = "black",
        dashArray = "",
        fillOpacity = 3,
        popup = pastel("Cantón:"
             , cr_covid$canton
             , "<br/>"
             , "Casos Confirmados:"
             , cr_covid$confirmados
             , "<br/>"
             , "Casos Activos:"
             ,cr_covid$activos
             , "<br/>"
             , "Casos Recuperados:"
             , cr_covid$recuperados
             , "<br/>"
             , "Casos Fallecidos:"
             , cr_covid$muertes
             , "<br/>"
             ,  "<br>"
             , "<a href='"
             , cr_covid$geometry)) %>%
   addLegend(pal = pal, values = -confirmados, opacity = 0,7,
             title = "Rango de casos confirmados",
             position = "bottomright")

mns <- cr_covid %>%
   group_by(provincia) %>%
   summarize(confirmados= sum(confirmados, na.rm = TRUE), activos = sum(activos, na.rm = TRUE),
             fallecidos= sum(muertes, na.rm = TRUE), recuperados= sum(recuperados, na.rm = TRUE))
   fy <- leaflet(mns)
   pal <- colorBin("Spectral", mns$confirmados, bins= 7, na.color = "white")
   fy %>% addPolygons(
      fillColor = -pal(confirmados),
      weight = 1,
      opacity = 2,
      color = "black",
      dashArray = "",
      fillOpacity = 3,
      popup = paste( "Provincia:"
                     , mns$provincia
                     , '<br/>'
                     , "Casos Confirmados:"
                     , mns$confirmados
                     , '<br/>'
                     , "Casos Activos:"
                     , mns$activos
                     , '<br/>'
                     , "Casos Recuperados:"
                     , mns$recuperados
                     , '<br/>'
                     , "Casos Fallecidos:"
                     , mns$muertes
                     , "<br>"
                     , "a href='"
                     , mns$geometry)) %>%
          addLegend(pal= pal,
                    values = -confirmados,
                    opacity = 0,7,
                    title= "Rango de casos confirmados",
                    position = "bottomright")