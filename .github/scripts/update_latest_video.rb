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
hp_channel_id = ENV['HP_CHANNEL_ID']
kb_channel_id = ENV['KB_CHANNEL_ID']

puts "API Key: #{api_key}"

# Read existing content of the file
existing_content = {}
if File.exist?('_data/latest_video.json')
  existing_content = JSON.parse(File.read('_data/latest_video.json'))
end

# Fetch latest video for Harcipan
latest_video_id_hp = get_latest_video_id(api_key, hp_channel_id)

if latest_video_id_hp
  latest_video_url_hp = "https://www.youtube.com/watch?v=#{latest_video_id_hp}"

  # Update the existing content with new information
  existing_content['hp_id'] = latest_video_id_hp

  # Write the updated content back to the file
  File.write('_data/latest_video.json', existing_content.to_json)
  puts "Updated latest video for Harcipan id: #{latest_video_url_hp}"
else
  puts "No videos found for Harcipan."
end

# Fetch latest video for Kriszbubu
latest_video_id_kb = get_latest_video_id(api_key, kb_channel_id)

if latest_video_id_kb
  latest_video_url_kb = "https://www.youtube.com/watch?v=#{latest_video_id_kb}"

  # Update the existing content with new information
  existing_content['kb_id'] = latest_video_id_kb

  # Write the updated content back to the file
  File.write('_data/latest_video.json', existing_content.to_json)
  puts "Updated latest video for Kriszbubu id: #{latest_video_url_kb}"
else
  puts "No videos found for Kriszbubu."
end
