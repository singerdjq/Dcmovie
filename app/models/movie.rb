class Movie < ApplicationRecord
    has_many :line_items
    has_many :orders, through: :line_items
    before_destroy :ensure_not_referenced_by_any_line_item
    validates :image_url, :name, :year, :description,  presence:true
    validates :price, numericality: {greater_than_or_equal_to:0.01}
    validates :name,uniqueness:true
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
        }
    private
    def ensure_not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base,'Line Items present')
            throw :about
        end
    end
    def self.search(term)
        if term
            where("name LIKE?", "%#{term}%")
        else
            all
        end
    end
end
