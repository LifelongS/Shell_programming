# Написать shell-процедуру, которая:
# вводит символьную строку, содержащую маршрутное имя некоторого файла; проверяет введенное маршрутное имя, если оно начинается с символа /, на совпадение его первой части с маршрутным именем домашнего каталога пользователя;
# если введенное маршрутное имя содержит маршрутное имя домашнего каталога или является относительным, то проверяет существование указанного файла, в противном случае выводит на экран сообщение об ошибке;
# если файл существует, то выводит на экран его содержимое;
# если файл не существует, то создает его и записывает в него строку, передаваемую в качестве параметра;

#!/bin/bash

echo $0

echo "Привет, мир!"

if [ $# -gt 0 ]; then
 case $1 in
  \/*)
   if [[ $1 == $HOME* ]]; then
    if [ -f "$1" ];then
     cat $1
    else
     if [ $# -gt 1 ]; then
      echo $2 > $1
     else
      echo "Записывать в файл нечего!"
     fi
    fi
   fi
   ;;
  * )
                        if [ -f "$1" ];then
                                        cat $1
                                else
                                        if [ $# -gt 1 ]; then
                                                echo $2 > $1
                                        else
                                                echo "Записывать в файл нечего!"
                                        fi
                                fi

   ;;
 esac
else
 echo 'Не было введено ничего!'
fi
