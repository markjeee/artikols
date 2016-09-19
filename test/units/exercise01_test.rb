require 'test_helper'
require 'my_array_map'

class MyArrayMapTest < ActiveSupport::TestCase
  setup do
    MyArrayMap.setup

    @source_a = [ 1, 2, 3, 4 ]
    @expected_a = [ '1', '2', '3', '4' ]
  end

  test "Original Array#map" do
    assert_equal(@source_a.map(&:to_s), @expected_a)
  end

  test "MyArrayMap#my_map" do
    assert_equal(@source_a.my_map(&:to_s), @expected_a)
  end

  test "MyArrayMap#my_crude_map" do
    assert_equal(@source_a.my_crude_map(&:to_s), @expected_a)
  end
end
