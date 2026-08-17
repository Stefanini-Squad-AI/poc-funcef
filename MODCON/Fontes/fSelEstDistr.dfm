inherited frmSelEstDistr: TfrmSelEstDistr
  Left = 164
  Top = 164
  HelpContext = 760030
  Caption = 'Estatística da Distribuição dos Processos'
  ClientHeight = 325
  ClientWidth = 576
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 576
    Height = 286
    BorderWidth = 2
    object rgValor: TRadioGroup
      Left = 31
      Top = 10
      Width = 360
      Height = 46
      Caption = 'Valores'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Reclamados'
        'Estimados ou Reais')
      TabOrder = 0
    end
    object rgSelCargo: TRadioGroup
      Left = 31
      Top = 64
      Width = 360
      Height = 36
      Caption = 'Considerar'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'A Selecionar')
      TabOrder = 1
      OnClick = rgSelCargoClick
    end
    object gbxCargo: TGroupBox
      Left = 31
      Top = 100
      Width = 360
      Height = 175
      Caption = 'Cargos'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      Visible = False
      object dblcCargo: TwwDBLookupCombo
        Left = 30
        Top = 35
        Width = 295
        Height = 21
        Hint = 'Informe Tipo(s) Desejado(s)'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TITULO'#9'30'#9'TITULO')
        LookupTable = qryCargo
        LookupField = 'TITULO'
        MaxLength = 5
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = False
        OnCloseUp = dblcCargoCloseUp
      end
      object lstCargo: TListBox
        Left = 30
        Top = 61
        Width = 295
        Height = 108
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        Sorted = True
        TabOrder = 1
        OnKeyDown = lstCargoKeyDown
      end
      object cbxDemais: TCheckBox
        Left = 30
        Top = 15
        Width = 292
        Height = 17
        Caption = 'Inclui Não Selecionados como '#39'Demais Itens'#39
        TabOrder = 2
      end
      object lstCodCargo: TListBox
        Left = 33
        Top = 132
        Width = 40
        Height = 30
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
    end
    object rgDistribPor: TRadioGroup
      Left = 405
      Top = 10
      Width = 150
      Height = 262
      Caption = 'Distribuição Por'
      ItemIndex = 0
      Items.Strings = (
        'Cargos'
        'Estabelecimentos'
        'Segmentos'
        'Sindicatos'
        'Centros de Custo')
      TabOrder = 3
      OnClick = rgDistribPorClick
    end
  end
  inherited Dock971: TDock97
    Top = 286
    Width = 576
    inherited tb97Fundo: TToolbar97
      Left = 406
      DockPos = 414
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 239
      DockPos = 247
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  object ds: TwwDataSource
    Left = 201
    Top = 192
  end
  object qryCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT C.TITULO, C.IDCARGO AS CODIGO'
      'FROM CARGO C, FUNCIONARIO F'
      'WHERE F.IDCARGO = C.IDCARGO'
      'ORDER BY UPPER(TITULO)')
    ValidateWithMask = True
    Left = 294
    Top = 189
  end
end
