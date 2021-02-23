require 'test_helper'

class EDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @e_doc = e_docs(:one)
  end

  test "should get index" do
    get e_docs_url
    assert_response :success
  end

  test "should get new" do
    get new_e_doc_url
    assert_response :success
  end

  test "should create e_doc" do
    assert_difference('EDoc.count') do
      post e_docs_url, params: { e_doc: { Category_id: @e_doc.Category_id, User_id: @e_doc.User_id, description: @e_doc.description, docname: @e_doc.docname, file: @e_doc.file } }
    end

    assert_redirected_to e_doc_url(EDoc.last)
  end

  test "should show e_doc" do
    get e_doc_url(@e_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_e_doc_url(@e_doc)
    assert_response :success
  end

  test "should update e_doc" do
    patch e_doc_url(@e_doc), params: { e_doc: { Category_id: @e_doc.Category_id, User_id: @e_doc.User_id, description: @e_doc.description, docname: @e_doc.docname, file: @e_doc.file } }
    assert_redirected_to e_doc_url(@e_doc)
  end

  test "should destroy e_doc" do
    assert_difference('EDoc.count', -1) do
      delete e_doc_url(@e_doc)
    end

    assert_redirected_to e_docs_url
  end
end
