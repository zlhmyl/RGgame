module MicropostsHelper
  def stop_words
    File.read('chinese_stop_words.txt').split.sort
  end

  def rm_symbol text
    out = text.downcase
    out = out.gsub(/<[^<>]+>/, ' ')
    out = out.gsub(/[0-9]+/, ' ')
    out = out.gsub(/(http|https):\/\/[^\s]*/, ' ')
  end

  def pre_content item
    title = rm_symbol item.title
    content = rm_symbol item.content
    contents = (title + ",") * 10 + "," + (content + ",") * 5
    return contents
  end

  def extract_tags micro_post
    keyword = JiebaRb::Keyword.new
    contents = pre_content micro_post
    keywords_weights = keyword.extract contents, 5
    keywords = keywords_weights.map!{|word| word.first}
    keywords.each do |word|
      if stop_words.include?(word)
        keywords = keywords.delete(word)
      end
    end
    if keywords.length >= 3
      return keywords.first(3).join(" | ")
    else
      return keywords.join(" | ")
    end
  end
end
