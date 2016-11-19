defaultTestDate <- structure(1472688000,
                             class = c("POSIXct", "POSIXt"),
                             tzone = "UTC")
defaultTestTime <- structure(1472724672,
                             class = c("POSIXct", "POSIXt"),
                             tzone = "UTC")
defaultTestTimeMilliSecs <- structure(1472724672.345678,
                                      class = c("POSIXct", "POSIXt"),
                                      tzone = "UTC")


options(digits.secs = 6)

asUTCInUTC <- function(x) {
    utctime(x = x, tz = "UTC")
}

checkDates <- function(secs, millis) {
    checkEquals(asUTCInUTC(c(secs, millis)),
                c(defaultTestTime, defaultTestTimeMilliSecs))
}

test.FormatDataAndTimeUTCNumbers <- function() {
    checkDates("2016-09-01 10:11:12", "2016-09-01 10:11:12.345678")
    checkDates("2016/09/01 10:11:12", "2016/09/01 10:11:12.345678")
    checkDates("20160901 101112",     "20160901 101112.345678")
    checkDates("20160901 10:11:12",   "20160901 10:11:12.345678")
    checkDates("09/01/2016 10:11:12", "09/01/2016 10:11:12.345678")
    checkDates("09-01-2016 10:11:12", "09-01-2016 10:11:12.345678")

}

test.FormatDataAndTimeUTCAlpha3 <- function() {
    checkDates("2016-Sep-01 10:11:12", "2016-Sep-01 10:11:12.345678")
    checkDates("2016/Sep/01 10:11:12", "2016/Sep/01 10:11:12.345678")
    checkDates("2016Sep01 101112",     "2016Sep01 101112.345678")
    checkDates("2016Sep01 10:11:12",   "2016Sep01 10:11:12.345678")
    checkDates("Sep/01/2016 10:11:12", "Sep/01/2016 10:11:12.345678")
    checkDates("Sep-01-2016 10:11:12", "Sep-01-2016 10:11:12.345678")
    checkDates("01.Sep.2016 10:11:12", "01.Sep.2016 10:11:12.345678")
    checkDates("01Sep2016 101112",     "01Sep2016 101112.345678")
    checkDates("01Sep2016 10:11:12",   "01Sep2016 10:11:12.345678")
    checkDates("01-Sep-2016 101112",   "01-Sep-2016 101112.345678")
    checkDates("01-Sep-2016 10:11:12", "01-Sep-2016 10:11:12.345678")
}

test.FormatDataAndTimeUTCFullName <- function() {
    checkDates("2016-September-01 10:11:12", "2016-September-01 10:11:12.345678")
    checkDates("2016/September/01 10:11:12", "2016/September/01 10:11:12.345678")
    checkDates("2016September01 101112",     "2016September01 101112.345678")
    checkDates("2016September01 10:11:12",   "2016September01 10:11:12.345678")
    checkDates("September/01/2016 10:11:12", "September/01/2016 10:11:12.345678")
    checkDates("September-01-2016 10:11:12", "September-01-2016 10:11:12.345678")
    checkDates("01.September.2016 10:11:12", "01.September.2016 10:11:12.345678")
}

test.DayFormats <- function() {
    checkDates("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016")
    checkDates("Thu 01 Sep 2016 10:11:12", "Thu 01 Sep 2016 10:11:12.345678")
}

test.DateFormats <- function() {
    checkEquals(
        asUTCInUTC(c("2016-09-01", "20160901", "09/01/2016", "09-01-2016")),
        rep(defaultTestDate, 4))
    #anytime(c("2016-Sep-01", "2016Sep01", "Sep/01/2016", "Sep-01-2016"))
}

