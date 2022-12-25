require 'rails_helper'

include Helpers

describe "User" do
  before :each do
    FactoryBot.create :user
  end

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(username: "Pekka", password: "Foobar1")
      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
        sign_in(username: "Pekka", password: "wrong")
        expect(current_path).to eq(signin_path)
        expect(page).to have_content 'Username and/or password mismatch'
    end
  end

  it "when signed up with good credentials, is added to the system" do
    visit signup_path
    fill_in('user_username', with: 'Brian')
    fill_in('user_password', with: 'Secret55')
    fill_in('user_password_confirmation', with: 'Secret55')
  
    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
  end

  it 'User ratings are visible on users own page' do
    user1 = FactoryBot.create :user, username: 'test_user1', password: 'Test12', password_confirmation: 'Test12'
    user2 = FactoryBot.create :user, username: 'test_user2', password: 'Test23', password_confirmation: 'Test23'
    FactoryBot.create :rating, score: 15, user: user1
    FactoryBot.create :rating, score: 25, user: user1
    FactoryBot.create :rating, score: 33, user: user2
    sign_in(username: "test_user1", password: "Test12")
    expect(page).to have_content 'Username: test_user1'
    expect(page).to have_content 'Has made 2 ratings'
    expect(page).to have_content 'anonymous 15'
    expect(page).to have_content 'anonymous 25'
    visit ratings_path
    expect(page).to have_content 'List of ratings'
    expect(page).to have_content 'anonymous 15 test_user1'
    expect(page).to have_content 'anonymous 25 test_user1'
    expect(page).to have_content 'anonymous 33 test_user2'
  end

  it 'User rating is removed from db when pressed delete' do
    user1 = FactoryBot.create :user, username: 'test_user1', password: 'Test12', password_confirmation: 'Test12'
    FactoryBot.create :rating, score: 15, user: user1
    sign_in(username: "test_user1", password: "Test12")
    expect(Rating.count).to eq(1)
    click_link 'Delete'
    expect(Rating.count).to eq(0)

  end
end