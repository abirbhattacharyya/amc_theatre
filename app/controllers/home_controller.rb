class HomeController < ApplicationController
  def index
  end

  def states
#    if request.post?
    for state in $states
      #state = params[:ddl_states]
      #flash[:notice]="Please Select State" and return if state.blank?
      url = URI.parse("http://www.amctheatres.com/Home/GetTheatresByState")
      http = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Post.new(url.request_uri)
      # http://www.amctheatres.com/Home/GetTheatresByState?State=CA
      request.set_form_data(:State => state.first)

      response = http.request(request)
      theatres = JSON::parse(response.body).flatten
      for theatre in theatres
        new_theatre = Theatre.find_or_create({:name => theatre["TheatreName"], :unit_number => theatre["UnitNumber"]})
        new_theatre.address_line1 = theatre["AddressLine1"]
        new_theatre.address_line2 = theatre["AddressLine2"]
        new_theatre.city = theatre["City"]
        new_theatre.state = theatre["State"]
        new_theatre.zip = theatre["Zip"]
        new_theatre.web_url = theatre["WebsiteURL"]
        new_theatre.lat = theatre["Latitude"]
        new_theatre.lng = theatre["Longitude"]
        new_theatre.save
        #render :text => theatre.keys.inspect and return false
      end
    end
    flash[:notice] = "Successfully created..."
    redirect_to "/"
  end
  
  def shows
    for theatre in Theatre.all
      url = URI.parse("http://www.amctheatres.com/Home/GetShowtimes")
      http = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Post.new(url.request_uri)
      request.set_form_data(:businessDate => Date.today.to_date, :unitNumber => theatre.unit_number)

      response = http.request(request)
      begin
        movies = JSON::parse(response.body)
        for movie in movies
          for showtime in movie["Showtimes"]
            new_show = MovieShow.find_or_create({:name => showtime["Movie"]["MovieName"], :theatre_id => theatre.id, :show_time => showtime["DisplayShowTime"]})
            #new_show.show_time = showtime["DisplayShowTime"]
            new_show.web_url = showtime["Movie"]["WebsiteURL"]
            new_show.run_time = showtime["Movie"]["RunTime"]
            new_show.imax = showtime["Movie"]["IMAX"]
            new_show.etx = showtime["Movie"]['ETX']
            new_show.threeD = showtime["Movie"]["ThreeD"]
            new_show.save
          end
        end
      rescue => e
      end
    end
    flash[:notice] = "Successfully created..."
    redirect_to "/"
  end
  
  def download_csv
    csv_string = FasterCSV.generate do |csv|
      csv << ["Theatre Name", "Address Line1", "Address Line2", "City", "State", "Zip", "Theatre Url", "Movie Name", "Show Time", "Movie Url"]

      for state in $states
        theatres = Theatre.all(:include => [:movie_shows], :conditions => ["state=?", state.first])
        for theatre in theatres
          for show in theatre.movie_shows
            csv << [theatre.name, theatre.address_line1, theatre.address_line2, theatre.city, state.last, theatre.zip, theatre.web_url, show.name, show.show_time, show.web_url]
          end
        end
      end
    end

    filename = "amcthatres_movie_shows.csv"
    send_data(csv_string,
      :type => 'text/csv; charset=utf-8; header=present',
      :filename => filename)
  end
end
