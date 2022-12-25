# frozen_string_literal: true

require 'net/https'
  require 'net/http'
  require 'uri'
  require 'json'

  def zoom
    api_key = ENV["ZOOM_API_KEY"]
    secret  = ENV["ZOOM_API_SECRET_KEY"]
    user_id = ENV["ZOOM_USER_ID"]
    jwt = ENV["ZOOM_JWT_TOKEN"]
    meeting_url = "https://api.zoom.us/v2/users/#{user_id}/meetings"

    uri = URI.parse(meeting_url)
    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(uri.path)
    req["Authorization"] = "Bearer #{jwt}"
    req["Content-Type"] = "application/json"
        req.body = {
            "type":1,
        }.to_json
    res = http.request(req)
    parseURL = JSON.parse(res.body)
    url = parseURL["join_url"]
  end
