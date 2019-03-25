require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "movie attributes must not be empty" do
    movie= Movie.new
    assert movie.invalid?
    assert movie.errors[:image_url].any?
    assert movie.errors[:name].any?
    assert movie.errors[:year].any?
    assert movie.errors[:description].any?
    assert movie.errors[:price].any?
end
    test "price must be positive" do
        movie = Movie.new(image_url: "xxx.jpg",
                           name: "my movie name",
                           description: "xxx",
                           year: "yyy")
        movie.price = -1
        assert movie.invalid?
        assert_equal ["must be greater than or equal to 0.01"],
         movie.errors[:price]
         movie.price = 0
        assert movie.invalid?
        assert_equal ["must be greater than or equal to 0.01"],
         movie.errors[:price]
         movie.price = 1
        assert movie.valid?
       
end
    def new_movie(image_url)
        Movie.new(image_url: image_url,
                   name: "my movie name",
                   description: "xxx",
                   year: "yyy",
                   price: 1)
end
    test "image url" do
        ok=%w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
            http://a.b.c/x/y/z/fred.gif}
        bad=%w{ fred.doc fred.gif/more fred.gif.more}
        ok.each do |image_url|
            assert new_movie(image_url).valid?,
            "#{image_url} shouldn't be invalid"
        end
        bad.each do |image_url|
            assert new_movie(image_url).invalid?,
            "#{image_url} shouldn't be valid"
        end
    end
end