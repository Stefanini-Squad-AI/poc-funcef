object DtmDadosBancarios: TDtmDadosBancarios
  OldCreateOrder = True
  Left = 396
  Top = 332
  Height = 220
  Width = 452
  object MsContaCor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'CONTABANCARIA.CONTACORRENTE'
      'CONTABANCARIA.TIPOCONTA'
      'CONTABANCARIA.FLGCONTAPREF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome do Banco'
      'Num. Banco'
      'Num Agência'
      'Conta Corrente'
      'Tipo'
      'Preferencial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'BANCO'
      'AGENCIABANCARIA'
      'CONTABANCARIA')
    CamposChave.Strings = (
      'CONTABANCARIA.IDCBANCARIA'
      'CONTABANCARIA.CONTACORRENTE'
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'CONTABANCARIA.TIPOCONTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = BANCO.IDPESSOA'
      'AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA'
      'CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA'
      'CONTABANCARIA.IDPESSOA = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '10'
      '15'
      '15'
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 157
    Top = 6
  end
  object CdsBuscaContaDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 8
  end
  object SQLBuscaContaDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '       DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '       DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPO' +
        'CONTA,'
      '       C.CONTACORRENTE,'
      '       B.NUMBANCO,'
      '       A.NUMAGENCIA,'
      '       C.TIPOCONTA,'
      '       C.IDCBANCARIA,'
      
        '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOM' +
        'EAGENCIA,'
      
        '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOM' +
        'EBANCO,'
      '       B.MASCARACC,'
      '       B.MASCARAAGENCIA'
      'FROM'
      
        '   PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABA' +
        'NCARIA A, BANCO B'
      'WHERE'
      '   (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '   (C.IDAGENCIA = A.IDPESSOA)  AND'
      '   (A.IDBANCO   = B.IDPESSOA) AND'
      '   (A.IDPESSOA = PA.IDPESSOA) AND'
      '   (B.IDPESSOA = PB.IDPESSOA) AND'
      '   (D.IDCBANCARIA = C.IDCBANCARIA) ')
    ClientDataSet = CdsBuscaContaDoc
    Left = 112
    Top = 56
  end
  object CdsContaCor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 8
  end
  object SQLContaCor: TCMSqlParams
    SQL.Strings = (
      'SELECT DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '       DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '       DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPO' +
        'CONTA,'
      
        '       C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA, C' +
        '.IDCBANCARIA,'
      
        '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOM' +
        'EAGENCIA,'
      
        '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOM' +
        'EBANCO'
      
        'FROM PESSOA PA, PESSOA PB, CONTABANCARIA C, AGENCIABANCARIA A, B' +
        'ANCO B'
      'WHERE (C.IDPESSOA = :IDPESSOA)  AND'
      '      (C.FLGCONTAPREF = 1)       AND'
      '      (C.IDAGENCIA = A.IDPESSOA) AND'
      '      (A.IDBANCO   = B.IDPESSOA) AND'
      '      (A.IDPESSOA = PA.IDPESSOA) AND'
      '      (B.IDPESSOA = PB.IDPESSOA)'
      ' ')
    ClientDataSet = CdsContaCor
    Left = 64
    Top = 56
  end
  object CdsBuscaContaDocForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 8
  end
  object SQLBuscaContaDocForn: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '   DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '   DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPOCONT' +
        'A,'
      
        '   C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA, C.IDC' +
        'BANCARIA,'
      
        '   DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOMEAGE' +
        'NCIA,'
      
        '   DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOMEBAN' +
        'CO,'
      '   B.MASCARACC,'
      '   B.MASCARAAGENCIA'
      'FROM'
      
        '   PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABA' +
        'NCARIA A, BANCO B'
      'WHERE'
      '   (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '   (C.IDPESSOA = D.IDFORCLI)  AND'
      '   (C.FLGCONTAPREF = 1)       AND'
      '   (C.IDAGENCIA = A.IDPESSOA) AND'
      '   (A.IDBANCO   = B.IDPESSOA) AND'
      '   (A.IDPESSOA = PA.IDPESSOA) AND'
      '   (B.IDPESSOA = PB.IDPESSOA)'
      ' '
      '')
    ClientDataSet = CdsBuscaContaDocForn
    Left = 16
    Top = 56
  end
end
