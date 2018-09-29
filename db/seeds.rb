# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# user = User.new(:email => 'a@a', :password => '111111',:admin => true, :name =>  '管理者', :name_kana => 'かんりしゃ', :postal_code => 'a', :address => 'a', :tel =>'000000000')
# user.save!

artist = Artist.new(:name => 'B\'z', :name_kana => 'ビーズ')
genre = Genre.new(:name => 'Rock')
label = Label.new(:name => 'Being')

# TrackRelation = TrackRelation.new()

artist.save!
genre.save!
label.save!
