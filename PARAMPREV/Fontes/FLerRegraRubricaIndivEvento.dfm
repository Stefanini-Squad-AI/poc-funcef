inherited frmLerRegraRubricaIndivEvento: TfrmLerRegraRubricaIndivEvento
  Left = 176
  Top = 174
  Caption = 'Associar Rubricas ao Evento Gerador'
  ClientHeight = 247
  ClientWidth = 470
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 470
    Height = 208
    object gpRegra: TGroupBox
      Left = 8
      Top = 86
      Width = 454
      Height = 115
      TabOrder = 0
      object lbl4: TLabel
        Left = 9
        Top = 14
        Width = 179
        Height = 13
        Caption = 'Regra de Validação da Rubrica'
      end
      object Label1: TLabel
        Left = 9
        Top = 59
        Width = 165
        Height = 13
        Caption = 'Regra de Cálculo da Rubrica'
      end
      object dblkpcmbIDREGRAVALIDAASS: TwwDBLookupCombo
        Left = 9
        Top = 29
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
        OnChange = dblkpcmbIDREGRAVALIDAASSChange
      end
      object cmbRegraCalculo: TwwDBLookupCombo
        Left = 9
        Top = 74
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
        AllowClearKey = False
        OnChange = cmbRegraCalculoChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 6
      Width = 454
      Height = 79
      TabOrder = 1
      object lblPlano: TLabel
        Left = 7
        Top = 14
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object lblEvento: TLabel
        Left = 7
        Top = 34
        Width = 41
        Height = 13
        Caption = 'Evento'
      end
      object lblrubrica: TLabel
        Left = 7
        Top = 54
        Width = 45
        Height = 13
        Caption = 'Rubrica'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 208
    Width = 470
    inherited tb97Fundo: TToolbar97
      Left = 182
      DockPos = 182
      inherited sep3: TToolbarSep97
        Left = 160
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 80
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 14
      DockPos = 14
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 387
    Top = 75
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 267
    Top = 106
  end
end
