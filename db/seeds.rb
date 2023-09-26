@color_hex_options = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']

def seed
  reset_db
  create_projects(10)
  create_colors(100)
  create_swatches
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_projects(quantity)
  quantity.times { create_project }
end

def create_project
  project = Project.create(name: "Project #{(111..999).to_a.sample}")
  puts "Project with id #{project.id} and name #{project.name} just created"
end

def create_colors(quantity)
  quantity.times { create_color }
end

def create_color
  color = Color.create(hex: generate_hex, alpha: 100)
  puts "Color with id #{color.id} and hex #{color.hex} just created"
end

def create_swatches
  Color.all.each do |color|
    project = Project.all.sample
    swatch = Swatch.create(project_id: project.id)
    fill = Fill.create(color_id: color.id, swatch_id: swatch.id)
    puts "Swatch with id #{swatch.id} just created with color #{swatch.colors.first.hex}"
  end
end

def generate_hex
  color_hex = '#'
  6.times { color_hex += @color_hex_options.sample }
  color_hex
end

seed