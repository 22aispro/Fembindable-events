local function runBenchmark(name, iterations, func)
	for _ = 1, 100 do func() end

	local startTime = os.clock()
	for _ = 1, iterations do func() end
	local endTime = os.clock()

	local totalTime = endTime - startTime
	local timePerOp = totalTime / iterations

	print(string.format("%-40s | %7d | %7.4fs | %10s", name, iterations, totalTime, formatTime(timePerOp)))
end
