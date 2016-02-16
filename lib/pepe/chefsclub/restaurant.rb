class Pepe::Chefsclub::Restaurant < Pepe::Chefsclub
  def answer
    @restaurants = get_restaurant
    restaurant = @restaurants["hits"][random_restaurant]
    if restaurant
      restaurant["_source"]["name"]
    else
      "descuple não consegui encontrar"
    end
  end

  private

    def translate_neighborhood_slang(slang)
      neighborhood_slang = Chefsclub::NeighborhoodSlang.where("slang ILIKE '#{slang}'").last
      if neighborhood_slang
        neighborhood_slang.translated
      else
        slang
      end
    end

    def translate_cuisine_slang(slang)
      cuisine_slang = Chefsclub::CuisineSlang.where("slang ILIKE '#{slang}'").last
      if cuisine_slang
        cuisine_slang.translated
      else
        slang
      end
    end

    def random_restaurant
      rand(@restaurants["hits"].size - 1) 
    end

    def get_restaurant
      request_params = build_request
      puts request_params
      uri = URI(request_params)
      response = Net::HTTP.get(uri)
      JSON.parse response
    end
    
    def build_request
      "#{domain}#{endpoint}?#{build_params}"
    end

    def build_params
      processed_params = process_captures
      processed_params["city"] = default_city
      processed_params["neighborhood"] = translate_neighborhood_slang(processed_params["neighborhood"]) if processed_params["neighborhood"]
      processed_params["cuisines"] = translate_cuisine_slang(processed_params["cuisines"]) if processed_params["cuisines"]
      to_query(processed_params)
    end

    def endpoint
      "/api/v2/mobile/search"
    end

    def default_city
      "rio-de-janeiro"
    end
end