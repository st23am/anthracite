class ChangeInitScoreToInteger < ActiveRecord::Migration
  def change
    remove_column :characters, :init_score
    add_column :characters, :init_score, :integer
  end
end
