require 'selenium-webdriver'
require 'csv'
require 'nokogiri'

main_link = 'https://www.upwork.com/resources/top-sites-for-online-education-and-learning'
write_data = []

driver = Selenium::WebDriver.for :chrome
driver.get main_link

doc = Nokogiri::HTML(driver.page_source)

doc.css('ol[role="list"] li a').each_with_index do |element, i|
  link_text = element.text.strip
  link_text_id = "##{i + 1}-#{element.text.strip.downcase.gsub(' ', '-')}"

  element_with_id = doc.css("#{link_text_id}")

  image_element = element_with_id.css('img').first

  image_src = image_element ? image_element['src'] : nil

  text_content = element_with_id.css('p').text.strip

  write_data << [i + 1, link_text, image_src, text_content]

end

driver.quit

CSV.open("myfile.csv", "w") do |csv|
  csv << ["ID", "Name", "Image Src", "Text Content"]
  write_data.each do |data|
    csv << data
  end
end
