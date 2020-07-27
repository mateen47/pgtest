class CreateProjectBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :project_bugs do |t|
    	t.integer :project_id
    	t.integer :bug_id
    end
  end
end
