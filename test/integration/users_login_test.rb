# frozen_string_literal: true

require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'danger flash message should appear only once' do
    get login_path
    post login_path, params: { session: { email: '', password: '' } }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'success flash message should appear only once' do
    user = User.new(name: 'Foo Example', email: 'this@example.com', password: 'password123')
    user.save

    get login_path
    post login_path, params: { session: { email: 'this@example.com', password: 'password123' } }
    follow_redirect!
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login with valid information' do
    get login_path
    post login_path, params: { session: { email: @user.email,
                                          password: 'password123' } }

    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', user_path(@user)
  end
end
