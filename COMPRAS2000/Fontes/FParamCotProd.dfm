inherited FrmParamCotProd: TFrmParamCotProd
  Left = 107
  Top = 199
  Caption = 'Cotação por Produto'
  ClientHeight = 117
  ClientWidth = 362
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 362
    Height = 78
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 89
      Height = 13
      Caption = 'Nº do Processo'
    end
    object dblcProc: TCMDBLookupCombo
      Left = 24
      Top = 32
      Width = 177
      Height = 21
      DropDownAlignment = taLeftJustify
      LookupTable = qryProc
      LookupField = 'CODPROCESSO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 78
    Width = 362
    inherited tb97Fundo: TToolbar97
      Left = 192
      DockPos = 192
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 24
      DockPos = 24
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65531
  end
  object qryProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'P.CODPROCESSO'
      'FROM'#9
      #9'COTACOES C,'
      '      PROCESSO P     '
      'WHERE'
      '       (P.IDCOMPRADOR = :IDCOMPRADOR)'
      '   AND (P.CODPROCESSO = C.CODPROCESSO)    '
      'GROUP BY P.CODPROCESSO'
      'ORDER BY P.CODPROCESSO')
    ValidateWithMask = True
    Left = 240
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCOMPRADOR'
        ParamType = ptUnknown
      end>
    object qryProcCODPROCESSO: TFloatField
      DisplayLabel = 'Nº do Processo'
      FieldName = 'CODPROCESSO'
      Origin = 'PROCESSO.CODPROCESSO'
    end
  end
end
