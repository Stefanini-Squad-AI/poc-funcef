inherited frmDispDivergentesMT: TfrmDispDivergentesMT
  Left = 280
  Top = 236
  Caption = 'Disponibilidades Divergentes'
  ClientHeight = 407
  ClientWidth = 455
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 455
    Height = 368
    object dbgDispDiverg: TwwDBGrid
      Left = 1
      Top = 1
      Width = 453
      Height = 366
      Selected.Strings = (
        'DATADISPFINANC'#9'15'#9'Data'
        'NOMEPLANO'#9'21'#9'Plano'
        'NOMEPATRO'#9'20'#9'Patrocinador')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsDispDivergentes
      ReadOnly = True
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
    Top = 368
    Width = 455
    inherited tb97Fundo: TToolbar97
      Left = 283
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 114
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 307
  end
  object cdsDispDivergentes: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DATALANCFINAN'
        DataType = ftDateTime
      end
      item
        Name = 'NUMCHQBORDERO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'STATUSCONCILIA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ENTRADASAIDA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALORLANCFINAN'
        DataType = ftFloat
      end
      item
        Name = 'CODPORTADOR'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FLGDISP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'DATADISPFINANC'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 48
  end
  object dsDispDivergentes: TwwDataSource
    DataSet = cdsDispDivergentes
    Left = 176
    Top = 96
  end
end
