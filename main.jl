# Visualizing Fourier Series
using Plots;

# f(x) is a piece-wise linear function
# f(x) = 0 for -1/2 < x < -1/4
#        3 for -1/4 < x < 1/4
#        0 for 1/4 < x < 1/2
function f(x)
   if x < 1/4 && x > -1/4
      3
   else
      0
   end
end

my_plot = plot(range(-1/2, 1/2, length=100), f)

# The Fourier Series Representation of f(x) is :
# f(x) = 3/2 + 2*3/pi(coswt - 1/3 cos 3wt + 1/5 cos 5wt - 1/7 cos 7wt +...)

function get_a_n(n)
	val =  (6/(n*pi)) * sin((pi * n)/2)
end

function get_n_partial_sum(x)
   a_naught = 3/2
   result = 0
   for i = 1:500
       result +=  get_a_n(i) * cos(i * 2*pi * x)
    end
    return (result + a_naught)
end


my_fourier_plot = plot(range(-1/2, 1/2 , length=100), [f, get_n_partial_sum], ylims=(0, 5), label=["Original Function" "Fourier Representation"], title="Visualization of Fourier Series")
display(my_fourier_plot);
