require 'spec_helper'

describe 'welcome/index.html.haml' do
  it 'displays product details correctly' do
    render
    expect(rendered).to match /Fee Remission - Back Office/
    expect(rendered).to match /prototype/
  end
end
