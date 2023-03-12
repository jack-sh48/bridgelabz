require 'rails_helper'
RSpec.describe BxBlockForms::FormsController, type: :request do

  before :each do
     @file = fixture_file_upload('Screenshot from 2022-11-29 13-15-30.png')
  end

  before :each do
     @url = "/bx_block_forms/forms"
  end

  let (:create_form){
    {
      "forms":  { "page_title": "test", "page_description": "this last", "submit_button_text": "save" , "field_name": "text", "field_description": "lsksk", "field_type": "integer", "background_colour": "black" , "border_redius": "round", "border_width":  12.33, "border_colour": "red", "border": "thin", "alignment": "left","image": @file,}
    }
  }

  let (:error_form){
    {
      "forms": {"page_description": "this last", "submit_button_text": "save" , "field_name": "text", "field_description": "lsksk", "field_type": "integer", "background_colour": "black" , "border_redius": "round", "border_width":  12.33, "border_colour": "red", "border": "thin", "alignment": "left"}
    }
  }

  let (:update_form){
    {
      'id': 1,
      "forms": { "page_title": "test", "page_description": "this last", "submit_button_text": "save" , "field_name": "text", "field_description": "lsksk", "field_type": "integer", "background_colour": "black" , "border_redius": "round", "border_width":  12.33, "border_colour": "red", "border": "thin", "alignment": "left"}
    }
  }

  describe "GET index" do
    it "renders the index template" do
      get @url, params: create_form
      expect(response).to have_http_status 200
    end
  end

 describe 'Create Form' do
    it 'should create Form' do
      post @url, params: create_form
      expect(response).to have_http_status 200
    end

    it 'Should Not Create ' do
       post @url, params: error_form
       expect(response).to have_http_status 422
    end
 end

 describe 'Update Form' do
  before do
      @form = BxBlockForms::Form.find_by(id: 1)
      unless @form
        @form = BxBlockForms::Form.create( id: 1, page_title: "test", page_description: "this last", submit_button_text: "save" , field_name: "text", field_description: "lsksk", field_type: "integer", background_colour: "black" , border_redius: "round", border_width:  12.33, border_colour: "red", border: "thin", alignment: "left")
      end
      @form.image=@file
      @form.save
      @form
    end
    it 'should update Form' do
       put "/bx_block_forms/forms/1", params: update_form
       expect(response).to have_http_status 200
    end

    it 'should not update Form' do
       put "/bx_block_forms/forms/3", params: update_form
       expect(response).to have_http_status 422
    end
 end

 describe 'Destroy Form' do
    before do
      @form = BxBlockForms::Form.find_by(id: 1)
      unless @form
        @form = BxBlockForms::Form.create( id: 1, page_title: "test", page_description: "this last", submit_button_text: "save" , field_name: "text", field_description: "lsksk", field_type: "integer", background_colour: "black" , border_redius: "round", border_width:  12.33, border_colour: "red", border: "thin", alignment: "left")
      end
      @form.image=@file
      @form.save
      @form
    end
    it 'should delete Form' do
       delete "/bx_block_forms/forms/1"
       expect(response).to have_http_status 200
    end
 end

 describe 'Show method' do
   it "should show form" do
     get "/bx_block_forms/forms", params: update_form[:id]
     expect(response.status).to eq 200
  end
  it"should not show form" do
      get "/bx_block_forms/forms/0", params: error_form[:id]
      expect(response).to have_http_status(404)
   end
 end

end
