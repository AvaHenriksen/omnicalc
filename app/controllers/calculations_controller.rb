class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    @text_without_spaces = @text.delete(" ")

    @text_split = @text.split(" ")

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text_without_spaces.length

    @word_count = @text_split.count

    @occurrences = @text_split.count(@special_word)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @step_1 = @apr/(1200.0)

    @step_2 = @years*12

    @step_3 = @step_2*-1

    @step_4 = (1+@step_1)**@step_3

    @step_5 = @step_1/(1-@step_4)

    @step_6 = @step_5*@principal

    @monthly_payment = @step_6

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending-@starting
    @minutes = @seconds/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @days/365

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================
    a = [@numbers]

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max-@numbers.min

      @sorted = @numbers.sort
      @len = @sorted.length

    @median = (@sorted[(@len - 1) / 2] + @sorted[@len / 2]) / 2.0

    @sum = @numbers.sum

    @mean = @sum/@count

      def population_variance
            m = @mean
            sum = @numbers.inject(0){|accum, i| accum +(i-m)**2 }
            sum/(@numbers.length).to_f
          end

    @variance = population_variance

    @standard_deviation = Math.sqrt(@variance)

    @mode = 

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
