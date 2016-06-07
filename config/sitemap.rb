host "mkdev.me"

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url films_url
  Film.where(send_new_film: false).each do |film|
    url film
  end
end

ping_with "http://#{host}/sitemap.xml"