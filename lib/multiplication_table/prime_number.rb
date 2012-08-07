# utility class for checking and calculating prime numbers
class PrimeNumber

  def self.is_prime?(number)
    return false if number < 2

    (2..Math.sqrt(number)).each do |value|
      if number % value == 0
        return false
      end
    end
    true
  end

  # Calculates the first n primes
  def self.calculate_primes(n)
    primes = [2]
    candidate = 3

    while primes.length < n
      primes << candidate if is_prime?(candidate)
      candidate += 2
    end
    primes
  end

end