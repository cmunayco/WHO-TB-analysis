library(WDI)
library(epicalc)
indicators <- c("NY.GDP.PCAP.KN", "SP.DYN.TFRT.IN", "SP.POP.TOTL")
df_world <- WDI("all", indicators, extra=TRUE, start=1960, end=2013)
df_world<-df_world[order(df_world$country,df_world$year),]
# Discard unwanted rows
df_LAC_NA <- df_world[ which(df_world$region == c("Latin America & Caribbean (all income levels)","North America")), ]

#### TB data notifications
tb_notification<-read.csv("TB_notifications_2015-02-03.csv")
tb_notification_LAC_NA <- tb_notification[ which(tb_notification$g_whoregion == c("AMR")), ]


# Selecting columns
df_LAC_NA <- subset(df_LAC_NA, select=c("country", "year", indicators))
# Discard unwanted columns
df_LAC_NA <- df_LAC_NA[,1:6]
head(df_LAC_NA)

