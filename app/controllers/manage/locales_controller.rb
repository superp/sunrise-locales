class Manage::LocalesController < Manage::BaseController
  inherit_resources
  defaults :route_prefix => 'manage'
  before_filter :find_locale
  
  authorize_resource :class => Sunrise::YmlLocale
  
  def edit
    @text = Sunrise::YmlLocale.new(@locale).get_data
    
    respond_with @text
  end
  
  def update    
    yml = Sunrise::YmlLocale.new(@locale)
    
    respond_to do |format|
      if !params[:text].blank? && yml.set_data(params[:text])
        I18n.reload!
        
        flash[:notice] = I18n.t('flash.locale.updated')
        
        format.html { redirect_to manage_locales_path }
        format.xml { head :ok }
      else
        flash.now[:error] = I18n.t('flash.locale.update_error')
      	
        format.html { render :action => "edit" }
        format.xml { render :xml => 'error', :status => :unprocessable_entity }
      end
    end 
  end
  
  protected
    
    def collection
      @locales = Sunrise.available_locales
    end
    
    def find_locale
      @locale = params[:id]
    end
end
