# Design Decisions & Ambiguities

## Decision 1: Tech Stack Selection
**Question**: What technology stack should be used for the backend?

**Options Considered**:
- **Option A**: Python (Django/FastAPI)
- **Option B**: Node.js (Express) with TypeScript
- **Option C**: Go (Gin)

**Decision**: I chose **Option B**.

**Reasoning**: 
- TypeScript provides type safety, which mimics the strong typing of Dart/Flutter in the frontend, creating a consistent development experience.
- Long-term maintainability and rich open-source ecosystem of Node.js.
- Express is a minimalist framework that is easy to extend.

---

## Decision 2: Database Choice
**Question**: Which database to use for persistent storage?

**Options Considered**:
- **Option A**: MongoDB (NoSQL)
- **Option B**: PostgreSQL
- **Option C**: LibSQL / Turso (SQLite compatible)

**Decision**: I chose **Option C** (LibSQL / Turso).

**Reasoning**: 
- **Lightweight**: SQLite is extremely light and doesn't require running a separate heavy database server locally during initial dev.
- **Turso**: Provides a cloud-hosted SQLite experience (LibSQL), combining the ease of SQLite with the power of a distributed database.
- **Assignment Fit**: The requirement mentioned reliable persistent storage; SQLite is a robust embedded SQL engine.

---

## Decision 3: Architecture Pattern
**Question**: How to structure the codebase?

**Decision**: **Layered Architecture** (Controller -> Service -> Repository).

**Reasoning**:
- **Separation of Concerns**: 
  - `Controllers`: Handle HTTP requests, inputs, and responses.
  - `Services`: Contain business logic and validation.
  - `Repositories`: Handle direct database interactions.
- **Testability**: Makes unit testing strict and easier by allowing mocking of dependencies (e.g., mocking the repository when testing the service).

**Trade-offs**: Requires more boilerplate files compared to a simple MVC or monolithic handler approach, but pays off in scalability and maintainability.
