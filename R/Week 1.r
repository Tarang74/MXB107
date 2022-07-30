##  Simple Barplot

##  The ggplot command takes a data frame as an argument,
##  you can also specify the aesthetics "aes()" to
##  associate variables with specific axes of your plot

##  geom_bar() specifies that we want a bar plot, ggtitle adds the title and theme centres it
##  over the plot.

make_bar <- ggplot(epa_data, aes(x = make)) + geom_bar() +
    xlab("Manufacturer") +
    ylab("Number of models") +
    ggtitle("Number of Models by Make for the Top 10 Manufacturers") +
    theme(plot.title = element_text(hjust = 0.5))

plot(make_bar)

##  Pareto Plot

##  We create a new data frame called "df" to count the number of models
##  per manufacturer and aggregate by manufacturer.
##  We then use ggplot calling the first ten rows only and
##  plot the results from largest to smallest from left to right.
##  Finally, we add a title and centre it over the plot.

df <- epa_data %>% count(make)

make_pareto <- ggplot(df[1:10,]) +
    geom_bar(aes(x = reorder(make, - n), y = n), stat = "identity") +
    xlab("Manufacturer") +
    ylab("Number of models") +
    ggtitle("Number of Models by Make for the Top 10 Manufacturers") +
    theme(plot.title = element_text(hjust = 0.5))

plot(make_pareto)

##  We can use the data set `epa_data` directly in `ggplot` with 
##  the `stat_summary()` function to plot yearly averages for fuel economy 

mean_mpg_year <- ggplot(epa_data, aes(x = year, y = city)) +
  stat_summary(geom = "line", fun = "mean") +
  xlab("Year") +
  ylab("City MPG") +
  ggtitle("EPA City MPG by Year") +
  theme(plot.title = element_text(hjust = 0.5))

mpg_1990 <- epa_data %>% filter(year == 1990) %>% ggplot(aes(city)) +
  geom_histogram(aes(y = ..density..), binwidth = 2) +
  xlab("City MPG") +
  ylab("Relative Frequency") +
  ggtitle("EPA City MPG for 1990") +
  theme(plot.title = element_text(hjust = 0.5))
