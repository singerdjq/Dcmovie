require 'csv'
namespace :pictures_list do
  desc "TODO"
  task load_pictures: :environment do
  
  Picture.destroy_all
  	CSV.foreach("lib/assets/csv/pictures.csv", :headers =>true) do |row |
  		puts row.inspect
  		Picture.create(name:row[0],year:row[1],nominations:row[2],rating:row[3],genre1:row[4],genre2:row[5],release:row[6])
        end
        
  end

end