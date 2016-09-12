json.array!(@kanjis) do |kanji|
  json.extract! kanji, :id, :rank, :word, :yomi, :japanese, :english
  json.url kanji_url(kanji, format: :json)
end
