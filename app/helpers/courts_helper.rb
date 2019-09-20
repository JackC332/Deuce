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

    def create_court(array)
        array.each do |court|
            if Court.exists?(name: court[:name])
                next
            else
                Court.create(name: court[:name], latitude: court[:lat], longitude: court[:long], rating: court[:rating], details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." )
            end
        end
    end
end

