class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string   :event_title, null: false
    	t.text     :description, null: false
    	t.string   :location
    	t.datetime :date
      

      	t.timestamps null: false
    end
  end
end
