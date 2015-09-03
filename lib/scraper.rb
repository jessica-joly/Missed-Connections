class Keyword
  define_method(:scraper) do |user_id|
    require 'rubygems'
    require 'mechanize'
    require 'pry-byebug'
    require 'nokogiri'

    keyword = self.keyword()
    scraper = Mechanize.new

    scraper.history_added = Proc.new { sleep 0.5 }
    BASE_URL = 'http://portland.craigslist.org'
    ADDRESS = 'https://portland.craigslist.org/search/mis'
    results = []
    # results << ['URL']

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
        title = link.text.strip
        url = "http://portland.craigslist.org" + link.attributes["href"].value

        #save the results
        results << [url, title]
      end
    end

    # all of the above again
    results.each() do |result|
      scraper.history_added = Proc.new { sleep 0.5 }
      ADDRESS = result[0]
      # Address may be a problem
      begin
        scraper.get(ADDRESS) do |page|
          # section may be a problem
          raw_results = page.search('section.userbody')
          #parse the results
          raw_results.each do |result|
            # section may be a problem
            body_raw = result.css('section')
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
    # untested
      if post.any?()
        Post.find_or_create_by({:keyword_id => self.id(), :user_id => user_id, :url => post[0], :title => post[1], :body => post[2]})
      end
    end

  end
end
