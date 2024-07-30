class CreateAbouts < ActiveRecord::Migration[7.1]
  def change
    create_table :abouts do |t|

      t.timestamps
    end
  end
end
