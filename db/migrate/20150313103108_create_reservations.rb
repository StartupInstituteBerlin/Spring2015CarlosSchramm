class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :last_name
      t.datetime :date
      t.integer :number_of_people

      t.timestamps null: false
    end
  end
end
