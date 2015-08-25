require 'test_helper'

class EvolucaoTiposControllerTest < ActionController::TestCase
  setup do
    @evolucao_tipo = evolucao_tipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evolucao_tipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evolucao_tipo" do
    assert_difference('EvolucaoTipo.count') do
      post :create, evolucao_tipo: { nome: @evolucao_tipo.nome }
    end

    assert_redirected_to evolucao_tipo_path(assigns(:evolucao_tipo))
  end

  test "should show evolucao_tipo" do
    get :show, id: @evolucao_tipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evolucao_tipo
    assert_response :success
  end

  test "should update evolucao_tipo" do
    patch :update, id: @evolucao_tipo, evolucao_tipo: { nome: @evolucao_tipo.nome }
    assert_redirected_to evolucao_tipo_path(assigns(:evolucao_tipo))
  end

  test "should destroy evolucao_tipo" do
    assert_difference('EvolucaoTipo.count', -1) do
      delete :destroy, id: @evolucao_tipo
    end

    assert_redirected_to evolucao_tipos_path
  end
end
