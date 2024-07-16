function onUpdateDatabase()
	print("> Updating database to version 37 (session tokens)")

	db.query([[
		CREATE TABLE IF NOT EXISTS `sessions` (
			`id` int NOT NULL AUTO_INCREMENT,
			`token` binary(16) NOT NULL,
			`account_id` int NOT NULL,
			`ip` varbinary(16) NOT NULL,
			`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
			`expired_at` timestamp NULL DEFAULT NULL,
			PRIMARY KEY (`id`),
			UNIQUE KEY `token` (`token`),
			FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
		) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;
	]])
	return true
end
