class ChangeTransaccionId < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :transacciones do |t|
        dir.up   { t.change :id, :string }
        dir.down { t.change :id, :integer }
      end
    end
  end
end
