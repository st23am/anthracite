class Character < ActiveRecord::Base

  def active_model_serializer
    CharacterSerializer
  end
end
