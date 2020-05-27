class QuizzesController < ApplicationController
    before_action :authenticate_user!

    def show 
        @img = Image.all
        user = current_user
        @records = user.records

        @done_img_ids = []
        @records.each do |record|
            @done_img_ids.append(record.image.id)
        end
        @undo_img_ids = @img.ids - @done_img_ids 
    end

end
