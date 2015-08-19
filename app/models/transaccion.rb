class Transaccion < ActiveRecord::Base

  self.table_name = "transacciones"

  scope :batch_id, -> batch_id { where("batch_id LIKE ?", "%#{batch_id}%") }
  scope :external_id, -> external_id { where("external_id LIKE ?", "%#{external_id}%") }

end
