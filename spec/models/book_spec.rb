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
end