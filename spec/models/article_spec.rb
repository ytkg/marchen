# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '.update_or_create_from_rss' do
    let(:item) do
      {
        id: 1,
        title: 'タイトル',
        description: 'ディスクリプション',
        link: 'https://example.jp',
        thumbnail: 'https://example.jp/thumbnail.png'
      }
    end

    subject { described_class.update_or_create_from_rss(item) }

    it do
      is_expected.to have_attributes(id: 1,
                                     title: 'タイトル',
                                     description: 'ディスクリプション',
                                     link: 'https://example.jp',
                                     thumbnail: 'https://example.jp/thumbnail.png')
    end
  end
end
