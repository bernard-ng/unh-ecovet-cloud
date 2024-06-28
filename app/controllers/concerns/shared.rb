# frozen_string_literal: true

require 'json'

module Shared
  def json_collection(name)
    path = Rails.root.join('data', "#{name}.json")
    JSON.parse(File.read(path), object_class: OpenStruct)
  end
end
