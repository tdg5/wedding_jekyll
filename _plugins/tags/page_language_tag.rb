module JekyllHueman
  class PageLanguageTag < Liquid::Tag
    DEFAULT_LANGUAGE = "en"

    def render(context)
      context.registers[:site].config["language"] ||
        context.registers[:page]["language"] ||
        DEFAULT_LANGUAGE
    end
  end
end

Liquid::Template.register_tag("page_language", JekyllHueman::PageLanguageTag)
