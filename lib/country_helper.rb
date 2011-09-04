# encoding: UTF-8

require File.dirname(__FILE__) + '/country_definitions'

module ActionView
  module Helpers
    module FormOptionsHelper
      def country_select(object, method, options = {}, html_options = {})
        options[:keys] = :names unless options.has_key?(:keys)
        options[:values]  = :nums  unless options.has_key?(:values)
        Rails.logger.info("keys: " << options[:keys].to_s << " values: " << options[:values].to_s)

        potential = {
          names:   COUNTRY_NAMES,
          nums:    COUNTRY_NUMS,
          alpha2s: COUNTRY_ALPHA2S,
          alpha3s: COUNTRY_ALPHA3S
        }
        Rails.logger.info("keys: " << potential[options[:keys]].to_s << " values: " << potential[options[:values]].to_s)

        select_options = potential[options[:keys]].zip(potential[options[:values]])

        InstanceTag.new(object, method, self, options.delete(:object)).to_select_tag(select_options, options, html_options)
      end
    end

    class FormBuilder
      def country_select(method, options = {}, html_options = {})
        @template.country_select(@object_name, method, options.merge({object: @object}), html_options)
      end
    end
  end
end
