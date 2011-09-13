require 'spec_helper'

describe Manage::LocalesController do
  render_views
  
  before(:all) do
    @locale = Sunrise.available_locales[rand(Sunrise.available_locales.length)]
    @text = "#{@locale}:\n  title: 'Hello World'"
    @text2 = @text + "\n  new: 'temp'"
  end
  
  context "administrator" do
    login_admin
        
    context "exists locale" do     
      it "should render index action" do
        get :index
        assigns(:locales).should include(@locale)
        response.should render_template('index')
      end
      
      it "should render edit action" do
        controller.should_receive :edit
        get :edit, :id => @locale
      end
      
      it "should update locale" do
        put :update, :id => @locale, :text => @text
        assigns(:locale).should == @locale
        Sunrise::YmlLocale.new(@locale).get_data.should == @text
        response.should redirect_to(manage_locales_path)
        
        put :update, :id => @locale, :text => @text2
        Sunrise::YmlLocale.new(@locale).get_data.should == @text2
      end
    end
  end
  
  context "anonymous user" do
    user_logout
    
    it "should not render index action" do
      controller.should_not_receive :index
      get :index
    end
    
    context "with exists structure" do  
      it "should not render edit action" do
        controller.should_not_receive :edit
        get :edit, :id => @locale
      end
      
      it "should not render update action" do
        controller.should_not_receive :update
        put :update, :id => @locale
      end
    end
  end
end
