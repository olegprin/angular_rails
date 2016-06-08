host "mkdev.me"

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  Film.where(send_new_film: false).find_each do |post|
    url film_path(post.slug),  last_mod: Time.now, change_freq: "daily", priority: 1.0
  end
end




ping_with "http://#{host}/sitemap.xml"