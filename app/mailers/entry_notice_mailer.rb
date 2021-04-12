class EntryNoticeMailer < ApplicationMailer
  def entryNotice
    @name = params[:name]
    @familyName = params[:familyName]
    @lastName = params[:lastName]
    @title = params[:title]
    mail(to: params[:to], subject: '【Nemmy】新着応募のお知らせ')
  end
end
