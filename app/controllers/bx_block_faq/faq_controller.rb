module BxBlockFaq
  class FaqController < ApplicationController

    def index
      render json: Faq.all
    end

    def create
      @faq = Faq.new(faq_params)
      if @faq.save
        render json: @faq
      else
        render json: {
            errors: [{
              error: "FAQs Not created!",
            }]
          }, status: :unprocessable_entity
       end
    end

    def update
      @faq =  Faq.find(params[:id])
      if @faq.update(faq_params)
         render json: @faq
       end
    end

    def show
      @faq =  Faq.find(params[:id])
      render json: {id: @faq.id, question: @faq.question , description: @faq.description, content: @faq.content}
    end

    def destroy
      @faq =  Faq.find(params[:id])
       if @faq.destroy
         render json: {message: " FAQs deleted!"}
       end
    end

    private

    def faq_params
       params.require(:faq).permit(:question, :description, :content)
    end
  end
end
