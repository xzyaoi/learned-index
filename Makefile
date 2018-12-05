CC=clang++ -march=native -std=c++1y -Ofast
CFLAGS=-I/usr/local/include/eigen3 -I/usr/local/include/rapidjson

bin:
	$(CC) main.cpp -o learned-index $(CFLAGS)

.PHONY: clean test

clean:
	rm -f learned-index

test: bin
	scp 192.168.146.134:/home/leiy/Learned-Indexes/model/Random/full_train/NN/100000.json .
	scp 192.168.146.134:/home/leiy/Learned-Indexes/data/random.csv .
	python processmodel.py > model.txt
	python processdata.py > data.txt
	./learned-index model.txt data.txt

