require 'test_helper'

class ClothingTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ClothingType.new.valid?
  end
end
