# System Architecture

## High-Level Architecture

![Architecture](../images/high-level-architecture.png)

### Description

The platform follows a layered architecture designed for scalability and maintainability.

1. USDA datasets are imported into the Stage schema.
2. Cleaned data is loaded into the Public schema.
3. Views expose simplified datasets for application consumption.
4. Future services such as FastAPI and AI recommendation modules will consume the Public schema.

## Benefits

- Separation of raw and production data
- Easier debugging
- Repeatable ETL process
- Production-ready database design
