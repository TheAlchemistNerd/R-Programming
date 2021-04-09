data <- read.table("C:\\Users\\qwert\\Documents\\data.txt")
data
# rename the column 
colnames(data)<- "entries"
data
mean_data = with(data, mean(entries))
mean_data
median_data = with(data, median(entries))
median_data
sd_data = with(data, sd(entries))
sd_data

# frequency plot
freq_table <- with(data, table(entries))
View(freq_table)
data_freq <- as.data.frame(freq_table)
View(data_freq)
freq_plot<-hist(data$entries, freq=TRUE)
lines(density(data_freq$Freq))
