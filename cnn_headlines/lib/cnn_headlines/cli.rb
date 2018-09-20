class CNNHeadlines::CLI

  def call
    puts "Extra! Extra! Read All About It!"
    topics
    list_headlines
    goodbye
  end

  def topics
    @topics = CNNHeadlines::Topics.topic
    topics_display
  end

  def topics_display
    @topics.each.with_index(1) do |topic, i|
      puts "#{i}. #{topic.name}"
    end
  end

  def topic_choice
    puts "Please choose one of the news topics by number, or type exit:"
    input = gets.strip
    if input == "exit"
      goodbye
    elsif !((1..@topics.count).include?(input.to_i))
      topic_choice
    else
      @topics.each.with_index do |topic, i|
        case input
          when  "#{i+1}"
            headlines(@topics[i].url)
          end
        end
      end
  end

  def headlines(topic_url)
    @headlines = CNNHeadlines::Topics.headlines(topic_url)
    @headlines.each.with_index(1) do |head, i|
      puts "#{i}. #{head.title}"
      puts "(#{head.url})"
      puts "\n"
    end
    more
  end

  def more
   puts "Type list to view the news topics again, or type exit."
   input = gets.strip

   if input == "exit"
     goodbye
   elsif input == "list"
     topics_display
     topic_choice
   else more
   end
 end

 def goodbye
   puts "Come back later for more headlines!"
   exit
 end

end
