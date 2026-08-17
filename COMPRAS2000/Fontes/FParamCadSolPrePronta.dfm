inherited FrmParamCadSolPrePronta: TFrmParamCadSolPrePronta
  Left = 165
  Top = 162
  Caption = 'Cadastro de Solicitação Pré-Pronta'
  ClientHeight = 153
  ClientWidth = 492
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 492
    Height = 114
    object GrpPre: TGroupBox
      Left = 18
      Top = 15
      Width = 454
      Height = 83
      Caption = ' Solicitação Pré-Pronta '
      TabOrder = 0
      object dblcSolPre: TCMDBLookupCombo
        Left = 16
        Top = 38
        Width = 421
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCSCPREPRONTA'#9'60'#9'Descrição'
          'IDSCPREPRONTA'#9'10'#9'Código')
        LookupTable = qrySolPre
        LookupField = 'IDSCPREPRONTA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 114
    Width = 492
    inherited tb97Fundo: TToolbar97
      Left = 260
      DockPos = 260
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 92
      DockPos = 92
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qrySolPre: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '          IDSCPREPRONTA,'
      '          DESCSCPREPRONTA'
      ''
      'FROM'
      '          SCPREPRONTA'
      'ORDER BY'
      '           DESCSCPREPRONTA'
      '          ')
    ValidateWithMask = True
    Left = 447
    Top = 12
  end
end
eDados'
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
    Params.Data = {
