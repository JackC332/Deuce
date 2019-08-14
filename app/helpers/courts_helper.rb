module CourtsHelper
    def google_api 
        query = "tennis"
        key = ENV["GOOGLE_KEY"]
        location = "51.513793,-0.169182"
        radius = 1000
        url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{query}&key=#{key}&location=#{location}&radius=#{radius}"
        response = RestClient.get(url)
        parsed = JSON.parse(response)["results"]
    end
end

