#!/bin/bash

#1
echo ' '
echo 'Test 1 is running: "-n test2.txt" '
cat -n test2.txt > t
.././s21_cat -n test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#2
echo 'Test 2 is running: "-b test2.txt" '
cat -b test2.txt > t
.././s21_cat -b test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#3
echo 'Test 3 is running: "-e test2.txt" '
cat -e test2.txt > t
.././s21_cat -e test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#4
echo 'Test 4 is running: "-s test2.txt" '
cat -s test2.txt > t
.././s21_cat -s test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#5
echo 'Test 5 is running: "-t test2.txt" '
cat -t test2.txt > t
.././s21_cat -t test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#6
echo 'Test 6 is running: "-n -b -e -t -s test2.txt" '
cat -n -b -e -t -s test2.txt > t
.././s21_cat -n -b -e -t -s test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#7
echo 'Test 7 is running: "-n test.txt test2.txt" '
cat -n test.txt test2.txt > t
.././s21_cat -n test.txt test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#8
echo 'Test 8 is running: "-b test.txt test2.txt" '
cat -b test.txt test2.txt > t
.././s21_cat -b test.txt test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#9
echo 'Test 9 is running: "-e test.txt test2.txt" '
cat -e test.txt test2.txt > t
.././s21_cat -e test.txt test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#10
echo 'Test is running: "-t test.txt test2.txt" '
cat -t test.txt test2.txt > t
.././s21_cat -t test.txt test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#11
echo 'Test is running: "-s test.txt test2.txt" '
cat -s test.txt test2.txt > t
.././s21_cat -s test.txt test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#12
echo 'Test is running: "-n -b -e -t -s test.txt test2.txt" '
cat -n -b -e -t -s test.txt test2.txt > t
.././s21_cat -n -b -e -t -s test.txt test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#13
echo 'Test is running: "-n -e -t -s test.txt test2.txt" '
cat -n -e -t -s test.txt test2.txt > t
.././s21_cat -n -e -t -s test.txt test2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#14
echo 'Test is running: "-n -e -t -s test.txt test2.txt >>" '
cat -n -e -t -s test.txt test2.txt >> t
.././s21_cat -n -e -t -s test.txt test2.txt >> ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#нет файла
#15
echo 'Test is running: "cat test.txt > VS ./s21 test.txt >" '
cat test.txt > t
.././s21_cat test.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#некорректная опция
#16
echo 'Test is running: "-z test.txt" '
cat -z test.txt > t
.././s21_cat -z test.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#вывод всех файлов
#17
echo 'Test is running: "cat *.txt VS s21_cat *.txt" '
cat *.txt > t
.././s21_cat *.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi