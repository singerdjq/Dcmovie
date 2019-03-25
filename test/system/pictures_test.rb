require "application_system_test_case"

class PicturesTest < ApplicationSystemTestCase
  setup do
    @picture = pictures(:one)
  end

  test "visiting the index" do
    visit pictures_url
    assert_selector "h1", text: "Pictures"
  end

  test "creating a Picture" do
    visit pictures_url
    click_on "New Picture"

    fill_in "Genre1", with: @picture.genre1
    fill_in "Genre2", with: @picture.genre2
    fill_in "Name", with: @picture.name
    fill_in "Nominations", with: @picture.nominations
    fill_in "Rating", with: @picture.rating
    fill_in "Release", with: @picture.release
    fill_in "Synopsis", with: @picture.synopsis
    fill_in "Year", with: @picture.year
    click_on "Create Picture"

    assert_text "Picture was successfully created"
    click_on "Back"
  end

  test "updating a Picture" do
    visit pictures_url
    click_on "Edit", match: :first

    fill_in "Genre1", with: @picture.genre1
    fill_in "Genre2", with: @picture.genre2
    fill_in "Name", with: @picture.name
    fill_in "Nominations", with: @picture.nominations
    fill_in "Rating", with: @picture.rating
    fill_in "Release", with: @picture.release
    fill_in "Synopsis", with: @picture.synopsis
    fill_in "Year", with: @picture.year
    click_on "Update Picture"

    assert_text "Picture was successfully updated"
    click_on "Back"
  end

  test "destroying a Picture" do
    visit pictures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Picture was successfully destroyed"
  end
end
