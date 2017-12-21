class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :notice, polymorphic: true, index: true
      t.integer :state
      t.timestamps
    end
  end
end
