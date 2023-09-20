//Утилита считывает содержимое каждого указанного каталога и отображает информацию о каждом файле внутри.
//Эта информация включает в себя имя файла, его размер и мод доступа.

package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strconv"
)

// Функция для считывания директории и вывода файлов внутри неё
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

// Функция для форматирования информации о файле
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

// Основная функция, принимающая аргументы командной строки
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
