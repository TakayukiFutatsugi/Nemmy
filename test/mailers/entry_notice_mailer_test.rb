require "test_helper"

class EntryNoticeMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  def entryNotice
    entryNoticeMailer.with(to: "jeopardy1216@gmail.com", name: "二木株式会社", familyName: "二木", lastName: "孝幸", title:"エンジニアのお仕事").entryNotice
  end
end
