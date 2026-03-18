# CLAUDE.md — Global Coding Guidelines

Universal defaults for all projects. **Project-level CLAUDE.md files override these.**

## Coding Principles

- Understand existing code before modifying it — match surrounding style, patterns, and conventions.
- Prioritize clarity over cleverness. Readable code beats compact code. Three similar lines beat a premature abstraction.
- Favor immutability and pure functions. Mutate state only when necessary and at well-defined boundaries.
- Never bypass the type system (`as any`, `# type: ignore`, unchecked casts) — use proper types, imports, and patterns.
- Prefer explicit over implicit — explicit dependencies, configuration, and error paths over magic or convention.
- Use descriptive, intent-based names (e.g., `calculate_tax` not `do_stuff`, `OrderProcessor` not `Manager`).
- Only add comments to explain _why_, never _what_.
- Keep changes minimal and focused — don't refactor or "improve" beyond what the task requires (YAGNI).
- Be aware of algorithmic complexity. Avoid unnecessary O(n²) or worse in loops, queries, and data transformations.

## Architecture Defaults

These apply to non-trivial projects unless a project-level CLAUDE.md specifies otherwise.

- **Group by domain, then feature.** Co-locate all files for a feature (logic, data, UI, tests) in one directory.
- **Dependency direction is inward:** Business logic must not depend on infrastructure (frameworks, databases, HTTP). Invert dependencies at boundaries with interfaces/protocols.
- **Prefer composition over inheritance.** Combine small, focused components rather than building deep class hierarchies.
- **Validate at the edges:** Sanitize and reject invalid external input (user input, API responses, file contents) at entry points with clear errors; enforce business rules in domain logic. Translate domain errors to transport errors only at the boundary.
- **Respect existing contracts:** When modifying public interfaces, consider existing consumers. Deprecate before removing.

## Error Handling

- Fail fast on programming errors (assertion failures, impossible states). Recover gracefully from expected failures (network, user input, external services).
- Don't use exceptions for control flow — reserve them for exceptional conditions. Use return values or result types for expected failures.
- Never swallow exceptions silently — at minimum, log and re-raise or return a typed error.
- Prefer typed/structured errors over bare strings or generic exceptions.
- Wrap errors with context when propagating — the caller needs to know what operation failed, not just the root cause.
- Log with context (request ID, entity ID, operation) — not just the error message.

## Testing

- Tests follow **Given-When-Then**: set up state, perform an action, assert the outcome.
- Name tests after the behavior they verify, not the method they call.
- Test behavior and contracts, not implementation details — assert on outputs and side effects, not internal state.
- Tests must be deterministic and isolated — no shared mutable state, no dependency on execution order, time, or external state.
- Co-locate tests with the code they test.
- Mock at boundaries (external services, I/O), not internal logic. Prefer real implementations where feasible.
- Default to unit tests. Use integration tests for boundaries (DB, APIs, file I/O). Reserve E2E for critical user flows.

## Development Workflow

- **Test-driven bug fixes:** Write a failing test that reproduces the bug, then fix the code to make it pass.
- **Verify after changes:** Run the relevant tests and formatter/linter on changed files before considering work done.
- **Dead code cleanup:** After a change, check for unused code (imports, functions, variables, types). Remove obviously dead code; ask before removing code that might have external consumers.
- **Small, reviewable changes:** Each commit should be a single logical change that can be reviewed independently.

## Dependencies

- Prefer the standard library before reaching for a third-party package.
- Pin dependency versions. Avoid floating ranges in production code.
- When adding a dependency, verify it is actively maintained, appropriately licensed, and free of known vulnerabilities.

## Security

- Never commit secrets, credentials, or API keys. Use environment variables or a secrets manager.
- Never log sensitive data (PII, tokens, passwords) — even at debug level.
- Use parameterized queries for any database access — never interpolate user input into queries.
- Avoid interpolating user input into shell commands, templates, or dynamic code — use safe APIs or allowlists.

## Conventions

- Commit style: [Conventional Commits](https://www.conventionalcommits.org/) — `type(scope): message`. Types: `feat`, `fix`, `docs`, `test`, `refactor`, `chore`, `ci`, `perf`, `build`.
- Branch naming: `type/short-description` (e.g., `feat/add-auth`, `fix/null-pointer`).
- Defer to the project's formatter/linter configuration. Do not manually reformat code outside the current change.
- Do not add `Co-Authored-By`, `Signed-off-by`, or similar trailers unless explicitly asked.

## Agent Behavior

- When a task is ambiguous, ask one clarifying question rather than guessing.
- Prefer editing existing files over creating new ones.
- After making changes, run the project's test/lint commands before reporting done.
- Do not explain what you are about to do — just do it. Explain only if the approach is non-obvious.
