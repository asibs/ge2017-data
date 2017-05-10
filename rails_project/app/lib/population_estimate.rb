module PopulationEstimate

  STANDARD_AGE_RANGES = [ {name: "Under 18", min_age:0, max_age:17},
                          {name: "18 - 34", min_age:18, max_age:34},
                          {name: "35 - 49", min_age:35, max_age:49},
                          {name: "50 - 64", min_age:50, max_age:64},
                          {name: "65 Plus", min_age:65, max_age:90} ]

  def population(options = {})
    min_age = options[:min_age] || 0
    max_age = options[:max_age] || 90
    gender = options[:gender] || :all

    sum = 0

    if (gender == :f || gender == :m) then
      (min_age..max_age).each do |age|
        method_name = get_method_name(age, gender)
        sum += self.public_send(method_name) if self.respond_to? method_name
      end
    elsif (gender == :all) then
      sum += self.population(min_age: min_age, max_age: max_age, gender: :f)
      sum += self.population(min_age: min_age, max_age: max_age, gender: :m)
    end

    sum
  end


  def population_percentage(options = {})
    population = population(options)
    population.to_f / pop_total * 100
  end


  def population_string(options = {})
    puts "#{population(options)} (#{population_percentage(options).round(2)}%)"
    "#{population(options)} (#{population_percentage(options).round(2)}%)"
  end


  def population_hash(age_ranges = [])
    # Default to 1 year ranges
    if age_ranges.empty? then
      (0..90).each do |i|
        age_ranges << [i,i]
      end
    end

    data = []
    [:f, :m].each do |gender|
      gender_pop = {}
      age_ranges.each do |min,max|
        gender_pop[get_age_label(min,max)] = population(min_age: min, max_age: max, gender: gender)
      end
      data << { name: get_gender_label(gender), data: gender_pop }
    end

    data
  end


  def gender_hash
    data = {}
    [:f, :m].each do |gender|
      method_name = "pop_total_#{gender}"
      data[get_gender_label(gender)] = self.public_send(method_name)
    end

    data
  end

  def gender_percentage(gender)
    return 0 unless [:f, :m].include? gender

    method_name = "pop_total_#{gender}"

    self.public_send(method_name).to_f / pop_total * 100
  end


  private
    def get_method_name(age, gender)
      age = "90plus" if age == 90

      "pop_#{age}_#{gender}"
    end

    def get_age_label(min, max = nil)
      if max.nil? then
        return (min == 90 ? "90+" : "#{min}")
      else
        return (min == max ? "#{get_age_label(min)}" : "#{get_age_label(min)}-#{get_age_label(max)}")
      end
    end

    def get_gender_label(gender)
      case gender
      when :f
        return "Female"
      when :m
        return "Male"
      else
        return ""
      end
    end

end
