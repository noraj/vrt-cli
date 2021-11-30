# frozen_string_literal: true

require 'vrt'
require 'paint'

module VrtCli
  # The application
  class App
    # Display vulnerabilities in a tree
    def display_tree
      VRT.get_map.structure.each do |_cat_id, category|
        puts Paint[category.name, :bold]
        category.children.each do |_subcat_id, subcategory|
          if subcategory.priority
            print ''.ljust(4) + Paint[subcategory.priority, SEVERITY[subcategory.priority]]
            puts " #{subcategory.name}"
          else
            puts ''.ljust(4) + subcategory.name
          end

          next unless subcategory.children?

          subcategory.children.each do |_variant_id, variant|
            if variant.priority
              print ''.ljust(8) + Paint[variant.priority, SEVERITY[variant.priority]]
              puts " #{variant.name}"
            else
              puts ''.ljust(4) + variant.name
            end
          end
        end
      end
      true
    end

    # Sort vulnerabilities
    # @param sortby [Symbol] Column to sort by (`:priority`, `:category`, `:subcategory`, `:variant`)
    # @param order [Symbol] Displayed in ascendant (`:asc`) order or descendant order (`:dsc`). Works with `sortby`.
    def sort(sortby = :priority, order = :asc)
      unless sortby.nil? || sortby == :nil
        @vulnerabilities.sort! { |a, b| a[sortby].to_s <=> b[sortby].to_s }
        @vulnerabilities.reverse! if order == :dsc
      end
      true
    end

    # Display vulnerabilities in a simple justified table
    #
    # - First column: Technical severity / Priority (`:priority`)
    # - Second column: Category (`:category`)
    # - Third column: Sub-category / Specific vulnerability (`:subcategory`)
    # - Fourth column: Vulnerability / Variant / Affected function (`:variant`)
    def display_table
      @vulnerabilities.each do |v|
        output = "#{Paint[v[:priority].to_s, SEVERITY[v[:priority]]]} #{Paint[v[:category].ljust(44), :bold]} "
        output += "#{v[:subcategory].ljust(55)} #{v[:variant]}"
        puts output
      end
      true
    end
  end
end
