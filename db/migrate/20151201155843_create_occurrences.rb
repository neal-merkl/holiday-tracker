class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.belongs_to :day, index: true
      t.belongs_to :holiday, index: true
      t.timestamps null: false
    end
  end
end
