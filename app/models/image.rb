class Image < ApplicationRecord
    # belongs_to :label
    has_many :records

    has_one_attached :img

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
            tmp = Image.new({:img => img})
            # name = img.original_filename
            # label = img2label[name.split('.')[0]]
            # if (l = Label.where(:major_dx_class => major_dx_class, :dx_subclass => dx_subclass, :feature_annotations => feature_annotations)[-1]) != nil
            #     tmp.label = l
            # else
            #     tmp_label = tmp.build_label(label)
            #     tmp_label.save
            # end

            if not tmp.save 
                logger.info "Store Error"
            end
        end
    end
end
