require 'test_helper'

class EvolucaosControllerTest < ActionController::TestCase
  setup do
    @evolucao = evolucaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evolucaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evolucao" do
    assert_difference('Evolucao.count') do
      post :create, evolucao: { evolucao_tipo_id: @evolucao.evolucao_tipo_id, paciente_id: @evolucao.paciente_id }
    end

    assert_redirected_to evolucao_path(assigns(:evolucao))
  end

  test "should show evolucao" do
    get :show, id: @evolucao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evolucao
    assert_response :success
  end

  test "should update evolucao" do
    patch :update, id: @evolucao, evolucao: { evolucao_tipo_id: @evolucao.evolucao_tipo_id, paciente_id: @evolucao.paciente_id }
    assert_redirected_to evolucao_path(assigns(:evolucao))
  end

  test "should destroy evolucao" do
    assert_difference('Evolucao.count', -1) do
      delete :destroy, id: @evolucao
    end

    assert_redirected_to evolucaos_path
  end
end
