require "pry"

# @site.posts.map(&:categories).reduce(:concat).uniq

module JekyllHueman
  class CategoryPage < Jekyll::Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = "index.html"

      self.process(@name)
      self.read_yaml(File.join(base, "_layouts"), "category_index.html")
      self.data["posts"] = site.categories[category]

      category_title_prefix = site.config["category_title_prefix"] || "Category: "
      self.data["header_title"] = %Q[<i class="fa fa-folder-open"></i>#{category_title_prefix}#{category}]
      self.data["title"] = "#{category.split(/\//).last} Archives"
    end
  end

  class CategoryPageGenerator < Jekyll::Generator
    def generate(site)
      if site.layouts.key?("category_index")
        dir = site.config["category_dir"] || "category"
        site.categories.each_key do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category)
        end
      end
    end
  end
end
