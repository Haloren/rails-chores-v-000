class level AR scope method example:

...user.rb...(model)
class User < ActiveRecord::Base
  has_many :addresses
  belongs_to :team

  def addresses_attributes=(addresses_attributes)
    addresses_attributes.each do |i, address_attributes|
      self.addresses.build(address_attributes)
    end
  end

  def team_attributes=(team_attributes)
    self.team = Team.where(:name => team_attributes[:name]).first or create do |t|
      t.hometown = team_attributes[:hometown]
    end
  end

(view - inside user_builder form_for)

<%= form_for(@user) do |f| %>
  <p>
    <%= f.label :email %>
    <%= f.text_field : email %>
  </p>

  <%= f.fields_for :addresses do |address_builder| %>
  <fieldset>
    <legend><%= address_builder.object.address_type %> Address</legend>
    <p>
      <%= address_builder.label :street_1 %>
      <%= address_builder.text_field :street_1 %>
    </p>
    <p>
      <%= address_builder.label :street_2 %>
      <%= address_builder.text_field :street_2 %>
    </p>

    <%= address_builder.hidden_field :address_type %>
  </fieldset>

  <% end %>

  <%= user.builder.fields_for :team do |team_builder| %>
  <fieldset>
    <legend>Team (Name required, Hometown only required for new Teams)</legend>
    <p>
      <%= team_builder.label :name %>
      <%= team_builder.text_field :name %>
    </p>
    <p>
      <%= team_builder.label :hometown %>
      <%= team_builder.text_field :hometown %>
    </p>
  </fieldset>
  <% end %>

  <%= user_builder.submit %>
<% end %>

(UsersController)

def new
  @user = User.new
  # has_many adds collection.build
  @user.addresses.build(:address_type => "Home")
  @user.addresses.build(:address_type => "Business")
  @user.addresses.build(:address_type => "Spacedress")
  @user,build_team # belongs_to adds build_association
end

def create
  @user = User.new(user_params)
  if @user.save
    redirect_to @user
  else
    render :new
  end
end

-----------------------
....from the todoMVC lecture about Lists and Items...

In order to mark items complete, I need to add urls and change my db.
  - the idea of an item being complete of incomplete requires data.
  - new forms for updating the status of an item - which means new url

/lists/1/items
  PUT/PATCH /lists/1/items/1 - Updating the Item 1 in List 1
  PUT/PATCH /lists/:list_id/items/:id

complete function and JS for check mark

add this to the view:
<input class="toggle" type="checkbox"
chore cycles
JS function to submit the form when you click the checkbox:

$(function)(){
  $("input.toggle").on("change", function(){
    $(this).parents("form").trigger("submit")
  })
});


...in my cycle.rb file, add these state methods:

STATUS = {
  :incomplete => 0,
  :complete => 1
}

def complete?
  self.status == STATUS[:complete]
end

def incomplete?
  self.status == STATUS[:incomplete]
end
