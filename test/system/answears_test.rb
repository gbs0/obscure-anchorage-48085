require "application_system_test_case"

class AnswearsTest < ApplicationSystemTestCase
  setup do
    @answear = answears(:one)
  end

  test "visiting the index" do
    visit answears_url
    assert_selector "h1", text: "Answears"
  end

  test "creating a Answear" do
    visit answears_url
    click_on "New Answear"

    fill_in "Description", with: @answear.description
    fill_in "Lat", with: @answear.lat
    fill_in "Lng", with: @answear.lng
    fill_in "Question", with: @answear.question_id
    click_on "Create Answear"

    assert_text "Answear was successfully created"
    click_on "Back"
  end

  test "updating a Answear" do
    visit answears_url
    click_on "Edit", match: :first

    fill_in "Description", with: @answear.description
    fill_in "Lat", with: @answear.lat
    fill_in "Lng", with: @answear.lng
    fill_in "Question", with: @answear.question_id
    click_on "Update Answear"

    assert_text "Answear was successfully updated"
    click_on "Back"
  end

  test "destroying a Answear" do
    visit answears_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Answear was successfully destroyed"
  end
end
