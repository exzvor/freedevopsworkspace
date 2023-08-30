package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"strconv"
)

// Функция для считывания директории и вывода файлов внутри неё
func ReadDir(directory string) error {
	fileInfos, err := ioutil.ReadDir(directory)
	if err != nil {
		fmt.Printf("Не удалось открыть директорию %s: %v\n", directory, err)
		return err
	}

	for _, fileInfo := range fileInfos {
		fileInfoStr := FormatFileInfo(directory, fileInfo)
		fmt.Println(fileInfoStr)
	}
	return nil
}

// Функция для форматирования информации о файле
func FormatFileInfo(directory string, fileInfo os.FileInfo) string {
	fileSize := strconv.FormatInt(fileInfo.Size(), 10)
	fileMode := fileInfo.Mode().String()
	fileName := fileInfo.Name()

	return fmt.Sprintf("%s %s %s", fileMode, fileSize, fileName)
}

// Основная функция, принимающая аргументы командной строки
func main() {
	if len(os.Args) < 2 {
		fmt.Println("Необходимо предоставить аргументы (папки).")
		return
	}

	for _, dir := range os.Args[1:] {
		absDir, err := filepath.Abs(dir)
		if err != nil {
			fmt.Printf("Не удалось получить абсолютный путь для %s: %v\n", dir, err)
			continue
		}
		ReadDir(absDir)
	}
}

//Утилита myls считывает содержимое каждого указанного каталога и отображает информацию о каждом файле внутри.
//Эта информация включает в себя мод доступа к файлу, его размер и имя.
