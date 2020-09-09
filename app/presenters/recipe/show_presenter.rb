# frozen_string_literal: true

class Recipe < ContentfulModel::Base
  class ShowPresenter < SimpleDelegator
    def tag_names
      @tag_names ||= tags ? tags.map { |x| x.name } : nil
    end

    def chef_name
      chef&.name
    end
  end
end
