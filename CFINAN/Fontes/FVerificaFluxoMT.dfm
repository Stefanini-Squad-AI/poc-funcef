inherited frmVerificaFluxoMT: TfrmVerificaFluxoMT
  Left = 181
  Top = 167
  HelpContext = 90040
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Verificação de Montagem de Fluxo de Caixa'
  ClientHeight = 441
  ClientWidth = 722
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 722
    Height = 402
    object dbgdTipoRecDes: TwwDBGrid
      Left = 5
      Top = 33
      Width = 712
      Height = 303
      ControlType.Strings = (
        'SELECIONADO;CheckBox;S;N')
      Selected.Strings = (
        'SELECIONADO'#9'2'#9'Ok'#9'F'
        'DESCRICAO'#9'78'#9'Recebimento/Desembolso'#9'F'
        'RECPAG'#9'4'#9'Tipo'#9'F'
        'CODIGO'#9'9'#9'Código'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsTRDFaltantes
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnDblClick = dbgdTipoRecDesDblClick
      IndicatorColor = icBlack
    end
    object pnlTitulo: TPanel
      Left = 5
      Top = 5
      Width = 712
      Height = 28
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Tipos de Recebimento que ainda não fazem parte do Fluxo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 5
      Top = 336
      Width = 712
      Height = 61
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 2
      object rgModoInclusao: TRadioGroup
        Left = 473
        Top = 2
        Width = 237
        Height = 57
        Align = alClient
        Caption = 'Modo de Inclusão'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Inclui em uma Nova Linha'
          'Inclui em uma Linha já Existente')
        ParentFont = False
        TabOrder = 1
      end
      object rgTipo: TRadioGroup
        Left = 305
        Top = 2
        Width = 168
        Height = 57
        Align = alLeft
        Caption = 'Tipo de Receb./Desemb.'
        ItemIndex = 0
        Items.Strings = (
          'Analítico'
          'Sintético')
        TabOrder = 0
        OnClick = rgTipoClick
      end
      object rgFaltantes: TRadioGroup
        Tag = 1
        Left = 2
        Top = 2
        Width = 191
        Height = 57
        Align = alLeft
        Caption = 'Faltantes'
        ItemIndex = 0
        Items.Strings = (
          'Tipo de Rec/Des'
          'Tipo de Doc. Rec/Pag')
        TabOrder = 2
        OnClick = rgFaltantesClick
      end
      object rgOpRecPag: TRadioGroup
        Tag = 2
        Left = 193
        Top = 2
        Width = 112
        Height = 57
        Align = alLeft
        ItemIndex = 1
        Items.Strings = (
          'Recebimento'
          'Pagamento')
        TabOrder = 3
        OnClick = rgOpRecPagClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 722
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90040
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 659
    Top = 83
  end
  object dsTRDFaltantes: TDataSource
    DataSet = CdsTRDFaltantes
    Left = 152
    Top = 112
  end
  object CdsTRDFaltantes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 112
  end
  object spTesteMontFluxo: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   R.TipoR,'
      '   P.TipoP,'
      '   C.TipoC,'
      '   D.TipoD'
      'FROM'
      
        '   (SELECT Count(*) AS TipoR FROM MontaFluxo WHERE (TipoCalculo=' +
        #39'R'#39')) R,'
      
        '   (SELECT Count(*) AS TipoP FROM MontaFluxo WHERE (TipoCalculo=' +
        #39'P'#39')) P,'
      
        '   (SELECT Count(*) AS TipoC FROM MontaFluxo WHERE (TipoCalculo=' +
        #39'C'#39')) C,'
      
        '   (SELECT Count(*) AS TipoD FROM MontaFluxo WHERE (TipoCalculo=' +
        #39'D'#39')) D')
    ClientDataSet = cdsTesteMontFluxo
    Left = 56
    Top = 168
  end
  object cdsTesteMontFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 168
  end
end
