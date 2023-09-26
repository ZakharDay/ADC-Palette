class CreateFills < ActiveRecord::Migration[7.0]
  def change
    create_table :fills do |t|
      t.integer :swatch_id
      t.integer :color_id
      t.integer :percent

      t.timestamps
    end
  end
end
