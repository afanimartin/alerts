user = User.create(email: "developer@alerts.com",password:"123456",password_confirmation:"123456")

Alert.create({alert_type: "portal_opened",tag: ["verions2.3.9", "production"], description: "A portal was opened.", origin: "192.168.1.100", user_id: user.id})
