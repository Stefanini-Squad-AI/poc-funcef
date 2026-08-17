inherited FrmParamSugestComp: TFrmParamSugestComp
  Left = 151
  Top = 155
  Caption = 'Sugestão de Compra'
  ClientHeight = 196
  ClientWidth = 431
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 431
    Height = 157
    object GrpAnalise: TGroupBox
      Left = 26
      Top = 22
      Width = 375
      Height = 88
      Caption = ' Analise de Estoque '
      TabOrder = 0
      object dblcAnalise: TCMDBLookupCombo
        Left = 15
        Top = 36
        Width = 343
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDANALISEESTOQUE'#9'10'#9'Nº da Análise'
          'DATAINICONSMED'#9'10'#9'Início'
          'DATAFIMCONSMED'#9'10'#9'Término')
        LookupTable = qryAnalise
        LookupField = 'IDANALISEESTOQUE'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object chkZero: TCheckBox
      Left = 24
      Top = 120
      Width = 361
      Height = 17
      Caption = 'Não Imprimir itens com sugestão de compras zero'
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 157
    Width = 431
    inherited tb97Fundo: TToolbar97
      Left = 257
      DockPos = 257
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 89
      DockPos = 89
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryAnalise: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      IDANALISEESTOQUE,'
      '      DATAINICONSMED,'
      '      DATAFIMCONSMED'
      'FROM'
      '    ANALISEESTOQUE'
      'WHERE'
      '            ((FLGACEITA <> '#39'S'#39')  OR (FLGACEITA IS NULL))'
      '   AND (CODALMOXARIFADO = :pCODALMOX)'
      '   AND (IDPESSOA = :pIDPESS)')
    ValidateWithMask = True
    Left = 361
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
end
