class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :message
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
