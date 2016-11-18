require 'test_helper'
require 'nokogiri'

class TocListTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TocList::VERSION
  end

  def test_render_with_default_template
    head = {'table of content' => [
      {'Platform features' => ['Scalability', 'Fault-tolerance']},
      {'Language features' => ['Functional programming', 'Extensibility and DSLs']},
      {'Tooling features' => ['A growing ecosystem', 'Interactive development', 'Erlang compatible']}]
    }

    fragment = create_html head

    assert_equal 11, fragment.css('a').count
    assert_equal 10, fragment.css('li').count
    assert_equal 4, fragment.css('ol').count
    assert_equal 1, fragment.css('.toc_container').count
  end

  private

  def create_html head
    toc_list = TocList.new head
    fragment_str = toc_list.render
    #puts fragment_str
    Nokogiri::HTML(fragment_str)
  end

end
