class ScoutNoticeMailer < ApplicationMailer
  def scoutNotice
    @familyName = params[:familyName]
    @lastName = params[:lastName]
    @name = params[:name]
    mail(to: params[:to], subject: '【Nemmy】新着スカウトのお知らせ')
  end
end
