require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test 'danger flash message should appear only once' do
    get login_path
    post login_path, params: { session: { email: "", password: "" } }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'success flash message should appear only once' do
    user = User.new(name: 'Foo Example', email: 'this@example.com', password: 'password123')
    user.save

    get login_path
    post login_path, params: { session: { email: "this@example.com", password: "password123" } }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
