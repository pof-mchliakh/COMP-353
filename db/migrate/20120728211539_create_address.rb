class CreateAddress < ActiveRecord::Migration
  def change
    create_table :address do |t|

      t.timestamps
    end
  end
end
