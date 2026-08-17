inherited frmAgendamentosNoPeriodo: TfrmAgendamentosNoPeriodo
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Atenção!'
  ClientHeight = 231
  ClientWidth = 576
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 576
    Height = 192
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 558
      Height = 13
      Caption = 
        'O atendente cuja ausência está sendo cadastrada possui os seguin' +
        'tes agendamentos no período:'
    end
    object Label2: TLabel
      Left = 8
      Top = 169
      Width = 427
      Height = 13
      Caption = 
        'Confirma o cadastro da ausência, ignorando os agendamentos do pe' +
        'ríodo?'
    end
    object wwDBGrid1: TwwDBGrid
      Left = 8
      Top = 32
      Width = 558
      Height = 129
      Selected.Strings = (
        'SOLICITANTE'#9'30'#9'Solicitante'
        'DATA'#9'11'#9'Data'
        'HORA'#9'6'#9'Hora'
        'ASSUNTO'#9'25'#9'Assunto')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dtsAgendamentos
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      RowHeightPercent = 120
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 192
    Width = 576
    inherited tb97Fundo: TToolbar97
      Left = 367
      Visible = False
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Sim'
      end
      inherited bbtnCancelar: TBitBtn
        Caption = '&Não'
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 243
  end
  object cdsAgendamentos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SOLICITANTE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end
      item
        Name = 'HORA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ASSUNTO'
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 47
    object cdsAgendamentosSOLICITANTE: TStringField
      DisplayLabel = 'Solicitante'
      DisplayWidth = 30
      FieldName = 'SOLICITANTE'
      Size = 60
    end
    object cdsAgendamentosDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object cdsAgendamentosHORA: TStringField
      DisplayLabel = 'Hora'
      DisplayWidth = 6
      FieldName = 'HORA'
      EditMask = '99:99;0; '
      Size = 4
    end
    object cdsAgendamentosASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      DisplayWidth = 25
      FieldName = 'ASSUNTO'
      Size = 35
    end
  end
  object dtsAgendamentos: TDataSource
    DataSet = cdsAgendamentos
    Left = 40
    Top = 48
  end
end
