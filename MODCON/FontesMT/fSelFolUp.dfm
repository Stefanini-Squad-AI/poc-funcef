inherited frmSelFolUp: TfrmSelFolUp
  Left = 90
  Top = 109
  HelpContext = 760024
  Caption = 'FollowUp das Etapas dos Processos'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnResult: TPanel
      object wwDBGrid1: TwwDBGrid
        Left = 1
        Top = 1
        Width = 613
        Height = 368
        Selected.Strings = (
          'NUMPROCTRAB'#9'7'#9'Processo'
          'DATAREALOCOR'#9'15'#9'Data Prevista (Real)'
          'NUMSEQ'#9'5'#9'Etapa'
          'DESCRICAO'#9'43'#9'Tipo de Etapa (Andamento)'
          'ASSUNTO'#9'40'#9'Assunto (Resumido)'
          'NOME'#9'60'#9'Contraparte'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clGray
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsFollowUp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
    inherited pgctrlPrincipal: TPageControl
      inherited tbshGeral: TTabSheet
        inherited rgSitProc: TRadioGroup
          Enabled = False
          ItemIndex = 0
        end
        inherited gbxDataEnc: TGroupBox
          Caption = 'Data de Agendamento'
        end
      end
    end
  end
  object dsFollowUp: TwwDataSource
    DataSet = CdsFollowUp
    Left = 348
    Top = 236
  end
  object CdsFollowUp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 347
    Top = 222
  end
  object sqlFollowUp: TCMSqlParams
    ClientDataSet = CdsFollowUp
    Left = 347
    Top = 209
  end
end
