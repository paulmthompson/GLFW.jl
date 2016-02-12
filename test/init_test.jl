module Init_Test

using GLFW, FactCheck

facts() do

	@fact GLFW.Init() --> true
	window = GLFW.CreateWindow(640, 480, "GLFW.jl")
	@fact typeof(window) --> GLFW.Window
end

end
