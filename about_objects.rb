require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    assert_equal true, 1.is_a?(Object)
    assert_equal true, 1.5.is_a?(Object)
    assert_equal true, "string".is_a?(Object)
    assert_equal true, nil.is_a?(Object)
    assert_equal true, Object.is_a?(Object)  # Object as type is also an object. Everything in Ruby is an object
  end

  def test_objects_can_be_converted_to_strings
    assert_equal "123", 123.to_s # "123"
    assert_equal "", nil.to_s # ""
  end

  def test_objects_can_be_inspected
    assert_equal "123", 123.inspect # "123"
    assert_equal "nil", nil.inspect # "nil"
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal Fixnum, obj.object_id.class   # Object_id returns in integer identifier. Hence the class obj.object_id.class belongs to is Fixnum
                                               # obj.class = Object; obj.object_id.class = Fixnum
  end

  def test_every_object_has_different_id 
    obj = Object.new
    another_obj = Object.new
    assert_equal true, obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal 1, 0.object_id  # pattern = (obj * 2) + 1
    assert_equal 3, 1.object_id  # and hence ALWAYS an odd number
    assert_equal 5, 2.object_id
    assert_equal 201, 100.object_id

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal true, obj           != copy            # so clone creates an exact copy, but it is a DIFFERENT OBJECT with DIFFERENT ID
    assert_equal true, obj.object_id != copy.object_id
  end
end
