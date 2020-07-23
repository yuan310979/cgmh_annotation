task :init_label  => :environment do
    puts "Drop all the records..."
    if not Label.destroy_all
        puts "Error on destroy origin data!"
    end
    mdc_list = ["Bacterial keratitis", "Fungal keratitis", "Parasitic keratitis", "Viral keratitis", "Non-infectious keratitis"]
    mdc2dxs = {
        "Bacterial keratitis" => ["Pseudomonas", "Others"],
        "Fungal keratitis" => ["Filamentous", "Non-filamentous"],
        "Parasitic keratitis" => ["Acanthamoeba", "Microsporidia"],
        "Viral keratitis" => ["Herpes", "Adenovirus"],
        "Non-infectious keratitis" => ["Marginal", "Neurotrophic/PED"]
    }
    mdc2df = {
        "Bacterial keratitis" => ["Oval shape ulcer", "Wreath infiltrate", "Epithelial plaque"],
        "Fungal keratitis" => ["Feathery margin", "Raised slough", "Colored ulcer"],
        "Parasitic keratitis" => ["Radial keratoneuritis", "Ring ulcer", "Multifocal coarse PEK"],
        "Viral keratitis" => ["Dendriform epithelitis", "Geographic ulcer", "Subepithelial infiltrate"],
        "Non-infectious keratitis" => ["Peripheral ulcer", "Crescent shape", "Rolled edge"]
    }
    mdc_list.each do |mdc|
        mdc2dxs[mdc].each do |dxs|
            feature_len = mdc2df[mdc].length()
            (1..feature_len).each do |l|
                mdc2df[mdc].combination(l).to_a.each do |f|
                    if not Label.create({:major_dx_class => mdc, :dx_subclass => dxs, :feature_annotations => f})
                        puts "Insert Error! #{mdc} #{dxs} #{f}"
                    end
                end
            end
            if not Label.create({:major_dx_class => mdc, :dx_subclass => dxs, :feature_annotations => ["Others"]})
                puts "Insert Error! #{mdc} #{dxs} #{f}"
            end
        end
    end
end