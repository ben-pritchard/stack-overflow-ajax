require 'rails_helper'

describe 'the show question process' do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in(user)
  end

  it 'shows the question' do
    question = FactoryGirl.create(:question, :inquiry => "Can you help?", :user_id => user.id)
    visit question_path(question)
    expect(question.inquiry).to eq "Can you help?"
  end

  it 'shows the question post' do
    question = FactoryGirl.create(:question, :post => "More detail", :user_id => user.id)
    visit question_path(question)
    expect(question.post).to eq "More detail"
  end
end
