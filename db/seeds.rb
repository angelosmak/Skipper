require "open-uri"

cv_url = "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321004/cv.pdf"
doc_url = "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321004/doc.pdf"
video_url = "https://res.cloudinary.com/dhbrz1unb/video/upload/v1745246610/video.mp4"
image_urls = [
  "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321006/1.jpg",
  "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321005/2.jpg",
  "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321005/3.jpg",
  "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745322626/4.jpg",
  "https://res.cloudinary.com/dhbrz1unb/image/upload/v1745321004/5.jpg"
]

names = [ "Nikos Papadopoulos", "Spiros Fakiolas", "Kostas Vasilakis", "Dimitris Savvatis", "Giannis Karalis" ]
bios = [
  "Lover of the sea with 10+ years of sailing experience.",
  "Certified skipper and maritime safety instructor.",
  "Enjoys guiding unique island tours and coastal adventures.",
  "Dedicated to sustainable sailing and eco-tourism.",
  "A seasoned sailor passionate about Aegean voyages."
]


Skipper.destroy_all

5.times do |i|
  skipper = Skipper.create!(
    name: names[i],
    bio: bios[i],
    phone: "+30 69#{rand(1000..9999)}#{rand(1000..9999)}",
    email: "skipper#{i + 1}@example.com"
  )

  # Attach CV
  cv_file = URI.open(cv_url)
  skipper.cv.attach(io: cv_file, filename: "cv.pdf", content_type: "application/pdf")

  doc_file = URI.open(doc_url)
  skipper.docs.attach(io: doc_file, filename: "doc.pdf", content_type: "application/pdf")

  # Attach video
  video_file = URI.open(video_url)
  skipper.video.attach(io: video_file, filename: "video.mp4", content_type: "video/mp4")

  # Attach image
  image_file = URI.open(image_urls[i])
  skipper.photo.attach(io: image_file, filename: "skipper_#{i + 1}.jpg", content_type: "image/jpeg")
end

puts "✅ Seeded 5 skippers with Cloudinary assets!"
