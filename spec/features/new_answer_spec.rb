describe "the add answer process" do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in(user)
  end

  it "adds a new answer", js: true do
    question = FactoryGirl.create(:question, :inquiry => "Help me", :user_id => user.id)
    visit question_path(question)
    click_on "Be the first to answer this question"
    fill_in "Answer", with: "Help you"
    click_button "Create Comment"
    expect(page).to have_content "Help you"
  end
end
