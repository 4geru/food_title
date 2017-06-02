require './Scrayping'

url = 'https://www.u-coop.net/food/menu/hanshin/info.php'

while true
  scraping_pages = ScrapingPage.new(url)
  print "#{scraping_pages.get_titles}\n"
  print "#{scraping_pages.get_details}\n"
  sleep 1
end