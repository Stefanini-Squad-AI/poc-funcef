inherited frmReplicarPeriodo: TfrmReplicarPeriodo
  Left = 303
  Top = 189
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Replicar Período de Agendamento'
  ClientHeight = 181
  ClientWidth = 347
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 347
    Height = 142
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 125
      Height = 13
      Caption = 'Grupo de Atendentes:'
    end
    object Label2: TLabel
      Left = 8
      Top = 96
      Width = 70
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label3: TLabel
      Left = 217
      Top = 96
      Width = 70
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 329
      Height = 28
      AutoSize = False
      Caption = 
        'Indique o Grupo de Atendentes e o Período para os quais você des' +
        'eja copiar os horários atualmente selecionados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object cmbGrupoAtendentes: TwwDBLookupCombo
      Left = 8
      Top = 64
      Width = 329
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição'#9'F')
      DataField = 'IDGRUPOATENDE'
      DataSource = ds
      LookupTable = cdsGrupoAtendentes
      LookupField = 'IDGRUPOATENDE'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbdtDtInicial: TwwDBDateTimePicker
      Left = 8
      Top = 112
      Width = 120
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DATAINICIO'
      DataSource = ds
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dbdtDtFinal: TwwDBDateTimePicker
      Left = 217
      Top = 112
      Width = 120
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DATAFIM'
      DataSource = ds
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  inherited Dock971: TDock97
    Top = 142
    Width = 347
    inherited tb97Fundo: TToolbar97
      Left = 175
      inherited bbtnSair: TBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 6
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 155
    Top = 99
  end
  object cdsGrupoAtendentes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDGRUPOATENDE'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftMemo
        Size = 500
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 273
    Top = 48
    object cdsGrupoAtendentesDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object cdsGrupoAtendentesIDGRUPOATENDE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOATENDE'
      Visible = False
    end
    object cdsGrupoAtendentesOBSERVACAO: TMemoField
      DisplayWidth = 10
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 156
    Top = 23
    object CdsIDPERIODOAGENDA: TFloatField
      FieldName = 'IDPERIODOAGENDA'
    end
    object CdsIDGRUPOATENDE: TFloatField
      FieldName = 'IDGRUPOATENDE'
    end
    object CdsDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object CdsDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
    end
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDHORARIOATENDE'
        DataType = ftFloat
      end
      item
        Name = 'IDPERIODOAGENDA'
        DataType = ftFloat
      end
      item
        Name = 'HORARIO'
        DataType = ftString
        Size = 4
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'HORARIO'
    Params = <>
    StoreDefs = True
    Left = 188
    Top = 24
    object cdsDetHORARIO: TStringField
      DisplayLabel = 'Horário'
      DisplayWidth = 50
      FieldName = 'HORARIO'
      EditMask = '99:99;0; '
      Size = 4
    end
    object cdsDetIDHORARIOATENDE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHORARIOATENDE'
      Visible = False
    end
    object cdsDetIDPERIODOAGENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPERIODOAGENDA'
      Visible = False
    end
  end
  object ds: TwwDataSource
    DataSet = Cds
    Left = 158
    Top = 55
  end
end
