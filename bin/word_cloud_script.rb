require 'json'
require_relative '../lib/word_cloud'

quotes = File.read('../data/quotes.json')
parsed_quotes = JSON.parse(quotes)

word_cloud = WordCloud.new(parsed_quotes)
p word_cloud.parse

