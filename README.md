# JapaneseTrendKeywords

Library to get japanese trend keywords

sorces

 はてなキーワード > 注目キーワード http://d.hatena.ne.jp/hotkeyword?mode=rss


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'japanese_trend_keywords'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install japanese_trend_keywords

## Usage

2.2.0 :001 > require 'japanese_trend_keywords'

 => true

2.2.0 :002 > jtk = JapaneseTrendKeywords::JapaneseTrendKeywords.new

 => #<JapaneseTrendKeywords::JapaneseTrendKeywords:0x007fb863d0f958>

2.2.0 :003 > jtk.get(:hatena)

 => {:name=>:hatena, :url=>"http://d.hatena.ne.jp/hotkeyword?mode=rss", :keywords=>["Kindle", "竹島の日", "七つの大罪", "京都大学", "坂東三津五郎", "東京メトロ", "翔鶴", "2ch", "Go！プリンセスプリキュア", "テーブルトークRPG", "さいたま市", "シュリケン", "デュラララ!!×2", "海上保安庁", "楽園の瑕", "与那国島", "Windows Update", "マイクロソフト", "モーツァルト", "レノボ", "ワールドトリガー", "永住外国人", "関ジャニ∞", "四旬節", "題名のない音楽会", "夜ノヤッターマン", "プリキュア", "JavaScript", "クリスマスローズ", "6才のボクが、大人になるまで。", "DOG DAYS″", "JR東日本", "mixi", "Windows 8", "いわなだれ", "アドウェア", "ギルガルド", "サイコパス", "シューベルト", "チャンピオンRED", "ハーフマラソン", "パラリンピック", "ブラッドリー・クーパー", "プラトン", "プレシーズンマッチ", "ベンチマーク", "一宮市", "第一航空戦隊", "沖縄タイムス", "岩波書店", "許されざる者", "熊井友理奈", "後藤真希", "行幸", "黒子のバスケ", "今井正人", "撮り鉄", "死亡フラグ", "松岡茉優", "神武天皇", "仁徳天皇", "吹奏楽", "正規空母", "尖閣", "尖閣諸島", "探照灯", "田村ゆかり", "満州", "与那国町", "コパノリッキー", "インカンテーション", "東京マラソン", "東京オリンピック", "BMI", "BS-TBS", "Dropbox", "Evernote", "HDMI", "グレープブランデー", "武豊", "Lenovo", "アスファルト", "ソクラテス", "ニーチェ", "楽天ブックス", "聖霊", "徹甲弾", "陸上自衛隊", "ワイドバッハ", "ベストウォーリア", "電子書籍", "辺野古", "フェブラリーステークス", "ローマンレジェンド", "大河ドラマ", "総務省", "API", "アドマイヤロイヤル", "鎮守府", "トマ・ピケティ"]}

2.2.0 :004 > jtk.getAll

 => [{:name=>:hatena, :url=>"http://d.hatena.ne.jp/hotkeyword?mode=rss", :keywords=>["Kindle", "竹島の日", "七つの大罪", "京都大学", "坂東三津五郎", "東京メトロ", "翔鶴", "2ch", "Go！プリンセスプリキュア", "テーブルトークRPG", "さいたま市", "シュリケン", "デュラララ!!×2", "海上保安庁", "楽園の瑕", "与那国島", "Windows Update", "マイクロソフト", "モーツァルト", "レノボ", "ワールドトリガー", "永住外国人", "関ジャニ∞", "四旬節", "題名のない音楽会", "夜ノヤッターマン", "プリキュア", "JavaScript", "クリスマスローズ", "6才のボクが、大人になるまで。", "DOG DAYS″", "JR東日本", "mixi", "Windows 8", "いわなだれ", "アドウェア", "ギルガルド", "サイコパス", "シューベルト", "チャンピオンRED", "ハーフマラソン", "パラリンピック", "ブラッドリー・クーパー", "プラトン", "プレシーズンマッチ", "ベンチマーク", "一宮市", "第一航空戦隊", "沖縄タイムス", "岩波書店", "許されざる者", "熊井友理奈", "後藤真希", "行幸", "黒子のバスケ", "今井正人", "撮り鉄", "死亡フラグ", "松岡茉優", "神武天皇", "仁徳天皇", "吹奏楽", "正規空母", "尖閣", "尖閣諸島", "探照灯", "田村ゆかり", "満州", "与那国町", "コパノリッキー", "インカンテーション", "東京マラソン", "東京オリンピック", "BMI", "BS-TBS", "Dropbox", "Evernote", "HDMI", "グレープブランデー", "武豊", "Lenovo", "アスファルト", "ソクラテス", "ニーチェ", "楽天ブックス", "聖霊", "徹甲弾", "陸上自衛隊", "ワイドバッハ", "ベストウォーリア", "電子書籍", "辺野古", "フェブラリーステークス", "ローマンレジェンド", "大河ドラマ", "総務省", "API", "アドマイヤロイヤル", "鎮守府", "トマ・ピケティ"]}]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/japanese_trend_keywords/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
