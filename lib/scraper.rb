class Keyword
  define_method(:scraper) do |user_id|
    require 'rubygems'
    require 'mechanize'
    require 'pry-byebug'
    require 'nokogiri'

    keyword = self.keyword()
    scraper = Mechanize.new

    scraper.history_added = Proc.new { sleep 0.5 }
    base_url = 'http://portland.craigslist.org'
    address = 'https://portland.craigslist.org/search/mis'
    results = []
    # results << ['URL']

    scraper.get(address) do |search_page|
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
        title = link.text.strip
        url = "http://portland.craigslist.org" + link.attributes["href"].value

        #save the results
        results << [url, title]
      end
    end

    results.each() do |result|
      scraper.history_added = Proc.new { sleep 0.5 }
      address = result[0]
      begin
        scraper.get(address) do |page|
          raw_results = page.search('section.userbody')
          #parse the results
          raw_results.each do |post|
            body_raw = post.css('section#postingbody')[0]
            body = body_raw.text.strip
            #save the results
            result << body
          end
        end
      rescue Exception
        result.clear()
      end
    end

    results.each do |post|
      if post.any?()
        Post.find_or_create_by({:keyword_id => self.id(), :user_id => user_id, :url => post[0], :title => post[1], :body => post[2]})
      end
    end
  end
end
