administrador = Papel.find_or_create_by!(nome: 'administrador') do |p|
  p.descricao = 'Acesso total ao sistema'
end

colaborador = Papel.find_or_create_by!(nome: 'colaborador') do |p|
  p.descricao = 'Acesso à gestão de chamados'
end

morador = Papel.find_or_create_by!(nome: 'morador') do |p|
  p.descricao = 'Acesso aos próprios chamados'
end

permissoes = {
  'gerenciar_blocos' => 'Criar, editar e remover blocos',
  'gerenciar_usuarios' => 'Criar, editar e remover usuários',
  'gerenciar_tipos_chamado' => 'Criar, editar e remover tipos de chamado',
  'gerenciar_status_chamado' => 'Criar, editar e remover status de chamado',
  'ver_chamados' => 'Visualizar chamados',
  'atualizar_status_chamado' => 'Atualizar status de chamados',
  'deletar_chamados' => 'Deletar chamados',
  'ver_auditoria' => 'Visualizar logs de auditoria'
}

permissoes.each do |nome, descricao|
  Permissao.find_or_create_by!(nome: nome) do |p|
    p.descricao = descricao
  end
end

permissoes_administrador = Permissao.all
permissoes_administrador.each do |permissao|
  PapelPermissao.find_or_create_by!(papel: administrador, permissao: permissao)
end

permissoes_colaborador = Permissao.where(nome: [ 'ver_chamados', 'atualizar_status_chamado' ])
permissoes_colaborador.each do |permissao|
  PapelPermissao.find_or_create_by!(papel: colaborador, permissao: permissao)
end

permissoes_morador = Permissao.where(nome: [ 'ver_chamados' ])
permissoes_morador.each do |permissao|
  PapelPermissao.find_or_create_by!(papel: morador, permissao: permissao)
end

StatusChamado.find_or_create_by!(nome: 'Aberto') do |s|
  s.padrao = true
end

StatusChamado.find_or_create_by!(nome: 'Em andamento') do |s|
  s.padrao = false
end

StatusChamado.find_or_create_by!(nome: 'Concluído') do |s|
  s.padrao = false
end

TipoChamado.find_or_create_by!(titulo: 'Manutenção') do |t|
  t.sla_horas = 24
end

TipoChamado.find_or_create_by!(titulo: 'Segurança') do |t|
  t.sla_horas = 2
end

TipoChamado.find_or_create_by!(titulo: 'Limpeza') do |t|
  t.sla_horas = 8
end

admin = User.find_or_create_by!(email: 'admin@capp.com') do |u|
  u.nome = 'Administrador'
  u.password = 'admin123'
end
admin.papeis << administrador unless admin.papeis.include?(administrador)

puts "Seed concluído!"
puts "Login: admin@capp.com"
puts "Senha: admin123"
