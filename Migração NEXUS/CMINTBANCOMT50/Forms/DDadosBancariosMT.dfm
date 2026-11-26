object DtmDadosBancariosMT: TDtmDadosBancariosMT
  OldCreateOrder = True
  Left = 37
  Top = 154
  Height = 479
  Width = 741
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
    Left = 224
    Top = 32
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
    Left = 176
    Top = 104
  end
  object CdsContaCor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 56
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
    Left = 48
    Top = 56
  end
  object CdsBuscaContaDocForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
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
    Left = 64
    Top = 112
  end
  object SqlBuscaCC: TCMSqlParams
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
    ClientDataSet = cdsBuscaCC
    Left = 72
    Top = 205
  end
  object SqlBuscaNumSeqArq: TCMSqlParams
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
    ClientDataSet = CDSBuscaNumSeqArq
    Left = 164
    Top = 165
  end
  object cdsBuscaCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 159
  end
  object CDSBuscaNumSeqArq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 172
    Top = 207
  end
end
