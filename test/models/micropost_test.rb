# frozen_string_literal: true

require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:miguel)
    @micropost = @user.microposts.build(content: 'Lorem ipsum')
  end

  test 'test micropost should be valid' do
    assert @micropost.valid?
  end

  test 'micropost needs a user id' do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test 'retrieve of all microposts should be in reverse created order' do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
