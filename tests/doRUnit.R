# Copyright (C) 2016 Bob Jansen
# Copyright (C) 2009 - 2014 Dirk Eddelbuettel and Romain Francois
# Earlier copyrights Gregor Gorjanc, Martin Maechler and Murray Stokely as detailed below
#
# This file is part of anytime.
#
# anytime is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# anytime is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with anytime. If not, see <http://www.gnu.org/licenses/>.

## doRUnit.R --- Run RUnit tests
##
## with credits to package fUtilities in RMetrics
## which credits Gregor Gojanc's example in CRAN package  'gdata'
## as per the R Wiki http://wiki.r-project.org/rwiki/doku.php?id=developers:runit
## and changed further by Martin Maechler
## and more changes by Murray Stokely in HistogramTools
## and then used adapted in RProtoBuf
## and now used here with two additional env var setters/getters
##
## Dirk Eddelbuettel, Feb 2014

stopifnot(require(RUnit, quietly = TRUE))
stopifnot(require(anytime, quietly = TRUE))

options(digits.secs=6)

print(sessionInfo())

testSuite <- defineTestSuite(name = "anytime Unit Tests",
                             dirs = system.file("unitTests", package = "anytime"),
                             testFuncRegexp = "^[Tt]est.+")

tests <- runTestSuite(testSuite)

printTextProtocol(tests)

if (getErrors(tests)$nFail > 0) {
    stop("TEST FAILED!")
}

if (getErrors(tests)$nErr > 0) {
    stop("TEST HAD ERRORS!")
}

if (getErrors(tests)$nTestFunc < 1) {
    stop("NO TEST FUNCTIONS RUN!")
}

