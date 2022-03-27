class Category < ApplicationRecord
  class Category < ApplicationRecord
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '生活習慣病' },
      { id: 3, name: '体質改善' },
      { id: 4, name: '健康予防' },
      { id: 5, name: '栄養素' },
      { id: 6, name: 'スポーツ栄養' },
      { id: 7, name: 'ダイエット' },
      { id: 8, name: 'その他' },
    ]
  
    include ActiveHash::Associations
    has_many :posts
  end
  
end
