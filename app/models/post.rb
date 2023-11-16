class Post < ApplicationRecord
    validates :title, presence: true
    validates :title, length: {maximum:20}
    validates :start, presence: true
    validates :finish, presence: true
    validates :memo, length: {maximum:500}


    #終了日は、開始日以降の日付としてくださいのバリデーションを作る

    validate :start_finish_check
    
    def start_finish_check
        if start.present? && finish.present? && start > finish
         errors.add(:finish, "は開始日より前の日付は登録できません") 
        end
      end

end
