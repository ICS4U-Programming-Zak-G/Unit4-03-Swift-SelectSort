//
//  SelectSort.swift
//
//  Created by Zak Goneau
//  Created on 2025-04-15
//  Version 1.0
//  Copyright (c) 2025 Zak Goneau. All rights reserved.
//
//  This program sorts a file of integers using the selection sort algorithm

// Import library
import Foundation

// Define main function
func main() {

    // Introduce program
    print("This program sorts a file of integers using the selection sort algorithm")

    // Assign file names
    let inputFile = "input.txt"
    let outputFile = "output.txt"

    // Initialize output string
    var outputStr = ""

    // Try to read the input file
    guard let input = FileHandle(forReadingAtPath: inputFile) else {

        // Tell user input file couldn't be opened
        print("Couldn't open input file")

        // Exit function
        exit(1)
    }

    // Try to read the output file
    guard let output = FileHandle(forWritingAtPath: outputFile) else {

        // Tell user output file couldn't be opened
        print("Couldn't open output file")

        // Exit function
        exit(1)
    }

    // Read lines from input file
    let inputData = input.readDataToEndOfFile()

    // Convert data to string
    guard let inputString = String(data: inputData, encoding: .utf8) else {


        // Tell user couldn't convert data to string
        print("Couldn't convert data to string")

        // Exit function
        exit(1)
    }

    // Split string into lines
    let lines = inputString.components(separatedBy: "\n")

    // Initialize position in file
    var position = 0

    // Loop through lines
    while position < lines.count {
        // Get current line and trim whitespace
        let line = lines[position].trimmingCharacters(in: .whitespacesAndNewlines)

        // Split line into numbers
        var numbers = line.components(separatedBy: " ")

        // Perform selection sort
        for pass in 0..<numbers.count - 1 {
            // Assign minimum to first number
            var min = pass

            // Loop through array
            for index in pass + 1..<numbers.count {

                // Check if current element is less than min
                if (Int(numbers[index])! < Int(numbers[min])!) {

                    // Assign current element to minimum
                    min = index
                }
            }

            // Swap minimum with current element
            if (min != pass) {
                let temp: String = numbers[pass]
                numbers[pass] = numbers[min]
                numbers[min] = temp
            }
        }

        // Write sorted line to output string
        for counter in 0..<numbers.count {
            // Add number to output string
            outputStr += numbers[counter] + " "
        }

        // Add new line to output string
        outputStr += "\n"

        // Write to output file
        output.write(outputStr.data(using: .utf8)!)

        // Clear output string
        outputStr = ""

        // Increment the position
        position += 1
    }

    // Close files
    output.closeFile()
    input.closeFile()
}

// Call main
main()