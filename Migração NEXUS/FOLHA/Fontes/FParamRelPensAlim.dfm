inherited FrmParamRelPensAlim: TFrmParamRelPensAlim
  Left = 163
  Top = 210
  HelpContext = 180097
  Caption = 'Relatório de Pensão Alimentícia por Favorecido'
  ClientHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 146
    inherited RdoTipoFiltro: TRadioGroup
      Visible = False
    end
    inherited PnlPreviaouEfetivada: TPanel
      Top = 40
      Height = 45
      inherited PnlMesPagto: TPanel
        Visible = False
      end
    end
    object grbPatrocinadora: TGroupBox
      Left = 1
      Top = 91
      Width = 409
      Height = 54
      Align = alBottom
      Caption = 'Patrocinadora'
      TabOrder = 3
      object cmbPatrocinadora: TwwDBLookupCombo
        Left = 4
        Top = 19
        Width = 389
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryPatrocinadora
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 146
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited qryPreviaouEfetivada: TwwQuery
    Left = 320
    Top = 5
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Left = 216
    Top = 5
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PAT.NOME, PAT.IDPESSOA'
      'FROM PESSOA PAT, PATRO'
      'WHERE PAT.IDPESSOA = PATRO.IDPESSOA'
      'ORDER BY PAT.NOME')
    ValidateWithMask = True
    Left = 243
    Top = 117
  end
end
