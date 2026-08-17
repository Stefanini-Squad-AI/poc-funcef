inherited frmVerificaMenuSAD: TfrmVerificaMenuSAD
  Left = 235
  Top = 142
  Caption = 'Verificação de Menu'
  ClientHeight = 514
  ClientWidth = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 581
    Height = 475
    object Label1: TLabel
      Left = 27
      Top = 21
      Width = 42
      Height = 13
      Caption = 'Módulo'
    end
    object Label2: TLabel
      Left = 27
      Top = 39
      Width = 165
      Height = 13
      Caption = 'Administração Previdenciária'
    end
    object pgCtrlVerificaMenu: TPageControl
      Left = 27
      Top = 63
      Width = 535
      Height = 403
      ActivePage = tbsResultado
      TabOrder = 0
      object tbsResultado: TTabSheet
        Caption = 'Resultado da Verificação'
        ImageIndex = 1
        object memResult: TMemo
          Left = 0
          Top = 0
          Width = 527
          Height = 375
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 475
    Width = 581
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Verificar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 391
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryModulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMODULO, NOMEMODULO'
      'FROM MODULO'
      'ORDER BY NOMEMODULO')
    ValidateWithMask = True
    Left = 33
    Top = 438
  end
  object dsFuncoes: TwwDataSource
    Left = 108
    Top = 480
  end
  object qryMenu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFUNCAO, NOMEFUNCAO'
      'FROM FUNCAO'
      'WHERE IDMODULO = :IDMODULO'
      'AND UPPER(NOMEFUNCAO) = UPPER(:NOMEFUNCAO)')
    ValidateWithMask = True
    Left = 345
    Top = 441
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOMEFUNCAO'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFUNCAO, NOMEFUNCAO'
      'FROM FUNCAO'
      'WHERE IDMODULO = :IDMODULO'
      ' ')
    ValidateWithMask = True
    Left = 180
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end>
  end
end
