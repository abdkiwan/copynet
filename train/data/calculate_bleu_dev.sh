#!/bin/bash

# compute BLEU

export TEST_TARGETS_REF0=reference0.lex
export TEST_TARGETS_REF1=reference1.lex
export TEST_TARGETS_REF2=reference2.lex
export TEST_TARGETS_REF3=reference3.lex
export TEST_TARGETS_REF4=reference4.lex
export TEST_TARGETS_REF5=reference5.lex
export TEST_TARGETS_REF6=reference6.lex
export TEST_TARGETS_REF7=reference7.lex

./multi-bleu.perl ${TEST_TARGETS_REF0} ${TEST_TARGETS_REF1} ${TEST_TARGETS_REF2} ${TEST_TARGETS_REF3} ${TEST_TARGETS_REF4} ${TEST_TARGETS_REF5} ${TEST_TARGETS_REF6} ${TEST_TARGETS_REF7} < predictions.txt

