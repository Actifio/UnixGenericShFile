#!/bin/sh

# modify these variables
DBPATH=/home/db/bin
DBNAME=proddb1

if [ $1 = “freeze” ];then
  $DBPATH freeze $DBNAME
  exit 0
fi

if [ $1 = “thaw” ];then
  $DBPATH thaw $DBNAME
  exit 0
fi

if [ $1 = “init” ];then
  echo "Nothing to do"
  exit 0
fi

if [ $1 = “abort” ];then
  $DBPATH thaw $DBNAME
  exit 0
fi

if [ $1 = “fini” ];then
  echo "Nothing to do"
  exit 0
fi
