inherited frmParamIntegraFinContabil: TfrmParamIntegraFinContabil
  Top = 222
  Caption = 'Relatório de Integração Contábil'
  ClientHeight = 241
  ClientWidth = 379
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 379
    Height = 202
    object GroupBox1: TGroupBox
      Left = 12
      Top = 16
      Width = 353
      Height = 161
      Caption = 'Tipo de Investimento'
      TabOrder = 0
      object DbLkcTipoInvestimento: TwwDBLookupCombo
        Left = 15
        Top = 103
        Width = 326
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOINVEST'#9'40'#9'Descrição')
        LookupTable = QryBuscaTipoInvestimento
        LookupField = 'IDTIPOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        Enabled = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object rdgTipo: TRadioGroup
        Left = 14
        Top = 29
        Width = 325
        Height = 49
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Todos'
          'Somente um')
        TabOrder = 0
        OnClick = rdgTipoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 202
    Width = 379
    inherited tb97Fundo: TToolbar97
      Left = 209
      DockPos = 209
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 41
      DockPos = 41
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object QryBuscaTipoInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDTIPOINVEST, DESCTIPOINVEST'
      ''
      'FROM '#9'CM.TIPOINVEST'
      ''
      'WHERE IDTIPOINVEST IN (1,2,5,6,7,8) '
      ''
      'ORDER BY DESCTIPOINVEST')
    ValidateWithMask = True
    Left = 293
    Top = 148
  end
end
