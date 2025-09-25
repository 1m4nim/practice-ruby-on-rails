class Post < ApplicationRecord
  # タイトル（:title）は必須（presence: true）とし、文字数を100文字までに制限
  validates :title, presence: true, length: { maximum: 100 }
  
  # 本文（:content）は必須（presence: true）とする
  validates :content, presence: true
end