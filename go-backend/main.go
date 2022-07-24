package main

import (
	"go-backend/configs"
	"go-backend/routes"

	"github.com/gin-gonic/gin"
)

func main() {
	/*var loginService service.LoginService = service.StaticLoginService()
	var jwtService service.JWTService = service.JWTAuthService()
	var loginController controller.LoginController = controller.LoginHandler(loginService, jwtService)*/
	router := gin.Default()

	//server := gin.New()

	/*server.POST("/login", func(ctx *gin.Context) {
		token := loginController.Login(ctx)

		if token != "" {
			ctx.JSON(http.StatusOK, gin.H{
				"token": token,
			})
		} else {
			ctx.JSON(http.StatusUnauthorized, nil)
		}
	})*/

	configs.ConnectDB()

	routes.UserRoute(router)
	router.Run("localhost:6000")

	//port := "8080"
	//server.Run(":" + port)
}
