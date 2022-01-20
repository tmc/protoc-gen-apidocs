.PHONY: test
test: tmp/googleapis
	go install
	protoc \
		-I thirdparty \
		-I tmp/googleapis \
		-I testdata \
		--apidocs_out=testdata/ \
		--apidocs_opt=paths=source_relative,format=html \
		testdata/example1/Booking.proto

tmp/googleapis:
	rm -rf tmp/googleapis tmp/protocolbuffers
	git clone --depth 1 https://github.com/googleapis/googleapis tmp/googleapis
	rm -rf tmp/googleapis/.git
	git clone --depth 1 https://github.com/protocolbuffers/protobuf tmp/protocolbuffers
	cp -r tmp/protocolbuffers/src/* tmp/googleapis/
	rm -rf tmp/protocolbuffers

