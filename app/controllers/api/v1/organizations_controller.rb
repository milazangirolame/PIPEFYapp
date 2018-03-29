class Api::V1::OrganizationsController < Api::V1::BaseController

  def index
    @organization = Organization.find_or_create_by(name: "Pipefy Recruitment Test", id:"92858".to_i)
    @cards = Card.all
    @fields = Field.all
  end

  def delete_records
    Pipe.first.destroy
    redirect_to root_path
  end


  def create_or_update_records
    get_data_from_pipefy
    create_or_update_pipes
    create_or_update_phases
    create_or_update_cards
    redirect_to root_path


  end


  def create_or_update_pipes
    @pipe_id = "335557".to_i
    @organization_id = "92858".to_i
    @pipe = Pipe.find_or_create_by(id: @pipe_id, organization_id: @organization_id, name:@data["data"]["organizations"][0]["pipes"][0]["name"])
  end

  def create_or_update_phases
    phase_quantity = 0
    phases = @data["data"]["organizations"][0]["pipes"][0]["phases"]

    while phase_quantity <= phases.length - 1
      phase = Phase.find_or_create_by(id: phases[phase_quantity]["id"].to_i,
                                  pipe_id: @pipe_id,
                                  name: phases[phase_quantity]["name"],
                                  done: phases[phase_quantity]["done"],
                                  description: phases[phase_quantity]["description"])



      phase_quantity +=1
    end
  end

  def create_or_update_cards
    phase_quantity = 0
    card_quantity = 0
    phases = Phase.all
    phases.each do |phase|
      cards =  @data["data"]["organizations"][0]["pipes"][0]["phases"][phase_quantity]["cards"]["edges"]
      while card_quantity <= cards.length - 1
        card = Card.find_or_create_by(id: cards[card_quantity]["node"]["id"].to_i,
                                          created_at: cards[card_quantity]["node"]["createdAt"],
                                          title: cards[card_quantity]["node"]["title"],
                                          due_date: cards[card_quantity]["node"]["due_date"],
                                          phase_id: phase.id)

        card_quantity +=1

      end
      phase_quantity +=1
      card_quantity = 0
    end
  end




end

