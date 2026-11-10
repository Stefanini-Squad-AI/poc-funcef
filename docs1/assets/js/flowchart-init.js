(function () {
  function init() {
    if (!window.mermaid) return;
    window.mermaid.initialize({
      startOnLoad: false,
      securityLevel: "loose",
      theme: "base",
      themeVariables: {
        primaryColor: "#1e2a3a",
        primaryTextColor: "#e7ecf3",
        primaryBorderColor: "#3d9cf0",
        lineColor: "#9aa8bc",
        secondaryColor: "#243044",
        tertiaryColor: "#1a2332",
        background: "#0f1419",
        mainBkg: "#1e2a3a",
        nodeBorder: "#3d9cf0",
        clusterBkg: "#1a2332",
        clusterBorder: "#2d3a4d",
        edgeLabelBackground: "#1a2332",
        fontFamily: '"Segoe UI", Tahoma, Geneva, Verdana, sans-serif'
      },
      flowchart: { htmlLabels: true, curve: "basis", padding: 12 }
    });
    var nodes = document.querySelectorAll(".mermaid");
    if (!nodes.length) return;
    var toRender = [];
    nodes.forEach(function (n) {
      if (n.getAttribute("data-processed") === "true") return;
      var src = n.textContent.trim();
      if (!src) return;
      if (/^flowchart\s/i.test(src) || /^graph\s/i.test(src)) {
        toRender.push(n);
      } else {
        n.classList.add("mermaid-text");
      }
    });
    if (!toRender.length) return;
    window.mermaid.run({ nodes: toRender }).catch(function () {});
  }
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
