=begin
  As a visitor
  When I visit the home page of the app
  Then I should see a welcome message
=end

RSpec.describe 'a visitor' do
  context 'visiting /' do
    it 'should see a welcome message' do

      visit '/'

      within('#greeting') do
        expect(page).to have_content('Welcome!')
      end
    end
  end
end


=begin
  As an unauthorized user
  When I click a specific jockey name
  Then I should see an ordered list of horse names that belong to that jockey
=end

RSpec.describe 'a visitor' do
  context 'clicking a jockey name' do
    it 'should see a list of horse names' do
      jockey = Jockey.create(name:'Michelle Obama')
      jockey.horses.create
      horse = jockey.horses.create(name:'Cheeseburger')

      visit '/index'

      click_link("#{jockey.name}") do
        expect(page).to have_content("#{jockey.name.horses.first}")
      end
    end
  end
end
