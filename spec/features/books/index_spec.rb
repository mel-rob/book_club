require 'rails_helper'

RSpec.describe "book index" do
  before(:each) do
    @book_1 = Book.create(title: "Pride & Prejudice", publication_year: "1813", pages: 432)
    @book_2 = Book.create(title: "Emma", publication_year: "1815", pages: 544)
    @book_4 = Book.create(title: "The Alchemist", publication_year: "1988", pages: 263)
    @book_5 = Book.create(title: "Tiny Pretty Things", publication_year: "2015", pages: 464)


    @author_1 = Author.create(name: "Jane Austen")
    @author_2 = Author.create(name: "Paulo Coelho")
    @author_3 = Author.create(name: "Sona Charaipotra")
    @author_4 = Author.create(name: "Dhonielle Clayton")

    @author_1.books << [@book_1, @book_2]
    @author_2.books << [@book_4]
    @author_3.books << [@book_5]
    @author_4.books << [@book_5]
  end

  it "shows all books in the system" do
    visit '/books'

    within "#book-#{@book_1.id}" do
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.pages)
      expect(page).to have_content(@book_1.publication_year)
      expect(page).to have_content(@author_1.name)
    end

    within "#book-#{@book_2.id}" do
      expect(page).to have_content(@book_2.title)
      expect(page).to have_content(@book_2.pages)
      expect(page).to have_content(@book_2.publication_year)
      expect(page).to have_content(@author_1.name)
    end

    within "#book-#{@book_5.id}" do
      expect(page).to have_content(@book_5.title)
      expect(page).to have_content(@book_5.pages)
      expect(page).to have_content(@book_5.publication_year)
      expect(page).to have_content(@author_3.name)
      expect(page).to have_content(@author_4.name)
    end
  end
end
