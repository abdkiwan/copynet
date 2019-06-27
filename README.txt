Most important:

clone the repo https://github.com/OpenNMT/OpenNMT-py.git


Data folder (train/data) :

1- train.triple       : input train data (triples) 
2- train.lex          : output train data (sentences)
3- dev.triple         : input validation data (triples)
4- dev.lex            : output validation data (sentences)
5- source.triple      : input test data (triples)
6- reference(0-7).lex : output test data (sentences)
Note : There are 8 files because every triple in the test data has multiple target sentences.
7- calculate_bleu_dev.sh : 
	Running it using (./calculate_bleu_dev.sh) calculates bleu scores. 
	It requires predictions.txt and reference(0-7).lex files to be in the same directory.


Train folder :

- Training copynet without pretrained embeddings : ./train.sh
- Training copynet pretrained embeddings         : ./train_with_embedding.sh
Note : the embeddings file has to be in the folder (data), and named (embeddings.vec).
The training parameters are found in: http://opennmt.net/OpenNMT-py/options/train.html , and could be changed in the training files.


API :
python api.py -model model.pt -src source.triple -output predictions.txt
Usage :
curl -i -H "Content-Type: application/json" -X POST -d '{"sentence":"---"}' http://localhost:5000


