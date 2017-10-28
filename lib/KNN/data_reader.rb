# frozen_string_literal: true

require 'csv'

# DataReader
class DataReader
  attr_reader :file_path
  def initialize(file_path)
    @file_path = file_path.to_s
  end

  def data
    CSV.read(@file_path, converters: :all).to_a.drop(1)
  end

end
