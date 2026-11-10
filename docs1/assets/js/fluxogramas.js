/* Renderiza os fluxogramas (blocos <pre class="fluxograma">) com Mermaid (cópia local em assets/js).
   Os blocos .mermaid antigos (texto livre/ASCII) não são processados — apenas .fluxograma. */
(function () {
  function render() {
    if (typeof mermaid === 'undefined') {
      document.querySelectorAll('pre.fluxograma').forEach(function (el) { el.classList.add('fluxograma-erro'); });
      return;
    }
    mermaid.initialize({
      startOnLoad: false,
      securityLevel: 'strict',
      theme: 'dark',
      flowchart: { htmlLabels: true, curve: 'basis', useMaxWidth: false },
      themeVariables: {
        background: '#0f1419', primaryColor: '#1e3a5f', primaryTextColor: '#e7ecf3',
        primaryBorderColor: '#3d9cf0', lineColor: '#9aa8bc', secondaryColor: '#243044',
        tertiaryColor: '#1a2332', fontFamily: '"Segoe UI", Tahoma, Geneva, Verdana, sans-serif', fontSize: '14px'
      }
    });
    var blocos = document.querySelectorAll('pre.fluxograma');
    blocos.forEach(function (el) { el.setAttribute('data-fonte', el.textContent); });
    mermaid.run({ nodes: blocos, suppressErrors: true }).catch(function () {}).then(function () {
      blocos.forEach(function (el) {
        if (!el.querySelector('svg')) {
          el.classList.add('fluxograma-erro');
          el.textContent = el.getAttribute('data-fonte');
        }
      });
    });
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', render);
  else render();
})();
