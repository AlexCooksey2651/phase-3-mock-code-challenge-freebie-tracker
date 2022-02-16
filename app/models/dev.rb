class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one? (item_name)
        !!self.freebies.find_by(item_name: item_name)
    end

    def give_away (other_dev, freebie)
        if freebie.dev == self
            freebie.update(dev: other_dev)
        else
            p "can't give away"
        end
    end
end
