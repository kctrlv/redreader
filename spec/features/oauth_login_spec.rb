require 'rails_helper'

context 'OAuth' do
  it "mocked user can login with their reddit account and see their karma" do
    stub_omniauth
    visit "/"
    assert_equal 200, page.status_code
    click_link "Sign In with Reddit"
    assert_equal '/dashboard', current_path
    assert page.has_content?("cool_guy")
    assert page.has_link?("Logout")
    assert page.has_content?("Comment Karma 2500")
    assert page.has_content?("Link Karma 1500")
  end

  # it "real user can login with their reddit account" do
  #   visit "/"
  #   assert_equal 200, page.status_code
  #   click_link "Sign In with Reddit"
  #   save_and_open_page
  #
  #   # assert_equal '/dashboard', current_path
  #   # assert page.has_content?("cool_guy")
  #   # assert page.has_link?("Logout")
  #   # assert page.has_content?("Comment Karma 2500")
  #   # assert page.has_content?("Link Karma 1500")
  #   # save_and_open_page
  # end

end
