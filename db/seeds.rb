# 清空旧数据
Review.destroy_all
Categorization.destroy_all
Book.destroy_all
Category.destroy_all
User.destroy_all

# 用户
user = User.create(username: "test", password: "123456")

# 分类（更真实）
fantasy = Category.create(name: "Fantasy")
scifi = Category.create(name: "Sci-Fi")
classic = Category.create(name: "Classic")
mystery = Category.create(name: "Mystery")
romance = Category.create(name: "Romance")
horror = Category.create(name: "Horror")
adventure = Category.create(name: "Adventure")
history = Category.create(name: "History")
philosophy = Category.create(name: "Philosophy")
drama = Category.create(name: "Drama")
thriller = Category.create(name: "Thriller")

# 书籍（真实 + 合理分类）
books = []

def create_book(title, author, categories)
  book = Book.create(title: title, author: author)
  categories.each do |cat|
    Categorization.create(book: book, category: cat)
  end
  book
end

# J.K. Rowling
books << create_book("Harry Potter and the Sorcerer's Stone", "J.K. Rowling", [fantasy, adventure])
books << create_book("Harry Potter and the Chamber of Secrets", "J.K. Rowling", [fantasy, adventure])
books << create_book("Harry Potter and the Prisoner of Azkaban", "J.K. Rowling", [fantasy, mystery])

# George Orwell
books << create_book("1984", "George Orwell", [scifi, classic, philosophy])
books << create_book("Animal Farm", "George Orwell", [classic, philosophy])

# Jane Austen
books << create_book("Pride and Prejudice", "Jane Austen", [romance, classic])
books << create_book("Emma", "Jane Austen", [romance, classic, drama])

# Tolkien
books << create_book("The Hobbit", "J.R.R. Tolkien", [fantasy, adventure])
books << create_book("The Lord of the Rings", "J.R.R. Tolkien", [fantasy, adventure])
books << create_book("The Silmarillion", "J.R.R. Tolkien", [fantasy, history])

# Dan Brown
books << create_book("The Da Vinci Code", "Dan Brown", [mystery, thriller])
books << create_book("Angels & Demons", "Dan Brown", [mystery, thriller])
books << create_book("Inferno", "Dan Brown", [mystery, history])

# 经典文学
books << create_book("The Great Gatsby", "F. Scott Fitzgerald", [classic, drama])
books << create_book("To Kill a Mockingbird", "Harper Lee", [classic, drama])
books << create_book("The Catcher in the Rye", "J.D. Salinger", [classic, drama])

# 哥特 / 恐怖
books << create_book("Dracula", "Bram Stoker", [horror, classic])
books << create_book("Frankenstein", "Mary Shelley", [horror, scifi, classic])

# 俄国文学
books << create_book("War and Peace", "Leo Tolstoy", [history, classic])
books << create_book("Crime and Punishment", "Fyodor Dostoevsky", [philosophy, classic, drama])

# 海洋文学
books << create_book("Moby Dick", "Herman Melville", [adventure, classic])

# 加一些评论（更真实）
books.sample(10).each do |book|
  Review.create(
    content: "A very meaningful and well-written book.",
    rating: rand(4..5),
    user: user,
    book: book
  )
end

puts "Realistic seed data created!"