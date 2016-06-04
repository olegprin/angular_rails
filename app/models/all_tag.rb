class AllTag < ActiveRecord::Base

  belongs_to :film

  def take_all_tag
    all_list.split(",")
  end
  
  def person_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
    params.require(:all_tag).permit(:id, :all_list)
  end
end
