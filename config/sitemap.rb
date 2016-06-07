host "mkdev.me"

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url posts_url
  Post.all.each do |post|
    url post
  end
end

ping_with "http://#{host}/sitemap.xml"