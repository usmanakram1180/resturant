class AddAttributesToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :name, :string
    add_column :bookings, :email, :string
    add_column :bookings, :datetime, :datetime
    add_column :bookings, :people, :integer
    add_column :bookings, :message, :text
  end
end
