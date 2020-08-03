#!/usr/bin/env bash

make

echo
echo C
time ./test_c.exe

echo
echo Python
time python3 test.py

echo
echo "OCaml (idiomatic)"
time dune exec ./test_idiomatic.exe

echo
echo "OCaml (non-idiomatic)"
time dune exec ./test_non_idiomatic.exe
