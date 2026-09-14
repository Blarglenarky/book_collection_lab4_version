require "rails_helper"

RSpec.describe "Books", type: :request do
    describe "POST /books" do
        it "creates a book successfully" do
            expect { #this inner section got autofilled by vsCode, if not working properly check this
                post "/books", params: { book: { title: "Name testing book" } }
            }.to change(Book, :count).by(1)

            expect(response).to redirect_to(book_path(Book.last))
            expect(flash[:notice]).to eq("Book was successfully created.")

        end
        
        it "does not create a book without a title" do
            expect {
                post books_path, params: {
                    book: {
                        title: ""
                    }
                }
            }.not_to change(Book, :count)

            expect(response).to have_http_status(:unprocessable_content)
        end
    end
end