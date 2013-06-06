class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :init_mod, :init_score, :hp, :strength, :agility, :stamina, :personality, :intelligence, :luck, :reflex, :fortitude, :will, :alignment, :occupation, :player_class, :player, :speed, :details, :ac, :in_combat, :lucky_roll
  embed :ids, include: true
end
