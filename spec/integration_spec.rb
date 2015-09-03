require('spec_helper')

describe('the user path', :type => :feature) do
  it('will show how the user can access personal page') do
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Alyssa')
    click_button('Submit')
    expect(page).to have_content('Alyssa')
  end

  it 'will generate the posts that contain the user keywords' do
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Alyssa')
    click_button('Submit')
    fill_in('new_keyword', :with => 'blonde')
    click_button('Add')
    expect(page).to have_content('blonde')
    click_button('Find Your Connections')
    expect(page).to have_content('blonde')
  end

  it 'will collect the user email address'do
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Alyssa')
    click_button('Submit')
    fill_in('email', :with => 'jessica@gmail.com')
    click_button('Add')
    expect(page).to have_content('Alyssa')
  end
end
