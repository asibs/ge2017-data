class CreateLocalAuthorities < ActiveRecord::Migration[5.0]
  def change
    create_table :local_authorities, id: :string do |t|
      t.string :name

      t.timestamps
    end
  end
end
