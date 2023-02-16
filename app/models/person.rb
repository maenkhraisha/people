class Person < ApplicationRecord
    validates :name, presence: true, length: {  minimum: 4 }
    validates :parent, presence: true, length: {  minimum: 4 }

    Person.create(name: nil).valid?
end
