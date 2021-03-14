# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#seed roles
['owner', 'contributor', 'reader'].each do |role|
  Role.create(name: role)
end

#seed permission
['create', 'read', 'update','delete','share'].each do |permission|
  if permission == 'create' || permission == 'delete' || permission == 'share'
    Permission.create(name: permission, role_id: Role.find_by_name('owner').id)
  end
  if permission == 'read'
    ['owner','contributor','reader'].each do |role|
      r_id = Role.find_by_name(role).id
      Permission.create(name: permission, role_id: r_id)
    end
  end
  if permission == 'update'
    ['owner','contributor'].each do |role|
      r_id = Role.find_by_name(role).id
      Permission.create(name: permission, role_id: r_id)
    end
  end
end