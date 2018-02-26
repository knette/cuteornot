class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :picture
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
