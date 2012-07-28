class CreatePerson < ActiveRecord::Migration
  def change
    create_table :person do |t|

      t.timestamps
    end
  end
end
