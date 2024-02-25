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
  write_data << [i + 1, link_text]
end

driver.quit

CSV.open("myfile.csv", "w") do |csv|
  csv << ["ID", "Name"]
  write_data.each do |data|
    csv << data
  end
end
