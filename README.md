# protoc-gen-apidocs

`protoc-gen-apidocs` is a very simple and customizable protoc generator that translates .proto files into clean and readable markdown format.

This is achieved by levearging the fantastic
[protogen](https://pkg.go.dev/google.golang.org/protobuf/compiler/protogen) library and Go's
built-in templating capabilties.

## Example Output

**Vehicle.proto example**

This example shows a variety of protobuf features including extensions and nested messages.

* [Output markdown](./testdata/example1/Vehicle.md)
* [Source proto](./testdata/example1/Vehicle.proto)


**Booking.proto example**

This example is relatively simple but shows streaming rpc endpoints properly handled.

* [Output markdown](./testdata/example1/Booking.md)
* [Source proto](./testdata/example1/Booking.proto)


