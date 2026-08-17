UPDATE bfciariotitplan bf
SET tipoopcaoir = (
    SELECT pt.tipoopcaoir
    FROM partprevplan pt
    WHERE pt.idpessoa = bf.idtitular
      and pt.IDPESSJUR   = bf.IDPESSJUR
      AND pt.idplanoprev = bf.IDPLANOORIGEM
      and pt.SEQPROPOSTA = bf.SEQPROPOSTA
