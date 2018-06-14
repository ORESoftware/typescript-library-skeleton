#!/usr/bin/env bash

echo "your simple bash test goes here"

simple_return_zero(){
  return 0;
}

simple_return_one(){
  return 1;
}

if simple_return_zero; then
   echo "we have 0000";
fi

if ! simple_return_zero; then
   echo "we have not 00000";
fi

if simple_return_one; then
   echo "we have 11111";
fi

if ! simple_return_one; then
   echo "we have not 11111";
fi
