module BxBlockBanners
  class BannersController < ApplicationController

    def index
        all_banners = Banner.all
        render json: BxBlockBanners::BannerSerializer.new(all_banners, params: {url: request.base_url})
    end

    def create
      @banner = BxBlockBanners::Banner.new(banner_params)
      if @banner.save
        render json: BxBlockBanners::BannerSerializer.new(@banner, params: {url: request.base_url})
      else
        render json: {
            errors: [{
              error: "Banner Not created!",
            }]
          }, status: :unprocessable_entity
       end
    end

    def update
      @banner =  Banner.find_by(id: params[:id])
      if @banner&.update(banner_params)
          render json: BxBlockBanners::BannerSerializer.new(@banner, params: {url: request.base_url})
       else
         render json: {
              errors: [{
                error: "Banner Not updated!",
              }]
            }, status: :unprocessable_entity
      end
    end

    def show
      @banner =  Banner.find_by(id: params[:id])
      unless @banner.nil?
        render json: BxBlockBanners::BannerSerializer.new(@banner, params: {url: request.base_url})
      else
        render json: {errors: [{message: "No record found"}]}, status: 404
      end
    end

    def destroy
      @banner =  Banner.find(params[:id])
       if @banner.destroy
         render json: {message: " Banner deleted!"}
       end
    end

    private

    def banner_params
       params.require(:banners).permit(:alignment, :border, :border_colour, :border_width, :background_colour, :background_image, :position, :banner_title, :banner_description, :submit_button_text, :border_redius, :logo_image)
    end
  end
end
