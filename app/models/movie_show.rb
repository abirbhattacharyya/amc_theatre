class MovieShow < ActiveRecord::Base
  belongs_to :theatre
  
  def self.find_or_create(options = {})
    MovieShow.find_by_name_and_theatre_id_and_show_time(options[:name], options[:theatre_id], options[:show_time]) || MovieShow.new(options)
  end
end
