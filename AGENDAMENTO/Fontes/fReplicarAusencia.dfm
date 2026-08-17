inherited frmReplicarAusencia: TfrmReplicarAusencia
  Left = 286
  Top = 449
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Replicar Ausência de Atendente'
  ClientHeight = 137
  ClientWidth = 349
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 349
    Height = 98
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 125
      Height = 13
      Caption = 'Grupo de Atendentes:'
    end
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 329
      Height = 28
      AutoSize = False
      Caption = 
        'Indique o Grupo de Atendentes cujos integrantes terão ausências ' +
        'copiadas do atualmente selecionado:'
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
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição'#9'F')
      DataField = 'IDGRUPOATENDE'
      LookupTable = cdsGrupoAtendentes
      LookupField = 'IDGRUPOATENDE'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 98
    Width = 349
    inherited tb97Fundo: TToolbar97
      Left = 177
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 8
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 163
    Top = 43
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
    Left = 225
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
    Left = 292
    Top = 31
    object CdsIDAUSENCIAATENDE: TFloatField
      FieldName = 'IDAUSENCIAATENDE'
    end
    object CdsIDATENDEAGENDA: TFloatField
      FieldName = 'IDATENDEAGENDA'
    end
    object CdsDATAHORAINICIO: TDateTimeField
      FieldName = 'DATAHORAINICIO'
      DisplayFormat = 'dd/mm/yyyy hh:nn:ss'
    end
    object CdsDATAHORAFIM: TDateTimeField
      FieldName = 'DATAHORAFIM'
      DisplayFormat = 'dd/mm/yyyy hh:nn:ss'
    end
    object CdsMOTIVO: TBlobField
      FieldName = 'MOTIVO'
      BlobType = ftBlob
      Size = 500
    end
  end
  object cdsAtendeAgenda: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 80
    Top = 24
    object cdsAtendeAgendaNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 12
      FieldName = 'NOMEUSUARIO'
      ProviderFlags = []
      FixedChar = True
    end
    object cdsAtendeAgendaNOME: TStringField
      DisplayLabel = 'Nome Completo'
      DisplayWidth = 33
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 60
    end
    object cdsAtendeAgendaIDATENDEAGENDA: TFloatField
      FieldName = 'IDATENDEAGENDA'
      Visible = False
    end
    object cdsAtendeAgendaIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Visible = False
    end
  end
end
