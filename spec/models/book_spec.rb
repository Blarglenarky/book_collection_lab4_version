require "rails_helper"

RSpec.describe Book, type: :model do
    describe "validations" do
        it "is valid with a title" do
            book = Book.new(title: "Name testing book")
            expect(book).to be_valid
        end

        it "is invalid without a title" do
            book = Book.new(title: "")
            expect(book).to_not be_valid
        end
    end

    describe "author" do
        it "accepts an author" do
            book = Book.new(title: "Name testing book", author: "Author Name")
            expect(book).to be_valid
        end
    end

    describe "price" do
        it "accepts a price" do
            book = Book.new(title: "Name testing book", price: 19.99)
            expect(book).to be_valid
        end
    end

    describe "published date" do
        it "accepts a published date" do
            published_date = Date.new(2026, 9, 14)
            book = Book.new(title: "Name testing book", published_date: published_date)
            expect(book).to be_valid
        end
    end
end
