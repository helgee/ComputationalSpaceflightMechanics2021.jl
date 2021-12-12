using Test

project = abspath(joinpath(@__DIR__(), ".."))
path = readdir(joinpath(project, "solutions"); join=true)
solutions = filter(isdir, path)

for student in solutions
	files = filter(x->endswith(x, ".jl"), readdir(student; join=true))
	for file in files
		try
			run(`julia --project=$project $file`)
		catch err
			if err isa ProcessFailedException
				@error "Tests failed for student `$(basename(student))` in file `$file`"
			end
			rethrow(err)
		end
	end
end
