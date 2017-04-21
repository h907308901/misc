require 'json'
require 'scanf'
require 'matrix'

class Matrix
  def []=(i,j,x)
    @rows[i][j]=x
  end
end

def min(a, b)
	if a < b
		a
	else
		b
	end
end

NODES = 30
# the adjacency matrix
$matadj = Matrix.build(NODES, NODES) {0}

# parse json data and store as adjacency matrix
f = open("json.txt", "r")
s = f.read
f.close
JSON.parse(s)["link"].each do |s|
	arr = s.scanf("%d-%d")
	$matadj[arr[0], arr[1]] = 1
	$matadj[arr[1], arr[0]] = 1
end

# the routing table
# $rt[id, dest] = element
$rt = Matrix.build(NODES, NODES) {nil}
# bandwidth: 0~9:500 10~19:300 20~29:150
$bandwidth = [500]*10 + [300]*10 + [100]*10
# score = W1*bandwidth-W2*hop
W1 = 1
W2 = 1

# msg:(0:dest, 1:next, 2:hop, 3: bandwidth)
# elements:(0:dest, 1:next, 2:hop, 3: bandwidth, 4:score)

# simulate one node receiving a message
def onrecv(id, msg)
	score = W1*msg[3]-W2*msg[2]
	e = $rt[id, msg[0]]
	return if e != nil && score <= e[4]
	$rt[id, msg[0]] = msg + [score]
	NODES.times do |i|
		if $matadj[id, i] > 0
			onrecv(i, [msg[0], id, msg[2] + 1, min($bandwidth[id], msg[3])])
		end
	end
end

# each node as an origin to send messages
NODES.times do |id|
	NODES.times do |i|
		if $matadj[id, i] > 0
			onrecv(i, [id, id, 1, $bandwidth[id]])
		end
	end
end

# print the routing table
NODES.times do |id|
	print "======================== ", id, " ========================\n"
	NODES.times do |i|
		arr = []
		NODES.times do |j|
			arr.push($rt[id, j][0]) if $rt[id, j][1] == i && $rt[id, j][0] != id
		end
		print arr.inspect.gsub(/\s/, ''), " -> ", i, "\n" if arr.size > 0
	end
end