module Helpers
  def time_tag(date, format = '%Y-%m-%d')
    "<time datetime=\"#{date.xmlschema}\">#{date.strftime(format)}</time>"
  end

  def sorted_tags
    blog.tags.sort_by do |tag, articles|
      date = articles.sort_by { |a| a.date }.first.date
      [date, tag]
    end
  end
end
