class Site::LicensesController < SiteController
  before_action { :first_time_visit }
  
  def privacy_policy
    #@privacy_policy = Setting.first.privacy_policy
    @settings = Setting.first
    @professionals = Professional.order(:id)
  end

  def terms_use
    #@terms_use = @settings = Setting.first.terms_use
    @settings = Setting.first
    @professionals = Professional.order(:id)
  end
end
