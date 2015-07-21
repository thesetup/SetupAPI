json.array! @profiles do |profile|
  json.id profile.id
  json.profiler_id profile.profiler_id
  json.profilee_id profile.profilee_id
  json.username profile.user.username
  json.avatar_url profile.user.avatar.url
end
