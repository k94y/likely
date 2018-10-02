# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# artist = Artist.new(:name => 'B\'z', :name_kana => 'ビーズ')
# genre = Genre.new(:name => 'Rock')
# label = Label.new(:name => 'Being')

# # TrackRelation = TrackRelation.new()

# artist.save!
# genre.save!
# label.save!

# user = User.new(:email => 'b@b', :password => '111111',:admin => false, :name =>  'test', :name_kana => 'テスト', :postal_code => 'a', :address => 'a', :tel =>'000000000')
# user.save!

cart_detail = CartDetail.new(:user_id => 1, :product_id => 1, :number => 1)
cart_detail.save!