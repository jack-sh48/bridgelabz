module BxBlockStory
  class TestimonialSerializer < BuilderBase::BaseSerializer
    attributes :id, :name, :company_name, :position, :content, :video_url, :description, :link, :description, :created_at, :updated_at
  end
end