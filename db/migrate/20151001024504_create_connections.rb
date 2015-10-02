class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
    	t.integer  :connected_user_id
    	t.integer  :attendance_id

    	t.timestamps null: false
    end
  end
end
