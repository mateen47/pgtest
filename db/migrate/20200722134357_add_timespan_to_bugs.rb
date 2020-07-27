class AddTimespanToBugs < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :created_at, :datetime, null: false
    add_column :bugs, :updated_at, :datetime, null: false
  end
end
