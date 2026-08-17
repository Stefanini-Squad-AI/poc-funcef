inherited frmnuminsc: Tfrmnuminsc
  Left = 197
  Top = 24
  Caption = 'Parâmetros Plano Previdenciário/Plano Assistencial'
  ClientHeight = 244
  ClientWidth = 372
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 372
    Height = 205
    object Label1: TLabel
      Left = 12
      Top = 119
      Width = 81
      Height = 13
      Caption = 'Número inicial'
      Visible = False
    end
    object Label2: TLabel
      Left = 12
      Top = 7
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object Label21: TLabel
      Left = 12
      Top = 159
      Width = 61
      Height = 13
      Caption = 'Calendário'
    end
    object Label3: TLabel
      Left = 12
      Top = 52
      Width = 104
      Height = 13
      Caption = 'Plano Assistencial'
    end
    object edNumInscInicial: TEdit
      Left = 12
      Top = 133
      Width = 169
      Height = 21
      TabOrder = 0
      Visible = False
    end
    object edPlanPrev: TEdit
      Left = 12
      Top = 23
      Width = 328
      Height = 21
      Color = cl3DLight
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBCBGeraAuto: TCheckBox
      Left = 12
      Top = 97
      Width = 341
      Height = 17
      Caption = 'Gerar Número de Inscrição automaticamente ?'
      TabOrder = 2
      OnClick = DBCBGeraAutoClick
    end
    object dblkpcmbCalend: TwwDBLookupCombo
      Left = 12
      Top = 173
      Width = 280
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Calendário')
      DataField = 'IDCALENDARIO'
      LookupTable = qryCalendario
      LookupField = 'IDCALENDARIO'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object edPlanAss: TEdit
      Left = 12
      Top = 68
      Width = 328
      Height = 21
      Color = cl3DLight
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 205
    Width = 372
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 347
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPlanPrevAss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      ' PLANPREVASS'
      'SET'
      ' FLGAUTONUMINSC = :FLGAUTONUMINSC,'
      ' NUMINSCINICIAL = :NUMINSCINICIAL,'
      ' IDCALENDARIO = :IDCALENDARIO'
      'WHERE'
      ' (IDPLANOPREV = :IDPLANOPREV) AND'
      ' (IDPLANASS = :IDPLANASS) AND'
      ' (IDPESSJUR = :IDPESSJUR)')
    ValidateWithMask = True
    Left = 265
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLGAUTONUMINSC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMINSCINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCALENDARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryCalendario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDCALENDARIO,NOME'
      'FROM'
      ' CALENDPREV'
      'ORDER BY UPPER(NOME)')
    ValidateWithMask = True
    Left = 280
    Top = 54
    object qryCalendarioNOME: TStringField
      DisplayLabel = 'Calendário'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryCalendarioIDCALENDARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCALENDARIO'
      Visible = False
    end
  end
end
