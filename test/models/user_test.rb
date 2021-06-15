require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "criando user" do
    user = User.new(email: 'pedro@email.com', password: '123456', name:'Pedro', role: 'Admin')
    assert user.save
    end

  test "editando user" do
    user = User.new(email: 'pedro@email.com', password: '123456', name:'Pedro', role: 'Admin')
    user.save
    assert user.update(email: 'pedro@email.com', password: '123456', name:'Pedro Jorge', role: 'Admin')
    end

  test "editando user com nome com um caracte" do
    user = User.new(email: 'pedro@email.com', password: '123456', name:'Pedro', role: 'Admin')
    user.save
    assert_not user.update(email: 'pedro@email.com', password: '123456', name:'P', role: 'Admin')
    end

end
