class XmlToHashParamsMapper
  ATTRIBUTES = {
    integer_to_string: ["value"].freeze,
    concat: ["value_1", "value_2"].freeze
  }.freeze

  def self.map(operation:, xml:)
    result = {}

    ATTRIBUTES[operation.to_sym].each do |attribute|
      result[attribute.to_sym] = xml.search("#{operation} #{attribute}").text
    end

    result
  end
end 