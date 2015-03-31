require 'rails_helper'

describe 'the add question process' do
  let(:user) {FactoryGirl.create(:user)}

  before do
    sign_in(user)
  end

  it 'adds a new question' do
    visit questions_path
    click_on "Ask a Question"
    fill_in "Inquiry", :with => "What is recursion?"
    fill_in "Post", :with => "Further explanation"
    click_on "Create Question"
    expect(page).to have_content("What is recursion?")
  end

  it 'shows error if user and inquiry are not filled in' do
    visit questions_path
    click_on "Ask a Question"
    click_on "Create Question"
    expect(page).to have_content("errors")
  end

  it 'shows error if inquiry not filled in' do
    visit questions_path
    click_on "Ask a Question"
    fill_in "Post", :with => "Further explanation"
    click_on "Create Question"
    expect(page).to have_content("errors")
  end

  it 'shows error if post not filled in' do
    visit questions_path
    click_on "Ask a Question"
    fill_in "Inquiry", :with => "What is recursion?"
    click_on "Create Question"
    expect(page).to have_content("errors")
  end

end
