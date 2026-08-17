inherited frmLerRegraContribEventoF: TfrmLerRegraContribEventoF
  Left = 176
  Top = 174
  Caption = 'Associar Reserva a Contibuição'
  ClientHeight = 205
  ClientWidth = 352
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 352
    Height = 166
    object gpRegra: TGroupBox
      Left = 8
      Top = 86
      Width = 335
      Height = 67
      TabOrder = 0
      object lbl4: TLabel
        Left = 9
        Top = 14
        Width = 206
        Height = 13
        Caption = 'Regra de Validação da Contribuição'
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
      object lblEvento: TLabel
        Left = 7
        Top = 34
        Width = 41
        Height = 13
        Caption = 'Evento'
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
    Top = 166
    Width = 352
    inherited tb97Fundo: TToolbar97
      Left = 180
      DockPos = 183
      inherited sep3: TToolbarSep97
        Left = 162
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 81
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 11
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
