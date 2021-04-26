module Paginable
  protected

  def current_page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 20).to_i
  end

  def meta_attributes(collection, extra_meta = {})
    {
      current_page: collection.current_page,
      totalItems: collection.total_count,
      itemsPerPage: collection.limit_value
    }.merge(extra_meta)
  end
end
