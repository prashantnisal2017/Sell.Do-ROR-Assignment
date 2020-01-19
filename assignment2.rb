=begin
#Assignment -2

  There is a User class and User class has a status attribute.
  Now that status attr can have so many values like active, inactive, pending, and
  so on.
  Implement the instance method such that I can call that method like below.
  @user.active?
  @user.inactive?
=end

class User
   attr_accessor :status

   def initialize
     @status = "active"
   end
   
   ["pending", "inactive","active"].each do |status|
      #Using define_method we can make the code DRY 
      define_method "#{status}?".to_sym do
        @status == status
      end
    end
    
    @user = User.new
    puts "@user.active?        :#{@user.active?}" 
    puts "@user.inactive?      :#{@user.inactive?}" 
    puts "@user.pending?       :#{@user.pending?}"
end
=begin

  Output: 
  @user.active?        :true
  @user.inactive?      :false
  @user.pending?       :false
  [Finished in 0.1s]
=end