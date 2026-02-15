# TODO

- [x] Improve folder structure.
- [x] Make `users/` users are currently supposed to be used for every host, but some users might have desktop-specific things like GNOME extensions. Figure out a way to prevent this.
- [x] Implement an actual module system (`options`).
- [x] Add like an option or something to `mkSystem` that tells which kind of a system we're building, e.g. laptop, desktop, server etc. and make some services like `sched-ext` only be enabled on only specified kinds.
- [ ] Some things aren't *core* but in `modules/core` anyway, e.g. `home-manager`. Check other categories too.
