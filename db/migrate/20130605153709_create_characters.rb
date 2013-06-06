class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string   :name
      t.string   :init_mod
      t.string   :init_score
      t.string   :hp
      t.string   :strength
      t.string   :agility
      t.string   :stamina
      t.string   :personality
      t.string   :intelligence
      t.string   :luck
      t.string   :reflex
      t.string   :fortitude
      t.string   :will
      t.string   :alignment
      t.string   :occupation
      t.string   :player_class
      t.string   :player
      t.string   :speed
      t.text     :details
      t.text     :lucky_roll
      t.string   :ac
      t.boolean  :in_combat
      t.timestamps
    end
  end
end
