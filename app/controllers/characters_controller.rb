class CharactersController < ApplicationController
  respond_to :json, :html
  expose(:characters) { Character.all }
  expose(:character, attributes: :character_params)

  def index
    respond_to  do |format|
      format.html { render }
      format.json { render json: characters }
    end
  end

  def create
    save_and_return_character
  end

  def show
    respond_with(character)
  end

  def update
    save_and_return_character
  end

  private

  def save_and_return_character
    params.permit!
    character.save
    respond_with(character)
  end

  def character_params
    params.require(:character).permit(:name,
                                      :init_mod,
                                      :init_score,
                                      :level,
                                      :hp,
                                      :strength,
                                      :agility,
                                      :stamina,
                                      :personality,
                                      :intelligence,
                                      :luck,
                                      :reflex,
                                      :fortitude,
                                      :will,
                                      :alignment,
                                      :occupation,
                                      :player_class,
                                      :player,
                                      :speed,
                                      :details,
                                      :ac,
                                      :in_combat,
                                      :lucky_roll)
  end
end


