require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  setup do
    @registration = registrations(:one)
  end

  test "visiting the index" do
    visit registrations_url
    assert_selector "h1", text: "Registrations"
  end

  test "should create registration" do
    visit registrations_url
    click_on "New registration"

    fill_in "Confirm password", with: @registration.confirm_password
    fill_in "Email address", with: @registration.email_address
    fill_in "First name", with: @registration.first_name
    fill_in "Last name", with: @registration.last_name
    fill_in "Password", with: @registration.password
    click_on "Create Registration"

    assert_text "Registration was successfully created"
    click_on "Back"
  end

  test "should update Registration" do
    visit registration_url(@registration)
    click_on "Edit this registration", match: :first

    fill_in "Confirm password", with: @registration.confirm_password
    fill_in "Email address", with: @registration.email_address
    fill_in "First name", with: @registration.first_name
    fill_in "Last name", with: @registration.last_name
    fill_in "Password", with: @registration.password
    click_on "Update Registration"

    assert_text "Registration was successfully updated"
    click_on "Back"
  end

  test "should destroy Registration" do
    visit registration_url(@registration)
    click_on "Destroy this registration", match: :first

    assert_text "Registration was successfully destroyed"
  end
end
