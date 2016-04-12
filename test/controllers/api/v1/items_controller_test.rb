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
    name = "MyString"

    get :show, id: id, format: :json
    item = JSON.parse(response.body)

    assert_response :success
    assert_equal item["id"], id
    assert_equal item["name"], name
  end

  test "#create" do
    item_params = {name: "Hammer", description: "When it is this time, you stop"}

    assert_equal 2, Item.count

    post :create, format: :json, item: item_params

    item_count_after = Item.count

    newly_created_item = JSON.parse(response.body)

    assert_response :success
    assert_equal 3, item_count_after
    assert_equal item_params[:name], Item.last.name
    assert_equal Item.last.id, newly_created_item["id"]

  end

end
