# Write a function that accepts a square matrix (N x N 2D array) and returns the determinant of the matrix.

# How to take the determinant of a matrix -- it is simplest to start with the smallest cases:

# A 1x1 matrix |a| has determinant a.

# A 2x2 matrix [ [a, b], [c, d] ] or

# |a  b|
# |c  d|

# has determinant: a*d - b*c.

# The determinant of an n x n sized matrix is calculated by reducing the problem to the calculation of the determinants of n matrices ofn-1 x n-1 size.

# For the 3x3 case, [ [a, b, c], [d, e, f], [g, h, i] ] or

# |a b c|  
# |d e f|  
# |g h i|  

# the determinant is: a * det(a_minor) - b * det(b_minor) + c * det(c_minor) where det(a_minor) refers to taking the determinant of the 2x2 matrix created by crossing out the row and column in which the element a occurs:

# |- - -|
# |- e f|
# |- h i|  

# Note the alternation of signs.

# The determinant of larger matrices are calculated analogously, e.g. if M is a 4x4 matrix with first row [a, b, c, d], then:

# det(M) = a * det(a_minor) - b * det(b_minor) + c * det(c_minor) - d * det(d_minor)

# the tricky bit was getting a deep copy of the matrix array to work with
def determinant(matrix)
    raise ArgumentError if matrix.count != matrix.first.count
    case matrix.count
    when 1
      matrix.first.reduce(:*)
    when 2
      matrix[0][0] * matrix [1][1] - matrix[0][1] * matrix[1][0]
    else
      plus_minus = -1
      matrix.first.map.with_index do |el, idx|
        minor = Marshal.load(Marshal.dump(matrix))
        minor.delete_at(0)
        minor.each{|row| row.delete_at(idx)}
        total = el * determinant(minor)
      end.sum do |n|
        plus_minus = plus_minus * -1
        n * plus_minus
      end
    end
  end

# and there's this
Matrix[*matrix].det

# was going for this initially but why transpose
def determinant(matrix)
    return matrix.flatten[0] if matrix.count == 1
    matrix.shift.each_with_index.reduce(0) do |res, (val, idx)|
      mat = matrix.transpose
      mat.delete_at(idx)
      res + val * determinant(mat) * (-1)**idx
    end
end
