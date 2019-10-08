class Book
  attr_accessor :author, :page_count
  attr_reader :title, :gener
  GENRES = []
  def initialize(title)
    @title = title
  end
def genre=(gener)
  @genre = gener
  GENRES << @genre
end
  def turn_page
    puts "Flipping the page...wow, you read fast!"
  end

end