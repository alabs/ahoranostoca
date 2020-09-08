class CreateContactRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_requests do |t|
      t.json :data
      t.timestamps
    end
  end
end
