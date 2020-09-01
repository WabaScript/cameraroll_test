require "test_helper"

# Always check test config before designing all tests:
# describe Album do 
#     it "should fail" do
#         assert true == false
#     end
# end

describe Album do
    describe "validity" do
        let(:album) { Album.new }

        before do 
            album.valid?
        end

        it "requires a user_id" do
            album.errors[:user_id].must_include "can't be blank"
        end

        it "requires a name" do
            album.errors[:name].must_include "can't be blank"
        end

        it "requires name to be unique for same user" do
            existing_album = create(:album)
            album.name = existing_album.name
            album.user = existing_album.user
            album.valid?

            album.errors[:name].must_include "has already been taken"
        end

        it "requires at least one image" do
            album.errors[:images].must_include "album must have at least one image"
        end

        it "requires images in accepted format" do
            album.errors[:images].must_include "check format of upload"
        end

        it "requires privacy setting" do
            album.errors[:privacy].must_include "can't be blank"
        end
    end
end