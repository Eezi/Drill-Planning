package routes

import (
	controller "go-backend/controllers"

	"github.com/gin-gonic/gin"
)

func UserRoute(router *gin.Engine) {
	router.POST("/user", controller.CreateUser())

	router.GET("/user/:userId", controller.GetUser())

	router.PUT("/user/:userId", controller.EditAUser())

	router.DELETE("/user/:userId", controller.DeleteAUser())
}
