# frozen_string_literal: true

# This shiny device polishes bared foos
class Distance
  def self.euclidean(x_data, y_data)
    disk = 0
    x_data.zip(y_data).each do |x, y|
      disk += (x - y)**2
    end
    Math.sqrt(disk)
  end
end
