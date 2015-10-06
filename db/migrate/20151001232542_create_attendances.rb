class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
    	t.integer  :user_id
    	t.integer  :event_id
    	t.boolean  :host
    	t.integer  :reason
      
      t.timestamps null: false
    end
  end
end
