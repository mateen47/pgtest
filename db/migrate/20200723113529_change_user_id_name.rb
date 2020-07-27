class ChangeUserIdName < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_projects, :user_id, :appuser_id
  end
end
