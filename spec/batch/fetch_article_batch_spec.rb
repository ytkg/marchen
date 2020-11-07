# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FetchArticleBatch do
  describe '#execute' do
    before do
      rss = RSS::Parser.parse(open('./spec/files/bookmark.rss').read)
      allow(RSS::Parser).to receive(:parse).and_return(rss)
      described_class.new.execute
    end

    it { expect(Article.count).to eq 20 }
    it {
      expect(Article.first).to have_attributes(
        id: 372_901_222,
        title: '不信と疑心暗鬼の先にある身勝手で新しい景色。「Giraffe Town」｜ソーシキ博士｜note',
        description: 'スーパーマリオの生みの親である任天堂の宮本茂氏が「スーパーマリオギャラクシー」を作る際、新入社員が描いた敵キャラがなぜダメなのかを説明する必要に迫られて「『マリオ』に出てくるキャラクターはひと目見ただけで機能がわかることがとても大事だ」と話したというエピソードがとても好きだ。 ファミコンのマリオを...',
        link: 'https://note.com/soshiki_hakase/n/n85e71e16229c',
        thumbnail: 'https://assets.st-note.com/production/uploads/images/8195258/rectangle_large_type_2_c996a7b699502b98236483837be03834.jpg?fit=bounds&quality=60&width=1280'
      )
    }
  end
end
