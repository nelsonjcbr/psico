json.array!(@evolucaos) do |evolucao|
  json.extract! evolucao, :id, :paciente_id, :evolucao_tipo_id
  json.url evolucao_url(evolucao, format: :json)
end
