inherited FrmResumoCot: TFrmResumoCot
  Left = 188
  Top = 128
  Caption = 'Resumo de Cotação'
  ClientHeight = 320
  ClientWidth = 393
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 393
    Height = 281
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Processo'
    end
    object dblcProc: TwwDBLookupCombo
      Left = 16
      Top = 32
      Width = 204
      Height = 21
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'CODPROCESSO'#9'10'#9'Processo')
      LookupTable = qryProc
      LookupField = 'CODPROCESSO'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 64
      Width = 361
      Height = 201
      Caption = ' Carimbos/Assinaturas '
      TabOrder = 1
      TabStop = True
      object Label1: TLabel
        Left = 14
        Top = 34
        Width = 21
        Height = 13
        Caption = '1º )'
      end
      object Label3: TLabel
        Left = 14
        Top = 67
        Width = 21
        Height = 13
        Caption = '2º )'
      end
      object Label5: TLabel
        Left = 14
        Top = 99
        Width = 21
        Height = 13
        Caption = '3º )'
      end
      object Label8: TLabel
        Left = 14
        Top = 132
        Width = 21
        Height = 13
        Caption = '4º )'
      end
      object Label10: TLabel
        Left = 14
        Top = 164
        Width = 21
        Height = 13
        Caption = '5º )'
      end
      object Edit1: TEdit
        Left = 40
        Top = 32
        Width = 305
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 40
        Top = 64
        Width = 305
        Height = 21
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 40
        Top = 96
        Width = 305
        Height = 21
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 40
        Top = 128
        Width = 305
        Height = 21
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 40
        Top = 160
        Width = 305
        Height = 21
        TabOrder = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 281
    Width = 393
    inherited tb97Fundo: TToolbar97
      Left = 223
      DockPos = 223
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 55
      DockPos = 55
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
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
      '      CODPROCESSO'
      'FROM'
      '      PROCESSO'
      'WHERE'
      '     (( STATUS = '#39'S'#39') Or (STATUS = '#39'O'#39') or (STATUS = '#39'F'#39' ))'
      '  AND(IDCOMPRADOR = :IDCOMPRADOR)   '
      'ORDER BY CODPROCESSO')
    ValidateWithMask = True
    Left = 245
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCOMPRADOR'
        ParamType = ptUnknown
      end>
    object qryProcCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PROCESSO.CODPROCESSO'
    end
  end
end
