# frozen_string_literal: true

require 'rss'

class FetchArticleBatch
  def execute
    rss = RSS::Parser.parse(Settings.bookmark_url)
    rss.items.each do |item|
      Article.update_or_create_from_rss(parse_item(item))
    end
  end

  private

  def parse_item(item)
    {
      id: extraction_id(item.about),
      title: item.title,
      description: extraction_description(item.content_encoded),
      link: item.link,
      thumbnail: extraction_thumbnail(item.content_encoded)
    }
  end

  def extraction_id(about)
    about[/bookmark-(\d+)/, 1].to_i
  end

  def extraction_description(content_encoded)
    html = Nokogiri::HTML.parse(content_encoded)
    html.css('p')[1].text
  end

  def extraction_thumbnail(content_encoded)
    html = Nokogiri::HTML.parse(content_encoded)
    thumbnail = html.css('img')[1].attributes['src'].value[%r{height=\d+;version=\d+;width=\d+/(.+)}, 1]
    CGI.unescape(thumbnail)
  end
end
