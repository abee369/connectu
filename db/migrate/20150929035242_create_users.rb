class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string  :first_name
    	t.string  :last_name
    	t.string  :email, null: false
    	t.string  :phone
    	t.string  :company_name
    	t.string  :job_title
    	t.text    :bio
    	t.string  :contact_by
    	t.string  :password_digest, null: false

      t.timestamps null: false
    end
  end
end
