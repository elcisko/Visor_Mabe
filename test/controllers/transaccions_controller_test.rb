require 'test_helper'

class TransaccionsControllerTest < ActionController::TestCase
  setup do
    @transaccion = transaccions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaccions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaccion" do
    assert_difference('Transaccion.count') do
      post :create, transaccion: { batch_id: @transaccion.batch_id, ejecucion: @transaccion.ejecucion, external_id: @transaccion.external_id, id: @transaccion.id, payload: @transaccion.payload, record_id: @transaccion.record_id, source_id: @transaccion.source_id, status: @transaccion.status, target_id: @transaccion.target_id, tipo_transaccion: @transaccion.tipo_transaccion }
    end

    assert_redirected_to transaccion_path(assigns(:transaccion))
  end

  test "should show transaccion" do
    get :show, id: @transaccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaccion
    assert_response :success
  end

  test "should update transaccion" do
    patch :update, id: @transaccion, transaccion: { batch_id: @transaccion.batch_id, ejecucion: @transaccion.ejecucion, external_id: @transaccion.external_id, id: @transaccion.id, payload: @transaccion.payload, record_id: @transaccion.record_id, source_id: @transaccion.source_id, status: @transaccion.status, target_id: @transaccion.target_id, tipo_transaccion: @transaccion.tipo_transaccion }
    assert_redirected_to transaccion_path(assigns(:transaccion))
  end

  test "should destroy transaccion" do
    assert_difference('Transaccion.count', -1) do
      delete :destroy, id: @transaccion
    end

    assert_redirected_to transaccions_path
  end
end
