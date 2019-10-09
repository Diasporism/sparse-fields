class ApplicationController < ActionController::Base
  private

  def requested_fields_for(resource)
    @requested_fields ||= begin
      combined_fields = jsonapi_fields
      resource.class.default_api_fields.each_pair do |key, value|
        combined_fields[key] ||= []
        combined_fields[key].concat(value)
      end

      sparse_fields_for_included_resources(resource).each_pair do |key, value|
        combined_fields[key] ||= []
        combined_fields[key].concat(value)
      end

      combined_fields
    end
  end

  def requested_include_for(resource)
    @requested_include_for ||= begin
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

  def sparse_fields_for_included_resources(resource)
    flattened_resources = []
    requested_include_for(resource).each do |resource|
      if resource.is_a?(Hash)
        flattened_resources.concat(resource.keys)
        flattened_resources.concat(resource.values.flatten)
      else
        flattened_resources << resource
      end
    end
    flattened_resources = flattened_resources.map(&:to_s).uniq

    flattened_resources.each_with_object({}) do |resource, hash|
      default_api_fields = resource.to_s.singularize.titleize.constantize.default_api_fields
      hash.deep_merge!(default_api_fields)
    end
  end
end
