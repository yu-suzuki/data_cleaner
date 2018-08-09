require 'natto'
require 'uri'
require 'nkf'

namespace :refresh_tweet do
  task task_model: :environment do
    stopword = get_stop_word('lib/tasks/stopword.dic')
    filename = 'lib/tasks/tweetfile.txt'
    File.open(filename, 'w') do |f|
      Tweet::TweetText.all.each do |t|
        words = clean_text(t.text, stopword)
        words.each do |w|
          f.print(w)
          f.print(' ')
        end
        f.print("\n")
      end
    end
  end

  def get_stop_word dic
    list = Array.new
    File.foreach(dic) do |f|
      list << f.chomp
    end
    list
  end

  def clean_text(text, stopwords)
    remove_mention!(text)
    text.delete!("\s")
    text.downcase!
    remove_uri!(text)
    full_to_half!(text)
    text = hankana_to_zenkana(text)
    remove_stopword!(text, stopwords)

    natto = Natto::MeCab.new

    words = Array.new


    natto.parse(text) do |n|
      features = n.feature.split(',')
      words << features[6] unless n.surface.empty? \
         || n.is_bos? || n.is_eos? || n.feature.start_with?('助詞') \
         || n.feature.start_with?('助動詞') || n.feature.start_with?('記号,空白') \
         || features[6].eql?('*')
    end
    words
  end

  def remove_mention!(text)
    text.gsub!(/@.+?\s/, '')
    text.gsub!(/#.+?\s/, '')
    text.gsub!(/&.+?;/, '')
  end

  def remove_uri!(text)
    URI.extract(text).uniq.each do |u|
      text.gsub!(u, '')
    end
  end

  def remove_stopword!(text, stopwords)
    stopwords.each do |s|
      text.gsub!(s, '')
    end
  end

  def full_to_half!(str)
    str = str.tr('０-９ａ-ｚＡ-Ｚ①-㊿', '0-9a-zA-Z1-50')
  end

  def hankana_to_zenkana(s)
    NKF::nkf('-WwXm0Z0', s)
  end
end
