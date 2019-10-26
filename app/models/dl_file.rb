class DlFile < ApplicationRecord
    mount_uploader :upload_filename, FileUploader
end
