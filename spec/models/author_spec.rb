require 'rails_helper'

RSpec.describe Author, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :author_books}
    it {should have_many(:books).through(:author_books)}
  end

  describe "methods" do
    before(:each) do
      @book_1 = Book.create(title: "Pride & Prejudice", publication_year: "1813", pages: 432)
      @book_2 = Book.create(title: "Emma", publication_year: "1815", pages: 544)
      @book_3 = Book.create(title: "Sense & Sensibility", publication_year: "1811", pages: 352)

      @author_1 = Author.create(name: "Jane Austen")

      @author_1.books << [@book_1, @book_2, @book_3]
    end

    it "#average_pages" do
      expect(@author_1.average_pages.to_i).to eq(442)
    end
  end
end
