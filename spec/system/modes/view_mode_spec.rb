describe "View modes" do
  it "view page" do
    #Act
    visit root_path
    click_on 'Modalidades'
    #Assert
    expect(current_path).to eq modes_path
  end

  it "successfully" do
    #Arrange
    for i in 1..3
      Mode.create!(
        name: "Modalidade #{i}",
        min_distance: 1 * i,
        max_distance: 20 * i,
        min_weight: 1 * i,
        max_weight: 20 * i,
        fixed_fee: 5 * i,
        active: true
      )
    end
    #Act
    visit root_path
    click_on 'Modalidades'
    #Assert
    expect(current_path).to eq modes_path
    within('table thead') do
      expect(page).to have_content 'Nome'
      expect(page).to have_content 'Distância Mínima (Km)'
      expect(page).to have_content 'Distância Máxima (Km)'
      expect(page).to have_content 'Status'
    end
    within('table tbody') do
      expect(page).to have_content 'Modalidade 1'
      expect(page).to have_content 'Modalidade 2'
      expect(page).to have_content 'Modalidade 3'
      expect(page).to have_content '1'
      expect(page).to have_content '2'
      expect(page).to have_content '3'
      expect(page).to have_content '20'
      expect(page).to have_content '40'
      expect(page).to have_content '60'
    end
  end

  it "no registered modes" do
    #Act
    visit root_path
    click_on 'Modalidades'
    #Assert
    expect(current_path).to eq modes_path
    expect(page).to have_content 'Nenhuma modalidade cadastrada'
  end
end