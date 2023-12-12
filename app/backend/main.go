package main

import (
	"database/sql"
	"fmt"
	"net/http"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

const (
	host     = "postgres_container_ip_address" // or container name "db" (in case of docker compose)
	port     = 5432
	user     = "postgres"
	password = "your_password"
	dbname   = "northwind"
)

func main() {
	// Create a Gin router
	router := gin.Default()

	// Add CORS middleware
	config := cors.DefaultConfig()
	config.AllowOrigins = []string{"http://your_server_ip"}                             // Replace with your actual frontend origin
	config.AllowMethods = []string{"GET", "POST", "OPTIONS"}                            // Add OPTIONS method
	config.AllowHeaders = []string{"Origin", "Content-Type", "Accept", "Authorization"} // Add necessary headers
	config.AllowCredentials = true                                                      // Allow credentials
	router.Use(cors.New(config))

	// Handle OPTIONS preflight requests
	router.OPTIONS("/", func(c *gin.Context) {
		c.Status(http.StatusOK)
	})

	// Handle GET request
	router.GET("/", func(c *gin.Context) {
		// Connect to the database
		db, err := sql.Open("postgres", fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
			host, port, user, password, dbname))
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		defer db.Close()

		// Execute a query on the table
		rows, err := db.Query("SELECT product_id, product_name FROM products")
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		defer rows.Close()

		// Collect data from the query result
		var data []map[string]interface{}
		for rows.Next() {
			var id int
			var name string
			// Add variables for each field in your table

			err := rows.Scan(&id, &name)
			if err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
				return
			}

			// Add data to the slice
			data = append(data, map[string]interface{}{
				"id":   id,
				"name": name,
			})
		}

		// Send data in the response
		c.JSON(http.StatusOK, gin.H{"data": data})
	})

	// Start the web server
	router.Run(":8080")
}
