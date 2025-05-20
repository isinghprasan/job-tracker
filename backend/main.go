package main

import (
	"log"

	"github.com/isinghprasan/job-tracker/backend/config"
	"github.com/isinghprasan/job-tracker/backend/routes"
)

func main() {
	config.LoadEnv()

	r := routes.SetupRouter()

	err := r.Run()
	if err != nil {
		log.Fatal("Failed to start http server: ", err)
	}
}
