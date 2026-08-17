inherited frmAjusteSaldoLancamentoMT: TfrmAjusteSaldoLancamentoMT
  Left = 438
  Top = 183
  Caption = 'Ajuste de Saldo através de Lançamentos...'
  ClientHeight = 283
  ClientWidth = 375
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 375
    Height = 244
    object Label1: TLabel
      Left = 25
      Top = 26
      Width = 109
      Height = 13
      Caption = 'Informe o Alterador'
    end
    object Label2: TLabel
      Left = 27
      Top = 72
      Width = 134
      Height = 13
      Caption = 'Histórico Complementar'
    end
    object dblcAlterador: TwwDBLookupCombo
      Left = 25
      Top = 42
      Width = 323
      Height = 21
      DropDownAlignment = taLeftJustify
      LookupTable = Cds
      LookupField = 'DESCRICAO'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object psb: TProgressBar
      Left = 1
      Top = 226
      Width = 373
      Height = 17
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 2
    end
    object memo: TMemo
      Left = 26
      Top = 88
      Width = 321
      Height = 107
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object stb: TStatusBar
      Left = 1
      Top = 207
      Width = 373
      Height = 19
      Panels = <>
      ParentFont = True
      SimplePanel = True
      SimpleText = ' '
      UseSystemFont = False
    end
  end
  inherited Dock971: TDock97
    Top = 244
    Width = 375
    inherited tb97Fundo: TToolbar97
      Left = 203
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 34
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 291
    Top = 7
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 8
  end
  object SqlCds: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '    CODALTERADOR, DESCRICAO FROM TIPOALTERADOR'
      'WHERE'
      '    RECPAG = :pRECPAG'
      'ORDER BY DESCRICAO')
    ClientDataSet = Cds
    Left = 176
    Top = 16
  end
  object SqlAux: TCMSqlParams
    ClientDataSet = CdsAux
    Left = 296
    Top = 160
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 160
  end
  object SqlLancamentos: TCMSqlParams
    SQL.Strings = (
      'SELECT D.CODDOCUMENTO, '
      '       D.NODOCUMENTO,'
      '       D.COMPLDOCUMENTO,'
      '       P.RAZAOSOCIAL,'
      '       D.RECPAG,'
      
        '       round(SUM(DECODE(D.RECPAG,'#39'R'#39', DECODE(L.DEBCRE,'#39'D'#39',L.VALO' +
        'R,L.VALOR*-1), '
      '           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))),2) AS SALDO'
      'FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '
      '      (P.IDPESSOA = D.IDFORCLI) AND '
      '      (D.STATUS = '#39'2'#39') AND '
      '      (D.RECPAG = :RECPAG) AND '
      '      (D.OPERACAO <> '#39'10'#39') AND'
      '      (D.OPERACAO <> '#39'11'#39') AND'
      '      (D.OPERACAO <> '#39'1 '#39') '
      'GROUP BY D.CODDOCUMENTO, '
      '       D.NODOCUMENTO,'
      '       D.RECPAG,'
      '       D.COMPLDOCUMENTO,'
      '       P.RAZAOSOCIAL'
      
        'HAVING ABS(ROUND(SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)),2)' +
        ') < 0.1 AND'
      
        '       ROUND(SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)),2) <> ' +
        '0'
      '')
    ClientDataSet = CdsLancamentos
    Left = 120
    Top = 104
  end
  object CdsLancamentos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 104
  end
end
