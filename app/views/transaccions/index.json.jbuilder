json.array!(@transaccions) do |transaccion|
  json.extract! transaccion, :id, :id, :external_id, :record_id, :batch_id, :payload, :ejecucion, :status, :tipo_transaccion, :source_id, :target_id
  json.url transaccion_url(transaccion, format: :json)
end
