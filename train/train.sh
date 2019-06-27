#!/bin/bash

export PATHFILES=/home/anastasia/Loria/opennmtpy_models

# No delex, copy and coverage
# preprocess, need to use dynamic_dict
python3 ../OpenNMT-py/preprocess.py \
-train_src data/train.triple \
-train_tgt data/train.lex \
-valid_src data/dev.triple \
-valid_tgt data/dev.lex \
-src_seq_length 70 \
-tgt_seq_length 70 \
-dynamic_dict \
-save_data data/data
# -share_vocab

# train
CUDA_VISIBLE_DEVICES=3 python3 ../OpenNMT-py/train.py \
-data data/data \
-save_model models/model \
-gpu_ranks 0 \
-copy_attn \
-coverage_attn \

# translate
python3 ../OpenNMT-py/translate.py \
-model models/model_step_1000.pt \
-src data/source.triple \
-output data/predictions.txt \
-gpu 0 --beam_size 1 --random_sampling_topk 1 -verbose

