# Design Decisions & Ambiguities

## Ambiguity 1: Thermal Status API for "Older Versions"
**Question**: The requirement stated: "Use PowerManager.getCurrentThermalStatus() (API 29+) or PowerManager.getThermalHeadroom() for older versions". However, `getThermalHeadroom()` is actually API 30+, while `getCurrentThermalStatus()` is API 29+. This created a contradiction where the "older version" method was actually newer.

**Options Considered**:
- **Option A**: Strictly follow the text and try to use `getThermalHeadroom` for older versions (impossible due to API level).
- **Option B**: Use `getCurrentThermalStatus` for API 29+ and implemented a custom battery-temperature based fallback for older versions.
- **Option C**: Use `getThermalHeadroom` for API 30+ (where available), `getCurrentThermalStatus` for API 29+, and a safe fallback (0) for anything below.

**Decision**: I chose **Option C**.

**Reasoning**: 
- It respects the *intent* of using the specific APIs mentioned (`getThermalHeadroom` and `getCurrentThermalStatus`).
- It provides a tiered approach to accuracy: Most accurate (Headroom/Status on new devices) -> Basic status (API 29) -> Fallback (API < 29).
- Using battery temperature as a proxy for thermal status (Option B) would be an assumption not supported by the prompt's request for specific APIs.

**Trade-offs**: Devices below API 29 will always show "None" (0) for thermal status unless a specific vendor API or battery temperature proxy was explicitly requested.

---

## Ambiguity 2: Backend Persistence & Platform
**Question**: The prompt asked for a persistent backend but allowed choices like SQLite or JSON.

**Decision**: The Flutter app is designed to be agnostic of the specific backend implementation, communicating via standard REST APIs. The provided backend implementation (if any) uses [Insert Backend Tech Here if Applicable, otherwise generic REST].

**Assumptions**: The backend is running and accessible at the base URL defined in the configuration. 

---

## Ambiguity 3: "Impossible" Data Values
**Question**: How to handle invalid sensor data (e.g., thermal value 5, battery 150%)?

**Decision**: Validation is enforced at multiple layers:
1. **Domain Layer**: Entities ensure data integrity before business logic processing.
2. **Backend**: The API rejects invalid data with 400 Bad Request.

**Trade-offs**: Stricter validation might reject some edge-case logs, but ensures data quality for analytics.
