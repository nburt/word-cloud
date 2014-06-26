class WordCloud

  def initialize(input)
    @input = input
  end

  def parse
    parsed_words = {}
    @input.each do |speaker, words|
      array_of_words(words).flatten.each do |word|
        if parsed_words[word]
          parsed_words[word][:count] += 1
          parsed_words[word][:people] << speaker
          parsed_words[word][:people].uniq!
        else
          parsed_words[word] = {
            :count => 1,
            :people => [speaker]
          }
        end
      end
    end
    parsed_words
  end

  private

  def array_of_words(words)
    words.map do |string|
      string.downcase.split(' ')
    end
  end
end