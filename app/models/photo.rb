class Photo < ApplicationRecord
    mount_uploader :image, FileUploader
end
