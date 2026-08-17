inherited frmSelEstOcorr: TfrmSelEstOcorr
  Left = 298
  Top = 144
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Estatística Médica'
  ClientHeight = 344
  ClientWidth = 432
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 432
    Height = 305
    BorderWidth = 2
    object rgFreq: TRadioGroup
      Left = 14
      Top = 8
      Width = 149
      Height = 46
      Caption = 'Frequência da Análise'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Mensal'
        'Anual')
      TabOrder = 0
      OnClick = spedAno1Change
    end
    object gbxFaixaData: TGroupBox
      Left = 170
      Top = 8
      Width = 249
      Height = 46
      Caption = 'Faixa de Anos'
      TabOrder = 1
      object Label1: TLabel
        Left = 123
        Top = 19
        Width = 8
        Height = 13
        Caption = 'a'
      end
      object spedAno1: TSpinEdit
        Left = 27
        Top = 16
        Width = 73
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnChange = spedAno1Change
      end
      object spedAno2: TSpinEdit
        Left = 156
        Top = 16
        Width = 73
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = spedAno1Change
      end
    end
    object rgSelTudo: TRadioGroup
      Left = 35
      Top = 65
      Width = 360
      Height = 45
      Caption = 'Comparar Ocorrências de'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos os Tipos'
        'A Selecionar')
      TabOrder = 2
      OnClick = rgSelTudoClick
    end
    object gbxOcorr: TGroupBox
      Left = 35
      Top = 113
      Width = 360
      Height = 184
      Caption = 'Ocorrências'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      Visible = False
      object dblcOcorr: TwwDBLookupCombo
        Left = 30
        Top = 21
        Width = 295
        Height = 21
        Hint = 'Informe Tipo(s) Desejado(s)'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRTIPOOCMED'#9'40'#9'DESCRTIPOOCMED')
        LookupTable = qryTabOcorr
        LookupField = 'CODTIPOOCMED'
        MaxLength = 5
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = False
        OnCloseUp = dblcOcorrCloseUp
      end
      object lstOcorr: TListBox
        Left = 30
        Top = 48
        Width = 295
        Height = 121
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
        OnKeyDown = lstOcorrKeyDown
      end
    end
  end
  inherited Dock971: TDock97
    Top = 305
    Width = 432
    inherited tb97Fundo: TToolbar97
      Left = 262
      DockPos = 262
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 94
      DockPos = 94
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 131
    Top = 187
  end
  object qryTabOcorr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from TIPOCMED order by DESCRTIPOOCMED')
    ValidateWithMask = True
    Left = 188
    Top = 187
  end
end
