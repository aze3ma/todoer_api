class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :body
      t.boolean :done, :default: false
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
