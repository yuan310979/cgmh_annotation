class Image < ApplicationRecord
    # belongs_to :label
    has_many :records

    has_one_attached :img
    has_one_attached :img_blue
    has_one_attached :img_green

    def self.import(params)
        # Process label table and store it into a mapping dict from image to its label
        # label = params['label']
        # workbook = Creek::Book.new label.tempfile
        # worksheets = workbook.sheets
        # puts "Found #{worksheets.count} worksheets"

        # img2label = {} 

        # worksheets.each do |worksheet|
        #     puts "Reading: #{worksheet.name}"
        #     num_rows = 0
        #     worksheet.rows.each do |row|
        #         img_filename = row["A#{num_rows+1}"]
        #         major_dx_class = row["B#{num_rows+1}"]
        #         dx_subclass = row["C#{num_rows+1}"]
        #         feature_annotations = row["D#{num_rows+1}"]
        #         img2label[img_filename] = {:major_dx_class => major_dx_class, :dx_subclass => dx_subclass, :feature_annotations => feature_annotations}
        #         num_rows += 1
        #     end
        # end

        # Processing Images
        imgs = params['imgs']
        imgs.each do |img|
            upload_filename = img.original_filename
            filename = upload_filename.split('.').first
            file_extention = upload_filename.split('.').last
            fname = filename.split('_').first
            type = upload_filename.split('_').last.split('.').first
            
            im = Image.where({:fname => fname}).last
            if im == nil
                im = Image.new({:fname => fname})
            end
            if type == 'blue'
                im.img_blue = img
            elsif type == 'green'
                im.img_green = img
            else
                im.img = img
            end
            
            # name = img.original_filename
            # label = img2label[name.split('.')[0]]
            # if (l = Label.where(:major_dx_class => major_dx_class, :dx_subclass => dx_subclass, :feature_annotations => feature_annotations)[-1]) != nil
            #     tmp.label = l
            # else
            #     tmp_label = tmp.build_label(label)
            #     tmp_label.save
            # end

            if not im.save 
                logger.info "Store Error"
            end
        end
    end
end
