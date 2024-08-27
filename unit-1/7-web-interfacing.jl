import HTTP, JSON

data = HTTP.request(
    "GET",
    "https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt"
)

shakespeare = String(data.body)
shakespwareWords = split(shakespeare)

jsonWords = HTTP.request(
    "GET",
    "https://raw.githubusercontent.com/" *
    "h-Klok/StatsWithJuliaBook/master/data/jsonCode.json"
)

parsedJsonDict = JSON.parse(String(jsonWords.body))
keywords = Array{String}(parsedJsonDict["words"])
numberToShow = parsedJsonDict["numToShow"]

wordCount = Dict([(x, count(w -> lowercase(w) == lowercase(x), shakespwareWords))
                for x in keywords])

sortedWordCount = sort(collect(wordCount), by=last, rev=true)
display(sortedWordCount[1:numberToShow])