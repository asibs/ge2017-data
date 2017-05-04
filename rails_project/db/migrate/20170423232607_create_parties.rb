class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties, id: :string do |t|
      t.string :name, index: { unique: true }

      t.timestamps
    end
  end
end
