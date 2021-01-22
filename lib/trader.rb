require 'nokogiri'
require 'open-uri'

PAGE_URL = 'https://coinmarketcap.com/all/views/all/'

page_coinmarket = Nokogiri::HTML(URI.open(PAGE_URL))





criptomonai_name = page_coinmarket.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol']/div").map {|name| "#{name.text}"}

criptomonai_price = page_coinmarket.xpath("//div[@class='price___3rj7O ']/a").map {|price|  "#{price.text}"}

name_price = Hash[criptomonai_name.zip(criptomonai_price)]
# puts criptomonai_name
# puts criptomonai_price

 name_price.each do |index| p [index].to_h
 end

