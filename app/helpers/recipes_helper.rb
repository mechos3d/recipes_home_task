# frozen_string_literal: true

module RecipesHelper

  def pagination_prev_page(default_limit)
    offset = query_params['offset'].to_i
    disabled = 'disabled' if offset <= 0

    new_offset = [(offset - @default_limit), 0].max
    link_to(
      'previous_page', recipes_path(query_params.merge(offset: new_offset)),
      class: "btn btn-outline-primary #{disabled}"
    )
  end

  def pagination_next_page(default_limit, total)
    offset = query_params['offset'].to_i

    new_offset = offset + @default_limit
    disabled = 'disabled' if new_offset >= total

    link_to(
      'next_page', recipes_path(query_params.merge(offset: new_offset)),
      class: "btn btn-outline-primary #{disabled}"
    )
  end
end
