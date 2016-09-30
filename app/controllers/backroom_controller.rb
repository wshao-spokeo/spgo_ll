class BackroomController < ApplicationController
  def search
    # params is input from the front end
    # out_hash is JSON formatted search result
    out_hash = Hash.new
    out_hash[:radius] = params[:radius]
    out_hash[:pins] = [
      {id: 101, lat: 34.144239, lng: -118.143482, name: "Convention Center", desc: "Conference center"},
      {id: 102, lat: 34.161327, lng: -118.167648, name: "Rose Bowl", desc: "Famed stadium"},
      {id: 103, lat: 34.143933, lng: -118.119168, name: "Pasadena City College", desc: "Community college"},
      {id: 104, lat: 34.158283, lng: -118.082035, name: "Hastings Branch Library", desc: "Public library"},
      {id: 105, lat: 34.144749, lng: -118.150870, name: "85C Bakery Cafe", desc: "Famed Taiwanese bakery"}
    ]
    out_hash[:pins].each do |pin|
      pin[:samp] = [true, false].sample
    end
    render plain: JSON.generate(out_hash)
  end
  def seek
    render plain: JSON.generate(params)
  end

end
