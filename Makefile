.PHONY: test
test: tmp/googleapis
	go install
	protoc \
		-I thirdparty \
		-I tmp/googleapis \
		-I testdata \
		--apidocs_out=testdata/ \
		--apidocs_opt=paths=source_relative \
		testdata/example1/*.proto

.PHONY: install
install:
	go install

tmp/googleapis:
	rm -rf tmp/googleapis tmp/protocolbuffers
	git clone --depth 1 https://github.com/googleapis/googleapis tmp/googleapis
	rm -rf tmp/googleapis/.git
	git clone --depth 1 https://github.com/protocolbuffers/protobuf tmp/protocolbuffers
	cp -r tmp/protocolbuffers/src/* tmp/googleapis/
	rm -rf tmp/protocolbuffers

