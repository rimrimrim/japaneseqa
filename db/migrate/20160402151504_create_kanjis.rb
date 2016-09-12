class CreateKanjis < ActiveRecord::Migration
  def change
    create_table :kanjis do |t|
      t.integer :rank
      t.string :word
      t.string :yomi
      t.string :japanese
      t.string :english

      t.timestamps null: false
    end
  end
end
