---
paths:
  - 'src/app/**'
---

<!-- Loads only when Claude touches the routing layer. Layer map is in architecture.md. -->

# Routing — the `app/` layer

`app/` defines routes and composes features into pages. The mental model is
**smart vs dumb components**:

- **Smart (the page / container):** owns data fetching and orchestration — it fetches,
  decides layout, wires things to the route, and passes data down.
- **Dumb (feature components):** presentation only, reusable, no data access of their own.

The page is the smart layer for the route; domain UI and business rules stay in `features/`.

## A page CAN

- Define the route and its layout, and compose feature components.
- Fetch data (as the smart container) through the **feature's data layer**
  (its hooks), then pass results down as props.
- Hold orchestration logic — what to render, how to arrange features, route `params`/`searchParams`.

## A page should NOT

- Reach into raw data access — no direct HTTP client / scattered `fetch` in `app/`.
  Data access goes through the feature's hooks.
- Implement domain **business rules** — those belong in the feature.
- Render complex domain UI inline — compose a dumb feature component instead.

## Server vs Client

- Server Components are the default; `'use client'` lives at interactive leaves.
- Interactive state (forms, wizards, toggles) lives in client components inside features.
- Pattern: page (server) fetches → passes data to client children as props.

## Conventions on top of native Next.js

Native files (`layout.tsx`, `loading.tsx`, `error.tsx`, `not-found.tsx`) and route groups
follow standard Next.js behavior. Our conventions on top:

- **`page.tsx` exists only when its feature is implemented** — no stubs / placeholder pages.
- **Routes with no frontend are handled by `not-found.tsx`** — never an empty `page.tsx`.
- Use route groups `(group)/` to separate zones:
  - `(authenticated)/` — routes behind the auth guard
  - `(unauthenticated)/` — public routes (sign-in, etc.)

## Proxy (not middleware)

**Next.js 16 renamed `middleware.ts` → `proxy.ts`** in this project. The auth guard lives
in `src/proxy.ts` — not `src/middleware.ts`. Never create a `middleware.ts` file; the
framework picks up `proxy.ts` via the exported `config.matcher`.

## See also

- `architecture.md` — layer map and import boundaries
- `features.md` — what a feature exports for pages to consume
- `data-fetching.md` — how data-fetching hooks are written
