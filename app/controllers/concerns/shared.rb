require 'json'

module Shared

  def json_collection(name)
    path = Rails.root.join('data', "#{name.to_s}.json")
    JSON.parse(File.read(path), object_class: OpenStruct)
  end
end
