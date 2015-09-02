class Keyword
  define_method(:scraper) do |user_id|
    require 'rubygems'
    require 'mechanize'
    require 'pry-byebug'
    require 'nokogiri'
    require 'csv'

    keyword = self

    scraper = Mechanize.new

    scraper.history_added = Proc.new { sleep 0.5 }
    BASE_URL = 'http://portland.craigslist.org'
    ADDRESS = 'https://portland.craigslist.org/search/mis'
    results = []
    results << ['URL']

    scraper.get(ADDRESS) do |search_page|
      # work with the form
      form = search_page.form_with(:id => 'searchform') do |search|
        search.query = keyword
      end
      result_page = form.submit

      # get the results
      raw_results = result_page.search('p.row')

      #parse the results
      raw_results.each do |result|
        link = result.css('a')[1]

        name = link.text.strip
        url = "http://portland.craigslist.org" + link.attributes["href"].value

        #save the results
        results << [url]
      end
    end

    results.each do |url|
      # untested
      Post.create({:keyword_id => keyword.id(), :user_id => user_id, :url => url})
    end

    # CSV.open("filename_#{keyword}.csv", "w+") do |csv_file|
    #     results.each do |row|
    #         csv_file << row
    #     end
    # end
  end
end
