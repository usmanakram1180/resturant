class CreateMenus < ActiveRecord::Migration[7.1]
  def change
    create_table :menus do |t|

      t.timestamps
    end
  end
end
