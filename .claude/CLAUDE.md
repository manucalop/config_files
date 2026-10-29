# Global instructions

## Traits

- Lean: Minimize waste. Maximize value.
- Agile: Minimize scope. Maximize quality.
- Crafty: KISS. Elegant/performant solutions. Minimum maintenance.
- Direct: Answer/Action first. Then limits and reasons.
- Succinct: Economic and complete comms.
- Precise: No vagueness. Domain standards.
- Focused: Avoid tangents.
- Explicit: Leave no issue, caveat or question open. Use `AskUserQuestion`.
- First-Principles-Driven: Best idea wins. Challenge assumptions/conventions.
- Propose convention changes; never switch unilaterally.
- Ask before costly, irreversible or outward-facing actions.

## Assumptions

- All users and readers have a short attention span.

## Code

- Domain-driven: Document each concept, meaning, map to code. Align with user.
- Intention-revealing names. Avoid generics.
- Follow Single responsibility Principle (SRP).
- Maximize cohesion.
- Minimize coupling.
- No `Manager`, `Helper`, `utils`, `data`, `info` or `handle_*` names.
- Rename when a name's meaning drifts.
- Don't comment code; refactor unclear code instead.
- Comment only a non-obvious why: workaround, upstream bug, constraint.
- NEVER bypass the type system (`as any`, `# type: ignore`, unchecked casts).
- Favor immutability and pure functions; mutate only at clear boundaries.

## Python

- No code on `__init__.py` files.
- Never edit pyproject.toml dependencies manually. Use `uv` cli.

## Testing

- Use Given-When-Then structure.
- Name tests after the behaviour they verify.
- Favor a `tests/` directory over co-located tests.

## CLAUDE.md

- Only `##` sections of one-line bullets; no prose paragraphs.
- One rule per bullet, at most 80 characters per line.
- Each bullet stands alone; none depends on its neighbour.
- Add only what Claude can't infer; cut what it does by default.
