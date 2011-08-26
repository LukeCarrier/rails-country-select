# Heavily (and shamelessly) inspired by
#   https://github.com/rails/country_select/blob/master/lib/country_select.rb

require File.dirname(__FILE__) + '/country_definitions'

module ActionView
  module Helpers
    module FormOptionsHelper
      def country_select(object, method, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_select_tag(COUNTRY_NAMES, options, html_options)
      end
    end

    class FormBuilder
      def country_select(method, options = {}, html_options = {})
        Rails.logger.info("ActionView::Helpers::FormBuilder.country_select()")
        Rails.logger.info([method, options, html_options].to_s)
        @template.country_select(@object_name, method, options.merge({object: @object}), html_options)
      end
    end
  end
end
