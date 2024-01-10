require 'rest-client'
require 'json'

def get_latest_video_id(api_key, channel_id)
  url = "https://www.googleapis.com/youtube/v3/search?key=#{api_key}&channelId=#{channel_id}&part=snippet&order=date&maxResults=1"
  response = RestClient.get(url)
  data = JSON.parse(response.body)

  if data['items'] && data['items'].any?
    return data['items'][0]['id']['videoId']
  else
    return nil
  end
end

api_key = ENV['YOUTUBE_API_KEY']
channel_id = ENV['CHANNEL_ID']

latest_video_id = get_latest_video_id(api_key, channel_id)

if latest_video_id
  latest_video_url = "https://www.youtube.com/watch?v=#{latest_video_id}"
  File.write('_data/latest_video.json', { 'url' => latest_video_url }.to_json)
  puts "Updated latest video URL: #{latest_video_url}"
else
  puts "No videos found."
end
