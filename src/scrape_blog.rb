#!/usr/bin/env ruby

require 'rubygems'
require 'hpricot'
require 'open-uri'

doc = open("http://fnord1.blog.ca/"){|f| Hpricot(f)}
posts = doc.search("//div[@class='post-inner']")
# posts.length
# posts[0].inner_html
# posts[0].inner_text

posts.each do |post|
    name = post.search("span[@class='name']").inner_text
    # posts.search("span[@class='name']") returns more elements

    date = post.search("//p[@class='post-info']/small/span/span[@class='date']").inner_text
    # post.search iteratively down the tree

    content = post.search("//div[@class='post-content-inner").inner_text
    # vs. inner_html -- lots of extra crud
    # vs .inner_text.strip
    # post.search("//div[@class='post-content-inner").xpath gives unique path

   # post/'div' == post.search("//div") not post.search("/div")

    puts "Name='#{name}', Date='#{date}', Content length='#{content.strip.split.length} words'"
end
