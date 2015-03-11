require 'spec_helper'

describe "reviews/new" do
  before(:each) do
    assign(:review, stub_model(Review,
      :venue_id => 1,
      :user_id => 1,
      :review_body => "MyText",
      :rating => 1
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reviews_path, "post" do
      assert_select "input#review_venue_id[name=?]", "review[venue_id]"
      assert_select "input#review_user_id[name=?]", "review[user_id]"
      assert_select "textarea#review_review_body[name=?]", "review[review_body]"
      assert_select "input#review_rating[name=?]", "review[rating]"
    end
  end
end
