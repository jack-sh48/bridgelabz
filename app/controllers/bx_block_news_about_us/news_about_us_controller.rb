module BxBlockNewsAboutUs
  class NewsAboutUsController < ApplicationController

    def index
      all_news = NewsAbout.all
      render json: BxBlockNewsAboutUs::NewsAboutUsSerializer.new(all_news, params: {url: request.base_url})
    end

    def create
      @news_about = NewsAbout.new(news_about_params)
      if @news_about.save
        render json: {id: @news_about.id,title: @news_about.title, sub_title: @news_about.sub_title, image: request.base_url+ Rails.application.routes.url_helpers.rails_blob_path(@news_about.image, only_path: true), link: @news_about.link, content: @news_about.content, description: @news_about.description}
      else
        render json: {
            errors: [{
              error: "NewsAbout Not created!",
            }]
          }, status: :unprocessable_entity
       end
    end

    def update
      @news_about =  NewsAbout.find_by(id: params[:id])
      if @news_about&.update(news_about_params)
         render json: BxBlockNewsAboutUs::NewsAboutUsSerializer.new(@news_about, params: {url: request.base_url})
      else
       render json: {
            errors: [{
              error: "News About us Not updated!",
            }]
          }, status: :unprocessable_entity
       end
    end

    def show
      @news_about =  NewsAbout.find(params[:id])
        render json: {id: @news_about.id, title: @news_about.title, sub_title: @news_about.sub_title, image: request.base_url+ Rails.application.routes.url_helpers.rails_blob_path(@news_about.image, only_path: true), link: @news_about.link,
          content: @news_about.content, description: @news_about.description}
    end

    def destroy
       @news_about =  NewsAbout.find(params[:id])
       if @news_about.destroy
         render json: {message: " NewsAboutUs deleted!"}
       end
    end

    private

    def news_about_params
       params.require(:news_about_us).permit(:title, :sub_title, :link, :description, :image, :content)
    end
  end
end
