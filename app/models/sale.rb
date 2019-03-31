class Sale < ApplicationRecord
  validates :cod, uniqueness: true
  validates :detail, presence: true
  validates :category, inclusion: { in: %w(uno dos tres cuatro cinco), message: "%{value} no es una categoría válida" }
  validates :value, numericality: true
  validates :discount, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 40 }
end
