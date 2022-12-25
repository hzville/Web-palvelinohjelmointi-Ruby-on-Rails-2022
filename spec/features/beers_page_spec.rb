require 'rails_helper'

include Helpers

describe 'Beer' do
    let!(:brewery) { FactoryBot.create :brewery, name: 'Koff' }
    let!(:user) { FactoryBot.create :user}


    before :each do
        sign_in(username: 'Pekka', password: 'Foobar1')
    end

    it 'adding beer when beer name is valid results success' do
        visit new_beer_path
        expect(page).to have_content 'New beer'
        fill_in('beer[name]', with: 'test beer')
        click_button 'Create Beer'
        expect(page).to have_content 'Beer was successfully created.'
        expect(page).to have_content 'Name: test beer'
        expect(Beer.count).to eq(1)
    end

    it 'adding beer when beer name is invalid results error' do
        visit new_beer_path
        expect(page).to have_content 'New beer'
        click_button 'Create Beer'
        expect(page).to have_content 'New beer'
        expect(page).to have_content 'Name can\'t be blank'
        expect(Beer.count).to eq(0)
    end
end