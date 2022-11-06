# frozen_string_literal: true

require_relative "tabs/version"

module Jekyll
  module Bulma
    module Tabs
      class Error < StandardError; end

      class TabsBlock < Liquid::Block
        def initialize(tag_name, markup, options)
          super
          markups = markup.split(' ', 2)
          if markups.length == 0
            raise SyntaxError.new("Block #{tag_name} requires 1 attribute")
          end
          @tabs_group = markups[0]
          @tabs_opts = markups[1]
        end

        def render(context)
          super
          environment = context.environments.first
          currentDirectory = File.dirname(__FILE__)
          templateFile = File.read(currentDirectory + '/template.erb')
          template = ERB.new(templateFile)
          template.result(binding)
        end
      end

      class TabBlock < Liquid::Block
        alias_method :render_block, :render

        def initialize(tag_name, markup, options)
          super
          markups = markup.split(' ', 2)
          if markups.length != 2
            raise SyntaxError.new("Block #{tag_name} requires 2 attributes")
          end
          @tabs_group = markups[0]
          @tab_id = markups[1]
        end

        def render(context)
          super
          site = context.registers[:site]
          converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
          environment = context.environments.first
          environment["tabs-#{@tabs_group}"] ||= {}
          environment["tabs-#{@tabs_group}"][@tab_id] = converter.convert(render_block(context))
        end
      end
    end
  end
end

Liquid::Template.register_tag('tab', Jekyll::Bulma::Tabs::TabBlock)
Liquid::Template.register_tag('tabs', Jekyll::Bulma::Tabs::TabsBlock)
