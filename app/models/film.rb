class Film < ActiveRecord::Base
  
  include ObjectModel::Model
  include PgSearch
  extend FriendlyId
  pg_search_scope :search_everywhere, against: [:title, :language]
  friendly_id :title, use: :slugged
  has_many :comments, as: :commentable
  belongs_to :user
  has_many :voices

  has_one :all_tag
  has_many :tags, dependent: :destroy
  after_create :create_tags
  after_update :create_tags
  after_destroy :create_tags
  #after_create :create_tags
  #after_update :create_tags
  validates :title, uniqueness: true, presence: true
  #attr_accessible :film_id, #:tags_attributes 
  accepts_nested_attributes_for :tags
  #after_create :send_film_to_user
  has_many :tags, dependent: :destroy
  
  if I18n.locale == :en 
    CATEGORY = %w[Action Comedy History Other] 
  else I18n.locale == :ru 
    CATEGORY=%w[Экшин Комедия Историческое Другое]
  end    
  
  @model_of_attachment='uploaded_file'.parameterize.underscore.to_sym

  

  include ValidationsForPicture


    
  def create_tags
    if self.send_new_film==false
    
      all_tag=AllTag.first  
      if all_tag.present?
        all_tag.destroy!
      end
        all_tags=AllTag.create!
      
      
        list=all_tags.all_list.to_a
        
       
      Film.where(send_new_film: false).each do |film|
          tags=delete_symblol(film.language) 
          tags.each do |tag| 
        #if 
          #Tag.create!(tag_type: tag, film_id: self.id)      
            list<<tag
        #end
          end
      end    
      m=[]
      list.each do |tag|
        unless m.include?(tag)
          m<<tag    
        end
      end
      tag_save=m.join(",")
      #self.tags.first.destroy
      all_tags.update_attributes(all_list: tag_save)     
      #all_tags.save
      #@d=list.join(" ")
    end  
  end  

  def delete_symblol(symbol)
    symbol.gsub(/\W/, ",").split(",").reject(&:empty?)
  end
    
  def self.search_product(params_search, params_page)
    self.search(params_search).paginate(:page => params_page, :per_page => Configurable['films_per_page'])
  end  

  def send_film_to_user
    FilmMailer.new_film(self).deliver_now
  end

end


  