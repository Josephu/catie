require "catie/version"
require 'active_support'
require 'active_record'

module Catie
	extend ActiveSupport::Concern

	module ClassMethods
		def serialize_attributes(column,*args)
			options = args.extract_options!
			@serialize_attributes = args
			serialize column
			args.each do |sa|
				define_method(sa) do
					self[column]["#{sa}"]
					#instance_variable_get("@#{sa}")
				end
				define_method("#{sa}=") do |value|
					if self[column]
						self[column]["#{sa}"]=value
					else
						self[column]={"#{sa}"=>value}
					end
					#instance_variable_set("@#{sa}",value)
				end
			end
		end
	end
end
