inherited frmParamSoliComp: TfrmParamSoliComp
  Left = 222
  Top = 188
  Caption = 'Solicitação de Compra'
  ClientHeight = 253
  ClientWidth = 337
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 337
    Height = 214
    object Label1: TLabel
      Left = 16
      Top = 75
      Width = 64
      Height = 13
      Caption = 'Solicitação'
    end
    object Label2: TLabel
      Left = 159
      Top = 75
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object rgrpStatus: TRadioGroup
      Left = 16
      Top = 16
      Width = 305
      Height = 49
      Caption = ' Status '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Não Impresso'
        'Já Impresso')
      TabOrder = 0
      OnClick = rgrpStatusClick
    end
    object dblkcmbNumSoli: TwwDBLookupCombo
      Left = 16
      Top = 90
      Width = 129
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NUMSOLCOMPRA'#9'10'#9'Código')
      LookupTable = qryNumSoli
      LookupField = 'NUMSOLCOMPRA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblkcmbCentro: TwwDBLookupCombo
      Left = 159
      Top = 90
      Width = 162
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Deescrição'#9'F'
        'CODCENTROCUSTO'#9'10'#9'Código')
      LookupTable = qryCentro
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object chkResumida: TCheckBox
      Left = 16
      Top = 120
      Width = 153
      Height = 17
      Caption = 'Imprimir resumida'
      TabOrder = 3
    end
    object RgOrdem: TRadioGroup
      Left = 16
      Top = 144
      Width = 305
      Height = 49
      Caption = ' Ordem '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Alfabética'
        'Código')
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 214
    Width = 337
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
  end
  object qryNumSoli: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 280
    Top = 16
  end
  object qryCentro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT S.CODCENTROCUSTO,C.NOME'
      'FROM SOLICOMP S, CENTCUST C '
      'WHERE  '
      '    (S.IDPESSOA = 1)'
      'AND (C.IDEMPRESA = 1)'
      'AND (C.CODCENTROCUSTO = S.CODCENTROCUSTO)'
      'ortder by c.nome')
    ValidateWithMask = True
    Left = 208
    Top = 16
  end
end
