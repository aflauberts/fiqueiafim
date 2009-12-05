require 'test_helper'

class ClothingTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => ClothingType.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    ClothingType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    ClothingType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to clothing_type_url(assigns(:clothing_type))
  end
  
  def test_edit
    get :edit, :id => ClothingType.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    ClothingType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ClothingType.first
    assert_template 'edit'
  end
  
  def test_update_valid
    ClothingType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ClothingType.first
    assert_redirected_to clothing_type_url(assigns(:clothing_type))
  end
  
  def test_destroy
    clothing_type = ClothingType.first
    delete :destroy, :id => clothing_type
    assert_redirected_to clothing_types_url
    assert !ClothingType.exists?(clothing_type.id)
  end
end
