class CreatePatterns < ActiveRecord::Migration[5.0]
  def change
    create_table :patterns do |t|
      t.text :title
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
