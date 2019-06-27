from __future__ import unicode_literals
from itertools import repeat

from onmt.utils.logging import init_logger
from onmt.utils.misc import split_corpus
from onmt.translate.translator import build_translator

import onmt.opts as opts
from onmt.utils.parse import ArgumentParser

import flask
from flask import request, abort, jsonify

def _get_parser():
    parser = ArgumentParser(description='translate.py')

    opts.config_opts(parser)
    opts.translate_opts(parser)
    return parser

def translate_sentence(sentence):
    parser = _get_parser()

    opt = parser.parse_args()
    translator = build_translator(opt)
    prediction = translator.translate(src=[sentence], batch_size=opt.batch_size)[1][0][0]

    return prediction

app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/', methods=['POST'])
def create_task():
    if not request.json or not 'sentence' in request.json:
        abort(400)

    return jsonify({'prediction': translate_sentence(request.json['sentence'])}), 201

app.run()
