class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery
  
  $states = [
      ["AR", "Arkansas"],
      ["AZ", "Arizona"],
      ["CA", "California"],
      ["CO", "Colorado"],
      ["CT", "Connecticut"],
      ["DC", "District of Columbia"],
      ["FL", "Florida"],
      ["GA", "Georgia"],
      ["IA", "Iowa"],
      ["IL", "Illinois"],
      ["IN", "Indiana"],
      ["KS", "Kansas"],
      ["KY", "Kentucky"],
      ["LA", "Louisiana"],
      ["MA", "Massachusetts"],
      ["MD", "Maryland"],
      ["MI", "Michigan"],
      ["MN", "Minnesota"],
      ["MO", "Missouri"],
      ["NE", "Nebraska"],
      ["NV", "Nevada"],
      ["NJ", "New Jersey"],
      ["NY", "New York"],
      ["NC", "North Carolina"],
      ["OH", "Ohio"],
      ["OK", "Oklahoma"],
      ["ON", "Ontario"],
      ["PA", "Pennsylvania"],
      ["QC", "Quebec"],
      ["SC", "South Carolina"],
      ["TX", "Texas"],
      ["UT", "Utah"],
      ["VA", "Virginia"],
      ["WA", "Washington"],
      ["WI", "Wisconsin"]
  ]
end