class CreateNewsletterRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletter_requests do |t|
      t.json :data
      t.timestamps
    end
  end
end
