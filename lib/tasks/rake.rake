# encoding: UTF-8

require 'nokogiri'
require 'open-uri'

class Array
  def dump_source
    result = "["
    self.collect do |item|
      result << "\n  "
      case item.class.to_s
        when "Fixnum" then result << item.to_s
        when "String" then result << "'" << item.escape_single_quotes << "'"
      end
      result << ","
    end
    result << "\n]"
  end
end

class String
  def escape_single_quotes
    self.gsub(/[']/, '\\\\\'')
  end
end

namespace :plugin do
  namespace :country_select do
    task :rebuild_country_arrays do
      names   = []
      alpha2s = []
      alpha3s = []
      nums    = []

      url = "http://en.wikipedia.org/w/index.php?title=ISO_3166-1&action=render"
      rows = Nokogiri::HTML(open(url)).xpath("/html/body/table[2]/tr")

      rows.each do |row|
        next if row.children[0].name === "th"

        begin
          names << row.xpath(".//td[1]/a")[0].content.to_s
        rescue NoMethodError
          names << row.xpath(".//td[1]/span/a")[0].content.to_s
        end

        alpha2s << row.xpath(".//td[2]/a/tt")[0].content.to_s
        alpha3s << row.xpath(".//td[3]/tt")[0].content.to_s
        nums    << row.xpath(".//td[4]/tt")[0].content.to_i
      end

      File.open(File.dirname(__FILE__) + "/../country_definitions.rb", "w:UTF-8") do |definitions|
        definitions << "# encoding: UTF-8\n\n"
        definitions << "COUNTRY_NAMES  = " << names.dump_source   << "\n\n"
        definitions << "COUNTRY_ALPHA2 = " << alpha2s.dump_source << "\n\n"
        definitions << "COUNTRY_ALPHA3 = " << alpha3s.dump_source << "\n\n"
        definitions << "COUNTRY_NUM    = " << nums.dump_source    << "\n\n"
      end
    end
  end
end