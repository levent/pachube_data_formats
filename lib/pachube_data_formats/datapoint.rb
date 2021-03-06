module PachubeDataFormats
  class Datapoint
    ALLOWED_KEYS = %w(feed_id datastream_id at value)
    ALLOWED_KEYS.each { |key| attr_accessor(key.to_sym) }

    include PachubeDataFormats::Templates::JSON::DatapointDefaults
    include PachubeDataFormats::Templates::XML::DatapointDefaults
    include PachubeDataFormats::Templates::CSV::DatapointDefaults
    include PachubeDataFormats::Parsers::JSON::DatapointDefaults
    include PachubeDataFormats::Parsers::XML::DatapointDefaults

    # validates_presence_of :datastream_id
    # validates_presence_of :value

    include Validations

    def valid?
      pass = true
      [:datastream_id, :value, :feed_id].each do |attr|
        if self.send(attr).blank?
          errors[attr] = ["can't be blank"]
          pass = false
        end
      end
      return pass
    end

    def initialize(input = {})
      if input.is_a? Hash
        self.attributes = input
      elsif input.strip[0...1].to_s == "{"
        self.attributes = from_json(input)
      else
        self.attributes = from_xml(input)
      end
    end

    def attributes
      h = {}
      ALLOWED_KEYS.each do |key|
        value = self.send(key)
        h[key] = value unless value.nil?
      end
      return h
    end

    def attributes=(input)
      return if input.nil?
      input.deep_stringify_keys!
      ALLOWED_KEYS.each { |key| self.send("#{key}=", input[key]) }
      return attributes
    end

    def as_json(options = {})
      generate_json(options[:version])
    end

    def to_json(options = {})
      ::JSON.generate as_json(options)
    end

    def to_xml(options = {})
      generate_xml(options[:version])
    end

    def to_csv(options = {})
      generate_csv(options.delete(:version), options)
    end
  end
end

