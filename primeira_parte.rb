require "Date"

class Lutador
  # Atributos com attr_writer e attr_accessor
  attr_writer :nome, :nacionalidade
  attr_accessor :anoNascimento, :peso, :vitorias, :empates, :derrotas

  def initialize(nome, nacionalidade, anoNascimento, altura, peso, vitorias, empates, derrotas)
    @nome = nome
    @nacionalidade = nacionalidade
    @anoNascimento = anoNascimento
    @altura = altura
    @peso = peso
    @vitorias = vitorias
    @empates = empates
    @derrotas = derrotas
  end

  def apresentarLutador
    puts "Nome: #{@nome}\nNacionalidade: #{@nacionalidade}\nIdade: #{@idade}\nAltura: #{@altura}\nPeso: #{@peso} kg\nCategoria: #{@categoria}"
    puts "Número de lutas: #{@total}\nVitórias: #{sprintf("%.0f", @vitorias)} - #{@percv}%\nEmpates: #{sprintf("%.0f", @empates)} - #{@perce}%" #sprintf e o metodo ali formata casa decimal
    puts "Derrotas: #{sprintf("%.0f", @derrotas)} - #{@percd}%"
  end

  def calcularLutas
    @total = @vitorias + @empates + @derrotas
  end

  def calcularIdade
    data = Date.today
    @idade = data.year - @anoNascimento
  end

  def percVit
    @ab = (@vitorias / @total) * 100 #numero dado tem q ser float pq se não int com int n resulta em float
    @percv = sprintf("%.1f", @ab) #formatando casal decimal
  end

  def percEmpt
    @cd = @empates / @total * 100
    @perce = sprintf("%.1f", @cd)
  end

  def percDerr
    @ef = @derrotas / @total * 100
    @percd = sprintf("%.1f", @ef)
  end

  def vencerLuta
    @vitorias += 1
  end

  def empatarLuta
    @empates += 1
  end

  def perderLuta
    @derrotas += 1
  end

  def definirCategoria
    if @peso >= 52.2 && @peso <= 70.3
      @categoria = "Leve"

  elsif @peso >= 70.4 && @peso <= 83.9
    @categoria = "Médio"

  elsif @peso >= 84.0 && @peso <= 120.2
    @categoria = "Pesado"

  else
    @categoria = "Inválida"
    end
  end
end



lt1 = Lutador.new("Shogun", "Brasileiro", 1985, 1.85, 79.0, 30.0, 15.0, 5.0)
lt2 = Lutador.new("Lyoto", "Brasileiro", 1989, 1.87, 81.0, 29.0, 5.0, 1.0)
lt3 = Lutador.new("Minotauro", "Brasileiro", 1979, 1.79, 106.0, 31.0, 9.0, 2.0)
lt4 = Lutador.new("Spider", "Brasileiro", 1983, 1.91, 70.0, 31.0, 3.0, 1.0)

lutadores = [lt1, lt2, lt3, lt4]

@apre = 0
for lutador in lutadores #dando nome lutador aos objetos da array
  @apre += 1
  puts "************Lutador #{@apre}********************"
  lutador.calcularIdade
  lutador.calcularLutas
  lutador.percVit
  lutador.percEmpt
  lutador.percDerr
  lutador.definirCategoria
  lutador.apresentarLutador
end

puts "************Lutador 1********************"
lt1.vencerLuta
lt1.vencerLuta
lt1.empatarLuta
lt1.apresentarLutador

puts "************Lutador 2********************"
lt2.empatarLuta
lt2.perderLuta
lt2.apresentarLutador

puts "************Lutador 3********************"
lt3.perderLuta
lt3.empatarLuta
lt3.perderLuta
lt3.apresentarLutador

puts "************Lutador 4********************"
lt4.empatarLuta
lt4.apresentarLutador
