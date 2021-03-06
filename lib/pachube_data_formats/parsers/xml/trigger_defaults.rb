module PachubeDataFormats
  module Parsers
    module XML
      module TriggerDefaults
        def from_xml(xml)
          xml = Nokogiri.parse(xml)
          hash = {}
          hash["id"] = xml.at_xpath("//id").content if xml.at_xpath("//id")
          hash["url"] = xml.at_xpath("//url").content if xml.at_xpath("//url")
          hash["trigger_type"] = xml.at_xpath("//trigger-type").content if xml.at_xpath("//trigger-type")
          hash["threshold_value"] = xml.at_xpath("//threshold-value").content if xml.at_xpath("//threshold-value")
          hash["notified_at"] = xml.at_xpath("//notified-at").content if xml.at_xpath("//notified-at")
          hash["user"] = xml.at_xpath("//user").content if xml.at_xpath("//user")
          hash["environment_id"] = xml.at_xpath("//environment-id").content if xml.at_xpath("//environment-id")
          hash["stream_id"] = xml.at_xpath("//stream-id").content if xml.at_xpath("//stream-id")
          hash
        end
      end
    end
  end
end

