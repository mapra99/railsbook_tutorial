# frozen_string_literal: true

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'user should not be created if it is invalid' do
    get signup_path

    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '',
                                         email: 'user@invalid',
                                         password: 'foo',
                                         password_confirmation: 'bar' } }
    end
  end
end
