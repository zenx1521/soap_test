class WsdlTestController < ApplicationController
  def wsdl
    doc = File.open(Rails.root.join('lib/wsdl.xml')) { |f| Nokogiri::XML(f) }
    render xml: doc
  end

  def actions
    http_soapaction = JSON.parse(request.headers["HTTP_SOAPACTION"]).to_sym
    xml = Nokogiri::XML(request.body.string)

    atrs = XmlToHashParamsMapper.map(operation: http_soapaction, xml: xml)

    result = case http_soapaction
    when :integer_to_string
      IntegerToStringService.call(atrs: atrs)
    when :concat
      ConcatService.call(atrs: atrs)
    end 

    render xml: build_response(http_soapaction, result)
  end 

  private

  def build_response(operation, result)
    Nokogiri::XML::Builder.new do |xml|
      xml.Envelope {
        xml.Body {
          xml.send("#{operation}_response") {
            xml.value result
          }
        }
      }
    end
  end
end