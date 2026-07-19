# Nutrivia Food Data Platform

A PostgreSQL data platform for integrating, cleaning, and serving USDA FoodData Central datasets.

This project is designed as the backend data foundation for Nutrivia, a nutrition application capable of food search, nutrition analysis, health reporting, and future AI-powered food recommendations.

---

## High-Level Architecture

![High Level Architecture](docs/high_level_architecture.png)

This architecture shows the flow of data from raw USDA datasets through the staging and production layers to the application and analytics components.

---

## Database ER Diagram

![Database ER Diagram](docs/stage_schema.png)

The ER diagram shows the normalized relational schema for staging layer, including primary key and foreign key relationships between core entities.

---

## Project Goals

The objective of this project is to transform raw USDA datasets into a clean, normalized, and scalable database suitable for real-world applications.

The platform focuses on:

- Data quality
- Data consistency
- Normalized schema design
- Scalable ETL pipelines
- Scalable database architecture
- Food embeddings using pgVector

---

## Features

- Stage Layer for raw USDA data
- Transformation Layer for cleaned data
- Core Layer for simplified querying
- SQL Functions for querying


---

## Tech Stack

| Technology | Purpose |
|------------|---------|
| PostgreSQL | Database |
| Supabase | Database Hosting |
| SQL | Data Processing |
| pgVector | Embeddings generation |
| GitHub | Repository |

Future:

- FastAPI
- React
- AI Recommendation Engine

---


## Data Sources

Currently supported datasets:

- Foundation Foods
- SR Legacy

Planned:

- Branded Foods
- Survey Foods
- Open Food facts

---

## Database Design

The database follows a normalized relational model.

Major entities include:

- Foods
- Nutrients
- Food Nutrients
- Categories
- Foundation Foods
- SR Legacy Foods

---

## Documentation

Detailed documentation is available inside the **docs** directory.

- Architecture
- Database Schema
- Data Pipeline

---

## Roadmap

- USDA complete integration
- Food search optimization
- Vector embeddings
- Semantic food search
- AI recommendations
- FastAPI backend
- React frontend
- User food logging
- Nutrition analytics
- Health reports

---
