#######################################################################

all : dot_prod.exe normalize_vec.exe

#######################################################################


dot_prod.exe: dot_prod.cpp
	g++ dot_prod.cpp -fopenmp -o dot_prod.exe

normalize_vec.exe: normalize_vec.cpp
		g++ normalize_vec.cpp -fopenmp -o normalize_vec.exe	

#######################################################################

clean :
	rm -f *.exe
