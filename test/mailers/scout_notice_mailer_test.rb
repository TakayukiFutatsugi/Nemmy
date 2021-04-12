require "test_helper"

class ScoutNoticeMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  def scoutNotice
    scoutNoticeMailer.with(to: "jeopardy1216@gmail.com", name: "二木株式会社", familyName: "二木", lastName: "孝幸").scoutNotice
  end
end
