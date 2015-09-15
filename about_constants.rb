require File.expand_path(File.dirname(__FILE__) + '/neo')

# Names of constants look like the names of local variables, except that they begin with a capital letter. 
# By convention, most constants are written in all uppercase with underscores to separate words, LIKE_THIS. 
# Ruby class and module names are also constants, but they are conventionally written using initial capital
# letters and camel case, LikeThis.

C = "top level"

class AboutConstants < Neo::Koan  

  C = "nested"

  # Relative path to constant => C
  # Absolute path to constant => ::C
  
  # The :: is a unary operator that allows: constants, instance methods and class methods defined within a class or module, 
  # to be accessed from anywhere outside the class or module.
  
  def test_nested_constants_may_also_be_referenced_with_relative_paths
    assert_equal "nested", C
  end


  def test_top_level_constants_are_referenced_by_double_colons
    assert_equal "top level", ::C
  end

  def test_nested_constants_are_referenced_by_their_complete_path
    # obviously, this refers to the constant contained within the class AboutConstants => returns "nested" and NOT "top level"
    assert_equal "nested", AboutConstants::C
    assert_equal "nested", ::AboutConstants::C
  end

  # ------------------------------------------------------------------

  class Animal
    LEGS = 4
    def legs_in_animal
      LEGS
    end

    class NestedAnimal
      def legs_in_nested_animal
        LEGS
      end
    end
  end

  def test_nested_classes_inherit_constants_from_enclosing_classes
    assert_equal 4, Animal::NestedAnimal.new.legs_in_nested_animal
  end

  # ------------------------------------------------------------------

  class Reptile < Animal # inherit constants from Animal
    def legs_in_reptile
      LEGS
    end
  end

  def test_subclasses_inherit_constants_from_parent_classes
    assert_equal 4, Reptile.new.legs_in_reptile
  end

  # ------------------------------------------------------------------

  class MyAnimals
    LEGS = 2

    class Bird < Animal
      def legs_in_bird
        LEGS
      end
    end
  end

  def test_who_wins_with_both_nested_and_inherited_constants
    assert_equal 2, MyAnimals::Bird.new.legs_in_bird
  end

  # QUESTION: Which has precedence: The constant in the lexical scope,
  # or the constant from the inheritance hierarchy?

  # The constant in the lexical scope overrules the inherited constant

  class MyAnimals::Oyster < Animal
    def legs_in_oyster
      LEGS
    end
  end

  def test_who_wins_with_explicit_scoping_on_class_definition
    assert_equal 4, MyAnimals::Oyster.new.legs_in_oyster
  end

  # QUESTION: Now which has precedence: The constant in the lexical
  # scope, or the constant from the inheritance hierarchy?  Why is it
  # different than the previous answer?
  
  # The order in which Ruby searches for the value of a constant is: 
  # 1. The enclosing scope
  # 2. Any outer scopes (repeat until top level is reached)
  # 3. Included modules
  # 4. Superclass(es)
  # 5. Object
  # 6. Kernel
  
  # In this case, despite Oyster being defined as a subclass of MyAnimals, it never is in its scope so the constant is taken
  # from the global scope
   
end
