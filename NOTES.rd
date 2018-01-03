Add "Overdue" header to user_chore.js

houses#index.html.erb ...


<% @houses.each do |house| %>

  <p><%= link_to house.name, house_path(house) %></p>
<% end %>

---



<%= button_to "x", house_chore_task_path(task.house_chore, :task_id => task.id), method: :delete, :class => "destroy" %>

//use this one in house_chores#show:
<%= button_to "x", [@house_chore, task], :method => :delete, :class => "destroy" %>


JS NOTES:

tasks#create (in tasks_controller)
  render :json => JSON::parse(@task.to_json).merge(:delete_path => house_chore_task_path(@house_chore, :id => @task.id))




<%= render partial: "house_chores/house_chores_form", locals: { user_chore: @user_chore, house_chore: @house_chore, users: @users } %>

actual Notes

1. Admin access only to adding chores to the house list?
    Have some kind of message on House#show about adding chores to the list.


3. Houses#show needs some attention.  Delete function and scoping of the chores that are returned.



idea for user.rb..

self.find_users(house_id)
self.where(“house_id == ?”, house_id)
end
User.find_users(current_user.house_id)










<div class="">
  <% @house.users.each do |house_user| %>
    <p><%= link_to house_user.name, user_path(house_user) %></p>
  <% end %>
</div>

SessionsController.rb..
class SessionsController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create

    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id

      redirect_to user_chores_path

    else

      @user = User.find_by(:name => params[:user][:name])
      #raise params.inspect
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id

        redirect_to root_url, notice: 'Logged in!'
      else
        flash.now.alert = 'Email or password is invalid'
        render :new
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end

user.rb...

def self.find_or_create_by_omniauth(auth_hash)
  self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
    user.password = SecureRandom.hex
  end
end

  def house_attributes=(house_attributes)
    self.house = House.where(:name => house_attributes[:name]).first_or_create do |h|
      h.city = house_attributes[:city]
    end
  end

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end




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
  @user.build_team # belongs_to adds build_association
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




<%= user.builder.fields_for :house do |house_builder| %>
<fieldset>
  <legend>House name</legend>
  <p>
    <%= house_builder.label :name %>
    <%= house_builder.text_field :name %>
  </p>
</fieldset>
<% end %>

<%= user_builder.submit %>
