module Init_Test

using GLFW, FactCheck

facts() do

	@fact GLFW.Init() --> true

end	


facts() do
	
	window = GLFW.CreateWindow(640, 480, "GLFW.jl")
	@fact typeof(window) --> GLFW.Window
	GLFW.DestroyWindow(window)

end

#Initialize debugging window
facts() do

	GLFW.WindowHint(GLFW.OPENGL_DEBUG_CONTEXT, Cint(true))
	window = GLFW.CreateWindow(640, 480, "GLFW.jl")
	@fact typeof(window) --> GLFW.Window
	GLFW.DestroyWindow(window)

end
	
#Initialize with regular hints
facts() do

	GLFW.DefaultWindowHints()
	window = GLFW.CreateWindow(640, 480, "GLFW.jl")
	@fact typeof(window) --> GLFW.Window
	GLFW.DestroyWindow(window)

end

#Check OpenGL Versions
facts() do

	for i in [1,2]
		for j in [0,1]

			GLFW.WindowHint(GLFW.CONTEXT_VERSION_MAJOR, i)
			GLFW.WindowHint(GLFW.CONTEXT_VERSION_MINOR, j)
			GLFW.WindowHint(GLFW.OPENGL_FORWARD_COMPAT, convert(Cuint,0))
			GLFW.WindowHint(GLFW.OPENGL_PROFILE,GLFW.OPENGL_ANY_PROFILE)
			window = GLFW.CreateWindow(640, 480, "GLFW.jl")
			@fact typeof(window) --> GLFW.Window
			GLFW.DestroyWindow(window)

		end
	end


end

#Check OpenGL Versions
facts() do

	GLFW.WindowHint(GLFW.CONTEXT_VERSION_MAJOR, 3)
	GLFW.WindowHint(GLFW.CONTEXT_VERSION_MINOR, 0)
	GLFW.WindowHint(GLFW.OPENGL_FORWARD_COMPAT, convert(Cuint,0))
	GLFW.WindowHint(GLFW.OPENGL_PROFILE,GLFW.OPENGL_ANY_PROFILE)
	window = GLFW.CreateWindow(640, 480, "GLFW.jl")
	@fact typeof(window) --> GLFW.Window
	GLFW.DestroyWindow(window)
end

end


