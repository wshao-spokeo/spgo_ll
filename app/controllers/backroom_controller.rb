class BackroomController < ApplicationController
  def search
    # params is input from the front end
    # out_hash is JSON formatted search result
    out_hash = Hash.new
    out_hash[:radius] = params[:radius]
    out_hash[:pins] = [
      {lat: 34.144239, lng: -118.143482, name: "Convention Center", desc: "Conference center"},
      {lat: 34.161327, lng: -118.167648, name: "Rose Bowl", desc: "Famed stadium"},
      {lat: 34.143933, lng: -118.119168, name: "Pasadena City College", desc: "Community college"},
      {lat: 34.158283, lng: -118.082035, name: "Hastings Branch Library", desc: "Public library"},
      {lat: 34.144749, lng: -118.150870, name: "85C Bakery Cafe", desc: "Famed Taiwanese bakery"}
    ]
    out_hash[:pins].each do |pin|
      pin[:samp] = [true, false].sample
    end
    render plain: JSON.generate(out_hash)
  end
end
