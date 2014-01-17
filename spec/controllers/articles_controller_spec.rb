require 'spec_helper'

describe ArticlesController do
  describe '#show' do
    let(:params)  {{ format: :json, id: article.id }}
    let(:article) { FactoryGirl.create(:article) }

    before { get :show, params }

    subject { response.body }

    it { should == article.to_json }
  end

  describe '#create' do
    let(:title)  { 'New Title' }
    let(:body)   { 'New Body for the article!' }
    let(:attrs)  {{ title: title, body: body }}
    let(:params) {{ format: :json, article: attrs }}

    before { post :create, params }

    it 'creates an Article' do
      Article.all.count.should == 1
    end

    #it 'returns the title' do
      #response.body.should include(title)
    #end

    #it 'returns the body' do
      #response.body.should include(body)
    #end

    ####################
    
    #subject { JSON.parse(response.body) }

    #it 'has new title' do
      #subject['title'].should == title
    #end

    #it 'has new body' do
      #subject['body'].should == body
    #end
    
    ####################

    subject { OpenStruct.new(JSON.parse(response.body)) }

    its(:title) { should == title }

    its(:body)  { should == body }
  end
end
