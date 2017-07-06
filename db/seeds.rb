# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 新增 locations
  Location.create!(
    name: '北京',
    sort: 1
  )

  Location.create!(
    name: '上海',
    sort: 2
  )

  Location.create!(
    name: '深圳',
    sort: 3
  )

  Location.create!(
    name: '广州',
    sort: 4
  )

  Location.create!(
    name: '杭州',
    sort: 5
  )

  Location.create!(
    name: '重庆',
    sort: 6
  )

  Location.create!(
    name: '香港',
    sort: 7
  )

  Location.create!(
    name: '台湾',
    sort: 8
  )

  Location.create!(
    name: '韩国',
    sort: 9
  )

  Location.create!(
    name: '新加坡',
    sort: 10
  )

  puts '创建初始工作地点*10'

# 新增工作种类 Category
  Category.create!(
  name: '技术',
  icon: 'fa fa-laptop',
  sort: 1,
  is_lock: true
  )

  Category.create!(
  name: '产品',
  icon: 'fa fa-tasks' ,
  sort: 2,
  is_lock: true
  )

  Category.create!(
  name: '设计',
  icon: 'fa fa-photo',
  sort: 3,
  is_lock: true
  )

  Category.create!(
  name: '运营',
  icon: 'fa fa-line-chart' ,
  sort: 4,
  is_lock: true
  )

  Category.create!(
  name: '市场',
  icon: 'fa fa-pie-chart' ,
  sort: 5,
  is_lock: true
  )

  Category.create!(
  name: '销售',
  icon: 'fa fa-cny' ,
  sort: 6,
  is_lock: true
  )

  Category.create!(
  name: '职能',
  icon: 'fa fa-paste' ,
  sort: 7,
  is_lock: true
  )

  Category.create!(
  name: '其他',
  icon: 'fa fa-address-book-o' ,
  sort: 8,
  is_lock: true
  )

  puts '创建初始工作种类*8'

# 新增 admin 账号  admin
if User.find_by(email: 'admin@test.com').nil?
  u = User.new
  u.name = '测试管理员'
  u.email = 'admin@test.com'
  u.password = '11111111'
  u.password_confirmation = '11111111'
  u.is_admin = true
  u.save
  puts '创建管理员*1'
else
  puts '已创建过此账号，不重复新增。'
end

# 新增 user 账号  user
if User.find_by(email: 'user@test.com').nil?
  u = User.new
  u.name = '测试用户'
  u.email = 'user@test.com'
  u.password = '11111111'
  u.password_confirmation = '11111111'
  u.is_admin = false
  u.save
  puts '创建一般用戶*1'
else
  puts '已创建过此账号，不重复新增。'
end

# 新增 website admin 账号  website admin
if User.find_by(email: 'website_admin@test.com').nil?
  u = User.new
  u.name = '测试超级管理员'
  u.email = 'website_admin@test.com'
  u.password = '11111111'
  u.password_confirmation = '11111111'
  u.is_admin = true
  u.is_website_admin = true
  u.save
  puts '创建超级管理员*1'
else
  puts '已创建过此账号，不重复新增。'
end
