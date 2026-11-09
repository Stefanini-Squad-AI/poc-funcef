/* Blueprint AS-IS — filtro de tabelas (sem dependências externas). A documentação é legível sem JavaScript. */
(function () {
  function norm(s) { return (s || '').toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, ''); }
  document.querySelectorAll('input.filter[data-filter]').forEach(function (inp) {
    var t = document.getElementById(inp.getAttribute('data-filter'));
    if (!t) return;
    inp.addEventListener('input', function () {
      var q = norm(inp.value);
      t.querySelectorAll('tbody tr').forEach(function (tr) {
        tr.style.display = !q || norm(tr.textContent).indexOf(q) >= 0 ? '' : 'none';
      });
    });
  });
})();
