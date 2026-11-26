inherited frmConferenciaPrevia: TfrmConferenciaPrevia
  Left = 220
  Top = 82
  HelpContext = 180012
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Conferência da Prévia'
  ClientHeight = 593
  ClientWidth = 808
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 808
    Height = 507
    object pnlLote: TPanel
      Left = 1
      Top = 1
      Width = 806
      Height = 75
      Align = alTop
      TabOrder = 0
      object lblLote: TLabel
        Left = 10
        Top = 11
        Width = 115
        Height = 13
        Caption = 'Lote de Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMes: TLabel
        Left = 9
        Top = 31
        Width = 112
        Height = 13
        Caption = 'Mês de Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtMesReferencia: TDBText
        Left = 125
        Top = 29
        Width = 74
        Height = 16
        DataField = 'MESREFERENCIA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbltTipoLote: TLabel
        Left = 218
        Top = 31
        Width = 77
        Height = 13
        Caption = 'Tipo do Lote:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbltEstadoLote: TLabel
        Left = 545
        Top = 31
        Width = 91
        Height = 13
        Caption = 'Estado do Lote:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPreechimento: TLabel
        Left = 9
        Top = 51
        Width = 3
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblTipoLote: TLabel
        Left = 298
        Top = 29
        Width = 3
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblEstadoLote: TLabel
        Left = 640
        Top = 29
        Width = 3
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblDescricaoLote: TLabel
        Left = 130
        Top = 9
        Width = 3
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 76
      Width = 806
      Height = 430
      ActivePage = tbsPreenchimento
      Align = alClient
      TabOrder = 1
      object tbsPreenchimento: TTabSheet
        Caption = 'Preenchimento'
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 798
          Height = 402
          VertScrollBar.Smooth = True
          Align = alClient
          TabOrder = 0
          object pnlPergunta1: TPanel
            Left = 0
            Top = 0
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object lblPergunta1: TLabel
              Left = 78
              Top = 9
              Width = 498
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Execução do Preparo do Benefícios pertinentes para todas as patr' +
                'ocinadoras e planos:'
            end
            object cbResp1: TComboBox
              Tag = 1
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Sim'
                'Não')
            end
          end
          object pnlPergunta2: TPanel
            Left = 0
            Top = 30
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object lblPergunta2: TLabel
              Left = 62
              Top = 9
              Width = 514
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Conferência dos valores de benefício e contribuição calculados (' +
                'ver relatório de Preparo):'
            end
            object cbResp2: TComboBox
              Tag = 2
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Completo'
                'Por Amostragem'
                'Sem Conferência')
            end
          end
          object pnlPergunta3: TPanel
            Left = 0
            Top = 60
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object lblPergunta3: TLabel
              Left = 320
              Top = 9
              Width = 256
              Height = 13
              Alignment = taRightJustify
              Caption = 'Importação de todos os Convênios realizada:'
            end
            object cbResp3: TComboBox
              Tag = 1
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Sim'
                'Não')
            end
          end
          object pnlPergunta4: TPanel
            Left = 0
            Top = 90
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 3
            object lblPergunta4: TLabel
              Left = 14
              Top = 9
              Width = 562
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Manutenção (inclusão, alteração e exclusão) de rubricas individu' +
                'ais, inclusive Pensão Alimentícia:'
            end
            object cbResp4: TComboBox
              Tag = 1
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Sim'
                'Não')
            end
          end
          object pnlPergunta4a: TPanel
            Left = 0
            Top = 120
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 4
            object lblPergunta4a: TLabel
              Left = 124
              Top = 9
              Width = 452
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Atualização de Percentuais de Pensão Alimentícia para Beneficiár' +
                'ios realizada:'
            end
            object cbResp4a: TComboBox
              Tag = 1
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Sim'
                'Não')
            end
          end
          object pnlPergunta5: TPanel
            Left = 0
            Top = 150
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 5
            object lblPergunta5: TLabel
              Left = 212
              Top = 9
              Width = 364
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lançamentos de cobrança/pagamento de Empréstimo realizado:'
            end
            object cbResp5: TComboBox
              Tag = 1
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Sim'
                'Não')
            end
          end
          object pnlPergunta6: TPanel
            Left = 0
            Top = 180
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 6
            object lblPergunta6: TLabel
              Left = 203
              Top = 9
              Width = 373
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lançamentos de cobrança de contribuição Assistencial realizado:'
            end
            object cbResp6: TComboBox
              Tag = 1
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Sim'
                'Não')
            end
          end
          object pnlPergunta7: TPanel
            Left = 0
            Top = 210
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 7
            object lblPergunta7: TLabel
              Left = 212
              Top = 9
              Width = 364
              Height = 13
              Alignment = taRightJustify
              Caption = 'Execução da Prévia Final após todas as correções necessárias:'
            end
            object cbResp7: TComboBox
              Tag = 1
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Sim'
                'Não')
            end
          end
          object pnlPergunta8: TPanel
            Left = 0
            Top = 240
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 8
            object lblPergunta8: TLabel
              Left = 15
              Top = 9
              Width = 561
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Conferência das rubricas processadas para cada recebedor (ver re' +
                'latório de Folha de Pagamento):'
            end
            object cbResp8: TComboBox
              Tag = 2
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Completo'
                'Por Amostragem'
                'Sem Conferência')
            end
          end
          object pnlPergunta9: TPanel
            Left = 0
            Top = 270
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 9
            object lblPergunta9: TLabel
              Left = 81
              Top = 9
              Width = 495
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Conferência das Entradas e Saídas de benefícios (ver relatório d' +
                'e Entradas e Saídas):'
            end
            object cbResp9: TComboBox
              Tag = 2
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Completo'
                'Por Amostragem'
                'Sem Conferência')
            end
          end
          object pnlPergunta10: TPanel
            Left = 0
            Top = 300
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 10
            object lblPergunta10: TLabel
              Left = 154
              Top = 9
              Width = 422
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Conferência dos totais por rubricas (ver relatório de Resumo de ' +
                'Rubricas):'
            end
            object cbResp10: TComboBox
              Tag = 2
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Completo'
                'Por Amostragem'
                'Sem Conferência')
            end
          end
          object pnlPergunta11: TPanel
            Left = 0
            Top = 330
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 11
            object lblPergunta11: TLabel
              Left = 137
              Top = 9
              Width = 439
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Conferência de rubricas em pendência (ver relatório de Rubricas ' +
                'Pendentes):'
            end
            object cbResp11: TComboBox
              Tag = 2
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Completo'
                'Por Amostragem'
                'Sem Conferência')
            end
          end
          object pnlPergunta12: TPanel
            Left = 0
            Top = 360
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 12
            object lblPergunta12: TLabel
              Left = 160
              Top = 9
              Width = 416
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Conferência das alterações de renda (ver relatório de Rendas Alt' +
                'eradas):'
            end
            object cbResp12: TComboBox
              Tag = 2
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Completo'
                'Por Amostragem'
                'Sem Conferência')
            end
          end
          object pnlPergunta13: TPanel
            Left = 0
            Top = 390
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 13
            object lblPergunta13: TLabel
              Left = 48
              Top = 9
              Width = 528
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Conferência das divergências de contribuição (ver relatório de D' +
                'ivergência de Contribuição):'
            end
            object cbResp13: TComboBox
              Tag = 2
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Completo'
                'Por Amostragem'
                'Sem Conferência')
            end
          end
          object pnlPergunta14: TPanel
            Left = 0
            Top = 420
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 14
            object lblPergunta14: TLabel
              Left = 173
              Top = 9
              Width = 403
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Conferência dos totais por banco (ver relatório de Créditos por ' +
                'Banco):'
            end
            object cbResp14: TComboBox
              Tag = 2
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Completo'
                'Por Amostragem'
                'Sem Conferência')
            end
          end
          object pnlPergunta15: TPanel
            Left = 0
            Top = 450
            Width = 778
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 15
            object lblPergunta15: TLabel
              Left = 10
              Top = 9
              Width = 565
              Height = 13
              Alignment = taRightJustify
              Caption = 
                'Conferência de conta bancária e valor das Pensões Alimentícias (' +
                'ver relatório de Pensão Aliment.):'
            end
            object cbResp15: TComboBox
              Tag = 2
              Left = 600
              Top = 5
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não obriga'
                'Completo'
                'Por Amostragem'
                'Sem Conferência')
            end
          end
        end
      end
      object tbsTmpdesc: TTabSheet
        Caption = 'Lançamentos Temporários'
        ImageIndex = 1
        object lblMsgTmpdesc: TLabel
          Left = 0
          Top = 0
          Width = 798
          Height = 25
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Lista de Lançamentos Temporários não processados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object dbgTmpdesc: TwwDBGrid
          Left = 0
          Top = 25
          Width = 798
          Height = 377
          Selected.Strings = (
            'MATDEP'#9'11'#9'Matrícula'
            'MATORIGEM'#9'11'#9'Matricula~Origem'
            'NOME'#9'22'#9'Nome'
            'IDPROVENTO'#9'9'#9'Rubrica~cód. interno'
            'CODPROVDESC'#9'10'#9'Rubrica~cód. externo'
            'VALOR'#9'10'#9'Valor'
            'DESCRICAO'#9'30'#9'Descrição'
            'IDTMPDESC'#9'9'#9'Código~Lançamento'
            'IDTITULAR'#9'6'#9'Idtitular'
            'IDPESSOA'#9'7'#9'Idpessoa')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsTmpdesc
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 808
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 554
    Width = 808
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 280
    Top = 2
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    Left = 403
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CTRLINTERFACE'
      'set'
      '  RESPCHKLIST = :RESPCHKLIST,'
      '  USUCHKLIST = :USUCHKLIST,'
      '  DTCHKLIST = :DTCHKLIST'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    Left = 443
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecione o Lote de Pagamento'
    Colunas.Strings = (
      'IDLOTE'
      'MESREFERENCIA'
      'DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Lote de Pagamento'
      'Mês referência'
      'Descrição do Lote')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CTRLINTERFACE')
    CamposChave.Strings = (
      'IDLOTE'
      'FLGIDATMP'
      'FLGVOLTATMP'
      'TIPO'
      'FLGCONCESSAO'
      'FLGTIPOFOLHA'
      'RESPCHKLIST')
    Filtro.Strings = (
      'FLGIDATMP = 1'
      'TIPO = '#39'B'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '7'
      '200')
    Left = 525
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 321
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 484
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDLOTE, MESREFERENCIA, DESCRICAO, FLGIDATMP, FLGVOLTATMP,'
      
        '       TIPO, FLGCONCESSAO, FLGTIPOFOLHA, RESPCHKLIST, USUCHKLIST' +
        ', DTCHKLIST'
      'FROM CTRLINTERFACE'
      'WHERE (IDLOTE = :PIDLOTE)'
      ' '
      ' '
      ' '
      ' ')
    Left = 362
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDLOTE'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 594
    Top = 2
  end
  object dsTmpdesc: TwwDataSource
    DataSet = qryTmpdesc
    Left = 309
    Top = 248
  end
  object qryTmpdesc: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT'
      '  T.IDTMPDESC, '
      '  T.IDTITULAR, '
      '  T.IDPESSOA, '
      '  T.IDPROVENTO, '
      '  T.VALOR, '
      '  PD.DESCRICAO,'
      '  PD.CODPROVDESC,'
      '  E.MATRICULA AS MATORIGEM,'
      '  D.MATRICULA AS MATDEP,'
      '  P.NOME  '
      'FROM '
      '  TMPDESC T,'
      '  PROVDESC PD,'
      '  PESSOA P,'
      '  DEPENTIT D,'
      '  ELEGPATRO E'
      'WHERE '
      '    T.MESCOBRANCA = :PMESCOBRANCA'
      'AND T.FLGDESCFOLHA = '#39'B'#39
      'AND T.LOTEPREVIA IS NULL'
      'AND T.IDTITULAR = D.IDTITULAR'
      'AND T.IDPESSOA = D.IDPESSOA'
      'AND T.IDTITULAR = E.IDPESSOA'
      'AND T.IDPESSJUR = E.IDPESSJUR'
      'AND P.IDPESSOA = T.IDPESSOA'
      'AND T.IDPROVENTO = PD.IDPROVENTO'
      'AND EXISTS ('
      '  SELECT 1'
      '  FROM PREVIA V'
      '  WHERE V.IDTITULAR = T.IDTITULAR'
      '  AND V.IDPESSOA = T.IDPESSOA'
      '  AND V.IDLOTE = :PIDLOTE)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 309
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptUnknown
        Value = '2006/08'
      end
      item
        DataType = ftInteger
        Name = 'PIDLOTE'
        ParamType = ptUnknown
        Value = 791386
      end>
  end
end
