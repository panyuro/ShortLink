class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :origin_url
      t.string :lookup_code

      t.timestamps
    end
  end
end
