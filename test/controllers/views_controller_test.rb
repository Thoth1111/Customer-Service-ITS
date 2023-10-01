require 'test_helper'

class ViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @view = views(:one)
  end

  test 'should get index' do
    get views_url
    assert_response :success
  end

  test 'should get new' do
    get new_view_url
    assert_response :success
  end

  test 'should create view' do
    assert_difference('View.count') do
      post views_url,
           params: { view: { entity_id: @view.entity_id, entity_type: @view.entity_type, user_id: @view.user_id,
                             view_time: @view.view_time } }
    end

    assert_redirected_to view_url(View.last)
  end

  test 'should show view' do
    get view_url(@view)
    assert_response :success
  end

  test 'should get edit' do
    get edit_view_url(@view)
    assert_response :success
  end

  test 'should update view' do
    patch view_url(@view),
          params: { view: { entity_id: @view.entity_id, entity_type: @view.entity_type, user_id: @view.user_id,
                            view_time: @view.view_time } }
    assert_redirected_to view_url(@view)
  end

  test 'should destroy view' do
    assert_difference('View.count', -1) do
      delete view_url(@view)
    end

    assert_redirected_to views_url
  end
end
