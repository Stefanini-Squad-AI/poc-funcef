inherited frmLerRegraBenefReserva: TfrmLerRegraBenefReserva
  Left = 176
  Top = 174
  Caption = 'Associar Reserva ao Benefício'
  ClientHeight = 240
  ClientWidth = 353
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 353
    Height = 201
    object gpConcessao: TGroupBox
      Left = 8
      Top = 86
      Width = 335
      Height = 103
      TabOrder = 0
      object lbl4: TLabel
        Left = 9
        Top = 58
        Width = 188
        Height = 13
        Caption = 'Regra p/ Abatimento de Reserva'
      end
      object Label1: TLabel
        Left = 9
        Top = 12
        Width = 55
        Height = 13
        Caption = 'N° Ordem'
      end
      object dblkpcmbRegraAbateReserva: TwwDBLookupCombo
        Left = 9
        Top = 73
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
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkpcmbRegraAbateReservaChange
      end
      object edNumOrdem: TEdit
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
        TabOrder = 1
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
      object lblBeneficio: TLabel
        Left = 7
        Top = 54
        Width = 56
        Height = 13
        Caption = 'Benefício'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 201
    Width = 353
    inherited tb97Fundo: TToolbar97
      Left = 183
      DockPos = 187
      inherited sep3: TToolbarSep97
        Left = 160
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 80
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 16
      DockPos = 19
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
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
    Left = 267
    Top = 152
  end
end
