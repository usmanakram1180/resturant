class AddAttributesToHome < ActiveRecord::Migration[7.1]
  def change
    add_column :homes, :email, :string
  end
end
