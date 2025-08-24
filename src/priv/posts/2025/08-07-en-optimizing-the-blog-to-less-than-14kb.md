%{
title: "This Blog is Under 14kb",
author: "Fabricio Damazio",
tags: ~w(elixir),
description: "Optimizing a Phoenix framework app to load really fast."
}
---
Yesterday I watched [this video ↗](https://www.youtube.com/watch?v=ciNXbR5wvhU)
{: target="_blank" .font-medium .text-pink-800 } where Primeagen explains how 
pages smaller than 14kB can load faster than a 15kB one (video based on 
[this post ↗](https://endtimes.dev/why-your-website-should-be-under-14kb-in-size/){: target="_blank" .font-medium .text-pink-800 }).


After watching it, I started thinking about ways to optimize this blog's loading. It's a standard Elixir application using Phoenix Framework without any optimizations.


# The Before

First, I'll access the blog with cache disabled and note the response sizes to compare before and after.

Request response:

    html        (3.04kB)
     app.js      (39.26kB)
     app.css     (6.64kB)
     br_flag.svg (2.81kB)
     us_flag.svg (702B)
     cn_flag.svg (722B)
     favicon.ico (468B)

Total: 53.64kB received.
Not bad for a standard app, but with room for improvement.

# Removing app.js

First optimization: remove the default app.js file that comes with Phoenix. 
This file contains JavaScript for LiveView, event handling like phx-click, and hooks. 
I don't need any of that. The blog is just a static site that renders markdown posts as HTML.

After removal:

    html        (3.02 kB)
     app.js      (0 kB) - removed
     app.css     (6.64 kB)
     br_flag.svg (2.81 kB)
     us_flag.svg (702 B)
     cn_flag.svg (722 B)
     favicon.ico (468 B)

Total: 14.36kB received.
A huge improvement, but not enough yet.

# Optimizing Tailwind

I hate writing CSS, so I kept Tailwind.
In a Phoenix app, we can configure Tailwind by editing tailwind.config.js. 
Removing unused plugins and core components seems like a good idea. 
The config file now looks like:
```js
module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/site_web.ex",
    "../lib/site_web/**/*.*ex"
  ],
  corePlugins: {
    float: false,
    animation: false,
    gradient: false,
    filter: false,
    backdropFilter: false,
    ringWidth: false,
    skew: false,
    rotate: false,
    translate: false,
  },
  plugins: []
```

After these changes, the generated CSS is smaller:

    html        (3.02 kB)
     app.css     (4.60 kB)
     br_flag.svg (2.81 kB)
     us_flag.svg (702 B)
     cn_flag.svg (722 B)
     favicon.ico (468 B)

Total: 12.32kB received. Already incredibly fast.

# CSS and SVG Preload

To improve loading time, I configured CSS preloading. This allows parallel CSS 
loading and optimizes metrics like LCP (Largest Contentful Paint) for faster 
content rendering and CLS (Cumulative Layout Shift) to prevent layout jumps. 
Just needed to add:

```html
<link
  rel="preload"
  href={~p"/assets/app.css"}
  as="style"
  ...
/>
```

Now, the flags...

Unicode uses "tag sequences" to represent flags. This would allow implementing 
language flags using just emojis, without images or SVGs.

Unfortunately, testing revealed Windows doesn't natively support flag emojis (thanks Microsoft!). 
The solution was using SVGs with preload.

# Simplifying Brazil's Flag

The 2.81kB Brazil flag SVG seemed excessive. For such a small icon, some details 
can be omitted. After optimization, the flag is now just 698B.

# The After

After final CSS class improvements, here are the results (BEFORE/AFTER):

    html        (3.04 kB → 2.48 kB)    (-18%)
     app.js      (39.26 kB → 0 kB)      (-100%)
     app.css     (6.64 kB → 3.95 kB)    (-40%)
     br_flag.svg (2.81 kB → 698 B)      (-75%)
     us_flag.svg (702 B → 702 B)        (0%)
     cn_flag.svg (722 B → 722 B)        (0%)
     favicon.ico (468 B → 468 B)        (0%)
     -----------------------------------------
     TOTAL:     53.64 kB → 9.02 kB      (-83%)

There's still room for more optimizations, but I'll stop here for now.

These optimizations made the blog ridiculously small.
Currently, the total size of all files received in the first request is about 9kB compressed.

This is without any caching. After the first visit with CSS and SVG cached, the blog sends just 2.48kB and responds in under 30ms on average.

Fast, really fast.

---

*Note: AI-assisted translation, human-reviewed. Feedback welcome.*
