# frozen_string_literal: true

require_relative 'distance'

# KNnearestNeighbor
class KNnearestNeighbor
  attr_reader :train_data, :test_data, :k
  def initialize(train_data, test_data, k=3)
    @train_data = train_data
    @test_data = test_data
    @k = k
  end

  def find_nearest_neighbours
    distances = []
    train_data.each do |data|
      distances.push data + [Distance.euclidean(data.first(4), @test_data.first(4))]
    end
    first_k_entries_sorted(distances, @k)
  end

  private

  def first_k_entries_sorted(data, k)
    data.sort_by(&:last).first k
  end

end
