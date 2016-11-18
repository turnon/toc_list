class TocList
  HashMethod = lambda do |item|
    item.gsub(/\s/, '_')
  end
end
