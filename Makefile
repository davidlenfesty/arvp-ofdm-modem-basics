default:
	iverilog -s tb tb.v mux.v -o sim
	@echo ------- Output
	./sim