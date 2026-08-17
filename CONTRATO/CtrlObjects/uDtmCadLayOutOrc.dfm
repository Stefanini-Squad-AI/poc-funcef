object DtmCadLayOutOrc: TDtmCadLayOutOrc
  OldCreateOrder = False
  Left = 229
  Top = 245
  Height = 323
  Width = 696
  object Qry: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDDESENHOORC,'
      '  IDRELATORC,'
      '  IDREPORTS,'
      '  ORIGEMCM,'
      '  FLGTIPOLAYOUT,'
      '  NOMELAYOUT'
      'FROM'
      '  DESENHOORC'
      'WHERE'
      '  ( IDDESENHOORC =: IDDESENHOORC )')
    Left = 16
    Top = 24
  end
  object qryRelatorio: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDRELATORC, NOMERELATORC '
      'FROM '
      '   RELATORC '
      'ORDER BY '
      '   NOMERELATORC')
    Left = 286
    Top = 24
  end
  object qryReports: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)')
    Left = 196
    Top = 24
  end
  object qryDemoColMes: TCMSqlParams
    SQL.Strings = (
      
        'SELECT                                                          ' +
        '                      '
      
        '   (0) AS R01_Janeiro, (0) AS R02_Fevereiro, (0) AS R03_Marco, (' +
        '0) AS R04_Abril,      '
      
        '   (0) AS R05_Maio, (0) AS R06_Junho, (0) AS R07_Julho, (0) AS R' +
        '08_Agosto,            '
      
        '   (0) AS R09_Setembro, (0) AS R10_Outubro, (0) AS R11_Novembro,' +
        ' (0) AS R12_Dezembro, '
      
        '   (0) AS SomaLinhaReal,                                        ' +
        '                      '
      
        '   (0) AS O01_Janeiro, (0) AS O02_Fevereiro, (0) AS O03_Marco, (' +
        '0) AS O04_Abril,      '
      
        '   (0) AS O05_Maio, (0) AS O06_Junho, (0) AS O07_Julho, (0) AS O' +
        '08_Agosto,            '
      
        '   (0) AS O09_Setembro, (0) AS O10_Outubro, (0) AS O11_Novembro,' +
        ' (0) AS O12_Dezembro, '
      '   (0) AS SomaLinhaOrc,'
      
        '   (0) AS AR01_Janeiro, (0) AS AR02_Fevereiro, (0) AS AR03_Marco' +
        ', (0) AS AR04_Abril,      '
      
        '   (0) AS AR05_Maio, (0) AS AR06_Junho, (0) AS AR07_Julho, (0) A' +
        'S AR08_Agosto,            '
      
        '   (0) AS AR09_Setembro, (0) AS AR10_Outubro, (0) AS AR11_Novemb' +
        'ro, (0) AS AR12_Dezembro,'
      '   (0) AS SomaLinhaAReal,'
      
        '   (0) AS AO01_Janeiro, (0) AS AO02_Fevereiro, (0) AS AO03_Marco' +
        ', (0) AS AO04_Abril,'
      
        '   (0) AS AO05_Maio, (0) AS AO06_Junho, (0) AS AO07_Julho, (0) A' +
        'S AO08_Agosto,'
      
        '   (0) AS AO09_Setembro, (0) AS AO10_Outubro, (0) AS AO11_Novemb' +
        'ro, (0) AS AO12_Dezembro,'
      '   (0) AS SomaLinhaAOrc,'
      '   R.FLGIMPRIMENEG AS FlagTipoNegativo,'
      
        '   ('#39'                                                           ' +
        '                   '#39') AS NomeContaInd,'
      
        '   C.NOMECONTAORCAMEN AS NomeConta, L.IDLINHASRELATORC AS NumLin' +
        'ha,'
      '   L.IDCONTAORCAMEN AS CodigoConta,'
      '   L.FLGINDENTACAO AS Indentacao, L.NUMDECIMAIS AS NumDecimais,'
      
        '   L.FLGTIPOLINHA AS FlagInterna1, C.FLGCONTAMONETARIA AS FlagMo' +
        'netaria,'
      
        '   ('#39' '#39') AS Linha1, ('#39' '#39') AS Linha2, ('#39' '#39') AS Linha3, ('#39' '#39') AS L' +
        'inha4,'
      '   ('#39'               '#39') AS PERIODO, ('#39'    '#39') AS EXERCICIO'
      'FROM'
      '   CONTASORCAMEN C, RELATORC R, LINHASRELATORC L'
      'WHERE'
      '   (C.IDCONTAORCAMEN = L.IDCONTAORCAMEN) AND'
      '   (C.IDPLANOORCAMEN = L.IDPLANOORCAMEN) AND'
      '   (R.IDRELATORC     = L.IDRELATORC)'
      '')
    Left = 106
    Top = 24
  end
  object qryDemoNormal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   (0) AS SaldoOrcPerEAT, (0) AS SaldoOrcAcumEAT, (0) AS SaldoRe' +
        'alPerEAT, (0) AS SaldoRealAcumEAT,'
      '   (0) AS SaldoRealPerEAN, (0) AS SaldoRealAcumEAN,'
      
        '   (0) AS SaldoRealAEAT, (0) AS SaldoRealAcumAEAT, (0) AS SaldoO' +
        'rcAEAT, (0) AS SaldoOrcAcumAEAT,'
      
        '   (0) AS AV_OrcPerEAT, (0) AS AV_OrcAcumEAT, (0) AS AV_RealPerE' +
        'AT, (0) AS AV_RealAcumEAT,'
      
        '   (0) AS AV_RealPerEAN, (0) AS AV_RealAcumEAN, (0) AS AV_OrcAEA' +
        'T, (0) AS AV_OrcAcumAEAT,'
      '   (0) AS AV_RealAEAT, (0) AS AV_RealAcumAEAT,'
      
        '   (0) AS DifOrcRealPerEAT, (0) AS DifOrcRealAcumEAT, (0) AS Dif' +
        'OrcRealPerEAN,'
      
        '   (0) AS DifOrcRealAcumEAN, (0) AS DifOrcRealAEAT, (0) AS DifOr' +
        'cReaAcumAEAT,'
      
        '   (0) AS AH_OrcRealPerEAT, (0) AS AH_OrcRealAcumEAT, (0) AS AH_' +
        'ExAtuAntPer,'
      '   (0) AS AH_PerAtuAntEAT, (0) AS AH_ExAtuAntAcum,'
      '   R.FLGIMPRIMENEG AS FlagTipoNegativo,'
      
        '   ('#39'                                                           ' +
        '                   '#39') AS NomeContaInd,'
      
        '   C.NOMECONTAORCAMEN AS NomeConta, L.IDLINHASRELATORC AS NumLin' +
        'ha,'
      
        '   L.IDCONTAORCAMEN AS CodigoConta, L.IDCONTAPARA100 AS CodigoCo' +
        'nta100,'
      '   L.FLGINDENTACAO AS Indentacao, L.NUMDECIMAIS AS NumDecimais,'
      
        '   L.FLGTIPOLINHA AS FlagInterna1, C.FLGCONTAMONETARIA AS FlagMo' +
        'netaria,'
      
        '   ('#39' '#39') AS Linha1, ('#39' '#39') AS Linha2, ('#39' '#39') AS Linha3, ('#39' '#39') AS L' +
        'inha4, '
      '   ('#39'               '#39') AS PERIODO, ('#39'    '#39') AS EXERCICIO'
      'FROM'
      '   CONTASORCAMEN C, RELATORC R, LINHASRELATORC L'
      'WHERE'
      '   (C.IDCONTAORCAMEN = L.IDCONTAORCAMEN) AND'
      '   (C.IDPLANOORCAMEN = L.IDPLANOORCAMEN) AND'
      '   (R.IDRELATORC     = L.IDRELATORC)'
      ''
      ''
      ' ')
    Left = 376
    Top = 24
  end
end
