# frozen_string_literal: true

module RecipesHelper

  def pagination_prev_page(default_limit)
    offset = query_params['offset'].to_i
    return unless offset > 0

    new_offset = [(offset - @default_limit), 0].max
    link_to(
      'previous_page', recipes_path(query_params.merge(offset: new_offset))
    )
  end

  def pagination_next_page(default_limit)
    offset = query_params['offset'].to_i

    new_offset = offset + @default_limit
    link_to(
      'next_page', recipes_path(query_params.merge(offset: new_offset))
    )
  end
end
