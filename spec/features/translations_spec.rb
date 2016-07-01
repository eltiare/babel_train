describe 'translation data' do

  it 'loads properly' do
    # errors will be raised if translation data is missing
    visit '/page_1'
    visit '/page_2'
  end

end