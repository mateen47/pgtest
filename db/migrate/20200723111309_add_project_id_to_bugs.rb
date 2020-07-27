class AddProjectIdToBugs < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :project_id, :integer
  end
end
