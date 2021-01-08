class InstagramLink < ApplicationRecord
  belongs_to :instagram_page, optional: true

  # Executa o método "link_validation" antes de salvar alguma coisa no BD.
  before_save :link_validation

  # método para verificar se o campo "link" começa com "http://". Caso não comece com "http://" será adicionado.
  def link_validation
    if self.link[0,7] != "http://"
      self.link.insert(0, "http://")
    end
  end
  
end
