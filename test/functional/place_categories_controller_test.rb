require 'test_helper'

class PlaceCategoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => PlaceCategory.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    PlaceCategory.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    PlaceCategory.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to category_url(assigns(:category))
  end
  
  def test_edit
    get :edit, :id => PlaceCategory.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    PlaceCategory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PlaceCategory.first
    assert_template 'edit'
  end
  
  def test_update_valid
    PlaceCategory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PlaceCategory.first
    assert_redirected_to category_url(assigns(:category))
  end
  
  def test_destroy
    category = PlaceCategory.first
    delete :destroy, :id => category
    assert_redirected_to categories_url
    assert !PlaceCategory.exists?(category.id)
  end
end
