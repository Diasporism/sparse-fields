class ApplicationController < ActionController::Base
  private

  def requested_fields_for(resource)
    combined_fields = jsonapi_fields
    resource.class.default_api_fields.each_pair do |key, value|
      combined_fields[key] ||= []
      combined_fields[key].concat(value)
    end
    combined_fields
  end

  def requested_include_for(resource)
    combined_includes = jsonapi_include&.split(',') || []
    resource.class.default_api_include.each do |included_thing|
      if included_thing.is_a?(Hash)
        combined_includes[combined_includes.index(included_thing.key)] << included_thing.values
      else
        combined_includes << included_thing.to_s
      end
    end
    combined_includes
  end

end
