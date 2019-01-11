require 'test_helper'

class SubventionRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  SubventionRequest.destroy_all
  Subvention.destroy_all

  subvention1 = Subvention.create!({
    name: 'Subvention des activités sportives',
    start_date: '1/10/2018',
    end_date: '31/12/2018',
    amount: 9000,
    photo: "https://vignette.wikia.nocookie.net/phobia/images/a/ab/Sports2.jpg"
  })

  subvention2 = Subvention.create!({
    name: 'Subvention père noël',
    start_date: '10/12/2018',
    end_date: '23/12/2200',
    amount: 18000,
    photo: "https://www.enfant.com/assets/posts/0000/276-age-ou-l-enfant-croit-au-pere-noel.jpg"
  })

  test "email must be present" do
    request = SubventionRequest.new(justif_path: "path.jpg", amount_asked: 1, subvention: subvention2)
    assert_not request.valid?, "An email should be present to validate the request"
  end

  test "email must be valid" do
    request = SubventionRequest.new(email: "nicolas", justif_path: "path.jpg", amount_asked: 1, subvention: subvention2)
    assert_not request.valid?, "'nicolas' shouldn't be a valid email"
    request.email = "nicolas@gmail"
    assert_not request.valid?, "'nicolas@gmail' shouldn't be a valid email"
    request.email = "nicolas@gmail.com"
    assert request.valid?, "'nicolas@gmail.com' should be a valid email"
  end

  test "justif_path must be present" do
    request = SubventionRequest.new(email: "nicolas@gmail.com", amount_asked: 1, subvention: subvention2)
    assert_not request.valid?, "A justif_path must be present to validate the request"
  end

  test "amount_asked must be present" do
    request = SubventionRequest.new(email: "nicolas@gmail.com", justif_path: "path.jpg", subvention: subvention2)
    assert_not request.valid?, "An amount must be present to validate the request"
  end

  test "amount_asked must not be higher than the subvention amount" do
    request = SubventionRequest.new(email: "nicolas@gmail.com", justif_path: "path.jpg", amount_asked: 18001, subvention: subvention2)
    assert_not request.valid?, "Shouldn't be able to create a request with an amount_asked of 18001 for a subvention where amount_asked is 18000"
  end

  test "amount_asked plus amount_asked for a previous request for same subvention must not be higher than subvention amount" do
    request1 = SubventionRequest.create!(email: "nicolas@gmail.com", justif_path: "path.jpg", amount_asked: 1, subvention: subvention2)
    request2 = SubventionRequest.new(email: "nicolas@gmail.com", justif_path: "path.jpg", amount_asked: 18000, subvention: subvention2)
    assert_not request2.valid?, "Shouldn't be able to create a request with an amount_asked of 1800 for a subvention where amount_asked is 18000, if a previous request has been made for that subvention"
  end

  test "date of request creation must fit the start_date/end_date of subvention" do
    SubventionRequest.destroy_all
    request = SubventionRequest.new(email: "nicolas@gmail.com", justif_path: "path.jpg", amount_asked: 1, subvention: subvention2)
    assert_not request.valid?, "Shouldn't be able to create a request for a subvention that ended in 2018"
  end

end
