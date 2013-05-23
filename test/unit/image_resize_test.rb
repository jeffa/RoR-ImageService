require 'test_helper'
require 'RMagick'

class ProductTest < ActiveSupport::TestCase

  test '500x500' do
    img = Magick::ImageList.new( 'test/unit/data/500x500.jpg' )
    assert_equal 500, img.columns
    assert_equal 500, img.rows

    img.resize_to_fill!(600, 725);
    assert_equal 600, img.columns
    assert_equal 725, img.rows
  end

  test '450x333' do
    img = Magick::ImageList.new( 'test/unit/data/450x333.jpg' )
    assert_equal 450, img.columns
    assert_equal 333, img.rows

    img.resize_to_fill!(75, 66);
    assert_equal 75, img.columns
    assert_equal 66, img.rows
  end

end
