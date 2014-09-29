class CreateRegs < ActiveRecord::Migration
  def change
    create_table :regs do |t|
      t.string :token, null: false
      t.timestamps
    end
  end
end
