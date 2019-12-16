@book_1 = Book.create(title: "Pride & Prejudice", publication_year: "1813", pages: 432)
@book_2 = Book.create(title: "Emma", publication_year: "1815", pages: 544)
@book_3 = Book.create(title: "Sense & Sensibility", publication_year: "1811", pages: 352)
@book_4 = Book.create(title: "The Alchemist", publication_year: "1988", pages: 263)
@book_5 = Book.create(title: "Tiny Pretty Things", publication_year: "2015", pages: 464)

@author_1 = Author.create(name: "Jane Austen")
@author_2 = Author.create(name: "Paulo Coelho")
@author_3 = Author.create(name: "Sona Charaipotra")
@author_4 = Author.create(name: "Dhonielle Clayton")

@author_1.books << [@book_1, @book_2, @book_3]
@author_2.books << [@book_4]
@author_3.books << [@book_5]
@author_4.books << [@book_5]
