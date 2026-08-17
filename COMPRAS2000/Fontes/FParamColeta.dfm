inherited FrmParamColeta: TFrmParamColeta
  Left = 192
  Top = 82
  Caption = 'Coleta de Preços'
  ClientHeight = 380
  ClientWidth = 423
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 423
    Height = 341
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 89
      Height = 13
      Caption = 'Nº do Processo'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 61
      Height = 13
      Caption = 'Cabeçalho'
    end
    object Label3: TLabel
      Left = 16
      Top = 160
      Width = 45
      Height = 13
      Caption = 'Rodapé'
    end
    object Label9: TLabel
      Left = 16
      Top = 256
      Width = 80
      Height = 13
      Caption = '1ª  Assinatura'
    end
    object Label10: TLabel
      Left = 16
      Top = 280
      Width = 80
      Height = 13
      Caption = '2ª  Assinatura'
    end
    object Label11: TLabel
      Left = 16
      Top = 304
      Width = 80
      Height = 13
      Caption = '3ª  Assinatura'
    end
    object dblcProc: TCMDBLookupCombo
      Left = 16
      Top = 32
      Width = 161
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
    object memCabec: TMemo
      Left = 16
      Top = 72
      Width = 393
      Height = 81
      MaxLength = 250
      TabOrder = 1
    end
    object memRodape: TMemo
      Left = 16
      Top = 176
      Width = 393
      Height = 73
      Lines.Strings = (
        '')
      MaxLength = 250
      TabOrder = 2
    end
    object EdAssinat1: TEdit
      Left = 104
      Top = 256
      Width = 305
      Height = 21
      TabOrder = 3
    end
    object EdAssinat2: TEdit
      Left = 104
      Top = 304
      Width = 305
      Height = 21
      TabOrder = 4
    end
    object EdAssinat3: TEdit
      Left = 104
      Top = 280
      Width = 305
      Height = 21
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 423
    inherited tb97Fundo: TToolbar97
      Left = 252
      DockPos = 252
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 84
      DockPos = 84
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65523
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
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
      'GROUP BY P.CODPROCESSO')
    Params.Data = {010001000B4944434F4D505241444F520006080000000000000000000100}
    ValidateWithMask = True
    Left = 376
    Top = 8
    object qryProcCODPROCESSO: TFloatField
      DisplayLabel = 'Nº do Processo'
      FieldName = 'CODPROCESSO'
      Origin = 'PROCESSO.CODPROCESSO'
    end
  end
end
