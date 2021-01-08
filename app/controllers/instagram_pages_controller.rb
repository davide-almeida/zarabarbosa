class InstagramPagesController < ApplicationController
  layout 'instagram_page'

  def index
    @professionals = Professional.order(:id)
    @settings = Setting.first

    @whatsapp = @settings.phone
    @whatsapp = @whatsapp.gsub(/[^0-9]/, '')

    @whatsapp2 = @professionals.first.phone.gsub(/[^0-9]/, '')

    if InstagramPage.first != nil
      @instagram_pages = InstagramPage.first
      @instagram_links = @instagram_pages.instagram_links
    end
  end
end
