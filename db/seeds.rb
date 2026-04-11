# Criando papéis
administrador = Papel.find_or_create_by!(nome: 'administrador') do |p|
  p.descricao = 'Acesso total ao sistema'
end

colaborador = Papel.find_or_create_by!(nome: 'colaborador') do |p|
  p.descricao = 'Acesso à gestão de chamados'
end

morador = Papel.find_or_create_by!(nome: 'morador') do |p|
  p.descricao = 'Acesso aos próprios chamados'
end

# Criando status de chamado
StatusChamado.find_or_create_by!(nome: 'Aberto') do |s|
  s.padrao = true
end

StatusChamado.find_or_create_by!(nome: 'Em andamento') do |s|
  s.padrao = false
end

StatusChamado.find_or_create_by!(nome: 'Concluído') do |s|
  s.padrao = false
end

# Criando tipo de chamado
TipoChamado.find_or_create_by!(titulo: 'Manutenção') do |t|
  t.sla_horas = 24
end

TipoChamado.find_or_create_by!(titulo: 'Segurança') do |t|
  t.sla_horas = 2
end

TipoChamado.find_or_create_by!(titulo: 'Limpeza') do |t|
  t.sla_horas = 8
end

# Criando usuário administrador inicial
admin = User.find_or_create_by!(email: 'admin@capp.com') do |u|
  u.nome = 'Administrador'
  u.password = 'admin123'
end
admin.papeis << administrador unless admin.papeis.include?(administrador)

puts "Seed concluído!"
puts "Login: admin@capp.com"
puts "Senha: admin123"