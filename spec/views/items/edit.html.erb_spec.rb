require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :price => 1.5,
      :name => "MyString",
      :category => 1,
      :sub_category => 1,
      :store => 1
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_path(@item), "post" do
      assert_select "input#item_price[name=?]", "item[price]"
      assert_select "input#item_name[name=?]", "item[name]"
      assert_select "input#item_category[name=?]", "item[category]"
      assert_select "input#item_sub_category[name=?]", "item[sub_category]"
      assert_select "input#item_store[name=?]", "item[store]"
    end
  end
end
