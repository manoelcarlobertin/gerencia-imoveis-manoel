class CreatePropertySituations < ActiveRecord::Migration[7.2]
  def change
    create_table :property_situations do |t|
      t.timestamps
    end
  end
end
