defaultTestDate <- structure(1472724672,
                             class = c("POSIXct", "POSIXt"),
                             tzone = "UTC")
defaultTestDateMilliSecs <- structure(1472724672.345678,
                                      class = c("POSIXct", "POSIXt"),
                                      tzone = "UTC")

options(digits.secs = 6)

asUTCInUTC <- function(x) {
    utctime(x = x, tz = "UTC")
}


test.FormatDataAndTimeUTCNumbers <- function() {
    checkEquals(asUTCInUTC(c("2016-09-01 10:11:12", "2016-09-01 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("2016/09/01 10:11:12", "2016/09/01 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    #checkEquals(asUTCInUTC(c("20160901 101112",     "20160901 101112.345678")),
    #            c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("20160901 10:11:12",   "20160901 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("09/01/2016 10:11:12", "09/01/2016 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("09-01-2016 10:11:12", "09-01-2016 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))

}

test.FormatDataAndTimeUTCAlpha3 <- function() {
    checkEquals(asUTCInUTC(c("2016-Sep-01 10:11:12", "2016-Sep-01 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("2016/Sep/01 10:11:12", "2016/Sep/01 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("2016Sep01 101112",     "2016Sep01 101112.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("2016Sep01 10:11:12",   "2016Sep01 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("Sep/01/2016 10:11:12", "Sep/01/2016 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("Sep-01-2016 10:11:12", "Sep-01-2016 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("01.Sep.2016 10:11:12", "01.Sep.2016 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("01Sep2016 101112",     "01Sep2016 101112.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("01Sep2016 10:11:12",   "01Sep2016 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("01-Sep-2016 101112",   "01-Sep-2016 101112.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
    checkEquals(asUTCInUTC(c("01-Sep-2016 10:11:12", "01-Sep-2016 10:11:12.345678")),
                c(defaultTestDate, defaultTestDateMilliSecs))
}

