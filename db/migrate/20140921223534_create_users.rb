class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 255
      t.string :password_digest, null: false, limit: 255
      t.text :status, null: false, limit: 1000
      t.timestamps
    end
  end
end
