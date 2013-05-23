require 'test_helper'
require 'open-uri'
require 'RMagick'
include Magick

class ProductTest < ActiveSupport::TestCase

  str = ''

  test '500x500' do
    uri = URI.parse( 'http://unlocalhost.com/test/500x500.jpg' );
    uri.open {|f| str = f.read  }
    img = Image.from_blob( str ).first;

    assert_equal 500, img.columns
    assert_equal 500, img.rows

    img.resize_to_fill!(600, 725);
    assert_equal 600, img.columns
    assert_equal 725, img.rows
  end

  test '450x333' do
    uri = URI.parse( 'http://unlocalhost.com/test/450x333.jpg' );
    uri.open {|f| str = f.read  }
    img = Image.from_blob( str ).first;

    assert_equal 450, img.columns
    assert_equal 333, img.rows

    img.resize_to_fill!(75, 66);
    assert_equal 75, img.columns
    assert_equal 66, img.rows
  end

end
