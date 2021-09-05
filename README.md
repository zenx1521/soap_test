Soap_test

ruby version: 3.0.0p0

Usage:

client = Savon::Client.new(wsdl: "http://localhost:3000/wsdl")

result = client.call(:concat, message: { value_1: 123, value_2: "abc" })
result.body => {:concat_response=>{:value=>"123abc"}}

result = client.call(:integer_to_string, message: { value: 123 })
result.body => {:integer_to_string_response=>{:value=>"123"}}
