class ChangeUserIdUserbug < ActiveRecord::Migration[6.0]
  def change
        rename_column :user_bugs, :user_id, :appuser_id
  end
end
