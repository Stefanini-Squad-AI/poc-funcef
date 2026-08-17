inherited FrmCadModelosCnabMT: TFrmCadModelosCnabMT
  Left = 331
  Top = 120
  Caption = 'Cadastro de Modelos de Arquivos Bancários'
  ClientHeight = 499
  ClientWidth = 683
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 683
    Height = 413
    inherited pnlMestre: TPanel
      Width = 681
      Height = 152
      object Label1: TLabel
        Left = 14
        Top = 10
        Width = 161
        Height = 13
        Caption = 'Modelo de Arquivo Bancário'
      end
      object Label4: TLabel
        Left = 17
        Top = 101
        Width = 74
        Height = 13
        Caption = 'Qtd. Colunas'
      end
      object wwDBEdit1: TwwDBEdit
        Left = 13
        Top = 26
        Width = 305
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object GroupBox1: TGroupBox
        Left = 348
        Top = 11
        Width = 305
        Height = 94
        Caption = 'Composição do Nome do Arquivo'
        TabOrder = 1
        object Label2: TLabel
          Left = 12
          Top = 23
          Width = 60
          Height = 13
          Caption = 'Texto Fixo'
        end
        object Label3: TLabel
          Left = 148
          Top = 25
          Width = 53
          Height = 13
          Caption = 'Extensão'
        end
        object dbedValfixo: TwwDBEdit
          Left = 12
          Top = 39
          Width = 121
          Height = 21
          DataField = 'NOMEARQVALFIXO'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedExtensao: TwwDBEdit
          Left = 148
          Top = 39
          Width = 121
          Height = 21
          DataField = 'NOMEARQEXTENSAO'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbchkData: TDBCheckBox
          Left = 12
          Top = 69
          Width = 106
          Height = 17
          Caption = 'Data Corrente'
          DataField = 'NOMEARQDATA'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkSeqNum: TDBCheckBox
          Left = 148
          Top = 68
          Width = 141
          Height = 17
          Caption = 'Seqüência Numérica'
          DataField = 'NOMEARQSEQNUM'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object dbrTipoEmiss: TDBRadioGroup
        Left = 13
        Top = 54
        Width = 305
        Height = 38
        Caption = 'Tipo de Emissão'
        Columns = 2
        DataField = 'RECPAG'
        DataSource = ds
        Items.Strings = (
          'Pagamento'
          'Recebimento')
        TabOrder = 2
        Values.Strings = (
          'P'
          'R')
      end
      object wwDBSpinEdit1: TwwDBSpinEdit
        Left = 17
        Top = 116
        Width = 81
        Height = 21
        Increment = 1
        DataField = 'QTDCOLUNAS'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 153
      Width = 681
      Height = 259
      Tabs.Strings = (
        'Linhas')
      inherited pgctrlDetalhe: TPageControl
        Width = 583
        Height = 200
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 575
            Height = 172
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 575
            Height = 172
            object Label5: TLabel
              Left = 8
              Top = 24
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label6: TLabel
              Left = 9
              Top = 73
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object dbedDescricao: TwwDBEdit
              Left = 8
              Top = 40
              Width = 265
              Height = 21
              DataField = 'DESCLINHACNAB'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbComboTipoLinha: TwwDBComboBox
              Left = 8
              Top = 89
              Width = 265
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Cabeçalho de Arquivo'#9'H'
                'Cabeçalho de Lote'#9'L'
                'Detalhe'#9'D'
                'Rodapé de Lote'#9'T'
                'Rdapé de Arquivo'#9'F')
              Sorted = False
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object BitBtn1: TBitBtn
              Left = 8
              Top = 128
              Width = 97
              Height = 25
              Caption = 'Colunas'
              TabOrder = 2
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                C8807FF7777777777FF700000000000000007777777777777777333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 673
      end
      inherited Dock974: TDock97
        Left = 587
        Height = 200
      end
    end
  end
  inherited Dock972: TDock97
    Width = 683
  end
  inherited Dock971: TDock97
    Top = 460
    Width = 683
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 506
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 310
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 256
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 360
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 556
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecione Modelo de Arquivo Bancário'
    Colunas.Strings = (
      'MODELOSCNAB.IDMODELOSCNAB'
      'MODELOSCNAB.DESCRICAO'
      'MODELOSCNAB.RECPAG')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Cód. do Modelo'
      'Descrição'
      'Pagar/Receber')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MODELOSCNAB')
    CamposChave.Strings = (
      'MODELOSCNAB.IDMODELOSCNAB'
      'MODELOSCNAB.RECPAG')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 608
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 420
    Top = 7
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 438
    Top = 295
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from modeloscnab')
    ClientDataSet = Cds
    Left = 337
    Top = 160
  end
  object cdsDet: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 497
    Top = 295
    Data = {
      AA0000009619E0BD010000001800000004000000000003000000AA000C49444C
      494E484153434E414208000400000000000D49444D4F44454C4F53434E414208
      000400000000000D444553434C494E4841434E41420100490000000100055749
      445448020002003C00095449504F4C494E484101004900000002000753554254
      595045020049000A004669786564436861720005574944544802000200010001
      00044C4349440400010009080000}
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'select * from LINHASCNAB')
    ClientDataSet = cdsDet
    Left = 497
    Top = 367
  end
end
