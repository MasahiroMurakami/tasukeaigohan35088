class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '和食料理' },
    { id: 3, name: 'イタリアン' },
    { id: 4, name: 'フレンチ' },
    { id: 5, name: '中華料理' },
    { id: 6, name: 'エスニック' },
    { id: 7, name: '創作料理' },
    { id: 8, name: 'インド料理' },
    { id: 9, name: 'ジャンクフード' },
    { id: 10, name: '洋食' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
