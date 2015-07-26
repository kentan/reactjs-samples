#require 'random'

template  = '[' +
    '{"company":"Itachi","price":"#{price}","sold":"14000","rank":"1"},' + 
 '{"company":"Shiba","price":"300","sold":"1200","rank":"2"}' +
']'

TEMPLATE = '{"company":"$NAME","price":"$PRICE","sold":"$SOLD","rank":"$RANK"}'

#puts data



def generate(size=100,limit=10)
    arr = []
    size.times {
        arr.push 100* (1 + rand(limit)) + rand(limit)
    }
    return arr
end

def convert(name,data)
    arr = []
    data.each do |d|
        arr.push TEMPLATE.sub("$NAME",name).sub("$PRICE",d.to_s)
    end
    return arr

end
    

name = "A"
arr = generate(10,10)
d1 = convert(name,arr)

name = "B"
arr = generate(10,10)
d2 = convert(name,arr)

while true
    10.times do |i|
        puts i
        str = "[#{d1[i]},#{d2[i]}]";
        puts str
        File.open("data.json", 'w') { |file| file.write(str) }
        sleep(2)
    end
end