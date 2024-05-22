  require "Date"

  class Lutador
    attr_accessor :nome, :nacionalidade, :anoNascimento, :peso, :vitorias, :empates, :derrotas #atributos da classe

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
      puts "Derrotas: #{sprintf("%.0f", @derrotas)} - #{@percd}%\n"
    end

    def calcularLutas
      @total = @vitorias + @empates + @derrotas
    end

    def calcularIdade
      data = Date.today #usando metodo do require "Date" puxando a data atual
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

  class Luta
    attr_accessor :rounds, :desafiante, :desafiado

    def initialize(rounds, desafiante, desafiado)
      @rounds = rounds
      @desafiante = desafiante
      @desafiado = desafiado
    end

    def marcarLuta
      @categoria1 = @desafiado.definirCategoria
      @categoria2 = @desafiante.definirCategoria
      @desafiado.calcularIdade
      @desafiado.calcularLutas
      @desafiado.percVit
      @desafiado.percEmpt
      @desafiado.percDerr
      @desafiante.calcularIdade
      @desafiante.calcularLutas
      @desafiante.percVit
      @desafiante.percEmpt
      @desafiante.percDerr

      if @desafiado == @desafiante
        @status = false

    elsif @rounds < 3
        @status = false

    elsif @categoria1 != @categoria2
        @status = false
    end
    end

    def mostrarLuta
      if @status == false
        puts "Luta inválida!"
      else
        puts "Luta válida!"
        puts "Serão #{@rounds} rounds."
        @desafiado.apresentarLutador
        puts "****************************************************"
        @desafiante.apresentarLutador
      end
    end


    def lutar
      @nomeDesafiante = @desafiante.nome
      @nomeDesafiado = @desafiado.nome
      @totalDesafiado = 0
      @totalDesafiante = 0
      @vetorResultados = []

      rounds.times do |i|
        @golpeDesafiado = rand(0..100)
        @golpeDesafiante = rand(0..100)

        if @golpeDesafiado > @golpeDesafiante
          puts "Golpe do desafiado venceu com #{@golpeDesafiado} de força, o golpe do desafiante que teve #{@golpeDesafiante}."
            @totalDesafiado += 1
            @vetorResultados << "Desafiado"
          elsif @golpeDesafiado == @golpeDesafiante
            puts "O poder dos golpes empatou com #{@golpeDesafiado} de força."
            @vetorResultados << "Empate"
          else
            puts "Golpe do desafiado perdeu com #{@golpeDesafiado} de força, o golpe do desafiante que teve #{@golpeDesafiante}."
              @totalDesafiante += 1
              @vetorResultados << "Desafiante"
       end
      end

      puts "Resultado dos rounds: #{@vetorResultados}."
      puts "Desafiante venceu #{@totalDesafiante} rounds e o desafiado #{@totalDesafiado}."

      if @totalDesafiado > @totalDesafiante
        puts "Vitória do desafiado #{@desafiado.nome}"
          @desafiado.vencerLuta
          @desafiante.perderLuta

    elsif @totalDesafiante > @totalDesafiado
      puts "Vitória do desafiante #{@desafiante.nome}!"
        @desafiante.vencerLuta
        @desafiado.perderLuta

      else
        puts "Empate!"
        @desafiante.empatarLuta
        @desafiado.empatarLuta
  end
end
end

  lt1 = Lutador.new("Shogun", "Brasileiro", 1985, 1.85, 79.0, 30.0, 15.0, 5.0)
  lt2 = Lutador.new("Lyoto", "Brasileiro", 1989, 1.87, 81.0, 29.0, 5.0, 1.0)
  lt3 = Lutador.new("Minotauro", "Brasileiro", 1979, 1.79, 106.0, 31.0, 9.0, 2.0)
  lt4 = Lutador.new("Spider", "Brasileiro", 1983, 1.91, 70.0, 31.0, 3.0, 1.0)

  @lutadores = [lt1, lt2, lt3, lt4]


  luta1 = Luta.new(10,lt4,lt1)
  luta1.marcarLuta
  luta1.mostrarLuta
  puts "\n"

  luta2 = Luta.new(11,lt1,lt2)
  luta2.marcarLuta
  luta2.mostrarLuta
  luta2.lutar
  puts "*****************************RESULTADOS - Desafiante*****************************"

  lt1.apresentarLutador
  puts "***********************RESULTADOS - Desafiado***********************"
  lt2.apresentarLutador
  puts "\n"

  luta3 = Luta.new(2,lt1,lt2)
  luta3.marcarLuta
  luta3.mostrarLuta
