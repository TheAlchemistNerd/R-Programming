library("stringr")
alphabet <- paste (LETTERS, collapse = "")
substr(alphabet, 18:24)
# same as paste0()
str_c("Learning", "to", "use", "the", "stringr", "package")
str_c("Learning", "to", "use", "the", "stringr", "package", sep = " ")
# allows recycling
str_c (letters, " is for", ".")
# some text with NA
text = c ("Learning", "to", NA, "use", "the", NA, "stringr", "package")
# compare ` str_length ()` with ` nchar ()`
nchar (text)
str_length (text)
x <- "Learning to use the stringr package"
# alternative indexing
str_sub (x, start = 1, end = 15)
str_sub (x, end = 15)
str_sub (x, start = 17)
str_sub (x, start = c (1, 17), end = c (15, 35))
# using negative indices for start/end points from end of string
str_sub (x, start = -1)
str_sub (x, end = -21)
# Replacement
str_sub (x, end = 15) <- "I know how to use"
x

# character duplication
str_dup ("beer", times = 3)
str_dup ("beer", times = 1:3)

# use with a vector of strings
states_i_luv <- state.name[ c (6, 23, 34, 35)]
str_dup (states_i_luv, times = 2)