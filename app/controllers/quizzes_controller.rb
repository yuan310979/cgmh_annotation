class QuizzesController < ApplicationController
    before_action :authenticate_user!

    def show 
        @img = Image.all
        user = current_user
        @user_id = user.id
        @record = Record.new
        @records = user.records

        @done_img_ids = []
        @records.each do |record|
            @done_img_ids.append(record.image.id)
        end
        @undo_img_ids = @img.ids - @done_img_ids

        if @undo_img_ids.length() == 0
            flash[:notice] = "Already Finish Your QUIZ"
            redirect_to user_path
        end

        @quiz_img_id = @undo_img_ids.sample
        @quiz_img = Image.find_by_id(@quiz_img_id)
    end

end
