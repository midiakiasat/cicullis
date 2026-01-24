# Scope

## Hard inclusions

- CI pipeline gating
- Deterministic policy enforcement
- Binary pass/fail verdicts
- Profile-driven rule execution

## Hard exclusions

- Code analysis
- Security scanning
- Quality metrics
- Report generation
- Notification systems
- Data persistence
- API endpoints
- User interfaces
- Authentication
- Multi-tenancy

## Boundary conditions

- stdin input only
- stdout output only
- Exit code is verdict
- No network calls
- No file system writes
- No environment mutation

## Non-goals

- General CI/CD framework
- Test runner
- Linting tool
- Dependency manager
- Build system
