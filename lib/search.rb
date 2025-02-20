# frozen_string_literal: true

require 'json'

module Search
  include Nanoc::Helpers::Text

  def create_search_index
    index_file = File.join(@config[:output_dir], 'search.json')
    File.write(index_file, articles_json)
  end

  def articles_json
    @articles_json ||= begin
      index = []

      @items.each do |item|
        next if item.attributes[:is_hidden]
        next unless item.attributes[:filename].end_with?('markdown')

        index << {
          id: item.path,
          title: item.attributes[:title],
          excerpt: item[:excerpt],
          categories: item[:categories],
          body: item.compiled_content
        }
      end

      JSON.generate(index)
    end
  end
end

include Search
