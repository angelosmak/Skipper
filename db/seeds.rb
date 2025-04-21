# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Create 5 sample skippers with different attributes
5.times do |i|
  skipper = Skipper.create!(
    name: "Skipper #{i + 1}",
    bio: "Experienced skipper with a passion for the sea. Skipper #{i + 1} has sailed across many oceans.",
    phone: "+30 69#{rand(1000..9999)}#{rand(1000..9999)}",
    email: "skipper#{i + 1}@example.com"
  )

  if Rails.env.development? || Rails.env.test?
    # Video
    # video_path = Rails.root.join('app', 'assets', 'images', 'video.mp4')
    # skipper.video.attach(io: File.open(video_path), filename: "video.mp4", content_type: 'video/mp4')

    # CV
    cv_path = Rails.root.join('app', 'assets', 'documents', 'sample_cv.pdf')
    skipper.cv.attach(io: File.open(cv_path), filename: "cv_#{i + 1}.pdf", content_type: 'application/pdf')

    # Docs
    doc_path = Rails.root.join('app', 'assets', 'documents', 'sample_document.pdf')
    skipper.docs.attach(io: File.open(doc_path), filename: "document_#{i + 1}.pdf", content_type: 'application/pdf')

    # Photo
    image_path = Rails.root.join('app', 'assets', 'images', "#{i + 1}.jpg")
    skipper.photo.attach(io: File.open(image_path), filename: "#{i + 1}.jpg", content_type: 'image/jpeg')
  end

  puts "✅ Created Skipper #{i + 1}"
end

puts "🎉 Seeded skippers with all attachments!"
