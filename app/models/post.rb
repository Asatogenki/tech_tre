class Post < ApplicationRecord
    # validates :検証するカラム名,{検証する内容}presenceは中身が空白なのを防ぐ
    validates :content, {presence: true, length:{maximum:140}}
    validates :user_id, {presence: true}
    def user
        return User.find_by(id: self.user_id)
    end
end
