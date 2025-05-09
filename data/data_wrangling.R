library(readxl)
library(dplyr)

pharynx <- read_excel("data/pharynx.xls")

glimpse(pharynx)


# Changing Variable Types -------------------------------------------------

pharynx$Case <- as.character(pharynx$Case)
pharynx$Inst <- as.character(pharynx$Inst)
pharynx$Sex <- as.factor(pharynx$Sex)
pharynx$Tx <- as.factor(pharynx$Tx)
pharynx$Grade <- as.factor(pharynx$Grade)
pharynx$Cond <- as.factor(pharynx$Cond)
pharynx$Site <- as.factor(pharynx$Site)
pharynx$T_Stage <- as.factor(pharynx$T_Stage)
pharynx$N_Stage <- as.factor(pharynx$N_Stage)
pharynx$Status <- as.factor(pharynx$Status)

# fixing the date of entry variable ---------------------------------------

year <- pharynx$Entry_Dt %% 100           # Get last two digits
day <- pharynx$Entry_Dt %/% 100           # Get the day of the year
year_full <- 1900 + year

pharynx$Entry_Dt <- as.Date(day - 1, origin = paste0(year_full, "-01-01"))


# Missing values Remove ---------------------------------------------------

missing_rows <- pharynx$Cond == "9" | pharynx$Grade == "9"

pharynx <- pharynx[!missing_rows,]

# Finishing up ------------------------------------------------------------

glimpse(pharynx)
