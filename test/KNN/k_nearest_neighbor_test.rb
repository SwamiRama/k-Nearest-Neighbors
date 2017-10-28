require "test_helper"
require_relative "../../lib/KNN/k_nearest_neighbor.rb"

class KNnearestNeighborTest < Minitest::Test
  def test_find_nearest_neighbours
    train_data = [
      [5.1,3.5,1.4,0.2,'Iris-setosa'],
      [5.2,3.7,1.2,0.1,'Iris-setosa'],
      [5.9,3.8,1.7,0.3,'Iris-setosa'],
      [7.0,3.2,4.7,1.4,'Iris-versicolor'],
      [6.3,3.3,6.0,2.5,'Iris-virginica']
    ]
    test_data = [5.1,3.5,1.4,0.2,'Iris-setosa']
    result = [
      [5.1, 3.5, 1.4, 0.2, "Iris-setosa", 0.0], 
      [5.2, 3.7, 1.2, 0.1, "Iris-setosa", 0.3162277660168382], 
      [5.9, 3.8, 1.7, 0.3, "Iris-setosa", 0.9110433579144304]
    ]
    k = 3
    result = 
    assert_equal result, KNnearestNeighbor.new(train_data, test_data, k).find_nearest_neighbours
  end

  def test_first_k_entries_sorted
    data = [
      [5.1,3.5,1.4,0.2,'Iris-setosa', 1],
      [5.2,3.7,1.2,0.1,'Iris-setosa', 2],
      [5.9,3.8,1.7,0.3,'Iris-setosa', 3],
      [7.0,3.2,4.7,1.4,'Iris-versicolor', 4],
      [6.3,3.3,6.0,2.5,'Iris-virginica', 10]
    ]
    k = 3
    result = [
      [5.1,3.5,1.4,0.2,'Iris-setosa', 1],
      [5.2,3.7,1.2,0.1,'Iris-setosa', 2],
      [5.9,3.8,1.7,0.3,'Iris-setosa', 3]
    ]
    calc = KNnearestNeighbor.new(1,2,3).send(:first_k_entries_sorted, data, k)
    assert_equal calc, result
  end

end
