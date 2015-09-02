require('spec_helper')

describe('the user path', :type => :feature) do
  it('will show how the user can access personal page') do
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Alyssa')
    click_button('Submit')
    expect(page).to have_content('Alyssa')
    fill_in('new_keyword', :with => 'blonde')
    click_button('Add')
    expect(page).to have_content('blonde')
    click_button('Find Your Connections')
    expect(page).to have_content('http')
  end
end
