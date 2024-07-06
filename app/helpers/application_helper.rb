# frozen_string_literal: true

module ApplicationHelper
  def encoding_names(type, ids)
    path = Rails.root.join('data', "#{type}.json")
    data = JSON.parse(File.read(path), object_class: OpenStruct)

    ids = ids.split(',').map(&:strip).map(&:to_i)
    id_to_name = data.each_with_object({}) do |item, hash|
      hash[item[:id]] = item[:name]
    end

    ids.map { |id| id_to_name[id] || id }
  end
end
