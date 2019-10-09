module Serializable
  extend ActiveSupport::Concern

  module ClassMethods
    def default_api_fields
      {}
    end

    def default_api_include
      []
    end
  end
end
