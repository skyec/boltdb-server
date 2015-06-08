.PHONY: clean test install

boltdb-server:
	go build

test:
	go test

install:
	go install

clean:
	rm test.db boltdb-server
