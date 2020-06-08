cr_covid_grafico <- cr_covid_df %>% 
  select(provincia, confirmados) %>% 
  group_by(provincia) %>% 
  summarize(confirmados = sum(confirmados, na.rm = TRUE)) %>% 
  arrange(desc(confirmados))

ggplot(cr_covid_grafico, aes(x=reorder(provincia, -confirmados), y=confirmados)) +
  ggtitle("Casos confirmados de Covid-19 en Costa Rica") +
  xlab("Provincias de Costa Rica") + 
  ylab("Casos confirmados") +  
  geom_col() +
  geom_text(aes(label=confirmados), vjust=-0.3, size=3.5)

