class CreatePrefectureCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :prefecture_codes do |t|

      t.timestamps
    end
  end
end
