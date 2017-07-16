
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
	



#-------------------------------------------------------------------------------------Recupérérer l'email ----------------------------------------------------------------

doc = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/95/vaureal.html"))
output = File.new('get_the_email_of_a_townhal_from_its_webpage.txt', 'w+')
p22 = doc.css('p.Style22').text
email = p22.scan(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i) 
output.write(email)


#-------------------------------------------------------------------------------------Recupérérer les urls----------------------------------------------------------------

def adresse

doc1 = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
output1 = File.new('get_all_the_urls_of_val_doise_townhalls', 'w+')
#data = doc1.css('a.lientxt')
url = doc1.xpath('//table/tr[2]/td/table/tr/td/p/a')
#url = data.to_s.scan(/95([^.]*).html/)
url.each { |x| 
    url = "http://annuaire-des-mairies.com/95/"+ x + ".html"
    return url }
end
#On arrive pas à créer un tableau qui stoque l'url complète ...

#-------------------------------------------------------------------------------------modifier l'url---------------------------------------------------------------------
#il faudrais créer une boucle qui utilise l'url stocké dans le tableau qu'on arrive pas à créer
