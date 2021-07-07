require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(name: 'Box 1',
                           description: 'Description',
                           price_cents: 10_000,
                           cost_cents: 5_000)
  end

  test 'product should be valid' do
    assert @product.valid?
  end

  test 'name should be present' do
    @product.name = ''
    assert_not @product.valid?
  end

  test 'name should not be too long' do
    @product.name = 'a' * 46
    assert_not @product.valid?
  end

  test 'name should not be too short' do
    @product.name = 'aa'
    assert_not @product.valid?
  end

  test 'description should not be too long' do
    @product.description = 'a' * 256
    assert_not @product.valid?
  end

  test 'price_cents should be present' do
    @product.price_cents = nil
    assert_not @product.valid?
  end

  test 'price_cents should not be 0' do
    @product.price_cents = 0
    assert_not @product.valid?
  end

  test 'price_cents should not be negative' do
    @product.price_cents = -1
    assert_not @product.valid?
  end

  test 'cost_cents should be present' do
    @product.cost_cents = nil
    assert_not @product.valid?
  end

  test 'cost_cents should not be 0' do
    @product.cost_cents = 0
    assert_not @product.valid?
  end

  test 'cost_cents should not be negative' do
    @product.cost_cents = -1
    assert_not @product.valid?
  end

  test 'discount_percentage should not be negative' do
    @product.discount_percentage = -1.to_d
    assert_not @product.valid?
  end

  test 'arts_amount should not be negative' do
    @product.arts_amount = -1.to_d
    assert_not @product.valid?
  end

  test 'cost should not be greater than price' do
    @product.price_cents = 1
    @product.cost_cents = 2
    assert_not @product.valid?
  end

  test 'main_image should be present' do
    # @product.image
    #         .attach(io: File.open(Rails.root
    #                                    .join('app',
    #                                          'assets',
    #                                          'images',
    #                                          'amoritta_test_image.png')
    #                                    .to_s),
    #                 filename: 'amorita_test_image.png',
    #                 content_type: 'image/png')
  end
end
