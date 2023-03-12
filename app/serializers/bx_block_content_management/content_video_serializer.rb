module BxBlockContentManagement
  class ContentVideoSerializer < BuilderBase::BaseSerializer
    attributes :id, :name, :url, :account_id, :description, :thumbnails, :created_at, :updated_at
  end
end
