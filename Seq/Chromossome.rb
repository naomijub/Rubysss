POP_SIZE = 70
GENE_SIZE = 8
MUTATION_RATE = 0.3

class Chromosome

  def initialize
    @gene = Array.new(POP_SIZE)
    @geneAux = Array.new(POP_SIZE)
    @fitness = Array.new(POP_SIZE)
    @bestFitness = - 5000
    @bestFitnessIdx = 0
    for i in 0 ... POP_SIZE
      genome = Array.new(GENE_SIZE)
      @geneAux[i] = " "
      @fitness[i] = 0
      for j in 0 ... GENE_SIZE
        genome[j] = rand(GENE_SIZE * (j+1)) % GENE_SIZE
      end
      @gene[i] = genome.map {|j| j.to_s }.join
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
      #puts "BestFit: #{@bestFitness} and BestIDX: #{@bestFitnessIdx}"
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
      #puts fit[i]
    end
    for i in 0 ... 5
      if(@fitness[fit[i]] > bestFit)
        bestFit = @fitness[fit[i]]
        bestFitIdx = fit[i]
      end
    end
    return bestFitIdx
  end
  
  def crossingOver
    for i in 0 ... POP_SIZE
      i1 = tournament
      i2 = tournament
      @geneAux[i] = @gene[i1][0...4] + @gene[i2][4...8]
      #puts "Gene1 #{@gene[i1]} + Gene2 #{@gene[i2]} = #{@geneAux[i]}"
    end
  end
  
  def mutate
    for i in 0 ... POP_SIZE
      if(rand >= MUTATION_RATE)
        equals = true
        gene = 0
        while equals do
          geneAux = rand(GENE_SIZE + (i * i + 1)) % GENE_SIZE
          gene = geneAux
          equals = hasNoEqualsMut(i, geneAux)
        end
        #puts "#{@gene[i]}"
        #equalIdx = whereEqual(i, gene)
        @gene[i][rand(GENE_SIZE)] = gene.to_s
        #puts "#{@gene[i]}"
      end
    end
  end
  
  #If there is no equals, fitness will be max
  def hasNoEqualsMut(g, i)
    equals = false
    for j in 0 ... GENE_SIZE
      if @gene[g][j].to_i == i
        equals = true
      end      
    end
    return equals
  end
  
  def whereEqual(g, i)
    geneEqual = 0
    for j in 0 ... GENE_SIZE
      if @gene[g][j].to_i == i
        geneEqual = j
      end
    end
    return geneEqual
  end
  
  def convert
    for i in 0 ... POP_SIZE
      @gene[i] = @geneAux[i]
    end
  end
  
  def getBestFit
    @bestFitness
  end
  
  def getBestFitIdx
    @bestFitnessIdx
  end
  
  def getGene(i)
    @gene[i]
  end
  
end

pop = Chromosome.new
pop.fitness

while pop.getBestFit != 0 do
  pop.crossingOver
  pop.convert
  pop.fitness
  pop.mutate
  pop.fitness
  puts "Best Fit: #{pop.getBestFit} Gene: #{pop.getGene(pop.getBestFitIdx)}"
end

puts "Best #{pop.getGene(pop.getBestFitIdx)}"

