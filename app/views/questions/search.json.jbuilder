
json.questions @questions
json.profiles @profiles do |p|
  json.id         p.id
  json.profiler_id p.profiler_id
  json.profilee_id p.profilee_id
  json.avatar_remote_url p.user.avatar_remote_url
  json.avatar_url p.user.avatar.url
end
