# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150626014540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alertas", force: true do |t|
    t.string   "tipo",       limit: 2,                  null: false
    t.integer  "relacao_id"
    t.string   "obs"
    t.string   "modulos",    limit: 50,                 null: false
    t.boolean  "ajustado",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "anotacoes", force: true do |t|
    t.integer  "user_id"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atendpsicos", force: true do |t|
    t.integer  "paciente_id"
    t.time     "data"
    t.text     "evolucao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bairros_logradouros", id: false, force: true do |t|
    t.integer "bairro_id"
    t.integer "logradouro_id"
  end

  create_table "campos", force: true do |t|
    t.string   "funcionalidade"
    t.string   "nome"
    t.string   "tipo"
    t.string   "valores"
    t.string   "regexp"
    t.integer  "tamanho_minimo"
    t.integer  "tamanho_maximo"
    t.boolean  "requerido"
    t.string   "posicao"
    t.boolean  "pesquisavel"
    t.string   "valor_padrao"
    t.boolean  "inativo"
    t.boolean  "multiplo"
    t.string   "autocomplete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "nome_field"
  end

  create_table "camposlocais", force: true do |t|
    t.string   "tabela"
    t.string   "campo"
    t.string   "tipo"
    t.string   "descricao"
    t.integer  "tamanho"
    t.text     "valores"
    t.string   "ordem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "caracinterns", force: true do |t|
    t.string "codigo_sus"
    t.string "descricao"
    t.date   "data_inicio_uso"
    t.date   "data_fim_uso"
  end

  create_table "cepvalidados", force: true do |t|
    t.boolean  "validado"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chconsistencias", force: true do |t|
    t.integer "chremessai_id"
    t.integer "hhmensagem_id"
    t.string  "complemento"
  end

  create_table "chremessaicons", force: true do |t|
    t.integer "chremessa_id"
    t.string  "susproc_id",     limit: 10
    t.integer "qtde"
    t.integer "qtde_importada"
    t.integer "convenio_id"
  end

  create_table "chremessaiprocs", force: true do |t|
    t.integer "chremessai_id"
    t.string  "susproc_id",             limit: 10
    t.string  "descricao_procedimento"
    t.integer "qtde"
    t.boolean "principal"
  end

  create_table "chremessais", force: true do |t|
    t.integer "chremessa_id"
    t.integer "intern_id"
    t.string  "descricao_procedimento"
    t.string  "cidsecundario_id",       limit: 8
    t.integer "dias_uti"
    t.string  "situacao",               limit: 1
    t.string  "nro_guia",               limit: 30
  end

  create_table "chremessas", force: true do |t|
    t.date    "data_alta_inicial"
    t.date    "data_alta_final"
    t.integer "qtde_lidos"
    t.integer "qtde_revisados"
    t.integer "competencia"
    t.integer "ups_id"
  end

  create_table "cidcapitulos", force: true do |t|
    t.string   "descricao"
    t.string   "descricao_abrev"
    t.string   "capitulo_inicio"
    t.string   "capitulo_fim"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "confexports", force: true do |t|
    t.string   "nome"
    t.string   "tipo_arquivo"
    t.text     "configuracao"
    t.integer  "confexport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "confimports", force: true do |t|
    t.string   "nome"
    t.string   "tipo_arquivo"
    t.text     "configuracao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contasnaocobradas", force: true do |t|
    t.text     "motivo"
    t.integer  "intern_id"
    t.integer  "motivonaocobranca_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convenio_webservices", force: true do |t|
    t.integer  "convenio_id"
    t.integer  "tisstipoguia_id"
    t.string   "url"
    t.string   "operacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convenios_filmes", force: true do |t|
    t.integer "convenio_id"
    t.date    "data"
    t.decimal "valor",       precision: 12, scale: 2
  end

  create_table "convenios_fttabprecosmatmeds", force: true do |t|
    t.integer "convenio_id"
    t.integer "fttabprecosmatmed_id"
    t.integer "ordem"
  end

  create_table "convenios_stgrupos", force: true do |t|
    t.integer  "convenio_id"
    t.integer  "stgrupo_id"
    t.decimal  "percentual_pfb"
    t.decimal  "percentual_pmc"
    t.decimal  "percentual_custo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convplanos_fttabprocs", force: true do |t|
    t.integer  "convplano_id"
    t.integer  "fttabproc_id"
    t.integer  "ordem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cprecpedidois", force: true do |t|
    t.integer  "cprecpedidonota_id"
    t.integer  "pedidoi_id"
    t.decimal  "qtde",               precision: 10, scale: 3
    t.float    "valor_total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cprecpedidonotas", force: true do |t|
    t.integer  "cprecpedido_id"
    t.integer  "numero"
    t.string   "serie"
    t.integer  "fornecedor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "valor_total"
  end

  create_table "cprecpedidos", force: true do |t|
    t.integer  "fornecedor_id"
    t.integer  "stpe_id"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ctbmovccs", force: true do |t|
    t.integer  "ctbmov_id"
    t.integer  "cc_id"
    t.decimal  "valor",      precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ctbmovs", force: true do |t|
    t.string   "item_type"
    t.integer  "item_id"
    t.integer  "ct_conta_id"
    t.integer  "ct_historico_id"
    t.string   "complemento"
    t.decimal  "valor",                     precision: 12, scale: 2
    t.string   "debcre",          limit: 1
    t.date     "data"
    t.datetime "data_exportacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customrels", force: true do |t|
    t.string   "arquivo"
    t.string   "titulo"
    t.string   "coluna"
    t.string   "linha"
    t.string   "valor"
    t.string   "where_fixo"
    t.integer  "orientacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "filtros"
  end

  create_table "escalaprofs", force: true do |t|
    t.integer  "medico_id"
    t.integer  "setor_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "obs"
    t.integer  "escalageradora_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "etnias", force: true do |t|
    t.string  "codigo_sus"
    t.string  "descricao"
    t.boolean "inativo"
  end

  create_table "evolucao_campos", force: true do |t|
    t.string   "nome"
    t.string   "tipo_campo"
    t.string   "titulo"
    t.boolean  "requerido"
    t.integer  "evolucao_tipo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "evolucao_campos", ["evolucao_tipo_id"], name: "index_evolucao_campos_on_evolucao_tipo_id", using: :btree

  create_table "evolucao_tipos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evolucaos", force: true do |t|
    t.integer  "paciente_id"
    t.date     "date"
    t.integer  "evolucao_tipo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "evolucaos", ["paciente_id"], name: "index_evolucaos_on_paciente_id", using: :btree

  create_table "exportacao_ctbs", force: true do |t|
    t.string "descricao"
    t.string "separador"
    t.text   "configuracao"
    t.string "formato_data"
  end

  create_table "favoritos", force: true do |t|
    t.string   "nome"
    t.string   "link"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "modulo"
  end

  create_table "feriads", force: true do |t|
    t.string  "descricao"
    t.integer "dia"
    t.integer "mes"
    t.integer "ano"
    t.boolean "feriado_municipal"
  end

  create_table "fichanascidos", force: true do |t|
    t.integer  "nascimento_id"
    t.integer  "apgar_um_min"
    t.integer  "apgar_cinco_min"
    t.string   "capurro"
    t.string   "apresentacao"
    t.string   "liquido_amniotico"
    t.string   "bolsa_rota"
    t.string   "grupo_sanguinio_nascido"
    t.string   "fator_rh_mae"
    t.string   "fator_rh_nascido"
    t.string   "se_reagente_mae"
    t.string   "se_reagete_nascido"
    t.integer  "anestesista_id"
    t.string   "vdrl_mae"
    t.string   "vdrl_nascido"
    t.string   "tipo_parto"
    t.string   "exame"
    t.string   "data_exame"
    t.string   "data_alta"
    t.string   "hora_exame"
    t.string   "hora_alta"
    t.string   "aspecto_geral_exame"
    t.string   "aspecto_geral_alta"
    t.string   "pele_e_faneros_exame"
    t.string   "pele_e_faneros_alta"
    t.string   "musculos_e_art_exame"
    t.string   "musculos_e_art_alta"
    t.string   "cabeca_exame"
    t.string   "cabeca_alta"
    t.string   "olhos_exame"
    t.string   "olhos_alta"
    t.string   "ouvidos_exame"
    t.string   "ouvidos_alta"
    t.string   "nariz_exame"
    t.string   "nariz_alta"
    t.string   "boca_e_cavum_exame"
    t.string   "boca_e_cavum_alta"
    t.string   "pescoso_exame"
    t.string   "pescoso_alta"
    t.string   "ausc_pulmonar_exame"
    t.string   "ausc_pulmonar_alta"
    t.string   "ausc_cardiaca_exame"
    t.string   "ausc_cardiaca_alta"
    t.string   "abdome_exame"
    t.string   "abdome_alta"
    t.string   "genitais_exame"
    t.string   "genitais_alta"
    t.string   "anus_exame"
    t.string   "anus_alta"
    t.string   "col_vertebral_exame"
    t.string   "col_vertebral_alta"
    t.string   "membros_exame"
    t.string   "membros_alta"
    t.string   "ortolani_exame"
    t.string   "ortolani_alta"
    t.string   "reflexos_exame"
    t.string   "reflexos_alta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filiais", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnatividadectbs", force: true do |t|
    t.integer  "fnatividade_id"
    t.string   "ctbconta_cod"
    t.integer  "fnctbhist_id"
    t.string   "complemento"
    t.string   "campo_valor"
    t.string   "debcre",         limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnbancos", force: true do |t|
    t.string   "codbanco"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fncaixas", force: true do |t|
    t.string   "nome"
    t.text     "configuracoes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fncartacobrancas", force: true do |t|
    t.string   "modelo"
    t.text     "carta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fncategorias", force: true do |t|
    t.integer  "codigo"
    t.string   "classificacao"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "recebe_lancamento"
  end

  create_table "fnchequesmovs", force: true do |t|
    t.integer "fnmovto_id"
    t.string  "nro_docto"
    t.date    "data_compensacao"
    t.string  "nominal"
    t.integer "fnchequesrec_id"
  end

  create_table "fnchequesrecs", force: true do |t|
    t.string   "nro_cheque"
    t.integer  "fnbanco_id"
    t.string   "nro_conta"
    t.string   "nome_conta"
    t.string   "obs"
    t.date     "data_vencimento"
    t.decimal  "valor",              precision: 12, scale: 2
    t.boolean  "baixado",                                     default: false
    t.integer  "qtde_apresentacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnchequesrecs_fnmovtos", force: true do |t|
    t.integer  "fnchequesrec_id"
    t.integer  "fnmovto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnconrecrs", force: true do |t|
    t.integer  "fnconrec_id"
    t.date     "date"
    t.string   "nro_recebido"
    t.decimal  "valor_baixa",  precision: 12, scale: 2
    t.text     "historico"
    t.integer  "fnmovto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fncxaatividades", force: true do |t|
    t.string   "nome"
    t.boolean  "entra_caixa"
    t.boolean  "sai_caixa"
    t.boolean  "entra_banco"
    t.boolean  "sai_banco"
    t.boolean  "entra_contas_receber"
    t.boolean  "sai_contas_receber"
    t.boolean  "entra_contas_pagar"
    t.boolean  "sai_contas_pagar"
    t.boolean  "so_banco"
    t.boolean  "antecipacao"
    t.boolean  "gerar_recibo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fndiamovtos", force: true do |t|
    t.integer "fncaixa_id"
    t.date    "data"
    t.boolean "aberto"
  end

  create_table "fnextratos", force: true do |t|
    t.integer  "fnrecursobanco_id"
    t.integer  "fnmovto_id"
    t.date     "data"
    t.text     "descricao"
    t.string   "nro_documento"
    t.decimal  "valor",             precision: 12, scale: 2
    t.decimal  "saldo",             precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nro_cheque"
  end

  create_table "fnfluxolanctos", force: true do |t|
    t.integer "fnmovto_id"
    t.integer "fncategoria_id"
    t.decimal "valor",          precision: 12, scale: 2
    t.integer "movto_id"
    t.string  "movto_type"
    t.string  "complemento"
  end

  create_table "fnmodeloscheques", force: true do |t|
    t.string   "nome"
    t.string   "arquivo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnmotivorenegociacoes", force: true do |t|
    t.string   "motivo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnmovtos", force: true do |t|
    t.integer "fndiamovto_id"
    t.string  "descricao"
    t.integer "recursoent_id"
    t.integer "recursosai_id"
    t.decimal "valor",            precision: 12, scale: 2
    t.string  "tipo_movimento"
    t.integer "fnmovtoorigem_id"
  end

  create_table "fnnfseis", force: true do |t|
    t.integer  "fnnfse_id"
    t.integer  "ftforma_id"
    t.string   "observacao", limit: 100
    t.decimal  "qtde",                   precision: 8,  scale: 2
    t.decimal  "valor",                  precision: 12, scale: 2
    t.decimal  "desconto",               precision: 12, scale: 2
    t.boolean  "importado",                                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnnfses", force: true do |t|
    t.integer  "filial_id"
    t.integer  "tiponf_id"
    t.integer  "fnnatoper_id"
    t.integer  "cliente_id"
    t.string   "cliente_type"
    t.integer  "tomador_id"
    t.integer  "fnpacote_id"
    t.decimal  "percentual_iss",        precision: 6,  scale: 2
    t.decimal  "valor_iss",             precision: 12, scale: 2
    t.decimal  "valor_servicos",        precision: 12, scale: 2
    t.decimal  "valor_pacote",          precision: 12, scale: 2
    t.decimal  "valor_pacote_desconto", precision: 12, scale: 2
    t.decimal  "valor_descontos",       precision: 12, scale: 2
    t.decimal  "valor_pis",             precision: 12, scale: 2
    t.decimal  "valor_cofins",          precision: 12, scale: 2
    t.decimal  "valor_inss",            precision: 12, scale: 2
    t.decimal  "valor_ir",              precision: 12, scale: 2
    t.decimal  "valor_csll",            precision: 12, scale: 2
    t.decimal  "valor_adiantamentos",   precision: 12, scale: 2
    t.decimal  "valor_avista",          precision: 12, scale: 2
    t.decimal  "valor_liquido",         precision: 12, scale: 2
    t.text     "observacao"
    t.text     "descritivo_servico"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnnfses_ftfatconvs", force: true do |t|
    t.integer  "fnnfse_id"
    t.integer  "ftfatconv_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnnfses_hhaprs", force: true do |t|
    t.integer  "fnnfse_id"
    t.integer  "hhapr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnnfses_interns", force: true do |t|
    t.integer  "fnnfse_id"
    t.integer  "intern_id"
    t.integer  "ftsubconta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnnfses_sancionadas", force: true do |t|
    t.integer  "fnnfse_id"
    t.datetime "datahora_aprovacao"
    t.integer  "fnnotaserie_id"
    t.integer  "numero_lote_rps"
    t.integer  "numero_rps"
    t.integer  "numero_nota"
    t.string   "protocolo_prefeitura"
    t.string   "codigo_verificacao_nfse"
    t.string   "link_nota"
    t.text     "motivo_cancelamento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "cancelada"
  end

  create_table "fnnfses_xmls", force: true do |t|
    t.integer  "fnnfse_id"
    t.integer  "tipo_documento"
    t.text     "xml_envio"
    t.text     "xml_resposta"
    t.boolean  "retorno_sem_erros",    default: true
    t.string   "protocolo_prefeitura"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnorcamatmeds", force: true do |t|
    t.integer  "fnorcamento_id"
    t.integer  "stmmapr_id"
    t.decimal  "qtde",           precision: 10, scale: 3
    t.decimal  "valor_unitario", precision: 12, scale: 2
    t.decimal  "descontos",      precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnorcamentos", force: true do |t|
    t.integer  "paciente_id"
    t.string   "titulo"
    t.decimal  "valor_descontos", precision: 12, scale: 2
    t.decimal  "total_orcamento", precision: 12, scale: 2
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipopac_id"
    t.integer  "convenio_id"
  end

  create_table "fnorcaprocs", force: true do |t|
    t.integer  "fnorcamento_id"
    t.integer  "procedimento_id"
    t.decimal  "qtde",            precision: 10, scale: 3
    t.decimal  "valor_unitario",  precision: 12, scale: 2
    t.decimal  "descontos",       precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnpagadiantamentos", force: true do |t|
    t.integer  "fornecedor_id"
    t.integer  "fnmovto_id"
    t.date     "data"
    t.decimal  "valor",         precision: 12, scale: 2
    t.decimal  "valor_baixa",   precision: 12, scale: 2
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnpagbaixaauxs", force: true do |t|
    t.integer  "fnpagbaixa_id"
    t.decimal  "valor",                precision: 12, scale: 2
    t.integer  "fnpagbaixahistaux_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fnpagadiantamento_id"
  end

  create_table "fnpagbaixahistauxs", force: true do |t|
    t.string   "nome"
    t.string   "tipo",       limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "inativo"
  end

  create_table "fnpagbaixas", force: true do |t|
    t.integer  "fnpag_id"
    t.date     "data"
    t.string   "nro_recibo"
    t.decimal  "valor_baixa", precision: 12, scale: 2
    t.text     "historico"
    t.integer  "fncxamov_id"
    t.string   "ajuste"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fnmovto_id"
  end

  create_table "fnpagrendups", force: true do |t|
    t.integer  "fnpagren_id"
    t.integer  "fnpag_id"
    t.string   "situacao",    limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnpagrens", force: true do |t|
    t.date     "data"
    t.integer  "fnrenegociacaomot_id"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnpags", force: true do |t|
    t.integer  "fntipo_id"
    t.string   "documento"
    t.string   "parcela"
    t.integer  "fornecedor_id"
    t.integer  "fnsituacao_id"
    t.date     "data_emissao"
    t.date     "data_vencimento"
    t.decimal  "valor",                    precision: 12, scale: 2
    t.decimal  "valor_pago",               precision: 12, scale: 2
    t.text     "obs"
    t.integer  "fnatividade_id"
    t.integer  "filial_id"
    t.integer  "stcompra_id"
    t.integer  "fnpagpai_id"
    t.integer  "rpamovto_id"
    t.integer  "intern_id"
    t.integer  "fnrec_id"
    t.date     "data_liberacao_pagto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "valor_projetado"
    t.integer  "origem_id"
    t.string   "origem_type"
    t.date     "data_vencimento_original"
  end

  create_table "fnpags_hhsps", id: false, force: true do |t|
    t.integer "fnpag_id"
    t.integer "hhsp_id"
  end

  create_table "fnpags_pmrepasses", id: false, force: true do |t|
    t.integer "fnpag_id"
    t.integer "pmrepasse_id"
  end

  create_table "fnpagtoemcheques", force: true do |t|
    t.integer  "fnmovto_id"
    t.string   "nro_cheque"
    t.string   "nominal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "bom_para"
  end

  create_table "fnprevisaosaldos", force: true do |t|
    t.date     "data"
    t.decimal  "saldo",      precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnprevisoes", force: true do |t|
    t.integer  "fncategoria_id"
    t.date     "data"
    t.decimal  "valor",          precision: 12, scale: 2
    t.string   "obs"
    t.boolean  "inativo",                                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnrecadiantamentos", force: true do |t|
    t.integer  "tomador_id"
    t.integer  "fnmovto_id"
    t.date     "data"
    t.decimal  "valor",       precision: 12, scale: 2
    t.decimal  "valor_baixa", precision: 12, scale: 2
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnrecbaixaauxs", force: true do |t|
    t.integer  "fnrecbaixa_id"
    t.decimal  "valor",                precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fnrecbaixahistaux_id"
    t.integer  "fnrecadiantamento_id"
  end

  create_table "fnrecbaixahistauxs", force: true do |t|
    t.string   "nome"
    t.string   "tipo",       limit: 1
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnrecbaixas", force: true do |t|
    t.integer  "fnrec_id"
    t.integer  "fnmovto_id"
    t.date     "data"
    t.string   "nro_recibo"
    t.decimal  "valor_baixa", precision: 12, scale: 2
    t.text     "historico"
    t.string   "ajuste"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnrecrendups", force: true do |t|
    t.integer  "fnrecren_id"
    t.integer  "fnrec_id"
    t.string   "situacao",    limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnrecrens", force: true do |t|
    t.date     "data"
    t.integer  "fnrenegociacaomot_id"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnrecs", force: true do |t|
    t.integer  "fntipo_id"
    t.integer  "filial_id"
    t.integer  "fnnota_id"
    t.integer  "fnsituacao_id"
    t.integer  "convenio_id"
    t.integer  "tomador_id"
    t.string   "documento"
    t.string   "parcela"
    t.date     "data_emissao"
    t.date     "data_vencimento"
    t.decimal  "valor",                    precision: 12, scale: 2
    t.decimal  "valor_recebido",           precision: 12, scale: 2
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fnrecpai_id"
    t.boolean  "valor_projetado"
    t.integer  "fnnfse_id"
    t.date     "data_vencimento_original"
  end

  create_table "fnrecursobancos", force: true do |t|
    t.integer  "fnrecurso_id"
    t.integer  "fnbanco_id"
    t.string   "nro_agencia"
    t.string   "nro_conta"
    t.string   "impressao_boleto"
    t.string   "codigo_cedente"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnrecursos", force: true do |t|
    t.string   "nome"
    t.string   "tipo"
    t.date     "data_fechamento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fnmodeloscheque_id"
    t.integer  "fncaixa_id"
    t.integer  "cod_ctb"
  end

  add_index "fnrecursos", ["fncaixa_id"], name: "index_fncaixa_id", using: :btree

  create_table "fnrecursosaldos", force: true do |t|
    t.integer  "fnrecurso_id"
    t.decimal  "entrada",         precision: 12, scale: 2
    t.decimal  "saida",           precision: 12, scale: 2
    t.decimal  "saldo",           precision: 12, scale: 2
    t.boolean  "ajustado_manual"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fndiamovto_id"
  end

  create_table "fnrenegociacaomots", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fnsituacoes", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fntipos", force: true do |t|
    t.string   "nome"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filtro"
  end

  create_table "formeletronicos", force: true do |t|
    t.integer  "intern_id"
    t.integer  "formulario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formulariois", force: true do |t|
    t.integer  "formulario_id"
    t.integer  "ordem"
    t.text     "conteudo"
    t.boolean  "somente_leitura"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formularios", force: true do |t|
    t.string   "nome"
    t.boolean  "inativo",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "formulario_id"
    t.text     "onde_usar"
  end

  create_table "ftconfimptabmats", force: true do |t|
    t.string "descricao"
    t.string "linhas_cabecalho"
    t.text   "de_para"
  end

  create_table "ftconsumoimps", force: true do |t|
    t.integer  "ftsubconta_id"
    t.string   "item_type"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ftconsumomms", force: true do |t|
    t.integer  "ftforma_id"
    t.integer  "cc_id"
    t.date     "data"
    t.decimal  "percentual_calc", precision: 5,  scale: 2
    t.boolean  "nao_recalcular"
    t.integer  "stmmapr_id"
    t.decimal  "vlr_total",       precision: 12, scale: 2
    t.decimal  "qtde",            precision: 12, scale: 4
    t.integer  "ftintguia_id"
    t.integer  "ftsubconta_id"
    t.integer  "recebedor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ftconsumoprocs", force: true do |t|
    t.integer  "ftforma_id"
    t.integer  "procedimento_id"
    t.string   "ftparticipacao_id"
    t.string   "viaacesso_id"
    t.date     "data"
    t.integer  "cc_id"
    t.decimal  "percentual_calc",   precision: 5,  scale: 2
    t.boolean  "nao_recalcular"
    t.integer  "medexecutante_id"
    t.time     "hora_inicial"
    t.time     "hora_final"
    t.decimal  "vlr_total",         precision: 12, scale: 2
    t.decimal  "vlr_co",            precision: 12, scale: 2
    t.decimal  "vlr_hm",            precision: 12, scale: 2
    t.decimal  "vlr_filme",         precision: 12, scale: 2
    t.decimal  "qtde",              precision: 12, scale: 4
    t.integer  "ftintguia_id"
    t.integer  "ftsubconta_id"
    t.integer  "recebedorhm_id"
    t.integer  "recebedorco_id"
    t.integer  "repassehm_id"
    t.integer  "repasseco_id"
    t.integer  "fttabproc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ftgrupos", force: true do |t|
    t.string  "classificacao"
    t.string  "descricao"
    t.integer "cc_id"
    t.integer "fnctbcon_id"
  end

  create_table "fttabmatis_stmmaprs", force: true do |t|
    t.integer  "fttabprecosmatmed_id"
    t.integer  "stmmapr_id"
    t.integer  "fttabmati_id"
    t.integer  "tuss_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cod_proprio"
  end

  create_table "fttabprecosmatmeds", force: true do |t|
    t.string   "nome"
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fttipoformas", force: true do |t|
    t.integer  "ordem"
    t.string   "descricao"
    t.string   "tipo"
    t.string   "tiss"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdagendaaparelhos", force: true do |t|
    t.integer  "gdagenda_id"
    t.integer  "gdaparelho_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdagendacancs", force: true do |t|
    t.integer  "gdagenda_id"
    t.integer  "gdmotcanc_id"
    t.text     "complemento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdagendaprocs", force: true do |t|
    t.integer  "gdagenda_id"
    t.integer  "proc_id"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdagendaprofissionais", force: true do |t|
    t.integer  "gdagenda_id"
    t.integer  "medico_id"
    t.string   "ftparticipacao_id", limit: 1
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdagendas", force: true do |t|
    t.integer  "gdrecurso_id"
    t.datetime "inicio"
    t.datetime "fim"
    t.integer  "paciente_id"
    t.string   "nome_paciente"
    t.text     "dados_contato"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "recursocamposxml"
    t.integer  "gdestado_id"
    t.integer  "ordem"
    t.string   "periodo",          limit: nil
    t.integer  "convenio_id"
    t.string   "tipo_anestesia"
  end

  create_table "gdalterexeccirs", force: true do |t|
    t.integer  "gdexeccir_id"
    t.integer  "autorizador_id"
    t.integer  "autorizado_id"
    t.text     "motivo"
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdaparelhos", force: true do |t|
    t.string   "nome"
    t.integer  "quantidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdcronogramas", id: false, force: true do |t|
    t.integer  "gdrecurso_id"
    t.integer  "dia_da_semana"
    t.string   "periodo"
    t.integer  "qtde"
    t.time     "hora_inicio"
    t.time     "hora_fim"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "id",            default: "nextval('gdcronogramas_id_seq'::regclass)", null: false
    t.integer  "tempo_agenda"
  end

  create_table "gdestados", force: true do |t|
    t.integer  "gdgrupo_id"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "corfonte_html"
  end

  create_table "gdexeccirs", force: true do |t|
    t.integer  "gdagenda_id"
    t.integer  "intern_id"
    t.datetime "inicio"
    t.datetime "fim"
    t.integer  "classificacao"
    t.string   "porte",                        limit: 1
    t.string   "tipo_anestesia",               limit: 1
    t.text     "diag_pre_operatorio"
    t.text     "diag_pos_operatorio"
    t.text     "descricao_cirurgia"
    t.text     "acidente"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "exame_radiologico_ato"
    t.text     "relatorio_imediato_patologia"
    t.string   "instrumentador"
    t.string   "obs_anestesia"
  end

  create_table "gdexecprocs", force: true do |t|
    t.integer  "gdexeccir_id"
    t.boolean  "por_video"
    t.integer  "via_acesso"
    t.integer  "proc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdexecprofissionais", force: true do |t|
    t.integer  "medico_id"
    t.string   "participacao", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gdexeccir_id"
  end

  create_table "gdfilacanceladas", force: true do |t|
    t.integer  "gdmotcancelamento_id"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gdfilapac_id"
  end

  create_table "gdfilanotas", force: true do |t|
    t.integer  "gdfilapac_id"
    t.string   "nota"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdfilaorigens", force: true do |t|
    t.string   "nome"
    t.integer  "ordem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdfilapacs", force: true do |t|
    t.integer  "gdgrupo_id"
    t.integer  "paciente_id"
    t.string   "nome_paciente"
    t.date     "data_nascimento"
    t.date     "data_laudo"
    t.string   "contato"
    t.string   "cidade"
    t.integer  "procsus_id"
    t.integer  "gdagenda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gdfilaorigem_id"
    t.integer  "medico_id"
    t.date     "data_pre_agenda"
    t.integer  "gdfilastatus_id"
  end

  create_table "gdfilastatus", force: true do |t|
    t.string   "descricao"
    t.string   "cor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdgrupocampos", force: true do |t|
    t.integer  "gdgrupo_id"
    t.string   "campo"
    t.string   "label"
    t.string   "tipo"
    t.string   "valor_selecao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nro_linha"
  end

  create_table "gdgrupos", force: true do |t|
    t.string   "nome"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dias_manter_agenda"
    t.boolean  "usa_fila"
  end

  create_table "gdindisponiveis", force: true do |t|
    t.integer "gdrecurso_id"
    t.date    "data"
    t.string  "motivo"
    t.time    "hora"
    t.integer "periodo"
  end

  create_table "gdmodeloresults", force: true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.integer  "medico_id"
    t.text     "diag_pre_operatorio"
    t.text     "diag_pos_operatorio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdmotcancelamentos", force: true do |t|
    t.string   "motivo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdmotcancs", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdpads", force: true do |t|
    t.string   "nome"
    t.text     "diag_pre_operatorio"
    t.text     "diag_pos_operatorio"
    t.text     "descricao_cirurgia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "rel_patologia"
    t.text     "exames_radio_ato"
    t.boolean  "publico"
  end

  create_table "gdpadsmedicos", force: true do |t|
    t.integer  "gdpad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pode_alterar_padrao"
    t.boolean  "inativo"
    t.integer  "user_id"
  end

  create_table "gdpadsprocs", force: true do |t|
    t.integer  "gdpad_id"
    t.integer  "proc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdrecursos", force: true do |t|
    t.integer  "gdgrupo_id"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "forma_agenda"
  end

  create_table "gdsusopmes", force: true do |t|
    t.integer  "gdexeccir_id"
    t.integer  "susproc_id"
    t.integer  "qtde"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hgestados", force: true do |t|
    t.string   "descricao"
    t.boolean  "feito"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hgexecucoes", force: true do |t|
    t.integer  "hgtarefa_id"
    t.datetime "inicio"
    t.datetime "fim"
    t.integer  "executante_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hglogs", force: true do |t|
    t.integer  "hgtarefa_id"
    t.integer  "user_id"
    t.text     "descricao_atividade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hgtarefas", force: true do |t|
    t.boolean  "de_leito"
    t.integer  "leito_id"
    t.string   "local"
    t.integer  "executante_id"
    t.text     "obs"
    t.integer  "hgestado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hhimportacoes", force: true do |t|
    t.integer  "hhaih_id"
    t.integer  "movimento_id"
    t.string   "modulo",       limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hhinterns_ignorados", force: true do |t|
    t.integer "hhaih_id"
    t.integer "intern_id"
  end

  create_table "histacessos", force: true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.string   "nome"
    t.integer  "nro_acessos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imagens_exames", id: false, force: true do |t|
    t.datetime "data_hora"
    t.string   "rdexamei_id"
    t.string   "token"
  end

  create_table "internlaudos", force: true do |t|
    t.integer  "intern_id"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.boolean  "tem_laudo"
    t.string   "nro_laudo"
    t.string   "nro_aih",           limit: 13
    t.string   "identificacao",     limit: 2
    t.string   "cidprincipal_id",   limit: 8
    t.string   "procsolicitado_id", limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "motivocobr_id",     limit: 2
    t.integer  "sequencia_id"
    t.string   "nro_gestante"
  end

  create_table "interns_cihacomplementos", force: true do |t|
    t.integer "intern_id"
    t.string  "desc_procedimento"
  end

  create_table "internsftobs", force: true do |t|
    t.integer  "intern_id"
    t.string   "obs"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labexames", force: true do |t|
    t.integer  "intern_id"
    t.integer  "profissional_id"
    t.date     "data_exame"
    t.string   "susproc_id"
    t.integer  "qtde"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "codigo_cobranca"
  end

  create_table "logradouros", force: true do |t|
    t.integer  "tb301_logradouro"
    t.string   "nome"
    t.integer  "ibge_id"
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loteguiais", force: true do |t|
    t.integer  "loteguia_id"
    t.integer  "internlaudo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loteguias", force: true do |t|
    t.date     "data_envio"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicocontatos", force: true do |t|
    t.integer "medico_id",    null: false
    t.string  "tipo_contato"
    t.string  "descricao"
  end

  create_table "minhaspaginas", force: true do |t|
    t.integer  "user_id"
    t.string   "modulo"
    t.string   "bloco"
    t.string   "posicao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mnchecklistitens", force: true do |t|
    t.integer  "mnchecklist_id"
    t.boolean  "executado"
    t.boolean  "testado"
    t.string   "descricao"
    t.integer  "usercriou_id"
    t.integer  "userexecutou_id"
    t.integer  "usertestou_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mnchecklists", force: true do |t|
    t.integer  "mnos_id"
    t.integer  "user_id"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mnclasscampos", force: true do |t|
    t.integer  "mnclassificacao_id"
    t.string   "campo",              limit: 20
    t.string   "tipo",               limit: 1
    t.string   "valores_select"
    t.string   "formato",            limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mnclassificacaos", force: true do |t|
    t.string   "classificacao", limit: 20
    t.string   "nome",          limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mnequipamentos", force: true do |t|
    t.string   "cd_equipamento",         limit: 20
    t.string   "fabricante",             limit: 30
    t.string   "modelo",                 limit: 30
    t.string   "nr_serie",               limit: 30
    t.integer  "fornecedor_id"
    t.integer  "nr_notafiscal"
    t.integer  "vlr_aquisicao"
    t.date     "data_aquisicao"
    t.integer  "estado"
    t.boolean  "manutencao_interna"
    t.boolean  "manutencao_externa"
    t.integer  "tempo_medio_manutencao"
    t.text     "obs"
    t.string   "recurso"
    t.date     "dt_vctogarantia"
    t.boolean  "contrato_manut"
    t.date     "data_instalacao"
    t.integer  "asstecnica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome"
    t.integer  "mnclassificacao_id"
  end

  create_table "mnequipoutroscampos", force: true do |t|
    t.integer  "mnequipamento_id"
    t.text     "campos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mngrupos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mnoss", force: true do |t|
    t.string   "tipo_manutencao"
    t.integer  "cc_id"
    t.integer  "mnservico_id"
    t.integer  "user_id"
    t.string   "falha_equip_acessorio"
    t.string   "acessorios_acomp"
    t.text     "descricao_falha"
    t.integer  "mnequipamento_id"
    t.integer  "mngrupo_id"
    t.integer  "prioridade"
    t.string   "nro_os"
    t.integer  "estado"
    t.integer  "prioridade_analise"
    t.integer  "mnservicoexec_id"
    t.string   "interna_externa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mnservicos", force: true do |t|
    t.string   "descricao"
    t.string   "tipo_servico", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modetiquetalinhas", force: true do |t|
    t.integer  "nro_linha"
    t.string   "orientacao"
    t.string   "fonte"
    t.string   "multiplicadorhorizontal"
    t.string   "multiplicadorvertical"
    t.string   "tipocodbarras"
    t.string   "largurabarralarga"
    t.string   "largurabarrafina"
    t.string   "alturacodbarras"
    t.string   "coordenadasx"
    t.string   "coordenadasy"
    t.string   "conteudo"
    t.integer  "modetiqueta_id"
    t.boolean  "codigodebarra"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "codigo_avancado"
  end

  create_table "modetiquetas", force: true do |t|
    t.string   "configuracao_antes_etiqueta"
    t.string   "configuracao_depois_etiqueta"
    t.string   "configuracao_antes_linha"
    t.string   "configuracao_depois_linha"
    t.string   "impressora"
    t.string   "modelo_impressao"
    t.integer  "qtde_colunas"
    t.integer  "largura_etiqueta"
    t.integer  "altura_etiqueta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "avancado"
    t.boolean  "inativo"
    t.string   "nome"
    t.integer  "etiqueta_por"
    t.integer  "qtde"
  end

  create_table "modrelatorios", force: true do |t|
    t.string   "arquivo_fisico"
    t.string   "titulo"
    t.text     "descricao"
    t.text     "where_fixo"
    t.boolean  "padrao",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modulos", force: true do |t|
    t.string   "sigla",       limit: 2
    t.string   "nome"
    t.boolean  "tem_versao"
    t.boolean  "ativo"
    t.string   "fundo_botao"
    t.string   "ordem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modulosconfs", force: true do |t|
    t.integer  "modulo_id"
    t.string   "subdominio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "porta"
  end

  create_table "modulosversoes", force: true do |t|
    t.integer  "modulo_id"
    t.string   "versao"
    t.datetime "data_atualizacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motivonaocobrancas", force: true do |t|
    t.string   "motivo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motivoscobrs", force: true do |t|
    t.string "codigo_sus"
    t.string "descricao"
    t.date   "data_inicio_uso"
    t.date   "data_fim_uso"
  end

  create_table "motivosgrs", force: true do |t|
    t.string   "descricao"
    t.string   "motivos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motivotransfs", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mpfolgas", force: true do |t|
    t.date     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mplocais", force: true do |t|
    t.string   "nome"
    t.string   "corfonte_html"
    t.integer  "ordem_fluxo"
    t.boolean  "pede_medico"
    t.boolean  "recebe_automatico"
    t.boolean  "so_movto_automatico"
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mploteis", force: true do |t|
    t.integer  "mplote_id"
    t.integer  "intern_id"
    t.text     "obs"
    t.boolean  "recebido"
    t.integer  "userdigitou_id"
    t.integer  "medico_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mplotes", force: true do |t|
    t.datetime "data_hora"
    t.integer  "mplocalorigem_id"
    t.integer  "mplocaldestino_id"
    t.integer  "userrecebe_id"
    t.boolean  "interns_excluidos"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mpmovimentadores", force: true do |t|
    t.integer  "user_id"
    t.integer  "mplocal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mpsameautorizacoes", force: true do |t|
    t.integer  "mpsamemov_id"
    t.string   "nome_solicitante"
    t.string   "rg_solicitante"
    t.date     "datanasc_solicitante"
    t.string   "fone_solicitante"
    t.integer  "solicitado_por"
    t.string   "nome_outro"
    t.string   "fone_outro"
    t.string   "rg_outro"
    t.string   "cpf_outro"
    t.integer  "relacao_paciente"
    t.string   "nome_relacao"
    t.integer  "dias_validade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mpsamemotsaidas", force: true do |t|
    t.string   "descricao"
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mpsamemovis", force: true do |t|
    t.integer  "mpsamemov_id"
    t.integer  "intern_id"
    t.date     "data_retorno"
    t.integer  "userretorno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mpsamemovs", force: true do |t|
    t.date     "data_saida"
    t.integer  "mpsamemotsaida_id"
    t.string   "nome_solicitante"
    t.text     "obs"
    t.integer  "usersaida_id"
    t.boolean  "com_saida_original"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mpsamepacoteis", force: true do |t|
    t.integer  "mpsamepacote_id"
    t.integer  "intern_id"
    t.boolean  "digitalizado"
    t.boolean  "arquivado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mpsamepacotes", force: true do |t|
    t.string   "localizacao"
    t.string   "pacote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mpsameparams", force: true do |t|
    t.string   "mascara_pacote"
    t.string   "mascara_localizacao"
    t.string   "termosolicitacao_jasper"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neoobitos", force: true do |t|
    t.integer  "nascimento_id"
    t.datetime "data_hora"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cidobito_id",          limit: 8
    t.string   "nro_declaracao_obito", limit: 12
  end

  create_table "notaxmls", force: true do |t|
    t.integer  "fnnota_id"
    t.integer  "tipo_documento"
    t.text     "xml_envio"
    t.text     "xml_retorno"
    t.boolean  "retorno_sem_erros"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ntdestinos", force: true do |t|
    t.string   "descricao",  limit: 30
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ntdietas", force: true do |t|
    t.string   "descricao"
    t.boolean  "nao_envia_refeicao"
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "lactario"
    t.boolean  "enteral"
  end

  create_table "ntdietas_stmmaprs", force: true do |t|
    t.integer "ntdieta_id", null: false
    t.integer "stmmapr_id", null: false
  end

  add_index "ntdietas_stmmaprs", ["ntdieta_id"], name: "idx_ntdietas_stmmaprs_ntdietas", using: :btree
  add_index "ntdietas_stmmaprs", ["ntdieta_id"], name: "index_ntdietas_stmmaprs_on_ntdieta_id", using: :btree
  add_index "ntdietas_stmmaprs", ["stmmapr_id"], name: "index_ntdietas_stmmaprs_on_stmmapr_id", using: :btree

  create_table "ntenteralmms", force: true do |t|
    t.integer  "ntenteralsaida_id"
    t.integer  "stmmapr_id"
    t.integer  "stunid_id"
    t.decimal  "qtde_unid",         precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ntenteralmms", ["ntenteralsaida_id"], name: "idx_ntenteralmms_ntenteralsaidas", using: :btree

  create_table "ntenterals", force: true do |t|
    t.integer  "intern_id"
    t.integer  "ntdieta_id"
    t.text     "obs"
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ntenterals", ["ntdieta_id"], name: "idx_ntenterals_ntdietas", using: :btree

  create_table "ntenteralsaidas", force: true do |t|
    t.integer  "ntenteral_id"
    t.datetime "hora_inicio_adm"
    t.datetime "data_hora_manipulacao"
    t.integer  "validade_horas"
    t.string   "temp_conservacao"
    t.integer  "volume_total"
    t.string   "via_acesso"
    t.integer  "veloc_admin"
    t.string   "tipo_veloc_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stsaida_id"
  end

  add_index "ntenteralsaidas", ["ntenteral_id"], name: "idx_ntenteralsaidas_ntenterals", using: :btree

  create_table "ntintervalodietas", force: true do |t|
    t.string   "intervalo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "intervalo_em_horas"
  end

  create_table "ntlactariomms", force: true do |t|
    t.integer  "ntlactario_id"
    t.integer  "stmmapr_id"
    t.decimal  "qtde_unid",     precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stunid_id"
  end

  add_index "ntlactariomms", ["ntlactario_id"], name: "idx_ntlactariomms_ntlactarios", using: :btree

  create_table "ntlactarios", force: true do |t|
    t.integer  "intern_id"
    t.integer  "ntdieta_id"
    t.integer  "ntintervalodieta_id"
    t.text     "obs"
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "qtde_ml"
  end

  add_index "ntlactarios", ["ntdieta_id"], name: "idx_ntlactarios_ntdietas", using: :btree
  add_index "ntlactarios", ["ntintervalodieta_id"], name: "idx_ntlactarios_ntintervalodietas", using: :btree

  create_table "ntlactariosaidas", force: true do |t|
    t.integer  "ntlactario_id"
    t.integer  "stsaida_id"
    t.datetime "data_hora"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ntlactariosaidas", ["ntlactario_id"], name: "idx_ntlactariosaidas_ntlactarios", using: :btree

  create_table "ntparametros", force: true do |t|
    t.integer  "dietaacomp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ntrefccis", force: true do |t|
    t.integer  "ntrefcc_id"
    t.integer  "cc_id"
    t.integer  "ntdestino_id"
    t.integer  "ntdieta_id"
    t.integer  "qtde"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ntrefccs", force: true do |t|
    t.date     "data"
    t.integer  "ntrefeicao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ntrefeicoes", force: true do |t|
    t.string   "descricao",  limit: 30
    t.integer  "peso_custo"
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordem"
  end

  create_table "ntrefpacienteidietas", force: true do |t|
    t.integer  "ntrefpacientei_id"
    t.integer  "ntdieta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ntrefpacienteis", force: true do |t|
    t.integer  "ntrefpaciente_id"
    t.integer  "intern_id"
    t.integer  "cc_id"
    t.integer  "ntdestino_id"
    t.boolean  "areceber"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "impressa"
  end

  create_table "ntrefpacientes", force: true do |t|
    t.date     "data"
    t.integer  "ntrefeicao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "obs"
  end

  create_table "orgaorgs", force: true do |t|
    t.string   "codigo"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sigla"
  end

  create_table "origematends", force: true do |t|
    t.string   "nome"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "origemints", force: true do |t|
    t.string  "descricao"
    t.boolean "inativo",   default: false, null: false
  end

  create_table "param_notas", force: true do |t|
    t.string   "certificado"
    t.string   "chave"
    t.string   "wsdl"
    t.string   "usuario_webservice"
    t.integer  "fornecedor"
    t.string   "versao_nfse"
    t.string   "wsdl_enviar_lote",                   limit: 1024
    t.string   "formato_xsd_enviar_lote",            limit: 1024
    t.string   "arquivo_xsd_enviar_lote",            limit: 1024
    t.string   "apelido_xsd_enviar_lote"
    t.string   "wsdl_cancelar_nfse",                 limit: 1024
    t.string   "formato_xsd_cancelar_nfse",          limit: 1024
    t.string   "arquivo_xsd_cancelar_nfse",          limit: 1024
    t.string   "apelido_xsd_cancelar_nfse"
    t.string   "wsdl_consultar_nfse_por_rps",        limit: 1024
    t.string   "formato_xsd_consultar_nfse_por_rps", limit: 1024
    t.string   "arquivo_xsd_consultar_nfse_por_rps", limit: 1024
    t.string   "apelido_xsd_consultar_nfse_por_rps"
    t.string   "wsdl_consultar_lote_rps",            limit: 1024
    t.string   "formato_xsd_consultar_lote_rps",     limit: 1024
    t.string   "arquivo_xsd_consultar_lote_rps",     limit: 1024
    t.string   "apelido_xsd_consultar_lote_rps"
    t.string   "wsdl_consultar_nfse",                limit: 1024
    t.string   "formato_xsd_consultar_nfse",         limit: 1024
    t.string   "arquivo_xsd_consultar_nfse",         limit: 1024
    t.string   "apelido_xsd_consultar_nfse"
    t.string   "wsdl_consultar_sit_lote",            limit: 1024
    t.string   "formato_xsd_consultar_sit_lote",     limit: 1024
    t.string   "arquivo_xsd_consultar_sit_lote",     limit: 1024
    t.string   "apelido_xsd_consultar_sit_lote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "param_notavendactbs", force: true do |t|
    t.integer  "ftforma_id"
    t.integer  "convenio_id"
    t.integer  "tipopac_id"
    t.integer  "cc_id"
    t.integer  "ct_conta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parametros", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome"
    t.string   "valor"
    t.string   "fn_padrao_recebimentos"
    t.string   "fn_padrao_pagamentos"
  end

  create_table "paramfichanascidos", force: true do |t|
    t.string   "campo"
    t.string   "valor"
    t.string   "inclui_valor_branco"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pcapacprocs", force: true do |t|
    t.integer  "pcfaturai_id"
    t.string   "procedimento_id"
    t.integer  "cbo_id"
    t.integer  "qtd"
    t.string   "cidprincipal_id"
    t.string   "cidsecundario_id"
    t.string   "cnpj_fornecedor"
    t.integer  "nro_nota"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nro_linha"
    t.integer  "susservico_id"
    t.integer  "susprocsclassif_id"
    t.integer  "qtd_ultrapassada"
  end

  create_table "pcbariatricas", force: true do |t|
    t.integer  "pcfaturai_id"
    t.integer  "imc"
    t.string   "nro_aih"
    t.string   "proc_aih"
    t.date     "data_cirurgia"
    t.string   "nro_aih_pos"
    t.string   "proc_aih_pos"
    t.string   "proc_aih_pos2"
    t.date     "data_cirurgia_pos"
    t.integer  "meses_acompanhamento"
    t.integer  "ano_acompanhamento"
    t.string   "pontuacao_baros"
    t.string   "tabela_baros"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pcfaturais", force: true do |t|
    t.string   "nro_apac"
    t.integer  "pcfatura_id"
    t.string   "nro_apac_anterior"
    t.integer  "medsolicitante_id"
    t.integer  "medexecutante_id"
    t.date     "inicio_validade_apac"
    t.date     "fim_validade_apac"
    t.integer  "paciente_id"
    t.string   "nome_responsavel"
    t.integer  "motivosaida_id"
    t.date     "data_encerramento_apac"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "carateratend_id"
    t.string   "tipo_apac"
    t.integer  "medresponsavel_id"
    t.date     "data_solicitacao"
    t.integer  "medautorizador_id"
    t.date     "data_autorizacao"
    t.string   "codigo_orgao_emissor"
    t.string   "situacao"
    t.integer  "pacresp_id"
  end

  create_table "pcfaturas", force: true do |t|
    t.integer  "competencia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descricao"
    t.integer  "apresentacao"
    t.integer  "pctipofatura_id"
    t.string   "situacao"
  end

  create_table "pclaudogerais", force: true do |t|
    t.integer  "pcfaturai_id"
    t.string   "cidprincipal_id"
    t.string   "cidsecundario_id"
    t.string   "cidcausas_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pcmedicamentos", force: true do |t|
    t.integer  "pcfaturai_id"
    t.string   "cidcausas_id"
    t.integer  "peso_kg"
    t.integer  "altura_cm"
    t.boolean  "transplantado"
    t.integer  "qtd_transplantes"
    t.boolean  "gestate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pcnefrologias", force: true do |t|
    t.integer  "pcfaturai_id"
    t.string   "cidprincipal_id"
    t.string   "cidsecundario_id"
    t.string   "cidcausas_id"
    t.date     "data_primeira_dialise"
    t.integer  "altura_cm"
    t.integer  "peso_kg"
    t.integer  "diurese_ml"
    t.integer  "glicose"
    t.integer  "albumina"
    t.integer  "hb"
    t.boolean  "acesso_vascular"
    t.boolean  "hiv"
    t.boolean  "hcv"
    t.boolean  "hbsag"
    t.boolean  "ultra_abdominal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pcparametros", force: true do |t|
    t.integer  "orgaoresp_id"
    t.string   "sigla"
    t.integer  "diretorunidade_id"
    t.integer  "codigo_ups"
    t.string   "nome_ups"
    t.string   "nome_destino"
    t.string   "orgao_destino"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cnsresponsavel_id"
  end

  create_table "pcquimios", force: true do |t|
    t.integer  "pcfaturai_id"
    t.string   "cidprincipal_id"
    t.string   "cidsecundario_id"
    t.string   "cidcausas_id"
    t.string   "cidtopografia_id"
    t.string   "cidanterior1_id"
    t.string   "cidanterior2_id"
    t.string   "cidanterior3_id"
    t.date     "data_inicio_anterior1"
    t.date     "data_inicio_anterior2"
    t.date     "data_inicio_anterior3"
    t.string   "linfonodos"
    t.string   "estadio"
    t.integer  "grau_histopatologico"
    t.date     "data_diag_hist"
    t.boolean  "continuidade"
    t.date     "data_inicio_trat"
    t.string   "esquema"
    t.integer  "meses_planejados"
    t.integer  "meses_autorizados"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pcradioareas", force: true do |t|
    t.integer "pcradio_id"
    t.string  "cidarea_id"
    t.integer "nro_campos"
    t.date    "data_inicio"
    t.date    "data_fim"
  end

  create_table "pcradios", force: true do |t|
    t.integer  "pcfaturai_id"
    t.string   "cidprincipal_id"
    t.string   "cidsecundario_id"
    t.string   "cidcausas_id"
    t.string   "cidtopografia_id"
    t.string   "cidanterior1_id"
    t.string   "cidanterior2_id"
    t.string   "cidanterior3_id"
    t.date     "data_inicio_anterior1"
    t.date     "data_inicio_anterior2"
    t.date     "data_inicio_anterior3"
    t.string   "linfonodos"
    t.string   "estadio"
    t.integer  "grau_histopatologico"
    t.date     "data_diag_hist"
    t.boolean  "continuidade"
    t.date     "data_inicio_trat"
    t.integer  "finalidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pctipofaturas", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissoes", force: true do |t|
    t.integer  "role_id"
    t.string   "metodo"
    t.string   "controle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pmbpaofflines", force: true do |t|
    t.integer  "ups_id"
    t.integer  "cmpt"
    t.integer  "medico_id"
    t.string   "cbo_id",           limit: 6
    t.date     "data_atend"
    t.string   "susproc_id",       limit: 10
    t.string   "cnspac"
    t.string   "sexo"
    t.integer  "cidade_id"
    t.string   "cid_id",           limit: 8
    t.integer  "idade"
    t.integer  "qt"
    t.integer  "pmcarate_id"
    t.string   "nr_autorizacao"
    t.string   "nmpac"
    t.date     "dtnasc"
    t.string   "orig"
    t.string   "cor_id",           limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "susservico_id",    limit: 3
    t.string   "susclassif_id",    limit: 3
    t.integer  "cep",              limit: 8
    t.string   "endereco"
    t.integer  "logradouro_id"
    t.integer  "nro_endereco",     limit: 8
    t.integer  "complemento",      limit: 8
    t.string   "nome_bairro"
    t.integer  "bairro_id"
    t.integer  "telefone",         limit: 8
    t.string   "email"
    t.integer  "tb301_logradouro", limit: 2
  end

  create_table "pmconfrepasses", force: true do |t|
    t.integer  "ordem"
    t.string   "procedimento_ini",  limit: 10
    t.string   "procedimento_fim",  limit: 10
    t.string   "profissional_type"
    t.integer  "profissional_id"
    t.string   "tipo_valor"
    t.decimal  "valor",                        precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "inativo"
  end

  create_table "pmimportacoes", force: true do |t|
    t.integer  "pmmovto_id"
    t.integer  "movimento_id"
    t.string   "modulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pmrepasses", force: true do |t|
    t.string   "movto_type"
    t.integer  "movto_id"
    t.integer  "pmconfrepasse_id"
    t.decimal  "valor",            precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prontuariosdiferentes", force: true do |t|
    t.integer  "prontuario1_id"
    t.integer  "prontuario2_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prontunidos", force: true do |t|
    t.integer  "prontorigem_id"
    t.integer  "prontdestino_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rcacompanhantes", force: true do |t|
    t.integer  "intern_id"
    t.date     "data_entrada"
    t.string   "nome"
    t.string   "cpfrg"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rcboletims", force: true do |t|
    t.integer  "intern_id"
    t.datetime "data_hora"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rcfichas", force: true do |t|
    t.string   "nome"
    t.string   "arquivo"
    t.integer  "ordem"
    t.boolean  "marcado"
    t.text     "filtros"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tipo_web"
  end

  create_table "rcparametros", force: true do |t|
    t.boolean  "usa_higienizacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sitleito_id_alta"
  end

  create_table "rcrestrics", force: true do |t|
    t.date     "data_ini"
    t.date     "data_fim"
    t.integer  "intern_id"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rcvisitas", force: true do |t|
    t.string   "nro_cracha"
    t.integer  "intern_id"
    t.datetime "entrada"
    t.datetime "saida"
    t.string   "nome"
    t.string   "cpfrg"
    t.string   "obs_entrada"
    t.string   "obs_saida"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdexameis", force: true do |t|
    t.integer  "rdexame_id"
    t.integer  "proc_id"
    t.string   "complemento",   limit: 100
    t.integer  "consumo_id"
    t.integer  "qtde",          limit: 2
    t.integer  "seq_impressao", limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdexames", force: true do |t|
    t.date     "data_requisicao"
    t.integer  "rdunidade_id"
    t.integer  "medsolicitante_id"
    t.string   "medsolicitante_nome"
    t.integer  "intern_id"
    t.boolean  "imprimiu_requisicao"
    t.text     "cuidados"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nro_protocolo"
    t.integer  "nro_exame"
    t.integer  "setororigem_id"
    t.boolean  "sem_laudo"
    t.boolean  "imprimiu_etiqueta"
    t.text     "exames_clinicos"
    t.text     "hipoteses_diagnosticas"
  end

  create_table "rdexecutados", force: true do |t|
    t.integer  "rdexame_id"
    t.integer  "rdtecnico_id"
    t.date     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdfilmes", force: true do |t|
    t.integer  "rdexame_id"
    t.integer  "stmmapr_id"
    t.integer  "qtde"
    t.integer  "qtde_inc"
    t.integer  "qtde_perd"
    t.integer  "rdmotivosperda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdlaudos", force: true do |t|
    t.date     "data"
    t.integer  "rdexame_id"
    t.integer  "radiologista_id"
    t.text     "resultado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdmotivosperdas", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdparametros", force: true do |t|
    t.string   "seq_formato", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdpresrequisicoes", force: true do |t|
    t.integer  "solexame_id"
    t.integer  "rdexamei_id"
    t.boolean  "ignorado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdrpadpros", force: true do |t|
    t.integer  "rdrpad_id"
    t.integer  "proce_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdrpads", force: true do |t|
    t.string   "descricao"
    t.text     "resultado"
    t.boolean  "normal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "apelido"
  end

  create_table "rdunidadefilmes", force: true do |t|
    t.integer  "rdunidade_id"
    t.integer  "stmmapr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdunidades", force: true do |t|
    t.string   "nome"
    t.integer  "ftgrupoexame_id"
    t.integer  "tipo_gera_consumo"
    t.integer  "stpe_id"
    t.string   "modelo_laudo",      limit: 30
    t.string   "modelo_requisicao", limit: 30
    t.boolean  "integra_pam"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tipo_sequencia",    limit: 1
    t.integer  "setor_id"
  end

  create_table "receitais", force: true do |t|
    t.integer  "receita_id"
    t.integer  "medicamento_id"
    t.string   "qtde"
    t.string   "dose"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relatorios", force: true do |t|
    t.string   "nome_jasper"
    t.string   "titulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "respinterns", force: true do |t|
    t.integer  "intern_id"
    t.integer  "resppaciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string  "title"
    t.boolean "profissional_saude"
    t.string  "modulos"
    t.boolean "personalizavel",     default: false
    t.boolean "medico"
  end

  add_index "roles", ["title"], name: "index_roles_on_title", unique: true, using: :btree

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.boolean "ativo"
  end

  create_table "scagravos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scaltaisolamentos", force: true do |t|
    t.integer  "scisolamento_id"
    t.integer  "user_id"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scisolamentoobs", force: true do |t|
    t.integer  "scisolamento_id"
    t.integer  "user_id"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scisolamentos", force: true do |t|
    t.integer  "sctipoisolamento_id"
    t.integer  "user_id"
    t.integer  "intern_id"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "lido"
  end

  create_table "scjustamostragermes", force: true do |t|
    t.integer  "scjustamostra_id"
    t.integer  "scjustgerme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scjustgermes", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scjustificativaamostras", force: true do |t|
    t.integer  "scjustificativa_id"
    t.integer  "scjustmaterial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scjustificativamms", force: true do |t|
    t.integer  "scjustificativa_id"
    t.integer  "matmed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scjustificativas", force: true do |t|
    t.string   "tipo",                limit: 1
    t.boolean  "infeccao_hospitalar"
    t.integer  "medico_id"
    t.date     "data"
    t.text     "justificativa"
    t.integer  "dias_utilizacao"
    t.date     "data_hora_vencto"
    t.integer  "intern_id"
    t.integer  "estado"
    t.integer  "scjustindicacao_id"
    t.integer  "scjusttopografia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scjustindicacoes", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scjustmateriais", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scjustobsccihs", force: true do |t|
    t.integer  "scjustificativa_id"
    t.text     "obs"
    t.boolean  "lido_medico"
    t.integer  "classificacao_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scjusttopografias", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scnotaagravoobss", force: true do |t|
    t.integer  "scnotagravo_id"
    t.integer  "usuario_id"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scnotaagravos", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "intern_id"
    t.integer  "scagravo_id"
    t.boolean  "notificacao_sinan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data_agravo"
  end

  create_table "sctipoisolamentos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "setors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sisfuncs", force: true do |t|
    t.string   "codinome"
    t.string   "descricao"
    t.integer  "sisfunc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sisfuncs_users", force: true do |t|
    t.integer  "sisfunc_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solcabs", force: true do |t|
    t.text     "exames_clinicos"
    t.text     "hipoteses_diagnosticas"
    t.string   "unidade"
    t.integer  "solicitante_id"
    t.boolean  "contraste"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "solicitante_nome"
    t.string   "solicitante_crm"
  end

  create_table "solexameis", force: true do |t|
    t.integer  "solexame_id"
    t.integer  "exame_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "obs"
  end

  create_table "solexames", force: true do |t|
    t.integer  "solcab_id"
    t.integer  "prescricao_id"
    t.integer  "intern_id"
    t.integer  "procedimento_id"
    t.string   "complemento"
    t.boolean  "precisaautorizar"
    t.string   "unidade"
    t.integer  "solicitante_id"
    t.boolean  "impresso"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stgrupos", force: true do |t|
    t.string   "descricao"
    t.string   "classificacao"
    t.string   "tipo",           limit: 10
    t.string   "fnctbconta_id",  limit: 10
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "usar_no_matmed"
    t.integer  "ct_conta_id"
  end

  create_table "stgrupos_contabil", force: true do |t|
    t.integer  "stgrupo_id"
    t.integer  "cc_id"
    t.integer  "ct_conta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stgrupotipos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stimpetiquetas", force: true do |t|
    t.integer  "stmmapr_id"
    t.integer  "stunid_id"
    t.string   "lote"
    t.date     "data_validade"
    t.integer  "qtde"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "obs",           limit: nil
  end

  create_table "tabtemporarias", force: true do |t|
    t.string "aba"
    t.text   "coluna01"
    t.text   "coluna02"
    t.text   "coluna03"
    t.text   "coluna04"
    t.text   "coluna05"
    t.text   "coluna06"
    t.text   "coluna07"
    t.text   "coluna08"
    t.text   "coluna09"
    t.text   "coluna10"
    t.text   "coluna11"
    t.text   "coluna12"
    t.text   "coluna13"
    t.text   "coluna14"
    t.text   "coluna15"
    t.text   "coluna16"
    t.text   "coluna17"
    t.text   "coluna18"
    t.text   "coluna19"
    t.text   "coluna20"
  end

  create_table "tbl_laudos", force: true do |t|
    t.string   "rdexamei_id"
    t.string   "nome_medico"
    t.string   "crm"
    t.datetime "data_hora"
  end

  create_table "telaconfigs", force: true do |t|
    t.string   "tela"
    t.string   "campo"
    t.string   "situacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tiponfs", force: true do |t|
    t.string   "nome"
    t.string   "origem",     limit: 1
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tissrepresentacaocompls", force: true do |t|
    t.integer "tissrepresentacao_id"
    t.text    "termo_detalhado"
    t.string  "referencia_fabricante"
    t.string  "nome_fabricante"
    t.string  "registro_anvisa"
    t.string  "classe_risco"
    t.string  "apresentacao",          limit: 5000
    t.string  "laboratorio"
    t.string  "sigla_uf"
    t.string  "codigo_terminologia"
    t.string  "codigo_tuss"
    t.string  "forma_enviou"
    t.string  "codigo_grupo"
    t.string  "nome_grupo"
    t.string  "status"
    t.string  "in"
    t.date    "data_in"
  end

  create_table "tissrepresentacoes", force: true do |t|
    t.integer  "tissterminologia_id"
    t.string   "codigo"
    t.string   "nome",                limit: 5000
    t.date     "data_inicio"
    t.date     "data_fim"
    t.date     "data_implantacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tissrepresentacoes", ["codigo"], name: "idx_tissrepresentacoes_01", using: :btree

  create_table "tissterminologias", force: true do |t|
    t.string   "nome"
    t.boolean  "inativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tisstipoguia", force: true do |t|
    t.string   "nome"
    t.integer  "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tissxmlguias", force: true do |t|
    t.integer  "tissxml_id"
    t.integer  "ftintguia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tissxmls", force: true do |t|
    t.integer  "convenio_id"
    t.integer  "tisstipoguia_id"
    t.text     "arq_prestador"
    t.text     "arq_operadora"
    t.text     "obs"
    t.string   "nro_protocolo_operadora"
    t.string   "versao_tiss"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tomadores", force: true do |t|
    t.string   "nome",           limit: 100
    t.string   "email",          limit: 60
    t.string   "tipo_pessoa",    limit: 1
    t.string   "cpf_cnpj",       limit: 14
    t.string   "insc_estadual",  limit: 20
    t.string   "telefone"
    t.string   "endereco",       limit: 80
    t.string   "nro_endereco",   limit: 5
    t.string   "complemento"
    t.integer  "cidade_id"
    t.string   "cep",            limit: 8
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bairro"
    t.integer  "fncategoria_id"
  end

  create_table "tomadores_origem", force: true do |t|
    t.integer  "tomador_id"
    t.string   "origem_type"
    t.integer  "origem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turnos", force: true do |t|
    t.string   "nome"
    t.time     "hora_inicio"
    t.time     "hora_fim"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userconfs", force: true do |t|
    t.integer  "user_id"
    t.integer  "setor_id"
    t.integer  "fila_id"
    t.integer  "departamento_id"
    t.integer  "fornecedor_id"
    t.string   "nome"
    t.string   "acessar_ccs"
    t.string   "stsolicpe_pes"
    t.string   "movimenta_pes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "acessa_modulos"
    t.date     "dt_acesso_inicial"
    t.date     "dt_acesso_final"
    t.string   "cc_solicitacoes"
    t.string   "grupos_agenda"
    t.string   "acesso_gdrecursos"
    t.string   "pr_formas_solexames"
    t.string   "filtros_solexames"
    t.integer  "fncaixa_id"
    t.integer  "gdrecurso_sessaoquimio_id"
    t.boolean  "pr_novo_modelo",            default: true
    t.string   "caixas_movimentados"
  end

  create_table "userhelps", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userlogs", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",   limit: 128, default: "", null: false
    t.string   "password_salt",                    default: "", null: false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "redefinir_senha"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "valores", force: true do |t|
    t.integer  "campo_id"
    t.string   "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tabela"
    t.integer  "tabela_id"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "xx", id: false, force: true do |t|
    t.integer  "id"
    t.integer  "user_id"
    t.integer  "setor_id"
    t.integer  "fila_id"
    t.integer  "departamento_id"
    t.integer  "fornecedor_id"
    t.string   "nome"
    t.string   "acessar_ccs"
    t.string   "stsolicpe_pes"
    t.string   "movimenta_pes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "acessa_modulos"
    t.date     "dt_acesso_inicial"
    t.date     "dt_acesso_final"
    t.string   "cc_solicitacoes"
    t.string   "grupos_agenda"
    t.string   "acesso_gdrecursos"
    t.string   "pr_formas_solexames"
    t.string   "filtros_solexames"
    t.integer  "fncaixa_id"
  end

end
