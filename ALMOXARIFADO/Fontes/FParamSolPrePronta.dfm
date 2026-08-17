inherited FrmParamSolPrePronta: TFrmParamSolPrePronta
  Left = 203
  Top = 167
  Caption = 'Solicitação Pré-Pronta'
  ClientHeight = 238
  ClientWidth = 394
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 394
    Height = 199
    object GroupBox1: TGroupBox
      Left = 23
      Top = 89
      Width = 349
      Height = 88
      Caption = ' Nº da Solicitação '
      TabOrder = 0
      object dblcSoli: TCMDBLookupCombo
        Left = 17
        Top = 36
        Width = 319
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NUMSOLCOMPRA'#9'10'#9'Nº  da Solicitação '
          'DATAENTREGA'#9'10'#9'Data de Entrega')
        LookupTable = qrySoli
        LookupField = 'NUMSOLCOMPRA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object RgSoli: TRadioGroup
      Left = 23
      Top = 18
      Width = 349
      Height = 58
      Caption = ' Utilizar solicitações '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Não impressas'
        'Já impressas')
      TabOrder = 1
      OnClick = RgSoliClick
    end
  end
  inherited Dock971: TDock97
    Top = 199
    Width = 394
    inherited tb97Fundo: TToolbar97
      Left = 224
      DockPos = 295
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 57
      DockPos = 128
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 3
  end
  object qrySoli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     NUMSOLCOMPRA,                   '
      '     DATAENTREGA,                    '
      '     IMPRESSO      '
      'FROM'
      '        SOLICOMP'
      'WHERE'
      '           ( IDPESSOA = :pIDPESS)'
      '  AND (CODALMOXARIFADO = :pCODALMOX)'
      '  AND (FLGPREPRONTA = '#39'S'#39')'
      '  AND (IMPRESSO = '#39'N'#39')'
      '')
    ValidateWithMask = True
    Left = 351
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end>
  end
end
