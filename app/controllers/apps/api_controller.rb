class Apps::ApiController < ApplicationController
  require 'pp'
  require 'httparty'

    include HTTParty
    base_uri "https://api.coursera.org/api/catalog.v1/courses"


    def index
    @phone = Phone.last
    puts @phone.number
    puts @phone.vercode
    end
  end
