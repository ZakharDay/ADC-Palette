class CreateColors < ActiveRecord::Migration[7.0]
  def change
    create_table :colors do |t|
      t.string :hex
      t.string :alpha

      t.timestamps
    end
  end
end