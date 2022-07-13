# frozen_string_literal: true

require 'json'

module Search
  include Nanoc::Helpers::Text

  def create_search_index
    index = []
    @items.each do |item|
      if item.attributes[:filename].end_with?('markdown')
        index << { id: item.path, title: item.attributes[:title], body: strip_html(item.compiled_content) }
      end
    end

    index_file = File.join(@config[:output_dir], 'search.json')
    File.write(index_file, JSON.generate(index))
  end
end

include Search
