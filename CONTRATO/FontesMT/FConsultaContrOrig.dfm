inherited frmConsultaContrOrig: TfrmConsultaContrOrig
  Left = 288
  Top = 163
  Caption = 'Consulta aos Contratos Originais'
  ClientHeight = 445
  ClientWidth = 683
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 683
    Height = 406
    object Splitter1: TSplitter
      Left = 5
      Top = 207
      Width = 673
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 673
      Height = 26
      Align = alTop
      Alignment = taLeftJustify
      Caption = 'Nome do Contrato / Processo'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pgcDetContratos: TPageControl
      Left = 5
      Top = 210
      Width = 673
      Height = 191
      ActivePage = tsServProd
      Align = alClient
      TabOrder = 1
      object tsServProd: TTabSheet
        Caption = 'Serviços/Produtos x Item Contratual'
        object dbgObjxItem: TwwDBGrid
          Left = 0
          Top = 0
          Width = 665
          Height = 163
          Selected.Strings = (
            'NOME_ITEM'#9'70'#9'Item'#9'F'
            'NOMEOBJETO'#9'70'#9'Objeto'#9'F'
            'TIPOTOLERANCIAOBJETO'#9'1'#9'TipoTolerância'#9'F'
            'TOLERANCIAMAISOBJETO'#9'6'#9'Superior'#9'F'
            'TOLERANCIAMENOSOBJETO'#9'6'#9'Inferior'#9'F'
            'MOEDESC'#9'20'#9'Moeda'#9'F'
            'DESCMEDIDA'#9'25'#9'Medida'#9'F'
            'QTDEITEM'#9'10'#9'Qtd'#9'F'
            'VALORUNITARIOOBJETO'#9'15'#9'ValorUnitário'#9'F'
            'VALORTOTALOBJETO'#9'15'#9'ValorTotal'#9'F'
            'NOMEPLANPREV'#9'50'#9'Plano'#9'F'
            'NOMEPATRO'#9'60'#9'Patrocinadora'#9'F'
            'DESCPROGRAMA'#9'60'#9'Programa'#9'F'
            'DATAINICIOCOBR'#9'10'#9'InícioCobrança'#9'F'
            'NUMMEDICOES'#9'10'#9'No.Medições'#9'F'
            'FREQUENCIA'#9'1'#9'Frequência'#9'F'
            'INTERVALO'#9'10'#9'Intervalo'#9'F'
            'NUMPARCELAS'#9'10'#9'No.Parcelas'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsServProdXItemr
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
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object tsRateio: TTabSheet
        Caption = 'Rateio'
        object dbgRateio: TwwDBGrid
          Left = 0
          Top = 0
          Width = 665
          Height = 163
          Selected.Strings = (
            'DESCCC'#9'77'#9'Centro de Custo'#9'F'
            'PERCRATEIOCONTR'#9'10'#9'Percentual'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRateioXCC
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
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object tsAditamento: TTabSheet
        Caption = 'Aditamento'
        object dbgAditamento: TwwDBGrid
          Left = 0
          Top = 0
          Width = 665
          Height = 163
          Selected.Strings = (
            'DATAASSADITAMENTO'#9'10'#9'Data'#9'F'
            'DESCADITAMENTO'#9'500'#9'Descrição'#9'F')
          MemoAttributes = [mSizeable, mWordWrap, mGridShow]
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsAditamento
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
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
    end
    object pgcContratos: TPageControl
      Left = 5
      Top = 31
      Width = 673
      Height = 176
      ActivePage = tsIntegracao
      Align = alTop
      TabOrder = 2
      object tsDescricao: TTabSheet
        Caption = 'Descrição'
        object dbmDescricaoContrato: TDBMemo
          Left = 5
          Top = 8
          Width = 652
          Height = 113
          DataField = 'DESCRICAOCONTRATO'
          DataSource = dsContratoOrig
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object tsDadosContr: TTabSheet
        Caption = 'Dados Contratuais'
        object GroupBox1: TGroupBox
          Left = 10
          Top = 5
          Width = 639
          Height = 60
          Caption = 'Datas'
          TabOrder = 0
          object Label7: TLabel
            Left = 9
            Top = 13
            Width = 60
            Height = 13
            Caption = 'Assinatura'
          end
          object Label8: TLabel
            Left = 147
            Top = 13
            Width = 60
            Height = 13
            Caption = 'Data Base'
          end
          object Label9: TLabel
            Left = 290
            Top = 13
            Width = 99
            Height = 13
            Caption = 'Prevista Encerra.'
          end
          object Label22: TLabel
            Left = 429
            Top = 13
            Width = 79
            Height = 13
            Caption = 'Encerramento'
          end
          object dbDataAssinatura: TwwDBEdit
            Left = 8
            Top = 29
            Width = 121
            Height = 21
            DataField = 'DATAASSINATURA'
            DataSource = dsContratoOrig
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbDataBase: TwwDBEdit
            Left = 146
            Top = 29
            Width = 121
            Height = 21
            DataField = 'DATABASECONTRATO'
            DataSource = dsContratoOrig
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbDataPrevista: TwwDBEdit
            Left = 290
            Top = 29
            Width = 121
            Height = 21
            DataField = 'DATAPREVENCERRA'
            DataSource = dsContratoOrig
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbDataEncerramento: TwwDBEdit
            Left = 429
            Top = 29
            Width = 121
            Height = 21
            DataField = 'DATAEFETENCERRA'
            DataSource = dsContratoOrig
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 67
          Width = 273
          Height = 71
          Caption = 'Valores'
          TabOrder = 1
          object Label10: TLabel
            Left = 8
            Top = 24
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object Label11: TLabel
            Left = 136
            Top = 24
            Width = 62
            Height = 13
            Caption = 'Valor Base'
          end
          object dbMoeda: TwwDBEdit
            Left = 8
            Top = 40
            Width = 121
            Height = 21
            DataField = 'MOEDESC'
            DataSource = dsContratoOrig
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBValorBaseContrato: TDBRealEdit
            Left = 144
            Top = 40
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '20.000,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALORBASECONTRATO'
            DataSource = dsContratoOrig
          end
        end
        object GroupBox3: TGroupBox
          Left = 288
          Top = 66
          Width = 193
          Height = 73
          Caption = 'Outros'
          TabOrder = 2
          object Label12: TLabel
            Left = 8
            Top = 13
            Width = 95
            Height = 26
            Caption = 'Prazo Denúncia (dias)'
            WordWrap = True
          end
          object Label1: TLabel
            Left = 115
            Top = 12
            Width = 69
            Height = 13
            Caption = 'Aviso Venc.'
          end
          object Label2: TLabel
            Left = 113
            Top = 23
            Width = 76
            Height = 13
            Caption = 'ou Enc.(dias)'
          end
          object dbPrazoDen: TwwDBEdit
            Left = 8
            Top = 43
            Width = 65
            Height = 21
            DataField = 'PRAZODENUNCIA'
            DataSource = dsContratoOrig
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbAviso: TwwDBEdit
            Left = 120
            Top = 43
            Width = 65
            Height = 21
            DataField = 'AVISO'
            DataSource = dsContratoOrig
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object GroupBox5: TGroupBox
          Left = 494
          Top = 66
          Width = 154
          Height = 49
          Caption = 'Reserva Orçamentária'
          TabOrder = 3
          object dbReservOrc: TwwDBEdit
            Left = 10
            Top = 19
            Width = 121
            Height = 21
            DataField = 'NUMRESERVA'
            DataSource = dsContratoOrig
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object tsContraparte: TTabSheet
        Caption = 'Dados da Contraparte'
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 67
          Height = 13
          Caption = 'Contraparte'
        end
        object lblCodForCli: TLabel
          Left = 320
          Top = 8
          Width = 171
          Height = 13
          Caption = 'Código no Cliente/Fornecedor'
        end
        object Label4: TLabel
          Left = 8
          Top = 56
          Width = 45
          Height = 13
          Caption = 'Contato'
        end
        object Label5: TLabel
          Left = 320
          Top = 56
          Width = 51
          Height = 13
          Caption = 'Telefone'
        end
        object dbContraparte: TwwDBEdit
          Left = 8
          Top = 24
          Width = 297
          Height = 21
          DataField = 'NOMEFORCLI'
          DataSource = dsContratoOrig
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbCodNoForCli: TwwDBEdit
          Left = 320
          Top = 24
          Width = 145
          Height = 21
          DataField = 'CODAUXCONTRATO'
          DataSource = dsContratoOrig
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbContato: TwwDBEdit
          Left = 8
          Top = 72
          Width = 297
          Height = 21
          DataField = 'NOMECONTATO'
          DataSource = dsContratoOrig
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbTelContato: TwwDBEdit
          Left = 320
          Top = 72
          Width = 241
          Height = 21
          DataField = 'TELCONTATO'
          DataSource = dsContratoOrig
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object tsEnderecos: TTabSheet
        Caption = 'Endereços'
        object Label17: TLabel
          Left = 8
          Top = 0
          Width = 172
          Height = 13
          Caption = 'Endereço de Correspondência'
        end
        object Label18: TLabel
          Left = 8
          Top = 40
          Width = 121
          Height = 13
          Caption = 'Endereço de Entrega'
        end
        object Label19: TLabel
          Left = 8
          Top = 80
          Width = 131
          Height = 13
          Caption = 'Endereço de Cobrança'
        end
        object dbCorrespondencia: TwwDBEdit
          Left = 8
          Top = 16
          Width = 601
          Height = 21
          DataField = 'ENDCORRESP'
          DataSource = dsContratoOrig
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbEntrega: TwwDBEdit
          Left = 8
          Top = 56
          Width = 601
          Height = 21
          DataField = 'ENDENTREGA'
          DataSource = dsContratoOrig
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbCobranca: TwwDBEdit
          Left = 8
          Top = 96
          Width = 601
          Height = 21
          DataField = 'ENDCOBRANCA'
          DataSource = dsContratoOrig
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object tsIntegracao: TTabSheet
        Caption = 'Integração'
        object Label28: TLabel
          Left = 9
          Top = 8
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object Label14: TLabel
          Left = 8
          Top = 48
          Width = 74
          Height = 13
          Caption = 'Responsável'
        end
        object Label26: TLabel
          Left = 337
          Top = 8
          Width = 160
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object Label24: TLabel
          Left = 337
          Top = 48
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object dbAtivProj: TwwDBEdit
          Left = 8
          Top = 24
          Width = 297
          Height = 21
          DataField = 'NOMEUNEG'
          DataSource = dsContratoOrig
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbRespons: TwwDBEdit
          Left = 8
          Top = 64
          Width = 297
          Height = 21
          DataField = 'NOMERESPON'
          DataSource = dsContratoOrig
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbCentroRespon: TwwDBEdit
          Left = 336
          Top = 24
          Width = 258
          Height = 21
          DataField = 'NOMECENTRORESP'
          DataSource = dsContratoOrig
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbTipoDoc: TwwDBEdit
          Left = 336
          Top = 64
          Width = 258
          Height = 21
          DataField = 'TIPODOCDESCR'
          DataSource = dsContratoOrig
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object tbObservacao: TTabSheet
        Caption = 'Observação'
        object dbmObservacao: TDBMemo
          Left = 5
          Top = 8
          Width = 652
          Height = 113
          DataField = 'OBSERVACAO'
          DataSource = dsContratoOrig
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object tsRenovacao: TTabSheet
        Caption = 'Renovação'
        object dbmRenovacao: TDBMemo
          Left = 5
          Top = 8
          Width = 652
          Height = 113
          DataField = 'RENOVACAO'
          DataSource = dsContratoOrig
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 683
    inherited tb97Fundo: TToolbar97
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object BtnConsulta: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Consulta'
        TabOrder = 2
        OnClick = BtnConsultaClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00700777777777
          7777770000007000777777777777770000007700077777777777770000007770
          0077777777777700000077770007700007777700000077777000088880077700
          00007777770887F7F88077000000777777087F7F7F807700000077777087F7F7
          F7F8070000007777708FFF7F7F780700000077777087F7F7F7F8070000007777
          708FFF7F7F780700000077777708FFF7F78077000000777777088F7F78807700
          0000777777700888800777000000777777777000077777000000777777777777
          777777000000777777777777777777000000}
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 96
    Top = 408
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object dsContratoOrig: TwwDataSource
    AutoEdit = False
    DataSet = cdsContratoOrig
    Left = 41
    Top = 117
  end
  object dsServProdXItemr: TwwDataSource
    AutoEdit = False
    DataSet = cdsServProdXItem
    Left = 137
    Top = 118
  end
  object dsRateioXCC: TwwDataSource
    AutoEdit = False
    DataSet = cdsRateioXCC
    Left = 233
    Top = 118
  end
  object dsAditamento: TwwDataSource
    AutoEdit = False
    DataSet = cdsAditamento
    Left = 329
    Top = 119
  end
  object MSContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTRATOORIG.DATAASSINATURA'
      'CONTRATOORIG.NOMECONTRATO'
      'CONTRATOORIG.CODCONTRATOEMPR'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Data Assinatura'
      'Nome do Contrato'
      'Processo'
      'Contraparte')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOORIG'
      'PESSOA')
    CamposChave.Strings = (
      'CONTRATOORIG.IDCONTRATO')
    Filtro.Strings = (
      'CONTRATOORIG.IDFORCLI = PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '20'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 24
    Top = 408
  end
  object cdsAditamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 96
  end
  object cdsRateioXCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 96
  end
  object cdsServProdXItem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 96
  end
  object cdsContratoOrig: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 96
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'SELECT IDADITAMENTO,'
      '       IDCONTRATO,'
      '       DATAASSADITAMENTO,'
      '       DESCADITAMENTO,'
      '       FLGVIRTUAL'
      'FROM ADITAMENTO'
      'WHERE IDCONTRATO = 1'
      'ORDER BY DATAASSADITAMENTO DESC')
    ClientDataSet = cdsAditamento
    Left = 432
    Top = 104
  end
end
