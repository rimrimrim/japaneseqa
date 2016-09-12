class FavoiteKanji < ActiveRecord::Base
  belogns_to :kanji
  belongs_to :user
end
