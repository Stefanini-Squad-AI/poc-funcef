(function () {
  if (typeof mermaid === 'undefined') return;
  mermaid.initialize({
    startOnLoad: true,
    theme: 'dark',
    themeVariables: {
      background: '#0f1419',
      primaryColor: '#1e2a3a',
      primaryTextColor: '#e7ecf3',
      primaryBorderColor: '#2d3a4d',
      lineColor: '#9aa8bc',
      secondaryColor: '#243044',
      tertiaryColor: '#1a2332'
    },
    securityLevel: 'loose',
    flowchart: { useMaxWidth: true, htmlLabels: true, curve: 'basis' },
    fontFamily: '"Segoe UI", Tahoma, Geneva, Verdana, sans-serif'
  });
})();
