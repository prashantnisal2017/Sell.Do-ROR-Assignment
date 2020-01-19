#Assignment -3

=begin

MP: Matches Played
W: Matches Won
D: Matches Drawn
L: Matches Lost
P: Points  
=end

class CricketTournament
  def match
                # mp|w |d |l |p
                # 0  1  2  3  4

    @ct = { "A"=>[0, 0, 0, 0, 0],
            "B"=>[0, 0, 0, 0, 0],
            "C"=>[0, 0, 0, 0, 0],
            "D"=>[0, 0, 0, 0, 0]}

     file='cricket_tournament.txt'
      File.readlines(file).each do |line|
        ls = line.split(';')
         @x = ls[0].split(" ")[1]
         @y = ls[1].split(" ")[1]
         @z = ls[2].delete!("\n")
          update_scoreboard(@x,@y,@z,@ct)
       end
      @ct.sort.to_h.sort_by {|_key, value| -value[4]}
    end

    def update_scoreboard(x,y,z,ct)
      ct[x][0] = ct[x][0] + 1   # match played +1 
      ct[y][0] = ct[y][0] + 1   # match played +1
        case z
        when "win"

        ct[x][4] = ct[x][4] + 3  # x gets 4 points
        ct[x][1] = ct[x][1] + 1  # x win  +1
        ct[y][3] = ct[y][3] + 1  # y loss +1  
        when "loss"
        ct[y][4] = ct[y][4] + 3  # y gets 3 point
        ct[y][1] = ct[y][1] + 1  # y win  +1
        ct[x][3] = ct[x][3] + 1  # x loss +1
      when "draw"
        ct[x][4] = ct[x][4] + 1  # x gets 1 point
        ct[y][4] = ct[y][4] + 1  # y gets 1 point
        
        ct[x][2] = ct[x][2] + 1  # x draw +1  
        ct[y][2] = ct[y][2] + 1  # y draw +1
        end
    end

    def print_output(result)
      puts "====================================="
      ["Team","mp","w ","d ","l ","p"].each { |e| print "#{e}  |" } 
      puts "\n-------------------------------------"
        result.each do |row|
          print "   #{row[0]}"
          row[1].each do |value|
            print "  | #{value}"
          end
        puts "\n"
        end
      puts "====================================="
    end
end

cricket_tournament = CricketTournament.new
result = cricket_tournament.match
cricket_tournament.print_output(result)


=begin

Output:
=====================================
Team  |mp  |w   |d   |l   |p  |
-------------------------------------
   A  | 3  | 2  | 1  | 0  | 7
   B  | 3  | 2  | 0  | 1  | 6
   C  | 3  | 1  | 0  | 2  | 3
   D  | 3  | 0  | 1  | 2  | 1
=====================================
=end