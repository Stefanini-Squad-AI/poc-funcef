inherited frmLerRegraContribReserva: TfrmLerRegraContribReserva
  Left = 335
  Top = 107
  Caption = 'Associar Reserva a Contibuição'
  ClientHeight = 287
  ClientWidth = 354
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 354
    Height = 248
    object gpConcessao: TGroupBox
      Left = 8
      Top = 86
      Width = 335
      Height = 141
      TabOrder = 0
      object lbl4: TLabel
        Left = 9
        Top = 52
        Width = 168
        Height = 13
        Caption = 'Regra de Cálculo da Reserva'
      end
      object Label1: TLabel
        Left = 9
        Top = 12
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object Label2: TLabel
        Left = 132
        Top = 34
        Width = 10
        Height = 13
        Caption = '%'
      end
      object Label3: TLabel
        Left = 9
        Top = 91
        Width = 202
        Height = 13
        Caption = 'Regra do Valor Máximo para Rateio'
      end
      object dblkpcmbRegraCalculoReserva: TwwDBLookupCombo
        Left = 9
        Top = 67
        Width = 304
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loColLines]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object edPercentual: TEdit
        Left = 9
        Top = 26
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object dblkpcmbValorRateio: TwwDBLookupCombo
        Left = 9
        Top = 106
        Width = 304
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra')
        LookupTable = qryRegra2
        LookupField = 'IDREGRA'
        Options = [loColLines]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 6
      Width = 335
      Height = 79
      TabOrder = 1
      object lblPlano: TLabel
        Left = 7
        Top = 14
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object lblReserva: TLabel
        Left = 7
        Top = 34
        Width = 48
        Height = 13
        Caption = 'Reserva'
      end
      object lblContribuicao: TLabel
        Left = 7
        Top = 54
        Width = 72
        Height = 13
        Caption = 'Contribuicao'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 354
    inherited tb97Fundo: TToolbar97
      Left = 183
      DockPos = 183
      inherited sep3: TToolbarSep97
        Left = 160
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 80
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 15
      DockPos = 15
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 288
    Top = 56
  end
  object qryRegra2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 270
    Top = 8
  end
end
