inherited frmPrevC: TfrmPrevC
  Left = 278
  Top = 209
  Caption = 'PREV,C'
  ClientHeight = 406
  ClientWidth = 746
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 746
    Height = 367
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 744
      Height = 74
      Align = alTop
      TabOrder = 0
      object lblMatricula: TLabel
        Left = 16
        Top = 22
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object lblNome: TLabel
        Left = 205
        Top = 22
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object edtMatricula: TEdit
        Left = 76
        Top = 19
        Width = 121
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtNome: TEdit
        Left = 245
        Top = 18
        Width = 359
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object btnProcurar: TBitBtn
        Left = 616
        Top = 13
        Width = 113
        Height = 28
        Caption = '&Procurar'
        TabOrder = 2
        OnClick = btnProcurarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484848484FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF000000000000FFFFFFFFFFFFFFFFFF000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF000000FF00
          FFFF00FFFF00FFFF00FF000084FF00FFFF00FF848484FFFFFFFFFFFFFF0000FF
          0000FF0000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF000084000084
          FF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF0000
          00FF00FFFF00FFFF00FF000084000084000084FF00FF848484FFFFFFFFFFFFFF
          0000FF0000FF0000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF000084
          000084000084000000000000000000000000FFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFF000000FF00FFFF00FFFF00FF000084000000FFFF00FF00FFFFFF00FF
          00FF000000848400FF0000FFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF
          000000FFFF00FF00FFFFFF00FF00FFFFFF00FF00FF000000FFFFFFFFFFFFFFFF
          FF848484848484FF00FFFF00FFFF00FF000000FF00FFFFFF00FF00FFFFFF00FF
          00FFFFFF00000000FFFFFF848484848484FF00FFFF00FFFF00FFFF00FFFF00FF
          000000FFFF00FF00FFFFFF00FF00FFFFFF00FF00FF000000848484FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFFFF00FF00FFFFFF00FF
          00FFFFFF00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF000000FF00FFFFFF00FF00FFFFFF00000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
    object dbgrdPrevC: TwwDBGrid
      Left = 1
      Top = 75
      Width = 744
      Height = 291
      Selected.Strings = (
        'DTINICIO'#9'15'#9'Dt. Início'
        'DTFIM'#9'15'#9'Dt. Fim'
        'DESCTIPOASSOCIACAO'#9'35'#9'Tipo Associação'
        'PERCCONTRIB'#9'35'#9'%Pprev')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 367
    Width = 746
    inherited tb97Fundo: TToolbar97
      Left = 574
      DockPos = 574
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 155
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DTINICIO, DTFIM, '
      'NVL('
      'DECODE(TIPOASSOCIACAO, 1, '#39'REG/REPLAN'#39','
      '                       2, '#39'PREVHAB'#39','
      '                       3, '#39'REG/REPLAN - PADV'#39','
      '                       4, '#39'PREVHAB/PADV'#39','
      '                       5, '#39'REB 1998'#39','
      '                       6, '#39'REB PADV 1998'#39','
      '                       7, '#39'CANCELAMENTO A PEDIDO'#39','
      '                       8, '#39'CANCELAMENTO POR INADINPLÊNCIA'#39','
      '                       9, '#39'REINSCRICÃO REB'#39','
      '                       10, '#39'LICENCIADO REB'#39','
      '                       11, '#39'RESGATE DE CONTRIBUIÇÃO'#39','
      '                       12, '#39'ASSISTIDO'#39','
      '                       13, '#39'REB 2002'#39','
      '                       14, '#39'REB 2002 (PADV)'#39','
      '                       15, '#39'NOVO PLANO'#39','
      '                       16, '#39'NOVO PLANO origem saldado'#39','
      '                       17, '#39'REG/REPLAN SALDADO'#39','
      '                       20, '#39'AUTOPATROCÍNIO'#39','
      '                       21, '#39'BENEFÍCIO PROPORCIONAL DIFERIDO'#39','
      '                       22, '#39'PORTABILIDADE'#39','
      '                       23, '#39'NOVO PLANO - INCORPORAÇÃO REB'#39','
      
        '                       24, '#39'PERC NA DATA DO SALDAMENTO'#39'),'#39'Não Pa' +
        'rticpante'#39')'
      ' AS DESCTIPOASSOCIACAO, PERCCONTRIB'
      '  FROM PREVCAIXA'
      ' WHERE IDPESSOA = :IDPESSOA'
      ' ORDER BY DTINICIO DESC')
    ValidateWithMask = True
    Left = 224
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 360
    Top = 136
  end
  object MontaEmpregados: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME'
      'EL.MATRICULA'
      'P.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'ELEGPATRO EL'
      'PLANPREV PP')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'EL.MATRICULA'
      'P.NOME')
    Filtro.Strings = (
      'P.IDPESSOA = EL.IDPESSOA'
      'EL.IDPESSJUR = 91008')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '10'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 552
    Top = 160
  end
end
