module Sortable
  extend ActiveSupport::Concern

  DIRECTIONS = %w[asc desc].freeze

  class_methods do
    def sorted(sort, dir)
      if respond_to?(:sort_by, true)
        column = column(sort)
        direction = direction(dir)
        order("#{column} #{direction}")
      else
        all
      end
    end

    private

    def column(sort)
      sort_by.include?(sort) ? sort : sort_by[0]
    end

    def direction(dir)
      DIRECTIONS.include?(dir) ? dir : DIRECTIONS[0]
    end
  end
end
