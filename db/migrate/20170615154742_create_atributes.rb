class CreateAtributes < ActiveRecord::Migration[5.1]
  def change
    create_table :atributes do |t|
      t.string :stat
      t.integer :value
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
