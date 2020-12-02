# Day 1: Report Repair ----

#read in data
x = read.delim("data/day1_input.txt", header = FALSE)

#function using two point apporach
fun = function(arr, col_num, target = 2020) {
    if (is.data.frame(arr)) {
        arr = arr[, col_num]
    }

    #sort array
    arr = sort(arr)

    #first index (R starts count at 1)
    i = 1

    #last index
    j = length(arr)

    #loop
    while (i < j) {
        curr_sum = arr[i] + arr[j]

        if (curr_sum == target) {
            return(
                cat("The two entries that sum to", target, "are", arr[i], "and",
                    arr[j], "and multiplying them produces", arr[i] * arr[j])
                )
        } else if (curr_sum < target) {
            i = i + 1
        } else if (curr_sum > target) {
            j = j - 1
        } else {
            stop("No values!")
        }
    }
}

#run function
fun(arr = x, col_num = 1, target = 2020)