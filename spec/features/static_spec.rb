require 'rails_helper'

describe 'navigate' do
  it "returns a 200" do
    visit root_path
    expect(page.status_code).to eq 200
  end
end
