class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'お肉のおかず' },
    { id: 3, name: '魚介のおかず' },
    { id: 4, name: '野菜のおかず' },
    { id: 5, name: 'ご飯もの' },
    { id: 6, name: '卵料理' },
    { id: 7, name: 'パスタ・グラタン' },
    { id: 8, name: '麺類' },
    { id: 9, name: '副菜・サラダ' },
    { id: 10, name: 'スープ・汁物・シチュー' },
    { id: 11, name: 'お菓子・スイーツ' }
  ]

  include ActiveHash::Associations
  has_many :articles

end