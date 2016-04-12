require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  test "#index" do
    get "index", format: :json

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, items.count
    assert items.first.has_key?("name")
  end

  test "#show" do
    id = Item.first.id

    get :show, id: id, format: :json
    item = JSON.parse(response.body)

    assert_response :success
    assert_equal item["id"], id
  end

end
