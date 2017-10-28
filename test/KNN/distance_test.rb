require "test_helper"
require_relative "../../lib/KNN/distance.rb"

class DistanceTest < Minitest::Test
  def test_euclidean_distance
    x = [4, 1, -2]
    y = [2, 3, -1]
    assert_equal 3, Distance.euclidean(x, y)
  end
  
  def test_euclidean_distance
    x = [5.1,3.5,1.4,0.2]
    y = [5.1,3.5,1.4,0.2]
    assert_equal 0, Distance.euclidean(x, y)
  end
end
