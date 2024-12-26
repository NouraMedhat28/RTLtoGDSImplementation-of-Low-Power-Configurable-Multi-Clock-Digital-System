set files [glob -nocomplain -directory . *]
foreach fileCel $files {
	set fname [split [file tail $fileCel] "^%1"]
	set newName "[lindex $fname 0]:1"
	file rename $fileCel $newName
}
