require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :password_hash => "Password Hash",
        :password_salt => "Password Salt",
        :active => false
      ),
      stub_model(User,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :password_hash => "Password Hash",
        :password_salt => "Password Salt",
        :active => false
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Hash".to_s, :count => 2
    assert_select "tr>td", :text => "Password Salt".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
