POP_SIZE = 70
GENE_SIZE = 8
MUTATION_RATE = 0.3
CROSSOVER = 0.7

class Chromosome
  @gene 
  @geneAux
  @fitness
  @bestFitness
  @bestFitnessIdx

  def initialize
    @gene = Array.new(POP_SIZE)
    @geneAux = Array.new(POP_SIZE)
    @fitness = Array.new(POP_SIZE)
    @bestFitness = - 5000
    @bestFitnessIdx = 0
    for i in 0 ... POP_SIZE
      genome = Array.new(GENE_SIZE)
      for j in 0 ... GENE_SIZE
        genome[j] = rand(GENE_SIZE * (j+1)) % GENE_SIZE
      end
      @gene[i] = genome.map {|j| j.to_s }.join
      @fitness[i] = 0
      #puts @gene[i]  
    end
  end
  
  def fitness
    for i in 0 ... POP_SIZE
      fit = 0
      for j in 0 ... GENE_SIZE
        fit = fit - (j - @gene[i][j].to_i)**2
        fit = fit - hasEqual(@gene[i][j].to_i, i)
      end
      @fitness[i] = fit
      if(@fitness[i] > @bestFitness)
        @bestFitness = @fitness[i]
        @bestFitnessIdx = i
      end
      puts "BestFit: #{@bestFitness} and BestIDX: #{@bestFitnessIdx}"
    end
  end
  
  def hasEqual(gene, i)
    fit = 0
    for j in 0 ... GENE_SIZE
      if(gene == @gene[i][j].to_i)
        fit = fit + 50
      end
    end
    #puts fit
    return fit
  end
  
  def tournament
    fit = Array.new(5)
    bestFit = -5000
    bestFitIdx = 0
    for i in 0 ... 5
      fit[i] = rand(POP_SIZE)
    end
    for i in 0 ... 5
      if(@fitness[fit[i]] > bestFit)
        bestFit = @fitness[fit[i]]
        bestFitIdx = fit[i]
      end
    end
  end
  
  def crossingOver
    
  end
  
  def mutElitism
    
  end
  
end

pop = Chromosome.new
pop.fitness

