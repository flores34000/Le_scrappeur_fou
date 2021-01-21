require 'nokogiri'
require 'open-uri'

PAGE_URL = 'http://annuaire-des-mairies.com/val-d-oise.html'

Annuaire_mairie = Nokogiri::HTML(URI.open(PAGE_URL))

def recup_nom_mairie()
    return Annuaire_mairie.xpath("//a[@class='lientxt']").map {|name| "#{name.text}: "}
end


def recup_mail_mairie()
    return Annuaire_mairie.xpath("//a[@class='lientxt']/@href").map {|mail| "#{mail.text}"}
end

mairie_mail = Hash[recup_nom_mairie.zip(recup_mail_mairie)]

mairie_mail.each do |index| p index.to_a
end



