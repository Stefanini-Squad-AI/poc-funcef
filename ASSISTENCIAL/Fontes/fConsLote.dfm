inherited frmConsLote: TfrmConsLote
  Left = 75
  Top = 55
  Caption = 'Consulta de Lotes'
  ClientWidth = 683
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 683
  end
  inherited Dock971: TDock97
    Width = 683
    inherited tb97Fundo: TToolbar97
      Left = 510
      DockPos = 510
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 342
      DockPos = 342
    end
  end
  inherited pnlPesquisa: TPanel
    Width = 683
    inherited Panel4: TPanel
      Left = 526
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 304
      Height = 164
      ActivePage = TabSheet1
      Align = alLeft
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Patrocinadora'
        object chkpatrocinadora: TCheckListBox
          Left = 0
          Top = 0
          Width = 296
          Height = 136
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 336
      Top = 16
      Width = 225
      Height = 65
      Caption = 'Mês Referência'
      TabOrder = 2
      object cmbmes: TComboBox
        Left = 10
        Top = 26
        Width = 121
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
        TabOrder = 0
      end
      object spinano: TSpinEdit
        Left = 136
        Top = 26
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
  end
  inherited tsetResult: TTabSet
    Width = 683
  end
  inherited grpResultado: TGroupBox
    Width = 683
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    inherited Panel1: TPanel
      Top = 18
      Width = 679
      Height = 202
      inherited dbgrdResultado: TwwDBGrid
        Width = 679
        Height = 202
        Selected.Strings = (
          'IDLOTE'#9'10'#9'Lote'#9'No'
          'MESREFERENCIA'#9'9'#9'Mês Ref.'#9'No'
          'PATRO'#9'30'#9'Patrocinadora'#9'No'
          'VLRTOTAL'#9'10'#9'Total'#9'No'
          'DATAIDATMP'#9'10'#9'Envio'#9'No'
          'DATAIDAINTERFACE'#9'10'#9'Efetivado'#9'No'
          'DATAVOLTAINTERFA'#9'10'#9'Volta'#9'No'
          'DATAVOLTATMP'#9'11'#9'Recebimento'#9'No')
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 659
    Top = 307
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = qry
    Left = 140
    Top = 336
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      ' ci.IDLOTE,'
      ' ci.MESREFERENCIA,'
      ' pj.nome patro,'
      ' ci.VLRTOTAL,'
      ' ci.DATAIDATMP,'
      ' ci.DATAIDAINTERFACE,'
      ' ci.DATAVOLTAINTERFA,'
      ' ci.DATAVOLTATMP'
      'from ctrlinterface ci, pessoa pj'
      'where (ci.idpessoa = pj.idpessoa)'
      'and (ci.TIPO = '#39'A'#39')')
    PictureMasks.Strings = (
      'VLRTOTAL'#9'###,###.##'#9'F'#9'T')
    ValidateWithMask = True
    Left = 178
    Top = 334
  end
  object qrypatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PAT.IDPESSOA, PAT.NOME'
      'FROM   PESSOA PAT'
      'WHERE  FLGPATROCINADORA=1')
    ValidateWithMask = True
    Left = 240
    Top = 336
  end
end
