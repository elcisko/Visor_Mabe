class Transaccion < ActiveRecord::Base

  self.table_name = "transacciones"

  scope :batch_id, -> batch_id { where("batch_id LIKE ?", "%#{batch_id}%") }
  scope :external_id, -> external_id { where("external_id LIKE ?", "%#{external_id}%") }
  scope :status, -> status { where("status LIKE ?", "%#{status}%") }
  scope :tipo_transaccion, -> tipo_transaccion { where("tipo_transaccion LIKE ?", "%#{tipo_transaccion}%") }


  #scope :batch_id, -> batch_id { where(:batch_id => batch_id) }
  #scope :external_id, -> external_id { where(:external_id => external_id) }
  #scope :status, -> status { where(:status => status  ) }

end
