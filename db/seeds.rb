# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "------------------------------------------------------------------"

puts "Cadastrando ADMINS..."
Admin.create!(email: "admin@admin.com.br", password: "123456", password_confirmation: "123456", name: "Admin Padrão")
Admin.create!(email: "davide@davide.com.br", password: "123456", password_confirmation: "123456", name: "Davide")
Admin.create!(email: "zara@zarabarbosa.com.br", password: "123456", password_confirmation: "123456", name: "Zara")
puts "ADMINS cadastrados!"

puts "------------------------------------------------------------------"

puts "Cadastrando FLAGS(BANNERS)..."
Flag.create!(title: "Psicoterapia Infantil (Ludoterapia)", description: "", picture: File.new(Rails.root.join('public', 'banners', 'banner1.jpg'), 'r'))
Flag.create!(title: "Psicoterapia", description: "", picture: File.new(Rails.root.join('public', 'banners', 'banner2.jpg'), 'r'))
Flag.create!(title: "Terapia de Grupo", description: "", picture: File.new(Rails.root.join('public', 'banners', 'banner3.jpg'), 'r'))
Flag.create!(title: "Palestras & Workshops", description: "", picture: File.new(Rails.root.join('public', 'banners', 'banner4.jpg'), 'r'))
puts "FLAGS(BANNERS) cadastrados!"

puts "------------------------------------------------------------------"

puts "Cadastrando SERVICES..."
Service.create!(title: "Psicoterapia Infantil (Ludoterapia)", description: "A psicoterapia infantil consiste no cuidado e atenção com a saúde mental da criança. É um espaço de acolhimento que proporciona à criança, através do brincar, a liberdade para expressar seus sentimentos e dificuldades, no intuito de construir um caminho rumo ao bem-estar familiar, a prevenção e solução de conflitos.", picture: File.new(Rails.root.join('public', 'services', 'service1.jpg'), 'r'))
Service.create!(title: "Psicoterapia", description: "simply my text of the printing and Ips um is simply text of the Ipsum is simply text of thetypesetting", picture: File.new(Rails.root.join('public', 'services', 'service2.jpg'), 'r'))
Service.create!(title: "Terapia de Grupo", description: "simply my text of the printing and Ips um is simply text of the Ipsum is simply text of thetypesetting", picture: File.new(Rails.root.join('public', 'services', 'service3.jpg'), 'r'))
Service.create!(title: "Palestras & Workshops", description: "simply my text of the printing and Ips um is simply text of the Ipsum is simply text of thetypesetting", picture: File.new(Rails.root.join('public', 'services', 'service4.jpg'), 'r'))
puts "SERVICES cadastrados!"

puts "------------------------------------------------------------------"

puts "Cadastrando PROFESSIONAL..."
Professional.create!(name: "Zara Barbosa", title: "Mestre e Especialista em Psicologia Clínica", number: "64/3467", description: "Lorem Ipsum is simply text of the Lorem Ipsum is simply my text of the printing and Ipsum is simply text of the Ipsum is simply text of thetypesetting Ipsum is simply text of the stry simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply text of the Lorem Ipsum is simply my text of", phone: "(84) 98892 4854", picture: File.new(Rails.root.join('public', 'professional', 'professionaldefault.png'), 'r'))
puts "PROFESSIONALS cadastrados!"

puts "------------------------------------------------------------------"

puts "Cadastrando PROJECTS..."
Project.create!(description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium dolore mque laudantium, totam rem aperiam, eaque ipsa quae ab illo invent ore veritatis et perspiciatis unde omnis iste natus error sit voluptatem")
puts "PROJECTS cadastrados!"

puts "------------------------------------------------------------------"

puts "Cadastrando WORKS..."
Work.create!(company: "Empresa 1", role: "Psicóloga Clínica")
Work.create!(company: "Empresa 2", role: "Recursos Humanos")
Work.create!(company: "Empresa 3", role: "Psicóloga Clínica")
puts "WORKS cadastrados!"

puts "------------------------------------------------------------------"

puts "Cadastrando QUESTIONS..."
Question.create!(doubt: "O teste deu certo?", answer: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium dolore mque laudantium, totam rem aperiam, eaque ipsa quae ab illo invent ore veritatis et perspiciatis unde omnis iste natus error sit voluptatem")
Question.create!(doubt: "How can therapy help?", answer: "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam suscipit augue lacus, id auctor elit")
Question.create!(doubt: "How much do the counseling sessions cost?", answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam suscipit augue lacus, id auctor elit placerat id. Nulla ultricies augue at felis elementum, sodales rhoncus metus sagittis.")
Question.create!(doubt: "Does the Counseling Center offer counseling?", answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam suscipit augue lacus, id auctor elit placerat id. Nulla ultricies augue at felis elementum, sodales rhoncus metus sagittis.")
puts "QUESTIONS cadastradas!"

puts "------------------------------------------------------------------"

puts "Cadastrando HEALTHINSURANCES..."
HealthInsurance.create!(name: "Unimed", picture: File.new(Rails.root.join('public', 'healthinsurance', 'unimed.jpg'), 'r'))
HealthInsurance.create!(name: "Amil", picture: File.new(Rails.root.join('public', 'healthinsurance', 'amil.jpg'), 'r'))
HealthInsurance.create!(name: "Bradesco", picture: File.new(Rails.root.join('public', 'healthinsurance', 'bradesco.jpg'), 'r'))
HealthInsurance.create!(name: "Cassi", picture: File.new(Rails.root.join('public', 'healthinsurance', 'cassi.jpg'), 'r'))
puts "HEALTHINSURANCES cadastrados!"

puts "------------------------------------------------------------------"

puts "--------------------------BLOG INÍCIO-----------------------------"
puts "----------------------------------"
puts "Cadastrando CATEGORIES..."
Category.create!(name: "Artigos")
Category.create!(name: "Notícias")
puts "CATEGORIES cadastradas!"
puts "----------------------------------"
puts "Cadastrando POSTS..."
Post.create!(title: "Post 1", body: "Conteúdo do Post 1", post_date: Date.today - Random.rand(5), admin_id: 1, category_id: 1, picture: File.new(Rails.root.join('public', 'blog', 'blog1.jpg'), 'r'))
Post.create!(title: "Post 2", body: "Conteúdo do Post 2", post_date: Date.today - Random.rand(5), admin_id: 1, category_id: 2, picture: File.new(Rails.root.join('public', 'blog', 'blog2.jpg'), 'r'))
Post.create!(title: "Post 3", body: "Conteúdo do Post 3", post_date: Date.today - Random.rand(5), admin_id: 1, category_id: 2, picture: File.new(Rails.root.join('public', 'blog', 'blog3.jpg'), 'r'))
Post.create!(title: "Post Teste Admin", body: "Testando post com outro admin", post_date: Date.today - Random.rand(5), admin_id: 3, category_id: 1, picture: File.new(Rails.root.join('public', 'blog', 'blog4.jpg'), 'r'))
puts "POSTS cadastradas!"
puts "----------------------------------"
puts "---------------------------BLOG FIM-------------------------------"

puts "------------------------------------------------------------------"

puts "Cadastrando DIARIES(ATENDIMENTOS)..."
Diary.create!(name: "Clínica Teste", address: "Natal/RN - Rua exemplo, N° 2", phone: "(84) 94545 4545", week: "Segunda a Sexta-feira:", start_time: "8:00:00", end_time: "17:00:00")
Diary.create!(name: "Clínica Teste", address: "Currais Novos/RN - Rua exemplo, N° 18", phone: "(84) 93333 3333", week: "Segunda a Sexta-feira:", start_time: "9:00:00", end_time: "10:00:00")
puts "DIARIES(ATENDIMENTOS) cadastrados!"

puts "------------------------------------------------------------------"

puts "Cadastrando SETTINGS..."
Setting.create!(email: "exemplo@exemplo.com.br", phone: "(84) 99629 1483", facebook: "", instagram: "", twitter: "", linkedin: "", youtube: "http://www.youtube.com/zarabarbosa", picture: File.new(Rails.root.join('public', 'settings', 'logo_header.png'), 'r'), picture_footer: File.new(Rails.root.join('public', 'settings', 'logo_footer.png'), 'r'), privacy_policy: "Teste de política de privacidade.", terms_use: "Teste de termos de uso.")
puts "SETTINGS cadastrados!"

puts "------------------------------------------------------------------"

