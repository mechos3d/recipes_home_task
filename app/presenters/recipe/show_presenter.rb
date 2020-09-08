# frozen_string_literal: true

class Recipe < ContentfulModel::Base
  class ShowPresenter < SimpleDelegator
    def tags_list
      @tags_list ||= tags ? tags.map { |x| x.name }.join(', ') : nil
    end

    def chef_name
      chef&.name
    end
  end
end
