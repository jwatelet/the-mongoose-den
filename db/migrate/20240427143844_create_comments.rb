class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :commentable, polymorphic: true, null: false
      t.references :commenter, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
