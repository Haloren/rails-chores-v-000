# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

House.create(:name => 'El Rancho', :city => 'San Francisco')
House.create(:name => 'Rankin', :city => 'Santa Cruz')
House.create(:name => 'Ravenna', :city => 'Seattle')

User.create(:username => 'Michael', :email => 'michael@yahoo.com', :password => '123456', :house_id => 1, :admin => false)
User.create(:username => 'Ann Marie', :email => 'amv@yahoo.com', :password => '123456', :house_id => 1, :admin => true)
User.create(:username => 'Kara', :email => 'kara@yahoo.com', :password => '123456', :house_id => 1, :admin => false)
User.create(:username => 'James', :email => 'james@yahoo.com', :password => '123456', :house_id => 2, :admin => true)
User.create(:username => 'Dawn', :email => 'dawn@yahoo.com', :password => '123456', :house_id => 2, :admin => false)
User.create(:username => 'Todd', :email => 'todd@yahoo.com', :password => '123456', :house_id => 2, :admin => false)
User.create(:username => 'Daryl', :email => 'daryl@yahoo.com', :password => '123456', :house_id => 3, :admin => true)
User.create(:username => 'Tiana', :email => 'tiana@yahoo.com', :password => '123456', :house_id => 3, :admin => false)
User.create(:username => 'Mark', :email => 'mark@yahoo.com', :password => '123456', :house_id => 3, :admin => false)

Chore.create(:name => 'Kitchen 1')
Chore.create(:name => 'Kitchen 2')
Chore.create(:name => 'Bathroom 1')
Chore.create(:name => 'Bathroom 2')
Chore.create(:name => 'Bathroom 3')
Chore.create(:name => 'Living Room')
Chore.create(:name => 'Family Room')
Chore.create(:name => 'Den')
Chore.create(:name => 'Backyard')
Chore.create(:name => 'Basement')
Chore.create(:name => 'Hallways')
Chore.create(:name => 'Laundry')
