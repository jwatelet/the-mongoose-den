class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :message
      t.string :url
      t.boolean :is_read, default: false
      t.references :user, null: false, foreign_key: true
      t.references :notifiable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
