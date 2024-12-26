set files [glob -nocomplain -directory . *]
foreach fileCel $files {
	set fname [split [file tail $fileCel] "_"]
	set newName "[lindex $fname 0]_[lindex $fname 1]:1"
	file rename $fileCel $newName
}
