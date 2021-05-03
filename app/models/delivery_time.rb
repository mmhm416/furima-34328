class DeliveryTime < ActiveHash::Base
  self.data = [
    {id: 0, name: '--'}, {id: 1, name: '1~2日で発送'}, {id: 2, name: '2~3日で発送'}, 
    {id: 3, name: '3~7日で発送'}, {id: 4, name: '8日以上の日数で発送'}
              ]
              include ActiveHash::Associations
              has_many :items
end