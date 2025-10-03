class CreateJoinTableProjectsTechnologies < ActiveRecord::Migration[8.0]
  def change
    create_join_table :projects, :technologies do |t|
      t.index [:project_id, :technology_id]
      t.index [:technology_id, :project_id]
    end
  end
end
