class AddColsToJobsTable < ActiveRecord::Migration
  def change
  	add_column :jobs, :salary, :string
  	add_column :jobs, :how_to_apply, :text
  	add_column :jobs, :area_of_london, :string
  end
end
