require 'spec_helper'

describe "default datastream xml parser" do
  context "0.5.1 (used by API v2)" do
    it "should convert into attributes hash" do
      @xml = datastream_as_(:xml)
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end

    it "should handle blank tags" do
      @xml = datastream_as_(:xml, :except_node => :tag)
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end

    it "should handle blank units" do
      @xml = datastream_as_(:xml, :except_node => :unit)
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end

    it "should handle missing unit attributes" do
      @xml = datastream_as_(:xml, :except_node => :unit_attributes)
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end

    it "should handle missing timestamps" do
      @xml = datastream_as_(:xml, :except_node => :timestamps)
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end
  end

  context "5 (used by API v1)" do
    it "should convert into attributes hash" do
      @xml = datastream_as_(:xml, :version => "5")
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end

    it "should handle blank tags" do
      @xml = datastream_as_(:xml, :version => "5", :except_node => :tag)
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end

    it "should handle blank units" do
      @xml = datastream_as_(:xml, :version => "5", :except_node => :unit)
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end

    it "should handle missing unit attributes" do
      @xml = datastream_as_(:xml, :version => "5", :except_node => :unit_attributes)
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end

    it "should handle missing value attributes" do
      @xml = datastream_as_(:xml, :version => "5", :except_node => :value_attributes)
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end

    it "should handle missing timestamps" do
      @xml = datastream_as_(:xml, :version => "5", :except_node => :timestamps)
      PachubeDataFormats::Datastream.new(@xml).should fully_represent_datastream(:xml, @xml)
    end
  end
end

