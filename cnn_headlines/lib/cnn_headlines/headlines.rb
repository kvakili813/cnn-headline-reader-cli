class CNNHeadlines::Headlines
  attr_accessor :title, :url

  @@headlines = []

  def self.headlines(topic_url)
    self.headline_scrape(topic_url)
  end

  def self.headline_scrape(division_url)
    doc = Nokogiri::HTML(open(division_url))
    @@headlines.clear
    doc.css("article.cd.cd--card.cd--article.cd--idx-1.cd--extra-small.cd--has-siblings.cd--media__image li").each do |article|
      headline = self.new
      headline.title = article.css("div.cd__content h3.cd__headline")
      headline.url = article.css("div.cd__content h3 a").attribute("href").value
      @@headlines << headline
    end
      @@headlines
  end
end
