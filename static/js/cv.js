/* Cheese Violence — progressive enhancement only. The site is fully visible without JS,
   and content can NEVER be stranded hidden: hiding is applied by JS, and a fallback timer
   reveals everything even if IntersectionObserver never fires. */
(function () {
  "use strict";
  var els = [].slice.call(document.querySelectorAll(".row, .desk, .section-head, .post-hero"));
  if (!els.length) return;

  var reduce = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  if (reduce || !("IntersectionObserver" in window)) return; // leave fully visible

  // Only now do we opt elements into the animated state.
  els.forEach(function (el) { el.classList.add("cv-reveal"); });

  function reveal(el) { el.classList.add("cv-in"); }

  var io = new IntersectionObserver(function (entries) {
    entries.forEach(function (e) {
      if (e.isIntersecting) { reveal(e.target); io.unobserve(e.target); }
    });
  }, { rootMargin: "0px 0px -6% 0px", threshold: 0.04 });

  els.forEach(function (el) { io.observe(el); });

  // Safety net: reveal anything still hidden shortly after load, no matter what.
  setTimeout(function () { els.forEach(reveal); }, 700);
  window.addEventListener("load", function () {
    setTimeout(function () { els.forEach(reveal); }, 200);
  });
})();
