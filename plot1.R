#=================
#
# BASE PLOTTING 1
#
#=================

if (!exists(NEI)) {NEI <- readRDS("summarySCC_PM25.rds")}
if (!exists(SCC)) {SCC <- readRDS("Source_Classification_Code.rds")}

# Q: Have total emissions from PM2.5 decreased in the US from 1999 to 2008?
# Assume that total represents summing up emissions in each year
# Chart type - barplot
library(RColorBrewer)
png(file = "plot1.png", width = 480, height = 480)

total_us <- aggregate(x = NEI$Emissions, by = list(NEI$year), FUN = sum, na.rm = TRUE)
barplot(height = total_us$x, xlab = "Year", ylab = "Total Emissions", 
        main = "Total PM2.5 Emissions in the US", names.arg = c(1999, 2002, 2005, 2008),
        space = c(0.1, 0.1), col = brewer.pal(n = 11, name = "RdYlGn"))

dev.off()