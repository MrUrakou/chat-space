class Group < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  has_many :messages
  validates :name, presence: true

  def message_display
    if messages.present?
      if messages.last.text.present?
        messages.last.text
      else
        "画像が投稿されています。"
      end
    else
      "メッセージはありません。"
    end
  end
end
