#!/bin/sh

## ---------- COLORS ---------- ##

MAGENTA="\033[35m"
BOLD_MAGENTA="\033[1;35m"
YELLOW="\033[33m"
BOLD_GREEN="\033[1;32m"
GREEN="\033[32m"
RED="\033[31m"
CYAN="\033[36m"
BLUE="\033[34m"
RESET="\033[0m"
YELLOW_BOLD="\033[1;33m"
BLEU_BOLD="\033[1;34m"

## ---------- VARIABLE ---------- ##

TEST_FAILED=0
TEST_PASSED=0
RETURN_VALUE=0
RESULT=""
EXCEPTED=""
EXCEPTED_RETURN_VALUE=0

## ---------- BUILD ---------- ##

make -s re > /dev/null

mv 201yams tests > /dev/null
if [ $? -ne 0 ]; then
    echo ${MAGENTA}'Error: 201yams not found' ${RESET}
    exit 1
fi

clear

## ---------- START ---------- ##

echo ${YELLOW_BOLD}'
        )  ()       )  (
      ( /(  (     (  |   )\ )
      )\()) )\    )\))( (()/(
     ((_)((((_)( ((_)()\ /(_))
    __ ((_)\ _ )\(_()((_|_))
    \ \ / (_)_\(_)  \/  / __|
     \ V / / _ \ | |\/| \__ \
      |_| /_/ \_\|_|  |_|___/

' ${RESET}

make clean > /dev/null

if cd tests; then
    echo ${BLEU_BOLD}'    [ -- Starting tests... -- ]\n' ${RESET}
else
    echo ${MAGENTA}'Error: tests folder not found' ${RESET}
    exit 1
fi

## ---------- TEST 1 ---------- ##

EXCEPTED="Chances to get a 4 yams: 0.01%"
EXCEPTED_RETURN_VALUE=0
RESULT=$(./201yams 0 0 0 0 0 yams_4)
RETURN_VALUE=$?

if [ "$RESULT" = "$EXCEPTED" ] && [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 1: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 1: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    echo ${YELLOW_BOLD}'Expected: ' ${RESET} $EXCEPTED
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 2 ---------- ##

EXCEPTED="Chances to get a 4 four-of-a-kind: 1.62%"
EXCEPTED_RETURN_VALUE=0
RESULT=$(./201yams 1 2 3 4 5 four_4)
RETURN_VALUE=$?

if [ "$RESULT" = "$EXCEPTED" ] && [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 2: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 2: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    echo ${YELLOW_BOLD}'Expected: ' ${RESET} $EXCEPTED
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 3 ---------- ##

EXCEPTED="Chances to get a 6 straight: 16.67%"
EXCEPTED_RETURN_VALUE=0
RESULT=$(./201yams 2 2 5 4 6 straight_6)
RETURN_VALUE=$?

if [ "$RESULT" = "$EXCEPTED" ] && [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 3: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 3: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    echo ${YELLOW_BOLD}'Expected: ' ${RESET} $EXCEPTED
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 4 ---------- ##
EXCEPTED="Chances to get a 2 full of 3: 0.13%"
EXCEPTED_RETURN_VALUE=0
RESULT=$(./201yams 0 0 0 0 0 full_2_3)
RETURN_VALUE=$?

if [ "$RESULT" = "$EXCEPTED" ] && [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 4: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 4: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    echo ${YELLOW_BOLD}'Expected: ' ${RESET} $EXCEPTED
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 5 ---------- ##
EXCEPTED="Chances to get a 2 full of 3: 0.13%"
EXCEPTED_RETURN_VALUE=0
RESULT=$(./201yams 0 0 0 0 0 full_2_3)
RETURN_VALUE=$?

if [ "$RESULT" = "$EXCEPTED" ] && [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 5: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 5: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    echo ${YELLOW_BOLD}'Expected: ' ${RESET} $EXCEPTED
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 6 ---------- ##
EXCEPTED="Chances to get a 2 full of 3: 100.00%"
EXCEPTED_RETURN_VALUE=0
RESULT=$(./201yams 2 3 2 3 2 full_2_3)
RETURN_VALUE=$?

if [ "$RESULT" = "$EXCEPTED" ] && [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 6: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 6: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    echo ${YELLOW_BOLD}'Expected: ' ${RESET} $EXCEPTED
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 7 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 7: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 7: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 8 ---------- ##
EXCEPTED_RETURN_VALUE=0
RESULT=$(./201yams -h 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 8: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 8: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 9 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 1 2 3 4 5 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 9: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 9: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 10 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 1 2 3 4 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 10: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 10: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 11 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 1 2 3 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 11: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 11: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 12 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 1 2 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 12: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 12: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 13 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 1 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 13: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 13: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 14 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 0 0 0 0 0 0 yams_4 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 14: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 14: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 15 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 0 0 0 0 0 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 15: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 15: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 16 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 0 0 0 0 0 0 0 yams_4 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 16: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 16: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 17 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 0 7 0 0 0 full_2_3 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 17: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 17: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 18 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 0 0 0 a 0 0 full_2_3 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 18: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 18: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 19 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 0 0 0 0 0 b full_2_3 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 19: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 19: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 20 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 0 0 0 -1 0 0 full_2_3 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 20: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 20: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 21 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 1 r r r r helloword 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 21: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 21: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 21 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 1 r r r r helloword 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 22: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 22: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 22 ---------- ##
EXCEPTED="Chances to get a 2 full of 3: 1.39%"
EXCEPTED_RETURN_VALUE=0
RESULT=$(./201yams 1 2 3 4 5 full_2_3)
RETURN_VALUE=$?

if [ "$RESULT" = "$EXCEPTED" ] && [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 23: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 23: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    echo ${YELLOW_BOLD}'Expected: ' ${RESET} $EXCEPTED
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 22 ---------- ##
EXCEPTED="Chances to get a 6 straight: 16.67%"
EXCEPTED_RETURN_VALUE=0
RESULT=$(./201yams 1 2 3 4 5 straight_6)
RETURN_VALUE=$?

if [ "$RESULT" = "$EXCEPTED" ] && [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 24: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 24: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    echo ${YELLOW_BOLD}'Expected: ' ${RESET} $EXCEPTED
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 25 ---------- ##

EXCEPTED="Chances to get a 4 four-of-a-kind: 0.33%"
EXCEPTED_RETURN_VALUE=0
RESULT=$(./201yams 1 2 3 0 0 four_4)
RETURN_VALUE=$?

if [ "$RESULT" = "$EXCEPTED" ] && [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 25: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 25: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    echo ${YELLOW_BOLD}'Expected: ' ${RESET} $EXCEPTED
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 26 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 1 2 3 4 5 full_3_3 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 26: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 26: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi

## ---------- TEST 27 ---------- ##
EXCEPTED_RETURN_VALUE=84
RESULT=$(./201yams 1 2 3 4 5 full_2_2 2>&1)
RETURN_VALUE=$?

if [ $RETURN_VALUE -eq $EXCEPTED_RETURN_VALUE ]; then
    echo ${BOLD_GREEN}'Test 27: OK' ${RESET}
    TEST_PASSED=$((TEST_PASSED + 1))
else
    echo ${BOLD_MAGENTA}'Test 27: KO' ${RESET}
    echo ${YELLOW_BOLD}'Return value: ' ${RESET} $RETURN_VALUE
    echo ${YELLOW_BOLD}'Excepted return value: ' ${RESET} $EXCEPTED_RETURN_VALUE
    echo ${YELLOW_BOLD}'Result: ' ${RESET} $RESULT
    TEST_FAILED=$((TEST_FAILED + 1))
fi


## ---------- END ---------- ##

echo ${BLEU_BOLD}'\n[END OF TESTS]' ${RESET}
echo ${GREEN}'  Passed: ' ${RESET} $TEST_PASSED
echo ${RED}'  Failed: ' ${RESET} $TEST_FAILED

rm 201yams

exit 0
