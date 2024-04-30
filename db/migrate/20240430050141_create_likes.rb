class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :likeable, polymorphic: true, null: false
      t.references :liker, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
