class CreateHandlingTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :handling_times do |t|

      t.timestamps
    end
  end
end
