module OVIRT
 class Host < BaseObject
    attr_reader :description, :status, :cluster

    def initialize(client, xml)
      super(client, xml[:id], xml[:href], (xml/'name').first.text)
      parse_xml_attributes!(xml)
      self
    end

    private

    def parse_xml_attributes!(xml)
      @description = ((xml/'description').first.text rescue nil)
      @status = (xml/'status').first.text
      @clister = Link::new(@client, (xml/'cluster').first[:id], (xml/'cluster').first[:href])
    end
  end
end