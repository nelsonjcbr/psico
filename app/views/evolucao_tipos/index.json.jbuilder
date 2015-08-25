json.array!(@evolucao_tipos) do |evolucao_tipo|
  json.extract! evolucao_tipo, :id, :nome
  json.url evolucao_tipo_url(evolucao_tipo, format: :json)
end
