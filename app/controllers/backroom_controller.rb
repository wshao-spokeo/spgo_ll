class BackroomController < ApplicationController
  def search
    # params is input from the front end
    # out_hash is JSON formatted search result
    out_hash = Hash.new
    params.each do |k,v|
      out_hash[k] = v.upcase
    end
    render plain: JSON.generate(out_hash)
  end
end
