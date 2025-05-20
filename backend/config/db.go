package config

import (
	"context"
	"log"
	"os"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
)

var DB *pgxpool.Pool

func ConnectToDB() {
	databaseUrl := os.Getenv("DATABASE_URL")
	if databaseUrl == "" {
		log.Fatal("DATABASE_URL is not set in environment")
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	pool, err := pgxpool.New(ctx, databaseUrl)
	if err != nil {
		log.Fatalf("Unable to create pgx pool: %v", err)
	}

	err = pool.Ping(ctx)
	if err != nil {
		log.Fatalf("Unable to connect to DB: %v", err)
	}

	DB = pool
	log.Println("Connected to PostgreSQL")
}
