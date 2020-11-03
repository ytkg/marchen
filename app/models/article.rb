# frozen_string_literal: true

class Article < ApplicationRecord
  def self.update_or_create_from_rss(item)
    find_or_initialize_by(id: item[:id]).tap do |article|
      article.update(title: item[:title], description: item[:description], link: item[:link], thumbnail: item[:thumbnail])
    end
  end
end
