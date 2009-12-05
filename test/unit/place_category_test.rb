require 'test_helper'

class PlaceCategoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PlaceCategory.new.valid?
  end
end
