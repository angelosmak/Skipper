# require "open-uri"

# cv_url = "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321004/cv.pdf"
# doc_url = "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321004/doc.pdf"
# video_url = "https://res.cloudinary.com/dhbrz1unb/video/upload/v1745246610/video.mp4"
# image_urls = [
#   "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321006/1.jpg",
#   "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321005/2.jpg",
#   "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321005/3.jpg",
#   "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745322626/4.jpg",
#   "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321004/5.jpg"
# ]

# names = [ "Nikos Papadopoulos", "Spiros Fakiolas", "Kostas Vasilakis", "Dimitris Savvatis", "Giannis Karalis" ]
# bios = [
#   "Lover of the sea with 10+ years of sailing experience.",
#   "Certified skipper and maritime safety instructor.",
#   "Enjoys guiding unique island tours and coastal adventures.",
#   "Dedicated to sustainable sailing and eco-tourism.",
#   "A seasoned sailor passionate about Aegean voyages."
# ]


# Skipper.destroy_all

# 5.times do |i|
#   skipper = Skipper.create!(
#     name: names[i],
#     bio: bios[i],
#     phone: "+30 69#{rand(1000..9999)}#{rand(1000..9999)}",
#     email: "skipper#{i + 1}@example.com"
#   )

#   skipper.image_url = image_urls[i]
#   skipper.video_url = video_url
#   skipper.cv_url = cv_url
#   skipper.doc_url = doc_url

#   skipper.save!  # 💾 This saves the updated attributes
# end

# puts "✅ Seeded 5 skippers with Cloudinary assets!"

# Skipper.all.each do |skipper|
#   # Check if a user with the same email already exists
#   user = User.find_or_create_by(email: skipper.email) do |u|
#     u.password = "password"
#     u.role = "skipper"
#   end

#   # Link the user to the skipper
#   skipper.update!(user_id: user.id)
# end
# skipper_bios = {
#   1 => "Nikos has sailed the Mediterranean for over 15 years, mastering both tranquil and stormy seas. He specializes in luxury sailing tours and personalized experiences. His calm demeanor and rich storytelling make him a favorite among guests. Nikos believes every journey should be as memorable as the destination.",
#   2 => "Spiros is an expert navigator with a strong background in marine biology. He’s passionate about educating guests on ocean ecosystems during each sail. With his warm hospitality and adventurous spirit, he makes every trip enjoyable. Spiros is fluent in three languages and loves connecting with international travelers.",
#   3 => "Kostas grew up by the sea and began sailing competitively at a young age. He brings deep technical knowledge and a love for island hopping. Guests appreciate his humor and insider tips on hidden beaches. Yannis always ensures that safety and fun go hand-in-hand.",
#   4 => "Dimitris is known for his meticulous planning and exceptional communication. He crafts tailor-made voyages that cater to families and groups. With a background in event coordination, he adds a unique flair to every sailing adventure. Dimitri's patience and energy are especially appreciated by guests with kids.",
#   5 => "Yannis has been a skipper on over 200 voyages, ranging from regattas to private retreats. His expertise in sailing techniques and weather patterns is unmatched. When not at sea, he teaches sailing courses to aspiring skippers. Takis is passionate about sharing his love of the ocean with every guest."
# }

# skipper_bios.each do |id, bio|
#   skipper = Skipper.find_by(id: id)
#   if skipper
#     skipper.update!(bio: bio)
#     puts "Updated bio for Skipper ##{id}"
#   else
#     puts "Skipper ##{id} not found"
#   end
# end

skipper = Skipper.find(4)

# Example: Book every Saturday to Friday for two weeks starting April 6, 2025
2.times do |week_offset|
  start_date = Date.new(2025, 4, 5) + (week_offset * 7) # April 5 is a Saturday
  (start_date..start_date + 6).each do |date|
    Booking.create!(skipper: skipper, date: date)
  end
end
