class Oystercard

  #We can access the balance by calling subject.balance
  attr_accessor :balance, :in_journey, :maximum_balance, :MINIMUM_FARE, :entry_station, :exit_station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  #When creating a oystercard instance, the balance will be 0.
  def initialize(balance = 0)
    @balance = balance
    @in_journey
    @maximum_balance = MAXIMUM_BALANCE
    @journey_history = []
  end
  #When using the method 'top_up', it adds the argument to the balance to equal
  # to the current balance. It returns nil so it doesn't confuse the user/test.
  def top_up(money)
    @money = money
    raise "Maximum balance of #{maximum_balance} exceeded"  if maximum
    @balance += money
    return
  end

  def touch_in(entry_station)
    raise 'You need to top up your oyster!' if minimum
    @in_journey = true
    @entry_station = entry_station
    return "You are currently in #{entry_station}"
  end

  def touch_out(exit_station)
    @in_journey = false
    deduct
    @exit_station = exit_station
    @journey = {entry_station => exit_station}
    @journey_history.push(@journey)
  end

  def in_journey?
    #Double bang !! returns the opposite boolean value of the operand. ! = false ! = true.
    #It will turn the value into a boolean
    !!entry_station
  end


  private

  def minimum
    @balance < MINIMUM_BALANCE
  end

  def maximum
    @balance + @money > MAXIMUM_BALANCE
  end

  def deduct(money = MINIMUM_FARE)
    @balance -= money
  end
end
