require('spec_helper')

describe('the user path', :type => :feature) do
  it('will show how the user can access personal page') do
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Alyssa')
    fill_in('email', :with => 'alyssa@gmail.com')
    fill_in('password', :with => 'cheese')
    click_button('Submit')
    expect(page).to have_content('Alyssa')
  end

  it 'will generate the posts that contain the user keywords' do
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Alyssa')
    fill_in('email', :with => 'jessica@gmail.com')
    fill_in('password', :with => 'hooray')
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
    fill_in('email', :with => 'jessica@gmail.com')
    fill_in('password', :with => 'hooray')
    click_button('Submit')
    fill_in('email', :with => 'jessica@gmail.com')
    click_button('Update')
    expect(page).to have_content('jessica@gmail.com')
  end

  it 'will update the user email address' do
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Alyssa')
    fill_in('email', :with => 'jessica@gmail.com')
    fill_in('password', :with => 'hooray')
    click_button('Submit')
    fill_in('email', :with => 'alyssa@gmail.com')
    click_button('Update')
    expect(page).to have_content('alyssa@gmail.com')
  end

  it 'will redirect the user to an error page if submitted email is already in use by another user'do
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Alyssa')
    fill_in('email', :with => 'jessica@gmail.com')
    fill_in('password', :with => 'hooray')
    click_button('Submit')
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Mark')
    fill_in('email', :with => 'jessica@gmail.com')
    fill_in('password', :with => 'hooray')
    click_button('Submit')
    expect(page).to have_content('Oops!')
  end


  it 'will edit a username' do
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Alyssa')
    fill_in('email', :with => 'jessica@gmail.com')
    fill_in('password', :with => 'hooray')
    click_button('Submit')
    fill_in('name_update', :with => 'starwars')
    click_button('Edit Name')
    expect(page).to have_content('Starwars')
  end

  it 'allow user to login using email and password authentification' do
    visit('/')
    click_link('Get started!')
    fill_in('name', :with => 'Alyssa')
    fill_in('email', :with => 'jessica@gmail.com')
    fill_in('password', :with => 'hooray')
    click_button('Submit')
    visit ('/login')
    fill_in('email', :with => 'jessica@gmail.com')
    fill_in('password', :with => 'hooray')
    click_button('Login')
    expect(page).to have_content('jessica@gmail.com')
   end
end
