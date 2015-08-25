json.array!(@pacientes) do |paciente|
  json.extract! paciente, :id, :nome, :data_nascimento
  json.url paciente_url(paciente, format: :json)
end
