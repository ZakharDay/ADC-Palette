class CreateSwatches < ActiveRecord::Migration[7.0]
  def change
    create_table :swatches do |t|
      t.integer :project_id
      t.integer :place

      t.timestamps
    end
  end
end
