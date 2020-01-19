# Assignment -1 - Refactor the below example codes (30 Minutes)

# Example 1:
def get_addresses
    Address.joins(:user).where('city IS NOT NULL')
end

# Example 2:
class Greeting
    attr_accessor :name
end

# Example 3:
def sum(first_arg, *rest_args)
    rest_args.reduce(first_arg) { |first, rest| first + rest }
end