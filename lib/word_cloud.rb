class WordCloud

  def initialize(data)
    @data = data
  end

  def organize
    hash = {}
    @data.each do |name, lines|
      words = []
      lines.each do |line|
        words << line.split(" ")
      end
      words.flatten.each do |word|
        if hash.has_key?(word.downcase)
          hash[word.downcase][:count] += 1
          hash[word.downcase][:people] << name unless hash[word.downcase][:people].include?(name)
        else
          hash[word.downcase] = {
            count: 1,
            people: [name]
          }
        end
      end
    end
    hash
  end

end