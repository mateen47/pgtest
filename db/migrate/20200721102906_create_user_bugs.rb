class CreateUserBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_bugs do |t|
    	t.integer :user_id
    	t.integer :bug_id
    end
  end
end
