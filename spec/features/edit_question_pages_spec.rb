require 'rails_helper'

describe 'the edit a question process' do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in(user)
  end

  it 'edits an inquiry' do
    question = FactoryGirl.create(:question, :inquiry => "Help me", :user_id => user.id)
    visit question_path(question)
    click_on 'Edit question'
    fill_in "Inquiry", :with => "I need help"
    click_on 'Update Question'
    expect(page).to have_content 'I need help'
  end

  it 'edits a post' do
    question = FactoryGirl.create(:question, :post => 'Please help with this')
    visit edit_question_path(question)
    fill_in "Post", :with => "Can anyone answer"
    click_on "Update Question"
    expect(page).to have_content "Can anyone answer"
  end

  it 'shows an error if inquiry is empty' do
    question = FactoryGirl.create(:question)
    visit edit_question_path(question)
    fill_in "Inquiry", :with => ''
    click_on "Update Question"
    expect(page).to have_content "errors"
  end

  it 'shows an error if post is empty' do
    question = FactoryGirl.create(:question)
    visit edit_question_path(question)
    fill_in "Post", :with => ''
    click_on "Update Question"
    expect(page).to have_content "errors"
  end
end
