class Theatre < ActiveRecord::Base
  has_many :movie_shows
  
  def self.find_or_create(options = {})
    Theatre.find_by_name_and_unit_number(options[:name], options[:unit_number]) || Theatre.new(options)
  end
end
