inherited frmSelEstObj: TfrmSelEstObj
  Left = 271
  Top = 100
  Caption = 'Estatística de Objetos Reclamados nos Processos'
  ClientHeight = 387
  ClientWidth = 421
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 421
    Height = 348
    BorderWidth = 2
    object rgValor: TRadioGroup
      Left = 31
      Top = 6
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
    object rgSelTudo: TRadioGroup
      Left = 31
      Top = 56
      Width = 360
      Height = 63
      Caption = 'Selecionar Reclamações'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todas por Tipo'
        'Todas por Grupo'
        'A Selecionar Por Tipo'
        'A Selecionar Por Grupo')
      TabOrder = 1
      OnClick = rgSelTudoClick
    end
    object gbxObjeto: TGroupBox
      Left = 31
      Top = 164
      Width = 360
      Height = 175
      Caption = 'Objetos'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      Visible = False
      object dblcObjeto: TwwDBLookupCombo
        Left = 30
        Top = 35
        Width = 295
        Height = 21
        Hint = 'Informe Tipo(s) ou Grupo(s) Desejado(s)'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO')
        LookupTable = qryTipObj
        LookupField = 'DESCRICAO'
        MaxLength = 5
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
        OnCloseUp = dblcObjetoCloseUp
      end
      object lstObjeto: TListBox
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
        OnKeyDown = lstObjetoKeyDown
      end
      object cbxDemais: TCheckBox
        Left = 30
        Top = 15
        Width = 292
        Height = 17
        Caption = 'Inclui Não Selecionados como '#39'Demais Objetos'#39
        TabOrder = 2
      end
    end
    object gbxPercMin: TGroupBox
      Left = 31
      Top = 122
      Width = 360
      Height = 36
      TabOrder = 3
      object Label1: TLabel
        Left = 344
        Top = 13
        Width = 10
        Height = 13
        Caption = '%'
      end
      object cbxPercMin: TCheckBox
        Left = 10
        Top = 12
        Width = 287
        Height = 17
        Caption = 'Inclui como '#39'Demais Objetos'#39' os com menos de'
        TabOrder = 0
      end
      object spedPercMin: TSpinEdit
        Left = 300
        Top = 9
        Width = 40
        Height = 22
        MaxValue = 100
        MinValue = 0
        TabOrder = 1
        Value = 10
      end
    end
  end
  inherited Dock971: TDock97
    Top = 348
    Width = 421
    inherited tb97Fundo: TToolbar97
      Left = 251
      DockPos = 251
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
      DockPos = 83
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
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
  object qryTipObj: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODTIPOOBJETO, DESCRICAO  '
      'from TIPOOBJPROCTRAB '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 294
    Top = 189
  end
end
