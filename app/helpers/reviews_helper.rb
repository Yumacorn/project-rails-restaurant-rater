module ReviewsHelper
    def num_stars_review(score)
        tally = ''
        score.times do |i|
            tally += image_tag('star-icon.jpg',size: "15")
        end
        tally.html_safe
    end
end
