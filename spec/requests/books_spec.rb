require "rails_helper"

RSpec.describe "Books", type: :request do
    describe "POST /books" do
        it "creates a book successfully" do
            # send a request to /books and verofythat database contains it
            expect { # this inner section got autofilled by vsCode, if not working properly check this
                post "/books", params: { book: { title: "Name testing book" } }
            }.to change(Book, :count).by(1)

            expect(response).to redirect_to(book_path(Book.last))
            expect(flash[:notice]).to eq("Book was successfully created.")
        end

        it "does not create a book without a title" do
            # tests empty title section (rainy day scenario)
            expect {
                post books_path, params: {
                    book: {
                        title: ""
                    }
                }
            }.not_to change(Book, :count)

            expect(response).to have_http_status(:unprocessable_content)
        end

        it "creates a book with an author" do
            expect {
                post books_path, params: {
                    book: {
                        title: "Name testing book",
                        author: "Author Name"
                    }
                }
            }.to change(Book, :count).by(1)

            expect(response).to redirect_to(book_path(Book.last))
        end

        it "creates a book with a price" do
            expect {
                post books_path, params: {
                    book: {
                        title: "Name testing book",
                        price: 19.99
                    }
                }
            }.to change(Book, :count).by(1)

            expect(response).to redirect_to(book_path(Book.last))
        end

        it "creates a book with a published date" do
            published_date = Date.new(2026, 9, 14)
            expect {
                post books_path, params: {
                    book: {
                        title: "Name testing book",
                        published_date: published_date
                    }
                }
            }.to change(Book, :count).by(1)

            expect(response).to redirect_to(book_path(Book.last))
        end
    end
end
