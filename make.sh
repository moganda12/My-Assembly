#!/bin/sh
nasm "$1" -felf64 -o "$2".o
ld "$2".o -o "$2"
rm "$2".o
./"$2"