
options(digits.secs=6)

library(anytime)

## Dates: Integer
anytime(20160101L + 0:2, tz = "UTC")
anytime(20160101L + 0:2, tz = "UTC", asUTC = TRUE)

## Dates: Numeric
anytime(20160101 + 0:2, tz = "UTC")
anytime(20160101 + 0:2, tz = "UTC", asUTC = TRUE)

## Dates: Factor
anytime(as.factor(20160101 + 0:2), tz = "UTC")
anytime(as.factor(20160101 + 0:2), tz = "UTC", asUTC = TRUE)

## Dates: Ordered
anytime(as.ordered(20160101 + 0:2), tz = "UTC")
anytime(as.ordered(20160101 + 0:2), tz = "UTC", asUTC = TRUE)

## Dates: Character
anytime(as.character(20160101 + 0:2), tz = "UTC")
anytime(as.character(20160101 + 0:2), tz = "UTC", asUTC = TRUE)

## Dates: alternate formats
anytime(c("20160101", "2016/01/02", "2016-01-03"), tz = "UTC")
anytime(c("20160101", "2016/01/02", "2016-01-03"), tz = "UTC", asUTC = TRUE)

## Datetime: ISO with/without fractional seconds
anytime(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678"), tz = "UTC")
anytime(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678"), tz = "UTC", asUTC = TRUE)

## Datetime: ISO alternate (?) with 'T' separator
anytime(c("20160101T101112", "20160101T101112.345678"), tz = "UTC")
anytime(c("20160101T101112", "20160101T101112.345678"), tz = "UTC", asUTC = TRUE)

## Datetime: textual month formats
anytime(c("2016-Sep-01 10:11:12", "Sep/01/2016 10:11:12", "Sep-01-2016 10:11:12"), tz = "UTC")
anytime(c("2016-Sep-01 10:11:12", "Sep/01/2016 10:11:12", "Sep-01-2016 10:11:12"), tz = "UTC", asUTC = TRUE)

## Datetime: Mixed format (cf http://stackoverflow.com/questions/39259184)
anytime(c("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016"), tz = "UTC")
anytime(c("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016"), tz = "UTC", asUTC = TRUE)

## Datetime: pre/post DST
anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"))
anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"), tz="UTC")  # important: catches change
anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"), tz="UTC", asUTC = TRUE)
