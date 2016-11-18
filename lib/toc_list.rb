require "toc_list/version"
require "toc_list/hash_method"
require 'erb'

class TocList

  def initialize toc_hash, tmpl={}
    @toc = toc_hash

    @title_tmpl_path = optional tmpl, :title
    @sections_tmpl_path = optional tmpl, :sections
    @container_tmpl_path = optional tmpl, :container

    @hash_method = block_given? ? hash_method : HashMethod
  end

  def title
    @toc.keys[0]
  end

  def sections
    @toc.values[0]
  end

  def render
    @sections_tmpl ||= parse_tmpl @sections_tmpl_path
    toc = @sections_tmpl.result binding
    toc = wrap toc if parent.nil?
    toc
  end

  protected

  attr_writer :title_tmpl, :sections_tmpl
  attr_accessor :parent

  private

  def optional tmpl, key
    tmpl.fetch(key, def_tmpl(key.to_s + '.erb'))
  end

  def wrap toc
    ctnr_tmpl = parse_tmpl @container_tmpl_path
    ctnr_tmpl.result binding
  end

  def render_item item
    @title_tmpl ||= parse_tmpl @title_tmpl_path
    @title_tmpl.result binding
  end

  def hash_link item
    @hash_method.call item
  end

  def render_section section
    if section.is_a? String
      render_item(section)
    else
      sec = self.class.new section
      sec.title_tmpl = @title_tmpl
      sec.sections_tmpl = @sections_tmpl
      sec.parent = self
      sec.render
    end
  end

  def parse_tmpl path
    ERB.new File.read path
  end

  def def_tmpl filename
    sub_lib_dir = File.expand_path(__FILE__).sub(/\.rb$/, '')
    File.join sub_lib_dir, filename
  end

end
