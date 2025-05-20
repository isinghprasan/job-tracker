package routes

import (
	"github.com/gin-gonic/gin"
	"github.com/isinghprasan/job-tracker/backend/handlers"
)

func SetupRouter() *gin.Engine {
	r := gin.Default()

	r.GET("/ping", handlers.HealthCheck)

	return r
}
