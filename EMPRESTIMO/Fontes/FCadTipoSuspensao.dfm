inherited frmCadTipoSuspensao: TfrmCadTipoSuspensao
  Left = 355
  Top = 94
  HelpContext = 150073
  Caption = 'Tipos de Suspensão de Cobrança'
  ClientHeight = 454
  ClientWidth = 640
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 640
    Height = 386
    object Label1: TLabel
      Left = 24
      Top = 10
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object DBedtDescricao: TDBEdit
      Left = 24
      Top = 24
      Width = 393
      Height = 21
      DataField = 'TSEDESCRICAO'
      DataSource = ds
      TabOrder = 0
    end
    object pgcParametros: TPageControl
      Left = 1
      Top = 59
      Width = 638
      Height = 326
      ActivePage = tbsGeral
      Align = alBottom
      TabOrder = 1
      object tbsGeral: TTabSheet
        Caption = 'Geral'
        object Label5: TLabel
          Left = 351
          Top = 188
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Percentual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object chkSuspendeConcessao: TDBCheckBox
          Left = 24
          Top = 120
          Width = 353
          Height = 17
          Caption = 'Suspensão automática na concessão'
          DataField = 'FLGSUSPCONCESSAO'
          DataSource = ds
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkGeraParcela: TDBCheckBox
          Left = 24
          Top = 140
          Width = 291
          Height = 17
          Caption = 'Gerar parcelas suspensas'
          DataField = 'FLGGERAPARCELAS'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkAtuSldParc: TDBCheckBox
          Left = 24
          Top = 179
          Width = 257
          Height = 17
          Caption = 'Atualizar Saldo Devedor na GERAÇÃO'
          DataField = 'FLGATUALSALDOPARC'
          DataSource = ds
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = chkAtuSldParcClick
        end
        object chkCobraEncargo: TDBCheckBox
          Left = 24
          Top = 257
          Width = 313
          Height = 17
          Caption = 'Cobrar encargos de parcelas suspensas geradas'
          DataField = 'FLGCOBRAENCARGOS'
          DataSource = ds
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkDeduzParcResta: TDBCheckBox
          Left = 24
          Top = 160
          Width = 318
          Height = 17
          Caption = 'Deduzir parcelas restantes na geração de parcelas'
          DataField = 'FLGDEDUZPARCREST'
          DataSource = ds
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkAtuSldEnvio: TDBCheckBox
          Left = 24
          Top = 199
          Width = 257
          Height = 17
          Caption = 'Atualizar Saldo Devedor no ENVIO'
          Color = clBtnShadow
          DataField = 'FLGATUALSALDOENV'
          DataSource = ds
          ParentColor = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
          OnClick = chkAtuSldEnvioClick
        end
        object gbPeriodo: TGroupBox
          Left = 16
          Top = 8
          Width = 361
          Height = 97
          Caption = ' Períodos de Suspensão '
          TabOrder = 0
          object Label4: TLabel
            Left = 20
            Top = 20
            Width = 215
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nº de meses para final de suspensão:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 66
            Top = 44
            Width = 169
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data de Início de suspensão:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 90
            Top = 68
            Width = 145
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Final de suspensão:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBMeses: TwwDBSpinEdit
            Left = 240
            Top = 16
            Width = 54
            Height = 21
            Increment = 1
            MaxValue = 999
            DataField = 'TSEMESES'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object edtDataInicio: TwwDBDateTimePicker
            Left = 240
            Top = 40
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'TSEINICIOSUSP'
            DataSource = ds
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 1
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
          object edtDataFim: TwwDBDateTimePicker
            Left = 240
            Top = 64
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'TSEFINALSUSP'
            DataSource = ds
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 2
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object DBCheckBox1: TDBCheckBox
          Left = 24
          Top = 219
          Width = 257
          Height = 17
          Caption = 'Suspensão por férias'
          DataField = 'FLGFERIAS'
          DataSource = ds
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = chkAtuSldEnvioClick
        end
        object DBCheckBox2: TDBCheckBox
          Left = 24
          Top = 239
          Width = 257
          Height = 17
          Caption = 'Suspensão por Cobrança Judicial'
          DataField = 'FLGCOBRJUDICIAL'
          DataSource = ds
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = chkAtuSldEnvioClick
        end
        object DBCheckBox3: TDBCheckBox
          Left = 24
          Top = 278
          Width = 313
          Height = 17
          Caption = 'Considerar parcelas suspensas como "em aberto"'
          DataField = 'FLGEMABERTO'
          DataSource = ds
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object cbSuspApenasConc: TDBCheckBox
          Left = 352
          Top = 120
          Width = 313
          Height = 17
          Caption = 'Suspensão openas na Concessão'
          DataField = 'FLGSUSAPENASCONC'
          DataSource = ds
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object edtPecentual: TDBEdit
          Left = 426
          Top = 184
          Width = 81
          Height = 21
          DataField = 'PERCENTUAL'
          DataSource = ds
          TabOrder = 11
        end
        object DBCheckBox4: TDBCheckBox
          Left = 352
          Top = 140
          Width = 313
          Height = 17
          Caption = 'Enviar prestação suspensa'
          DataField = 'FLGENVIA'
          DataSource = ds
          TabOrder = 12
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbrgTiposSuspensao: TDBRadioGroup
          Left = 336
          Top = 206
          Width = 289
          Height = 89
          Caption = 'Suspensão de Itens'
          DataField = 'FLGSUSPENSAOITEM'
          DataSource = ds
          Items.Strings = (
            'Suspender todos'
            'Suspender item centralizador e internos'
            'Suspender itens destacados')
          TabOrder = 13
          Values.Strings = (
            '0'
            '1'
            '2')
        end
      end
      object tbsRegra: TTabSheet
        Caption = 'Regras de Controle'
        ImageIndex = 1
        inline molRegraDB4: TmolRegraDB
          Left = 88
          Top = 3
          Width = 457
          inherited Regra: TLabel
            Width = 141
            Caption = 'Validação da Suspensão'
          end
          inherited DBedtRegra: TDBEdit
            Width = 393
            DataField = 'NOMEREGRAVALIDSUSP'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 400
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 424
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAVALIDSUSP'
            DataSource = ds
          end
        end
        inline molRegraDB1: TmolRegraDB
          Left = 88
          Top = 51
          Width = 457
          TabOrder = 1
          inherited Regra: TLabel
            Width = 120
            Caption = 'Recálculo de Seguro'
          end
          inherited DBedtRegra: TDBEdit
            Width = 393
            DataField = 'NOMEREGRARECALCSEG'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 400
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 424
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRARECALCSEG'
            DataSource = ds
          end
        end
        inline molRegraDB2: TmolRegraDB
          Left = 88
          Top = 99
          Width = 457
          TabOrder = 2
          inherited Regra: TLabel
            Width = 100
            Caption = 'Recálculo de IOF'
          end
          inherited DBedtRegra: TDBEdit
            Width = 393
            DataField = 'NOMEREGRARECALCIOF'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 400
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 424
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRARECALCIOF'
            DataSource = ds
          end
        end
        inline molRegraDB5: TmolRegraDB
          Left = 89
          Top = 190
          Width = 457
          TabOrder = 3
          inherited Regra: TLabel
            Width = 116
            Caption = 'Prestação Projetada'
          end
          inherited DBedtRegra: TDBEdit
            Width = 393
            DataField = 'NOMEREGRAPRESTPROJ'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 400
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 424
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'TSEIDREGRACALCPRESTPROJETADA'
            DataSource = ds
          end
        end
        inline molRegraDB6: TmolRegraDB
          Left = 89
          Top = 236
          Width = 457
          TabOrder = 4
          inherited Regra: TLabel
            Width = 151
            Caption = 'Margem Consignável Atual'
          end
          inherited DBedtRegra: TDBEdit
            Width = 393
            DataField = 'NOMEREGRAMARGCONSATU'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 400
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 424
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'TSEIDREGRACALCULOMARGELATUAL'
            DataSource = ds
          end
        end
        inline molRegraDB3: TmolRegraDB
          Left = 88
          Top = 147
          Width = 457
          TabOrder = 5
          inherited Regra: TLabel
            Width = 111
            Caption = 'Validação do Envio'
          end
          inherited DBedtRegra: TDBEdit
            Width = 393
            DataField = 'NOMEREGRAENVIOPARC'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 400
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 424
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAENVIOPARC'
            DataSource = ds
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 640
    inherited Toolbar971: TToolbar97
      inherited btnRefresh: TToolbarButton97
        Width = 31
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 377
        Width = 32
      end
      inherited ToolbarSep972: TToolbarSep97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 421
    Width = 640
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 488
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOSUSPEMPTMO'
      'set'
      '  IDTIPOSUSPEMPTMO = :IDTIPOSUSPEMPTMO,'
      '  TSEDESCRICAO = :TSEDESCRICAO,'
      '  TSEMESES = :TSEMESES,'
      '  TSEINICIOSUSP = :TSEINICIOSUSP,'
      '  TSEFINALSUSP = :TSEFINALSUSP,'
      '  IDRUBRICAADFERIAS = :IDRUBRICAADFERIAS,'
      '  IDREGRAVALIDSUSP = :IDREGRAVALIDSUSP,'
      '  IDREGRARECALCSEG = :IDREGRARECALCSEG,'
      '  IDREGRARECALCIOF = :IDREGRARECALCIOF,'
      '  IDREGRAENVIOPARC = :IDREGRAENVIOPARC,'
      '  TSEIDREGRACALCPRESTPROJETADA = '
      ':TSEIDREGRACALCPRESTPROJETADA,'
      '  TSEIDREGRACALCULOMARGELATUAL = '
      ':TSEIDREGRACALCULOMARGELATUAL,'
      '  FLGGERAPARCELAS = :FLGGERAPARCELAS,'
      '  FLGATUALSALDOPARC = :FLGATUALSALDOPARC,'
      '  FLGSUSPCONCESSAO = :FLGSUSPCONCESSAO,'
      '  FLGCOBRAENCARGOS = :FLGCOBRAENCARGOS,'
      '  FLGDEDUZPARCREST = :FLGDEDUZPARCREST,'
      '  FLGATUALSALDOENV = :FLGATUALSALDOENV,'
      '  FLGFERIAS = :FLGFERIAS,'
      '  FLGCOBRJUDICIAL = :FLGCOBRJUDICIAL,'
      '  FLGEMABERTO = :FLGEMABERTO,'
      '  FLGSUSAPENASCONC = :FLGSUSAPENASCONC,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  FLGENVIA = :FLGENVIA,'
      '  FLGSUSPENSAOITEM=:FLGSUSPENSAOITEM'
      'where'
      '  IDTIPOSUSPEMPTMO = :OLD_IDTIPOSUSPEMPTMO')
    InsertSQL.Strings = (
      'insert into TIPOSUSPEMPTMO'
      '  (IDTIPOSUSPEMPTMO, TSEDESCRICAO, TSEMESES, TSEINICIOSUSP, '
      'TSEFINALSUSP, '
      '   IDRUBRICAADFERIAS, IDREGRAVALIDSUSP, IDREGRARECALCSEG, '
      'IDREGRARECALCIOF, '
      '   IDREGRAENVIOPARC, TSEIDREGRACALCPRESTPROJETADA, '
      'TSEIDREGRACALCULOMARGELATUAL, '
      '   FLGGERAPARCELAS, FLGATUALSALDOPARC, FLGSUSPCONCESSAO, '
      'FLGCOBRAENCARGOS, '
      '   FLGDEDUZPARCREST, FLGATUALSALDOENV, FLGFERIAS, '
      'FLGCOBRJUDICIAL, FLGEMABERTO, '
      '   FLGSUSAPENASCONC, PERCENTUAL, FLGENVIA,'
      'FLGSUSPENSAOITEM)'
      'values'
      '  (:IDTIPOSUSPEMPTMO, :TSEDESCRICAO, :TSEMESES, :TSEINICIOSUSP, '
      ':TSEFINALSUSP, '
      '   :IDRUBRICAADFERIAS, :IDREGRAVALIDSUSP, :IDREGRARECALCSEG, '
      ':IDREGRARECALCIOF, '
      '   :IDREGRAENVIOPARC, :TSEIDREGRACALCPRESTPROJETADA, '
      ':TSEIDREGRACALCULOMARGELATUAL, '
      '   :FLGGERAPARCELAS, :FLGATUALSALDOPARC, :FLGSUSPCONCESSAO, '
      ':FLGCOBRAENCARGOS, '
      '   :FLGDEDUZPARCREST, :FLGATUALSALDOENV, :FLGFERIAS, '
      ':FLGCOBRJUDICIAL, '
      '   :FLGEMABERTO, :FLGSUSAPENASCONC, :PERCENTUAL, :FLGENVIA,'
      ':FLGSUSPENSAOITEM)')
    DeleteSQL.Strings = (
      'delete from TIPOSUSPEMPTMO'
      'where'
      '  IDTIPOSUSPEMPTMO = :OLD_IDTIPOSUSPEMPTMO')
    Left = 424
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TSE.TSEDESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Suspensão')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOSUSPEMPTMO TSE')
    CamposChave.Strings = (
      'TSE.IDTipoSuspEmptmo')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    RepeteConsulta = True
    ExibePergunta = False
    Left = 576
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 528
    Top = 16
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   TSE.IDTIPOSUSPEMPTMO, TSE.TSEDESCRICAO,'
      '   TSE.TSEMESES, TSE.TSEINICIOSUSP, TSE.TSEFINALSUSP,'
      ''
      '   TSE.IDRUBRICAADFERIAS,'
      ''
      '   TSE.IDREGRAVALIDSUSP,'
      '   TSE.IDREGRARECALCSEG,'
      '   TSE.IDREGRARECALCIOF,'
      '   TSE.IDREGRAENVIOPARC,'
      '   TSE.TSEIDREGRACALCPRESTPROJETADA,'
      '   TSE.TSEIDREGRACALCULOMARGELATUAL,'
      ''
      '   TSE.FLGGERAPARCELAS,'
      '   TSE.FLGATUALSALDOPARC,'
      '   TSE.FLGSUSPCONCESSAO,'
      '   TSE.FLGCOBRAENCARGOS,'
      '   TSE.FLGDEDUZPARCREST,'
      '   TSE.FLGATUALSALDOENV,'
      '   TSE.FLGFERIAS,'
      '   TSE.FLGCOBRJUDICIAL,'
      ''
      '   TSE.FLGEMABERTO,'
      ''
      '   TSE.FLGSUSAPENASCONC,'
      '   TSE.PERCENTUAL,'
      ''
      '   TSE.FLGENVIA,'
      '   NVL(TSE.FLGSUSPENSAOITEM,0) FLGSUSPENSAOITEM,'
      ''
      '   REGRAVALIDSUSP.NOMEREGRA AS NOMEREGRAVALIDSUSP,'
      '   REGRARECALCSEG.NOMEREGRA AS NOMEREGRARECALCSEG,'
      '   REGRARECALCIOF.NOMEREGRA AS NOMEREGRARECALCIOF,'
      '   REGRAENVIOPARC.NOMEREGRA AS NOMEREGRAENVIOPARC,'
      '   REGRAENVIOPRESPROJ.NOMEREGRA AS NOMEREGRAPRESTPROJ,'
      '   REGRAMARGCONSATU.NOMEREGRA AS NOMEREGRAMARGCONSATU'
      ''
      'FROM'
      '   REGRA REGRAVALIDSUSP,'
      '   REGRA REGRARECALCSEG,'
      '   REGRA REGRARECALCIOF,'
      '   REGRA REGRAENVIOPARC,'
      '   REGRA REGRAENVIOPRESPROJ,'
      '   REGRA REGRAMARGCONSATU,'
      ''
      '   TIPOSUSPEMPTMO TSE'
      ''
      'WHERE'
      '       ( TSE.IDTIPOSUSPEMPTMO =:PIDTIPOSUSPEMPTMO )'
      '   AND ( TSE.IDREGRAVALIDSUSP = REGRAVALIDSUSP.IDREGRA(+) )'
      '   AND ( TSE.IDREGRARECALCSEG = REGRARECALCSEG.IDREGRA(+) )'
      '   AND ( TSE.IDREGRARECALCIOF = REGRARECALCIOF.IDREGRA(+) )'
      '   AND ( TSE.IDREGRAENVIOPARC = REGRAENVIOPARC.IDREGRA(+) )'
      
        '   AND ( TSE.TSEIDREGRACALCPRESTPROJETADA = REGRAENVIOPRESPROJ.I' +
        'DREGRA(+) )'
      
        '   AND ( TSE.TSEIDREGRACALCULOMARGELATUAL = REGRAMARGCONSATU.IDR' +
        'EGRA(+) ) ')
    Left = 456
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOSUSPEMPTMO'
        ParamType = ptInput
      end>
    object qryIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      Size = 60
    end
    object qryTSEMESES: TFloatField
      FieldName = 'TSEMESES'
    end
    object qryTSEINICIOSUSP: TDateTimeField
      FieldName = 'TSEINICIOSUSP'
    end
    object qryTSEFINALSUSP: TDateTimeField
      FieldName = 'TSEFINALSUSP'
    end
    object qryIDRUBRICAADFERIAS: TFloatField
      FieldName = 'IDRUBRICAADFERIAS'
    end
    object qryIDREGRAVALIDSUSP: TFloatField
      FieldName = 'IDREGRAVALIDSUSP'
    end
    object qryIDREGRARECALCSEG: TFloatField
      FieldName = 'IDREGRARECALCSEG'
    end
    object qryIDREGRARECALCIOF: TFloatField
      FieldName = 'IDREGRARECALCIOF'
    end
    object qryIDREGRAENVIOPARC: TFloatField
      FieldName = 'IDREGRAENVIOPARC'
    end
    object qryFLGGERAPARCELAS: TFloatField
      FieldName = 'FLGGERAPARCELAS'
    end
    object qryFLGATUALSALDOPARC: TFloatField
      FieldName = 'FLGATUALSALDOPARC'
    end
    object qryFLGSUSPCONCESSAO: TFloatField
      FieldName = 'FLGSUSPCONCESSAO'
    end
    object qryFLGCOBRAENCARGOS: TFloatField
      FieldName = 'FLGCOBRAENCARGOS'
    end
    object qryFLGDEDUZPARCREST: TFloatField
      FieldName = 'FLGDEDUZPARCREST'
    end
    object qryFLGATUALSALDOENV: TFloatField
      FieldName = 'FLGATUALSALDOENV'
    end
    object qryFLGFERIAS: TFloatField
      FieldName = 'FLGFERIAS'
    end
    object qryFLGCOBRJUDICIAL: TFloatField
      FieldName = 'FLGCOBRJUDICIAL'
    end
    object qryFLGEMABERTO: TFloatField
      FieldName = 'FLGEMABERTO'
    end
    object qryFLGSUSAPENASCONC: TFloatField
      FieldName = 'FLGSUSAPENASCONC'
    end
    object qryPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryFLGENVIA: TFloatField
      FieldName = 'FLGENVIA'
    end
    object qryNOMEREGRAVALIDSUSP: TStringField
      FieldName = 'NOMEREGRAVALIDSUSP'
      Size = 60
    end
    object qryNOMEREGRARECALCSEG: TStringField
      FieldName = 'NOMEREGRARECALCSEG'
      Size = 60
    end
    object qryNOMEREGRARECALCIOF: TStringField
      FieldName = 'NOMEREGRARECALCIOF'
      Size = 60
    end
    object qryNOMEREGRAENVIOPARC: TStringField
      FieldName = 'NOMEREGRAENVIOPARC'
      Size = 60
    end
    object qryTSEIDREGRACALCPRESTPROJETADA: TFloatField
      FieldName = 'TSEIDREGRACALCPRESTPROJETADA'
    end
    object qryTSEIDREGRACALCULOMARGELATUAL: TFloatField
      FieldName = 'TSEIDREGRACALCULOMARGELATUAL'
    end
    object qryNOMEREGRAPRESTPROJ: TStringField
      FieldName = 'NOMEREGRAPRESTPROJ'
      Size = 60
    end
    object qryNOMEREGRAMARGCONSATU: TStringField
      FieldName = 'NOMEREGRAMARGCONSATU'
      Size = 60
    end
    object qryFLGSUSPENSAOITEM: TFloatField
      FieldName = 'FLGSUSPENSAOITEM'
    end
  end
end
