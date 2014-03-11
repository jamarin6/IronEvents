class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text_field :name
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.string :address

      t.timestamps
    end
  end
end
