class Book < ActiveRecord::Base
  has_attached_file :thumbnail, styles: { large: "650x650#", medium: "300x300#", thumb: "100x100#" },
    url: "/assets/books/:id/:style/:basename.:extension",
    path: ":rails_root/public/assets/books/:id/:style/:basename.:extension"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :thumbnail
  validates_attachment_size :thumbnail, less_than: 3.megabytes
  validates_attachment_content_type :thumbnail, content_type: ['image/jpeg', 'image/png']
end
