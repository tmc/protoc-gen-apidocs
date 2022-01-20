{{define "output"}}
{{template "html" .}}
{{end}}

{{define "html" }}
<html lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <meta name="theme-color" content="#000000">
    <link rel="icon" type="image/png" href="/static/img/favicon.png">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
{{template "body" .}}
</html>
{{end}}

{{define "body" }}
<body>
<div id="root">
<main>
  <div class="page-centered container mx-auto px-20">
{{template "nav"}}
    <div class="w-full mt-6">
      <div class="flex flex-col sm:flex-row justify-between items-baseline border-b overflow-x-auto">
        <div class="flex flex-row space-x-2 items-center">
          <h1 class="text-2xl font-light pb-1" id="title">
          {{ .Desc.Package }}
          </h1>
          <p class="text-sm mx-1 px-2 py-1 rounded-full text-yellow-600 border border-yellow-600">
          package</p>
        </div>
      </div>
      <div class="my-5"></div>
      {{/* table-of-contents */}}

<!-- services -->
{{/*
{{template "services" .}}
*/}}
<!-- end services -->

<!-- messages -->
{{template "messages" .}}
<!-- end messages -->

<!-- options -->
{{template "options" .}}
<!-- end options -->

    </div>
  </div>
</main>
      {{template "footer"}}
  </div>
</body>
</html>

{{end}}




{{define "nav"}}
{{end}}

      {{define "table-of-contents"}}
      <div class="mt-3">
        <h1 class="text-3xl">Index</h1>
        <div class="flex-none mx-5 leading-loose">
          <div class="flex flex-row space-x-3.5 items-center">
            <a class="prose-link" href="#" name="{{.Desc.FullName | anchor}}">
<a ></a>
            </a>
            <div class="text-xs text-gray-500 mx-1 px-1.5 rounded-full bg-gray-200">
              message
            </div>
          </div>
          <div class="flex flex-row space-x-3.5 items-center">
            <div class="entity-index-module__messageIndent___iPjQB">
              <svg width="11" height="11" viewbox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M1 0V8C1 9.10457 1.89543 10 3 10H11"
              stroke="#9090A1"></path></svg>
            </div><a class="prose-link" href="/tmc-/test/docs/main/com.example.vehicle#com.example.vehicle.Manufacturer.Category">Category</a>
            <div class="text-xs text-gray-500 mx-1 px-1.5 rounded-full bg-gray-200">
              enum
            </div>
          </div>
          <div class="flex flex-row space-x-3.5 items-center">
            <a class="prose-link" href="/tmc-/test/docs/main/com.example.vehicle#com.example.vehicle.Model">
            Model</a>
            <div class="text-xs text-gray-500 mx-1 px-1.5 rounded-full bg-gray-200">
              message
            </div>
          </div>
          <div class="flex flex-row space-x-3.5 items-center">
            <a class="prose-link" href="/tmc-/test/docs/main/com.example.vehicle#com.example.vehicle.Vehicle">
            Vehicle</a>
            <div class="text-xs text-gray-500 mx-1 px-1.5 rounded-full bg-gray-200">
              message
            </div>
          </div>
          <div class="flex flex-row space-x-3.5 items-center">
            <div class="entity-index-module__messageIndent___iPjQB">
              <svg width="11" height="11" viewbox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M1 0V8C1 9.10457 1.89543 10 3 10H11"
              stroke="#9090A1"></path></svg>
            </div><a class="prose-link" href="/tmc-/test/docs/main/com.example.vehicle#com.example.vehicle.Vehicle.Category">Category</a>
            <div class="text-xs text-gray-500 mx-1 px-1.5 rounded-full bg-gray-200">
              message
            </div>
          </div>
        </div>
        <div>
          <div class="mx-5 leading-loose">
            <a class="prose-link" href="/tmc-/test/docs/main/com.example.vehicle#options">
            Options</a>
          </div>
        </div>
      </div>
{{end}}

{{define "services" }}
      <div class="mt-6 pt-2">
        <div class="px-6 text-lg items-baseline leading-6">
          <div class="entity-layout-module__borderBox___HYWHn">
            <div class=
            "py-1 flex flex-col sm:flex-row justify-between text-lg items-baseline leading-4 font-light">
              <div class=
              "flex flex-row space-x-1.5 items-baseline mr-5">
                <span class="text-blue-800 font-light">service</span>
              </div><a href="/tmc-/test/file/main/Booking.proto#L54">
              <div class="inline-block relative">
                <div class=
                "prose-link text-xs font-normal whitespace-nowrap">
                  Booking.proto
                </div>
                <div class="hidden">
                  <svg width="14" height="14" viewbox="0 0 14 14" fill=
                  "none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M4 10L1 7L4 4" stroke="#161EDE"
                  stroke-miterlimit="5"></path>
                  <path d="M10 10L13 7L10 4" stroke="#161EDE"
                  stroke-miterlimit="5"></path>
                  <path d="M8 3L6 11" stroke="#161EDE"
                  stroke-miterlimit="5"></path></svg>
                </div>
              </div></a>
            </div>
            <div class="inline-block relative">
              <h1 class="entity-layout-module__header___d-hIL">
              <a class="prose-link" href=
              "/tmc-/test/docs/main/com.example#com.example.BookingService">
              BookingService</a></h1>
              <div class="hidden">
                <h1 class="entity-layout-module__header___d-hIL">
                <svg width="15" height="16" viewbox="0 0 15 16" fill=
                "none" xmlns="http://www.w3.org/2000/svg">
                <path d="M6.4707 1L2.4707 15" stroke="#161EDE"></path>
                <path d="M12 1L8 15" stroke="#161EDE"></path>
                <line y1="10.3318" x2="14" y2="10.3318" stroke=
                "#161EDE"></line>
                <line x1="1" y1="5.33185" x2="15" y2="5.33185" stroke=
                "#161EDE"></line></svg></h1>
              </div>
            </div>
          </div>
        </div>
        <div class="px-6 py-3 rounded-b-md">
          <div class="text-base font-light overflow-x-auto">
            <p class="mb-2">Service for handling vehicle bookings.</p>
          </div>
          <div class="text-lg mt-3 border border-gray-200 rounded-md"
          id="BookVehicle">
            <div class=
            "px-6 py-2 border-b items-center space-x-1 font-medium text-lg flex flex-wrap">
              <a class="hover:underline prose-link" href=
              "/tmc-/test/docs/main/com.example#BookVehicle"><span class="text-blue-700 font-light">
              rpc</span> BookVehicle</a><span>(</span><a class=
              "prose-link" href=
              "/tmc-/test/docs/main/com.example#com.example.Booking">Booking</a><span>)</span><span class="text-gray-600">returns</span><span>(</span><a class="prose-link"
              href=
              "/tmc-/test/docs/main/com.example#com.example.BookingStatus">BookingStatus</a><span>)</span>
            </div>
            <div class="px-6 pt-3 rounded-b-md">
              <div class="text-base font-light overflow-x-auto">
                <p class="mb-2">/ Used to book a vehicle. Pass in a
                Booking and a BookingStatus will be returned.</p>
              </div>
              <div class="flex flex-col sm:flex-row justify-between">
                <div class="text-base">
                  <span class="text-gray-500 font-light">request</span>
                  Booking
                </div><a class=
                "text-xs text-gray-500 flex flex-row items-end hover:text-buf-blue hover:underline"
                href=
                "/tmc-/test/docs/main/com.example#com.example.Booking">see
                full type
                <div class="h-3 w-3 ml-0.5 mb-0.5">
                  <svg xmlns="http://www.w3.org/2000/svg" viewbox=
                  "0 0 20 20" fill="currentcolor">
                  <path d=
                  "M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z">
                  </path>
                  <path d=
                  "M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z">
                  </path></svg>
                </div></a>
              </div>
              <div class=
              "p-2 border border-gray-300 bg-gray-100 rounded-md text-xs font-mono mt-2 mb-3 overflow-x-auto">
                <table>
                  <tbody>
                    <tr>
                      <td>
                        <pre><code>message Booking {</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>    <span>int32</span> vehicle_id = 1;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>    <span>int32</span> customer_id = 2;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>   <a class="prose-link" href=
                        "/tmc-/test/docs/main/com.example#com.example.BookingStatus">BookingStatus</a> status = 3;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code class=
                        "text-gray-500">   // Has booking confirmation been sent?</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>        <span>bool</span> confirmation_sent = 4;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code class=
                        "text-gray-500">        // Has payment been received?</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code> <span>bool</span> payment_received = 5;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>       <span>string</span> color_preference = 6;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>}</code></pre>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="flex flex-col sm:flex-row justify-between">
                <div class="text-base">
                  <span class=
                  "text-gray-500 font-light">response</span>
                  BookingStatus
                </div><a class=
                "text-xs text-gray-500 flex flex-row items-end hover:text-buf-blue hover:underline"
                href=
                "/tmc-/test/docs/main/com.example#com.example.BookingStatus">see
                full type
                <div class="h-3 w-3 ml-0.5 mb-0.5">
                  <svg xmlns="http://www.w3.org/2000/svg" viewbox=
                  "0 0 20 20" fill="currentcolor">
                  <path d=
                  "M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z">
                  </path>
                  <path d=
                  "M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z">
                  </path></svg>
                </div></a>
              </div>
              <div class=
              "p-2 border border-gray-300 bg-gray-100 rounded-md text-xs font-mono mt-2 mb-3 overflow-x-auto">
                <table>
                  <tbody>
                    <tr>
                      <td>
                        <pre><code>message BookingStatus {</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>  <span>int32</span> id = 1;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>    <span>string</span> description = 2;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>}</code></pre>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="text-lg mt-3 border border-gray-200 rounded-md"
          id="BookingUpdates">
            <div class=
            "px-6 py-2 border-b items-center space-x-1 font-medium text-lg flex flex-wrap">
              <a class="hover:underline prose-link" href=
              "/tmc-/test/docs/main/com.example#BookingUpdates"><span class="text-blue-700 font-light">
              rpc</span> BookingUpdates</a><span>(</span><a class=
              "prose-link" href=
              "/tmc-/test/docs/main/com.example#com.example.BookingStatusID">BookingStatusID</a><span>)</span><span class="text-gray-600">returns</span><span>(</span><span class="font-light text-gray-600">stream</span><a class="prose-link"
              href=
              "/tmc-/test/docs/main/com.example#com.example.BookingStatus">BookingStatus</a><span>)</span>
            </div>
            <div class="px-6 pt-3 rounded-b-md">
              <div class="text-base font-light overflow-x-auto">
                <p class="mb-2">/ Used to subscribe to updates of the
                BookingStatus.</p>
              </div>
              <div class="flex flex-col sm:flex-row justify-between">
                <div class="text-base">
                  <span class="text-gray-500 font-light">request</span>
                  BookingStatusID
                </div><a class=
                "text-xs text-gray-500 flex flex-row items-end hover:text-buf-blue hover:underline"
                href=
                "/tmc-/test/docs/main/com.example#com.example.BookingStatusID">see
                full type
                <div class="h-3 w-3 ml-0.5 mb-0.5">
                  <svg xmlns="http://www.w3.org/2000/svg" viewbox=
                  "0 0 20 20" fill="currentcolor">
                  <path d=
                  "M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z">
                  </path>
                  <path d=
                  "M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z">
                  </path></svg>
                </div></a>
              </div>
              <div class=
              "p-2 border border-gray-300 bg-gray-100 rounded-md text-xs font-mono mt-2 mb-3 overflow-x-auto">
                <table>
                  <tbody>
                    <tr>
                      <td>
                        <pre><code>message BookingStatusID {</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>    <span>int32</span> id = 1;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>}</code></pre>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="flex flex-col sm:flex-row justify-between">
                <div class="text-base">
                  <span class=
                  "text-gray-500 font-light">response</span>
                  BookingStatus<span class=
                  "text-sm mx-1 px-2 text-gray-800 border rounded-full hover:no-underline text-buf-blue">Stream</span>
                </div><a class=
                "text-xs text-gray-500 flex flex-row items-end hover:text-buf-blue hover:underline"
                href=
                "/tmc-/test/docs/main/com.example#com.example.BookingStatus">see
                full type
                <div class="h-3 w-3 ml-0.5 mb-0.5">
                  <svg xmlns="http://www.w3.org/2000/svg" viewbox=
                  "0 0 20 20" fill="currentcolor">
                  <path d=
                  "M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z">
                  </path>
                  <path d=
                  "M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z">
                  </path></svg>
                </div></a>
              </div>
              <div class=
              "p-2 border border-gray-300 bg-gray-100 rounded-md text-xs font-mono mt-2 mb-3 overflow-x-auto">
                <table>
                  <tbody>
                    <tr>
                      <td>
                        <pre><code>message BookingStatus {</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code> <span>int32</span> id = 1;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>    <span>string</span> description = 2;</code></pre>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <pre><code>}</code></pre>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
{{end}}

{{define "messages"}}
{{range .Messages }}
{{template "message" .}}
{{end}}
{{end}}

{{define "message"}}
      <div class="mt-6 pt-2">
        <div class="px-6 text-lg items-baseline leading-6">
          <div class="entity-layout-module__borderBox___HYWHn">
            <div class="py-1 flex flex-col sm:flex-row justify-between text-lg items-baseline leading-4 font-light">
              <div class="flex flex-row space-x-1.5 items-baseline mr-5">
                <span class="text-ink-blue font-light">message</span>
              </div>
              {{/*
              // TODO: consider restoring file references
              <a href="/tmc-/test/file/main/Vehicle.proto#L11">
              <div class="inline-block relative">
                <div class="prose-link text-xs font-normal whitespace-nowrap">
                  Vehicle.proto
                </div>
                <div class="hidden">
                  <svg width="14" height="14" viewbox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M4 10L1 7L4 4" stroke="#161EDE"
                  stroke-miterlimit="5"></path>
                  <path d="M10 10L13 7L10 4" stroke="#161EDE" stroke-miterlimit="5"></path>
                  <path d="M8 3L6 11" stroke="#161EDE"
                  stroke-miterlimit="5"></path></svg>
                </div>
              </div></a>
              */}}
            </div>
            <div class="inline-block relative">
              <h1 class="entity-layout-module__header___d-hIL">
              <a class="prose-link" href="#{{.Desc.FullName | anchor}}" name="{{.Desc.FullName | anchor}}">
              {{.Desc.Name}}</a></h1>
              <div class="hidden">
                <h1 class="entity-layout-module__header___d-hIL">
                <svg width="15" height="16" viewbox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M6.4707 1L2.4707 15" stroke="#161EDE"></path>
                <path d="M12 1L8 15" stroke="#161EDE">
                </path>
                <line y1="10.3318" x2="14" y2="10.3318"
                stroke="#161EDE"></line>
                <line x1="1" y1="5.33185" x2="15" y2="5.33185" stroke="#161EDE">
                </line></svg></h1>
              </div>
            </div>
          </div>
        </div>
        <div class="px-6 py-3 rounded-b-md">
          <div class="text-base font-light overflow-x-auto">
            <p class="mb-2">
{{.Comments.Leading | description}}
          </p>
            <p class="mb-2">
{{.Comments.Trailing | description}}
          </p>
          </div>
          <div class="p-2 border border-gray-300 bg-gray-100 rounded-md text-xs font-mono mt-2 mb-3 overflow-x-auto">
            <table>
              <tbody>
                <tr>
                  <td>
                    <pre><code>message {{.Desc.Name}} {</code></pre>
                  </td>
                </tr>
                {{range .Fields}}
                <tr>
                  <td>
                    <pre><code>       <span>
{{- if (is_primitive .) -}}
  {{ field_type . }}</span>
{{- else -}}
     <a class="prose-link" href="#{{ full_field_type . | anchor }}">{{ .| field_type }}</a>
{{- end -}}
</span> {{ .Desc.Name }} = {{ .Desc.Index }};</code></pre>
                  </td>
                </tr>
                {{end}}

                {{/*
                <tr>
                  <td>
                    <pre><code>      <span>required </span><span>string</span> code = 2;</code></pre>
                  </td>
                </tr>
                <tr>
                  <td>
                    <pre><code>   <span>optional </span><span>string</span> details = 3;</code></pre>
                  </td>
                </tr>
                <tr>
                  <td>
                    <pre><code class="text-gray-500">  // Manufacturer category.</code></pre>
                  </td>
                </tr>
                <tr>
                  <td>
                    <pre><code>     <span>optional </span><a class="prose-link" href="/tmc-/test/docs/main/com.example.vehicle#com.example.vehicle.Manufacturer.Category">Manufacturer.Category</a> category = 4;</code></pre>
                  </td>
                </tr>
                */}}
                <tr>
                  <td>
                    <pre><code>}</code></pre>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
{{end}}


{{define "options"}}
      <div class="mt-6 pt-2">
        <div class="px-6 text-lg items-baseline leading-6">
          <div class="flex flex-row space-x-1.5 items-baseline mr-5">
            <h1 class="inline"><a class="prose-link" href="/#options">Options</a></h1>
          </div>
        </div>
        <div class="px-6 py-3 rounded-b-md">
          <div class="flex justify-end">
            <a href="/tmc-/test/file/main/Vehicle.proto#L32">
            <div class="inline-block relative">
              <div class="prose-link text-xs font-normal whitespace-nowrap">
                Vehicle.proto
              </div>
              <div class="hidden">
                <svg width="14" height="14" viewbox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M4 10L1 7L4 4" stroke="#161EDE"
                stroke-miterlimit="5"></path>
                <path d="M10 10L13 7L10 4" stroke="#161EDE"
                stroke-miterlimit="5"></path>
                <path d="M8 3L6 11" stroke="#161EDE"
                stroke-miterlimit="5"></path></svg>
              </div>
            </div></a>
          </div>
          <div class="p-2 border border-gray-300 bg-gray-100 rounded-md text-xs font-mono mt-2 mb-3 overflow-x-auto">
            <table>
              <tbody>
                <tr>
                  <td>
                    <pre><code>extend <span>com.example.vehicle.Manufacturer</span> {</code></pre>
                  </td>
                </tr>
                <tr>
                  <td>
                    <pre><code class="text-gray-500">      // Manufacturer country.</code></pre>
                  </td>
                </tr>
                <tr>
                  <td>
                    <pre><code>      <span>optional </span><span>string</span> country = 100;</code></pre>
                  </td>
                </tr>
                <tr>
                  <td>
                    <pre><code>}</code></pre>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
{{end}}

{{define "footer" }}
      <footer style="mx-auto">
        <p>generated by protoc-gen-apidocs<p>
      </footer>
{{end}}
