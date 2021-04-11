# frozen_string_literal: true

require 'vrt'

module VrtCli
  # The application
  class App
    # @return [Array<Hash>] An array of vulnerabilities (+:priority+, +:category+, +:subcategory+, +:variant+)
    def parse
      vulns = []
      VRT.get_map.structure.each do |_cat_id, category|
        category.children.each do |_subcat_id, subcategory|
          if subcategory.children?
            subcategory.children.each do |_variant_id, variant|
              priority = variant.priority || '?'
              vuln = {
                priority: priority,
                category: category.name,
                subcategory: subcategory.name,
                variant: variant.name
              }
              vulns.push(vuln)
            end
          else
            priority = subcategory.priority || '?'
            vuln = {
              priority: priority,
              category: category.name,
              subcategory: subcategory.name,
              variant: '-'
            }
            vulns.push(vuln)
          end
        end
      end
      vulns
    end
  end
end
