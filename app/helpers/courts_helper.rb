module CourtsHelper
    def google_api(location) 
        query = "tennis"
        key = ENV["GOOGLE_KEY"]
        location = location
        radius = 2000
        url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{query}&key=#{key}&location=#{location}&radius=#{radius}"
        response = RestClient.get(url)
        parsed = JSON.parse(response)["results"]
    end
end

