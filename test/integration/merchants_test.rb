require 'test_helper'

class MerchantsTest < ActionDispatch::IntegrationTest

  def redirect_to_sign_in
    assert_redirected_to(controller: "devise/sessions", action: "new") 
  end

  def sign_in!
    u = User.create(email: "a#{rand(99999)}@a.a", password: "asdfasdf")
    sign_in(u)
  end
  
  test "index action" do
    sign_in!
    m1 = Merchant.create(name: "Vasian", city:"Lviv",address: "Ostrovnaya 3")
    m2 = Merchant.create(name: "Kolan", city:"Rivne",address: "Beregovaya 5")
    get merchants_url
    assert_equal assigns(:merchants).first, m1
    assert_equal assigns(:merchants).last, m2
    assert_template 'merchants/index' 
  end

  test "redirect from index when not logged in" do
    get merchants_url
    redirect_to_sign_in
  end

  test "new action" do
    sign_in!
    get new_merchant_url
    assert_equal assigns(:merchant).attributes, Merchant.new.attributes  
    assert_template 'merchants/new' 
  end

  test "redirects_to_log_in" do
    get new_merchant_url
    redirect_to_sign_in
  end

  test "create" do
    sign_in!
    post merchants_url, params: { merchant: {name: "Vasian", city:"Lviv",
    address: "Ostrovnaya 3", kind:"larek", owner:"LLC Rio"} }
    m = assigns(:merchant)
    assert_equal m.name, "Vasian"
    assert_equal m.city, "Lviv"
    assert_equal m.address, "Ostrovnaya 3"
    assert_equal m.kind, "larek"
    assert_equal m.owner, "LLC Rio"
    assert_template 'merchants/show' 
  end

  test "regect creation on empty params" do
    sign_in!
    post merchants_url, params: { merchant: {kind: "kolian"} }
    assert assigns(:merchant).invalid?
    assert_template 'merchants/new'
  end

  test "update" do
    sign_in!
    m = Merchant.create(name: "Vasian", city:"Lviv",address: "Ostrovnaya 3")
    put merchant_url(m.id, params:{ merchant: {name: "Kolian",  
    city:"Lviv",address: "Ostrovnaya 3"} })
    assert_equal assigns(:merchant).name, "Kolian"
    assert_template 'merchants/show'
  end

  test "prense update to invalid merchant" do
    sign_in!
    m = Merchant.create(name: "Vasian", city:"Lviv",address: "Ostrovnaya 3")
    n = Merchant.create(name: "Vova", city:"Lviv",address: "Ostrovnaya 3")
    put merchant_url(m.id, params:{ merchant: {name: "Vova"}})
    assert_template 'merchants/edit'
    assert assigns(:merchant).invalid?
  end

  
end
