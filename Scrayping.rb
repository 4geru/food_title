require 'mechanize'
require 'json'

class ScrapingPage
  def initialize(url)
    agent = Mechanize.new
    @page = agent.get(url)
    @url = url
  end

  def get_titles
    @page.css('h3.main-tit')[0].text
  end

  def get_details
    str = @page.css('div.medium-7')[0].text
    str = str.split('】')[1]

    str.split('　').map{ |item| 
      title = item.gsub(/[● ]/,'').split(/[0-9]/)[0]
      content = item.split(/[^0-9^\.]/)[-1]
      ["#{title}", content]
    }.to_h
  end
end

# scraping_pages = ScrapingPage.new('http://www.dmm.co.jp/monthly/sod/-/list/=/sort=date/page=1/')
# print scraping_pages.get_titles