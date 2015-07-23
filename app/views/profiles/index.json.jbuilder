json.profiles @profiles do |p|
  json.id p.id
  json.profiler_id p.profiler_id
  json.profilee_id p.profilee_id
  json.avatar_url p.user.avatar.url
end

json.questions @questions
json.videos @videos
json.users @users do |u|
  json.id u.id
  json.email u.email
  json.created_at u.created_at
  json.updated_at u.updated_at
  json.username u.username
  json.avatar_file_name u.avatar_file_name
  json.avatar_content_type u.avatar_content_type
  json.avatar_file_size u.avatar_file_size
  json.avatar_updated_at u.avatar_updated_at
  json.avatar_remote_url u.avatar_remote_url
end
