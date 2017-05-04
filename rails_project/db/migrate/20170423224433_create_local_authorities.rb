class CreateLocalAuthorities < ActiveRecord::Migration[5.0]
  def change
    create_table :local_authorities, id: :string do |t|
      t.string :name, index: true
      t.boolean :abolished, default: false
      t.date :abolished_date, default: nil

      t.timestamps
    end
  end
end
