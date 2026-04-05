---
name: gui
description: Graphical user interface design. Applies to web design and app making (TypeScript and Svelte preferred).
---

Animations may only be used if connected to a user action (for example,
user clicks a button) or environmental state change (for example,
counter increase or message is received).

Treat the following as global styles (put in global css):

- Colors (defined as variables)
- Fonts, including size and styling
- Default spacing, including margins, padding, gaps (defined as variables)

Modularize the code eagerly, breaking out components both for large
site elements (for example header or settings) and small (for example
button or drop-down list).

Break out utility libraries for complex functionality (for example
audio or complex processing of user input).
