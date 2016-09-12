class CreateFavoiteKanjis < ActiveRecord::Migration
  def change
    create_table :favoite_kanjis do |t|
      t.string :kanji_id　user_id

      t.timestamps null: false
    end
  end
end
