class RecordsController < ApplicationController
    def create
        r = Record.new()
        if not params.key?(:df)
            params[:df] = ["Others"]
        end
        l = Label.where(:major_dx_class => params[:mdc], :dx_subclass => params[:ds], :feature_annotations => params[:df])[-1]
        if l == nil
            flash[:alert] = "Storing Record Fail..."
        else
            r.label = l
            r.user_id = params[:record][:user_id]
            r.image_id = params[:record][:quiz_img_id]
        end
        if not r.save
            flash[:alert] = "Storing Record Fail..."
        else
            flash[:notice] = "Submit Successfully!"
        end
        redirect_to quiz_path
    end

    def export
        @records = Record.all
        respond_to do |format|
            format.html
            format.csv { send_data @records.to_csv, filename: "result-#{Date.today}.csv" }
        end
    end

    private
    def image_params
        params.require(:record).permit(:mdc, :ds, :df)
    end
end
