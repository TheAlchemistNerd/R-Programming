# Data Reshaping.

#Joining Columns and Rows in a Data Frame
# Create vector objects.
city <- c("Tampa","Seattle","Hartford","Denver")
state <- c("FL","WA","CT","CO")
zipcode <- c(33602,98104,06161,80294)

# Combine above three vectors into one data frame.
addresses <- cbind(city,state,zipcode)

# Print a header.
# Print the data frame.
cat("# # # # The First data frame\n")
print(addresses)

# Create another data frame with similar columns
new.address <- data.frame(
   city = c("Lowry","Charlotte"),
   state = c("CO","FL"),
   zipcode = c("80230","33949"),
   stringsAsFactors = FALSE
)

# Print a header.
# Print the data frame.
cat("# # # The Second data frame\n")
print(new.address)

# Combine rows form both the data frames.
all.addresses <- rbind(addresses,new.address)

# Print a header.
# Print the result.
cat("# # # The combined data frame\n")
print(all.addresses)

#Merging Data Frames
library(MASS)
library(reshape2)    # for melt() and cast() functions
merged.Pima <- merge(x = Pima.te, y = Pima.tr,
   by.x = c("bp", "bmi"),
   by.y = c("bp", "bmi")
)
print(merged.Pima)
nrow(merged.Pima)

# Melting and Casting
# Inspecting ship data
print(ships)

#converting all columns other than type and year into multiple rows.
molten.ships <- melt(ships, id = c("type","year"))
print(molten.ships)

# Cast the Molten Data
# the aggregate of each type of ship for each year is created.
recasted.ship <-recast(molten.ships, type+year~variable,sum)
print(recasted.ship)
