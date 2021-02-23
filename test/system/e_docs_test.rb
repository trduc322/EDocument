require "application_system_test_case"

class EDocsTest < ApplicationSystemTestCase
  setup do
    @e_doc = e_docs(:one)
  end

  test "visiting the index" do
    visit e_docs_url
    assert_selector "h1", text: "E Docs"
  end

  test "creating a E doc" do
    visit e_docs_url
    click_on "New E Doc"

    fill_in "Category", with: @e_doc.Category_id
    fill_in "User", with: @e_doc.User_id
    fill_in "Description", with: @e_doc.description
    fill_in "Docname", with: @e_doc.docname
    fill_in "File", with: @e_doc.file
    click_on "Create E doc"

    assert_text "E doc was successfully created"
    click_on "Back"
  end

  test "updating a E doc" do
    visit e_docs_url
    click_on "Edit", match: :first

    fill_in "Category", with: @e_doc.Category_id
    fill_in "User", with: @e_doc.User_id
    fill_in "Description", with: @e_doc.description
    fill_in "Docname", with: @e_doc.docname
    fill_in "File", with: @e_doc.file
    click_on "Update E doc"

    assert_text "E doc was successfully updated"
    click_on "Back"
  end

  test "destroying a E doc" do
    visit e_docs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "E doc was successfully destroyed"
  end
end
