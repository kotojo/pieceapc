module StaticPagesHelper

  def sort_by_price
    @comp_sort = Computer.all.sort_by {|comp| comp.price}
  end
end
