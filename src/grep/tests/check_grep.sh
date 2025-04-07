#!/bin/bash

#опции + один файл
#1
echo ' '
echo 'Test 1 is running: "-e 'cat' gr1.txt" '
grep -e 'cat' gr1.txt > t
.././s21_grep -e 'cat' gr1.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#2
echo 'Test 2 is running: "-i 'cat' gr1.txt" '
grep -i 'cat' gr1.txt > t
.././s21_grep -e 'cat' gr1.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#3
echo 'Test 3 is running: "-v 'cat' gr1.txt" '
grep -v 'cat' gr1.txt > t
.././s21_grep -v 'cat' gr1.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#4
echo 'Test 4 is running: "-c 'cat' gr1.txt" '
grep -c 'cat' gr1.txt > t
.././s21_grep -c 'cat' gr1.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#5
echo 'Test 5 is running: "-l 'cat' gr1.txt" '
grep -l 'cat' gr1.txt > t
.././s21_grep -l 'cat' gr1.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#6
echo 'Test 6 is running: "-n 'cat' gr1.txt" '
grep -n 'cat' gr1.txt > t
.././s21_grep -n 'cat' gr1.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#опции + несколько файлов
#7
echo 'Test 7 is running: "-e 'cat' gr1.txt gr2.txt" '
grep -e 'cat' gr1.txt gr2.txt > t
.././s21_grep -e 'cat' gr1.txt gr2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#8
echo 'Test 8 is running: "-i 'cat' gr1.txt gr2.txt" '
grep -i 'cat' gr1.txt gr2.txt > t
.././s21_grep -i 'cat' gr1.txt gr2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#9
echo 'Test 9 is running: "-v 'cat' gr1.txt gr2.txt" '
grep -v 'cat' gr1.txt gr2.txt > t
.././s21_grep -v 'cat' gr1.txt gr2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#10
echo 'Test 10 is running: "-c 'cat' gr1.txt gr2.txt" '
grep -c 'cat' gr1.txt gr2.txt > t
.././s21_grep -c 'cat' gr1.txt gr2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#11
echo 'Test 11 is running: "-l 'cat' gr1.txt gr2.txt" '
grep -l 'cat' gr1.txt gr2.txt > t
.././s21_grep -l 'cat' gr1.txt gr2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#11.1
echo 'Test 11.1 is running: "-l 'cat' *.txt" '
grep -l 'cat' *.txt > t
.././s21_grep -l 'cat' *.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#некорректный формат/отсутствие файла
#11.2
echo 'Test 11.2 is running: "-l 'cat' *.p" '
grep -l 'cat' *.p > t
.././s21_grep -l 'cat' *.p > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#12
echo 'Test 12 is running: "-n 'cat' gr1.txt gr2.txt" '
grep -n 'cat' gr1.txt gr2.txt > t
.././s21_grep -n 'cat' gr1.txt gr2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#шаблон регулярного выражения отсутствует
#13
echo 'Test 13 is running: "-n 'boba' gr1.txt gr2.txt" '
grep -n 'boba' gr1.txt gr2.txt > t
.././s21_grep -n 'boba' gr1.txt gr2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#некорректная опция
#14
echo 'Test 14 is running: "-m 'cat' gr1.txt gr2.txt" '
grep -m 'boba' gr1.txt gr2.txt > t
.././s21_grep -m 'boba' gr1.txt gr2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi

#нет опций
#15
echo 'Test 15 is running: "'cat' gr1.txt gr2.txt" '
grep 'cat' gr1.txt gr2.txt > t
.././s21_grep 'cat' gr1.txt gr2.txt > ts

if diff "t" "ts" > /dev/null; then
    echo 'Suscess'
    echo ' '
else 
    echo 'Fail'
fi
