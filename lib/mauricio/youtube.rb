class Mauricio::Youtube < Mauricio::Base
  
  def answer
    video = get_video
    video["content"] = video["snippet"]["title"]
    video["id"] = video["contentDetails"]["videoId"]
    video["partial"] = "youtube/video"
    video
  end

  private

    def get_video
      @playlist = get_playlist
      @playlist["items"][random_video]
    end  

    def random_video
      rand(@playlist["items"].size - 1)
    end
    
    def get_playlist
      uri = URI(api_uri)
      response = Net::HTTP.get(uri)
      JSON.parse response
    end

    def api_uri
      "https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails%2Csnippet&playlistId=PL6FTFljnXk5yvps-SjQV2IRyCGDXq5Epi&key=AIzaSyDJRNSaPqTxqnhMLnnQoAAxBDMXi77PBnM"
    end
end