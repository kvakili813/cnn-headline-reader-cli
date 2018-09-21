class CNNHeadlines::Topics

  attr_accessor :name, :url

    @@topics = []

    def self.topic
      doc = Nokogiri::HTML(open("https://www.cnn.com/"))

      doc.css("div.nav-menu-links").each do |div|
        topic = self.new
        topic.name = div.css("a").text
        topic.url = "https://www.cnn.com/#{div.css("a").attribute("href").value}"
        @@topics << topic
      end
      @@topics
    end

  end
