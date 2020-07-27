class CreateBug < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs do |t|
    	t.string :title
    	t.string :description
    	t.integer :deadline
    	t.integer :type
    	t.integer :status 	
    end
  end
end
