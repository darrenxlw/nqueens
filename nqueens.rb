def solve_n_queens(n)
    sol = (0..n-1).to_a.map{|x| [x]}
    (n).step(n**2-1, n) do |i|
    	tmp=[]
    	t=[]
    	i.upto(i+n-1) do |j|
    		sol.each do |k|
    			unless k.any?{|x| x%n==j%n || (x%(n+1)==j%(n+1) && j%n > x%n) || (x%(n-1)==j%(n-1) && j%n < x%n)}
    				t=k+[j]
    				tmp << t
    			end
    		end
    	end
    	sol=tmp
    end
    out=[]
    sol.each do |s|
    	out << ("."*(n**2)).chars.map.with_index{|x,i| s.include?(i) ? "Q" : x }.join.scan(/.{#{n}}/)
    end
    return out
end

n=0
until n>0 && n<16
    puts "Input n for all solutions of the n queens problem (0<n<16)"
    n=gets.to_i
end

solutions=solve_n_queens(n)
print solutions.count.to_s+" possible solutions\n\n"
solutions.each_with_index do |s,i|
    puts "solution " + (i+1).to_s
    s.each do |r|
        print r + "\n"
    end
    puts nil
end
