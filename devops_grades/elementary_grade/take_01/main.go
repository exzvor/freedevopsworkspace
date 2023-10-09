//The utility reads the contents of each specified directory and displays information about each file inside.
//This information includes the file name, file size, and access mod.

package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strconv"
)

// readDir is for reading a directory and outputting files inside it
func readDir(directory string) error {
	fileInfos, err := os.ReadDir(directory)
	if err != nil {
		fmt.Printf("Failed to open directory %s: %v\n\n", directory, err)
		return err
	}

	for _, fileInfo := range fileInfos {
		fileInfoStr := formatFileInfo(fileInfo)
		fmt.Println(fileInfoStr)
	}
	return nil
}

// formatFileInfo is for formatting file information
func formatFileInfo(fileInfo os.DirEntry) string {
	info, err := fileInfo.Info()
	if err != nil {
		fmt.Println("Error occurred while obtaining file information: ", err)
		return "exit"
	}

	fileSize := strconv.FormatInt(info.Size(), 10)
	fileMode := info.Mode().String()
	fileName := info.Name()

	return fmt.Sprintf("%s %s %s", fileName, fileSize, fileMode)
}

// main is accepts command line arguments
func main() {
	if len(os.Args) < 2 {
		fmt.Println("It is necessary to specify directory names")
		return
	}

	for _, dir := range os.Args[1:] {
		absDir, err := filepath.Abs(dir)
		if err != nil {
			fmt.Printf("Failed to get an absolute path for %s: %v\n", dir, err)
			continue
		}

		err = readDir(absDir)
		if err != nil {
			fmt.Printf("Failed to read directory %s: %v\n", absDir, err)
			continue
		}
	}
}
