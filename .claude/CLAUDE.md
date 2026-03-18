# CLAUDE.md — Global Coding Guidelines

Universal defaults for all projects. **Project-level CLAUDE.md files override these.**

## Coding Principles

- Understand existing code before modifying it — match surrounding style, patterns, and conventions.
- Prioritize clarity over cleverness. Readable code beats compact code. Three similar lines beat a premature abstraction.
- Favor immutability and pure functions. Mutate state only when necessary and at well-defined boundaries.
- Never bypass the type system (`as any`, `# type: ignore`, unchecked casts) — use proper types, imports, and patterns.
- Use descriptive, intent-based names (e.g., `ProcessPayment` not `PaymentService`). Only add comments to explain _why_, never _what_.
- Keep changes minimal and focused — don't refactor or "improve" beyond what the task requires (YAGNI).

## Architecture Defaults

These apply unless a project-level CLAUDE.md specifies otherwise.

- **Group by domain, then feature.** Co-locate all files for a feature (logic, data, UI, tests) in one directory.
- **Dependency direction is inward:** Business logic must not depend on infrastructure (frameworks, databases, HTTP). Invert dependencies at boundaries with interfaces/protocols.
- **Prefer composition over inheritance.** Combine small, focused components rather than building deep class hierarchies.
- **Validate at the edges:** Sanitize external input (user input, API responses, file contents) at entry points; enforce business rules in domain logic. Translate domain errors to transport errors only at the boundary.

## Error Handling

- Fail fast on programming errors (assertion failures, impossible states). Recover gracefully from expected failures (network, user input, external services).
- Never swallow exceptions silently — at minimum, log and re-raise or return a typed error.
- Prefer typed/structured errors over bare strings or generic exceptions.

## Testing

- Tests follow **Given-When-Then**: set up state, perform an action, assert the outcome.
- Name tests after the behavior they verify, not the method they call.
- Tests must be isolated — no shared mutable state, no dependency on execution order.
- Co-locate tests with the code they test.
- Mock at boundaries (external services, I/O), not internal logic. Prefer real implementations where feasible.

## Development Workflow

- **Test-driven bug fixes:** Write a failing test that reproduces the bug, then fix the code to make it pass.
- **Verify after changes:** Run the relevant tests and formatter/linter on changed files before considering work done.
- **Dead code cleanup:** After a change, check for unused code (imports, functions, variables, types). Ask before removing.
- **Small, reviewable changes:** Each commit should be a single logical change that can be reviewed independently.

## Dependencies

- Prefer the standard library before reaching for a third-party package.
- Pin dependency versions. Avoid floating ranges in production code.
- When adding a dependency, verify it is actively maintained, appropriately licensed, and free of known vulnerabilities.

## Security

- Never commit secrets, credentials, or API keys. Use environment variables or a secrets manager.
- Never log sensitive data (PII, tokens, passwords) — even at debug level.
- Use parameterized queries for any database access — never interpolate user input into queries.

## Conventions

- Commit style: [Conventional Commits](https://www.conventionalcommits.org/) — `feat:`, `fix:`, `docs:`, `test:`, `refactor:`, `chore:`, `ci:`, `perf:`, `build:` prefixes. No `Co-Authored-By` lines.
