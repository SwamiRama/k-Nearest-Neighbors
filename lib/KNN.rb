# frozen_string_literal: true

require_relative 'KNN/version'
require_relative 'KNN/data_reader'
require_relative 'KNN/k_nearest_neighbor'

# KNN
module KNN
  output_file = 'data/file.csv'
  train_data = DataReader.new('data/iris_data.set.csv').data.freeze
  test_data = DataReader.new('data/test_data.set.csv').data.freeze
  CSV_HEADERS = ['Sepal lenght', 'Sepal width', 'Petal lenght', 'Sepal width', 'Species'].freeze
  all = []

  test_data.each do |data|
    all << KNnearestNeighbor.new(train_data, data).find_nearest_neighbours
  end

  File.delete(output_file) if File.exist?(output_file)

  CSV.open(output_file, 'a+', write_headers: true, headers: CSV_HEADERS) do |csv|
    all.each_with_index do |data, i|
      csv << test_data[i] + ['orig']
      data.each do |row|
        csv << row
      end
      csv << ['-']
    end
  end

end
