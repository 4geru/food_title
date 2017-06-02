require 'mechanize'
require 'json'

class ScrapingPage
  def initialize(url)
    @agent = Mechanize.new
    @url = url
  end

  def get_titles
    agent = Mechanize.new
    page = agent.get(@url)
    page.css('h3.main-tit')[0].text
  end
end

# scraping_pages = ScrapingPage.new('http://www.dmm.co.jp/monthly/sod/-/list/=/sort=date/page=1/')
# print scraping_pages.get_titles