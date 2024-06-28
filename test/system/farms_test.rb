# frozen_string_literal: true

require 'application_system_test_case'

class FarmsTest < ApplicationSystemTestCase
  setup do
    @farm = farms(:one)
  end

  test 'visiting the index' do
    visit farms_url
    assert_selector 'h1', text: 'Farms'
  end

  test 'should create farm' do
    visit farms_url
    click_on 'New farm'

    click_on 'Create Farm'

    assert_text 'Farm was successfully created'
    click_on 'Back'
  end

  test 'should update Farm' do
    visit farm_url(@farm)
    click_on 'Edit this farm', match: :first

    click_on 'Update Farm'

    assert_text 'Farm was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Farm' do
    visit farm_url(@farm)
    click_on 'Destroy this farm', match: :first

    assert_text 'Farm was successfully destroyed'
  end
end
