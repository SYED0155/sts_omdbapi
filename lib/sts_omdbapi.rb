# frozen_string_literal: true

require_relative "sts_omdbapi/version"

module StsOmdbapi
  class Error < StandardError; end
  require "http"
  #OMDBAPI_URL  =  "https://www.omdbapi.com/?apikey=#{Rails.application.credentials[Rails.env.to_sym][:omdb_apikey]}"
  OMDBAPI_URL  =  "https://www.omdbapi.com/?apikey=e1fd6f14"
  def self.get_movie_data_using_imdb(movie_id,plot=nil)
    response = HTTP.get("#{OMDBAPI_URL}&i=#{movie_id}&plot=#{plot}")
    if response
      render json: {response:response, status: 200}
    else
      render json: {response:response, status: 404}
    end
  end

  def self.get_movie_data_using_movie_title(title,plot=nil)
    response = HTTP.get("#{OMDBAPI_URL}&t=#{title}&plot=#{plot}")
    if response
      render json: {response:response, status: 200}
    else
      render json: {response:response, status: 404}
    end
  end


  def self.get_movie_data_using_movie_type(title,type,plot=nil)
    if type.in?(["movie, series, episode"])
     response = HTTP.get("#{OMDBAPI_URL}&t=#{title}&type=#{type}&plot=#{plot}")
     render json: {response:response, status: 200}
    else
    render json: {response:response, status: 404}
    end
  end

  def self.get_movie_data_using_title_year_type_plot_params(title=nil,year=nil,type=nil,plot=nil)
    response = HTTP.get("#{OMDBAPI_URL}&=t=#{title}&y=#{year}&plot=#{plot}&type=#{type}")
    if response
      render json: {response:response, status: 200}
    else
      render json: {response:response, status: 404}
    end
  end

  def self.get_movie_data_using_movie_id_year_type_plot_params(movie_id=nil,year=nil,type=nil,plot=nil)
    response = HTTP.get("#{OMDBAPI_URL}&=i=#{movie_id}&y=#{year}&plot=#{plot}&type=#{type}")
    if response
      render json: {response:response, status: 200}
    else
      render json: {response:response, status: 404}
    end
  end
end
