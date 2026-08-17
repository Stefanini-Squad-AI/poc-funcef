inherited FrmCadPlanoAssistencial: TFrmCadPlanoAssistencial
  Left = 25
  Top = 110
  Caption = 'Cadastro de Plano Assistencial'
  ClientWidth = 757
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 757
    inherited pnlMestre: TPanel
      Width = 747
      Height = 46
      object lblValores: TLabel
        Left = 3
        Top = -1
        Width = 222
        Height = 23
        AutoSize = False
        Caption = 'Plano Assistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = []
        ParentFont = False
      end
      object dbedNome: TwwDBEdit
        Left = 3
        Top = 19
        Width = 337
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 56
      Width = 747
      Height = 277
      Align = alNone
      Tabs.Strings = (
        'Informações do Plano'
        'Contribuições'
        'Regras')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdCont'
        'dbgrdReg')
      inherited pgctrlDetalhe: TPageControl
        Width = 649
        Height = 218
        ActivePage = tbsContrib
        TabOrder = 0
        object tbsContrib: TTabSheet [0]
          Caption = 'Informações do Plano'
          ImageIndex = 1
          object Label2: TLabel
            Left = 0
            Top = 9
            Width = 77
            Height = 13
            Caption = 'Fornecedor  :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 2
            Top = 38
            Width = 57
            Height = 13
            Caption = 'Produto  :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 3
            Top = 68
            Width = 151
            Height = 13
            Caption = 'Portador Forma ( Boleto ) :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel1: TBevel
            Left = 1
            Top = 94
            Width = 635
            Height = 4
          end
          object Label4: TLabel
            Left = 5
            Top = 168
            Width = 84
            Height = 13
            Caption = ' Identificador :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 379
            Top = 114
            Width = 122
            Height = 13
            Caption = 'Numero do Contrato :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 379
            Top = 142
            Width = 107
            Height = 13
            Caption = 'Data de Vigência :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 379
            Top = 173
            Width = 150
            Height = 13
            Caption = 'Data de Comercialização :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblkIdFornecedor: TwwDBLookupCombo
            Left = 160
            Top = 7
            Width = 478
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME'#9'F')
            DataField = 'IDFORNSERV'
            DataSource = ds
            LookupTable = qryFornServAss
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            DropDownWidth = 5
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dblkIdProdass: TwwDBLookupCombo
            Left = 160
            Top = 35
            Width = 478
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'NOME')
            DataField = 'IDPRODASS'
            DataSource = ds
            LookupTable = qryProdAss
            LookupField = 'IDPRODASS'
            Style = csDropDownList
            DropDownWidth = 5
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dblkCodPortForma: TwwDBLookupCombo
            Left = 160
            Top = 63
            Width = 478
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            DataField = 'CODPORTFORMA'
            DataSource = ds
            LookupTable = qryPortForm
            LookupField = 'CODPORTFORMA'
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object DBCheckBoxAtivo: TDBCheckBox
            Left = 8
            Top = 113
            Width = 97
            Height = 17
            Caption = 'Plano Ativo'
            DataField = 'FLGATIVO'
            DataSource = ds
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBoxCobDif: TDBCheckBox
            Left = 132
            Top = 113
            Width = 153
            Height = 17
            Caption = 'Cobrança Diferenciada'
            DataField = 'OPCAOBDIF'
            DataSource = ds
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdOpcaoAident: TDBEdit
            Left = 95
            Top = 164
            Width = 33
            Height = 21
            AutoSize = False
            DataField = 'OPCAOAIDENT'
            DataSource = ds
            TabOrder = 5
          end
          object DBEdNumContrato: TDBEdit
            Left = 534
            Top = 111
            Width = 104
            Height = 21
            DataField = 'NUMCONTRATO'
            DataSource = ds
            TabOrder = 6
          end
          object DtInicVigencia: TDateTimePicker
            Left = 534
            Top = 139
            Width = 104
            Height = 21
            CalAlignment = dtaLeft
            Date = 37012.4725606482
            Time = 37012.4725606482
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 7
          end
          object DtInicCom: TDateTimePicker
            Left = 534
            Top = 168
            Width = 104
            Height = 21
            CalAlignment = dtaLeft
            Date = 37012.4725606482
            Time = 37012.4725606482
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 8
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 641
            Height = 190
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 641
            Height = 190
            Selected.Strings = (
              'NOME'#9'38'#9'Contribuição'
              'FLGCOBCARNE'#9'10'#9'Carnê'
              'NOMETP'#9'30'#9'Forma de Pagamento'
              'PAGADOR'#9'8'#9'Pagador'
              'DESCRICAO'#9'50'#9'Rubrica'
              'PRIORIDADE'#9'11'#9'Prioridade'
              'NOMEREGRA'#9'60'#9'Regra')
          end
        end
        object tbsRegras: TTabSheet
          Caption = 'Regras'
          ImageIndex = 2
        end
      end
      inherited Dock973: TDock97
        Width = 739
      end
      inherited Dock974: TDock97
        Left = 653
        Height = 218
      end
    end
  end
  inherited Dock972: TDock97
    Width = 757
  end
  inherited Dock971: TDock97
    Width = 757
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      IDPLANASS,'
      '      IDPESSOA,'
      '      IDREGRAATRASOJUR,'
      '      IDFORNSERV,'
      '      CODPORTFORMA,'
      '      CODTIPODOCHISTPAG,'
      '      IDPRODASS,'
      '      RECPAGHISTPAG,'
      '      NOME,'
      '      CODTIPORECHISTREC,'
      '      IDREGRAADMINISTR,'
      '      RECPAGHISTREC,'
      '      FLGFECHADO,'
      '      IDREGRACOBRANCA,'
      '      IDREGRAGERAL,'
      '      IDREGRAADMISSAO,'
      '      IDREGRAPAGAMENTO,'
      '      IDREGRABENEFICIA,'
      '      IDREGRACANCELAME,'
      '      IDREGRADESISTENC,'
      '      IDREGRACOMISSAO,'
      '      NUMCONTRATO,'
      '      DATAINICIOVIGENC,'
      '      DATAINICIOCOM,'
      '      CODTIPRECHISTPAG,'
      '      CODTIPODOCHISTREC,'
      '      IDREGRAATRASOCOR,'
      '      IDREGRADEVOLJUROS,'
      '      IDREGRADEVOLCORR,'
      '      IDFORNSERV2,'
      '      COMISSFORN,'
      '      COMISSFUND,'
      '      FLGOPCAOA,'
      '      TIPOFORNSERV2,'
      '      FLGOPCAOB,'
      '      FLGATIVO,'
      '      OPCAOAIDENT,'
      '      OPCAOBDIF'
      'FROM'
      '    PLANASS'
      'WHERE'
      '     IDPLANASS = :PRMIDPLANASS')
    Left = 361
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PRMIDPLANASS'
        ParamType = ptUnknown
      end>
    object qryIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = 'BASEDADOS.PLANASS.IDPLANASS'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PLANASS.IDPESSOA'
    end
    object qryIDREGRAATRASOJUR: TFloatField
      FieldName = 'IDREGRAATRASOJUR'
      Origin = 'BASEDADOS.PLANASS.IDREGRAATRASOJUR'
    end
    object qryIDFORNSERV: TFloatField
      FieldName = 'IDFORNSERV'
      Origin = 'BASEDADOS.PLANASS.IDFORNSERV'
    end
    object qryCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.PLANASS.CODPORTFORMA'
    end
    object qryCODTIPODOCHISTPAG: TFloatField
      FieldName = 'CODTIPODOCHISTPAG'
      Origin = 'BASEDADOS.PLANASS.CODTIPODOCHISTPAG'
    end
    object qryIDPRODASS: TFloatField
      FieldName = 'IDPRODASS'
      Origin = 'BASEDADOS.PLANASS.IDPRODASS'
    end
    object qryRECPAGHISTPAG: TStringField
      FieldName = 'RECPAGHISTPAG'
      Origin = 'BASEDADOS.PLANASS.RECPAGHISTPAG'
      FixedChar = True
      Size = 1
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANASS.NOME'
      Size = 40
    end
    object qryCODTIPORECHISTREC: TStringField
      FieldName = 'CODTIPORECHISTREC'
      Origin = 'BASEDADOS.PLANASS.CODTIPORECHISTREC'
      FixedChar = True
      Size = 15
    end
    object qryIDREGRAADMINISTR: TFloatField
      FieldName = 'IDREGRAADMINISTR'
      Origin = 'BASEDADOS.PLANASS.IDREGRAADMINISTR'
    end
    object qryRECPAGHISTREC: TStringField
      FieldName = 'RECPAGHISTREC'
      Origin = 'BASEDADOS.PLANASS.RECPAGHISTREC'
      FixedChar = True
      Size = 1
    end
    object qryFLGFECHADO: TFloatField
      FieldName = 'FLGFECHADO'
      Origin = 'BASEDADOS.PLANASS.FLGFECHADO'
    end
    object qryIDREGRACOBRANCA: TFloatField
      FieldName = 'IDREGRACOBRANCA'
      Origin = 'BASEDADOS.PLANASS.IDREGRACOBRANCA'
    end
    object qryIDREGRAGERAL: TFloatField
      FieldName = 'IDREGRAGERAL'
      Origin = 'BASEDADOS.PLANASS.IDREGRAGERAL'
    end
    object qryIDREGRAADMISSAO: TFloatField
      FieldName = 'IDREGRAADMISSAO'
      Origin = 'BASEDADOS.PLANASS.IDREGRAADMISSAO'
    end
    object qryIDREGRAPAGAMENTO: TFloatField
      FieldName = 'IDREGRAPAGAMENTO'
      Origin = 'BASEDADOS.PLANASS.IDREGRAPAGAMENTO'
    end
    object qryIDREGRABENEFICIA: TFloatField
      FieldName = 'IDREGRABENEFICIA'
      Origin = 'BASEDADOS.PLANASS.IDREGRABENEFICIA'
    end
    object qryIDREGRACANCELAME: TFloatField
      FieldName = 'IDREGRACANCELAME'
      Origin = 'BASEDADOS.PLANASS.IDREGRACANCELAME'
    end
    object qryIDREGRADESISTENC: TFloatField
      FieldName = 'IDREGRADESISTENC'
      Origin = 'BASEDADOS.PLANASS.IDREGRADESISTENC'
    end
    object qryIDREGRACOMISSAO: TFloatField
      FieldName = 'IDREGRACOMISSAO'
      Origin = 'BASEDADOS.PLANASS.IDREGRACOMISSAO'
    end
    object qryNUMCONTRATO: TFloatField
      FieldName = 'NUMCONTRATO'
      Origin = 'BASEDADOS.PLANASS.NUMCONTRATO'
    end
    object qryDATAINICIOVIGENC: TDateTimeField
      FieldName = 'DATAINICIOVIGENC'
      Origin = 'BASEDADOS.PLANASS.DATAINICIOVIGENC'
    end
    object qryDATAINICIOCOM: TDateTimeField
      FieldName = 'DATAINICIOCOM'
      Origin = 'BASEDADOS.PLANASS.DATAINICIOCOM'
    end
    object qryCODTIPRECHISTPAG: TStringField
      FieldName = 'CODTIPRECHISTPAG'
      Origin = 'BASEDADOS.PLANASS.CODTIPRECHISTPAG'
      FixedChar = True
      Size = 15
    end
    object qryCODTIPODOCHISTREC: TFloatField
      FieldName = 'CODTIPODOCHISTREC'
      Origin = 'BASEDADOS.PLANASS.CODTIPODOCHISTREC'
    end
    object qryIDREGRAATRASOCOR: TFloatField
      FieldName = 'IDREGRAATRASOCOR'
      Origin = 'BASEDADOS.PLANASS.IDREGRAATRASOCOR'
    end
    object qryIDREGRADEVOLJUROS: TFloatField
      FieldName = 'IDREGRADEVOLJUROS'
      Origin = 'BASEDADOS.PLANASS.IDREGRADEVOLJUROS'
    end
    object qryIDREGRADEVOLCORR: TFloatField
      FieldName = 'IDREGRADEVOLCORR'
      Origin = 'BASEDADOS.PLANASS.IDREGRADEVOLCORR'
    end
    object qryIDFORNSERV2: TFloatField
      FieldName = 'IDFORNSERV2'
      Origin = 'BASEDADOS.PLANASS.IDFORNSERV2'
    end
    object qryCOMISSFORN: TFloatField
      FieldName = 'COMISSFORN'
      Origin = 'BASEDADOS.PLANASS.COMISSFORN'
    end
    object qryCOMISSFUND: TFloatField
      FieldName = 'COMISSFUND'
      Origin = 'BASEDADOS.PLANASS.COMISSFUND'
    end
    object qryFLGOPCAOA: TFloatField
      FieldName = 'FLGOPCAOA'
      Origin = 'BASEDADOS.PLANASS.FLGOPCAOA'
    end
    object qryTIPOFORNSERV2: TStringField
      FieldName = 'TIPOFORNSERV2'
      Origin = 'BASEDADOS.PLANASS.TIPOFORNSERV2'
    end
    object qryFLGOPCAOB: TFloatField
      FieldName = 'FLGOPCAOB'
      Origin = 'BASEDADOS.PLANASS.FLGOPCAOB'
    end
    object qryFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
      Origin = 'BASEDADOS.PLANASS.FLGATIVO'
    end
    object qryOPCAOAIDENT: TStringField
      FieldName = 'OPCAOAIDENT'
      Origin = 'BASEDADOS.PLANASS.OPCAOAIDENT'
      Size = 10
    end
    object qryOPCAOBDIF: TStringField
      FieldName = 'OPCAOBDIF'
      Origin = 'BASEDADOS.PLANASS.OPCAOBDIF'
      Size = 10
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 363
    Top = 58
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 2
  end
  inherited upd: TUpdateSQL
    Left = 402
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLANASS.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Plano')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PLANASS')
    CamposChave.Strings = (
      'PLANASS.IDPLANASS'
      'PLANASS.NOME')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    Left = 483
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 442
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 313
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 548
    Top = 2
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 612
    Top = 2
  end
  object qryFornServAss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,F.IDPESSOA'
      'FROM   FORNSERV F,PESSOA P'
      'WHERE  (P.IDPESSOA = F.IDPESSOA)'
      'AND    NOT EXISTS (SELECT 1 FROM PESSOAFISICA PF'
      '                   WHERE  PF.IDPESSOA = P.IDPESSOA ) '
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 692
    Top = 58
    object qryFornServAssNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryFornServAssIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.FORNSERV.IDPESSOA'
      Visible = False
    end
  end
  object qryProdAss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO,IDPRODASS,NOME'
      'FROM   PRODASS')
    ValidateWithMask = True
    Left = 619
    Top = 58
    object qryProdAssDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PRODASS.DESCRICAO'
      Size = 80
    end
    object qryProdAssIDPRODASS: TFloatField
      FieldName = 'IDPRODASS'
      Origin = 'BASEDADOS.PRODASS.IDPRODASS'
    end
    object qryProdAssNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PRODASS.NOME'
      Size = 40
    end
  end
  object qryPortForm: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' CODARQUIVOREMESSA,CODBLOQCHE,CODCENTROCUSTO,'
      ' CODFORMA,CODFORMAPAGTO,CODPORTADOR,CODPORTFORMA,'
      ' CODTIPOPAGTO,CONTROLEREMESSA,DATACONTRREMESSA,'
      ' DESCFINAN,DESCRICAO,DMAIS,FLGEMITEAVISO,IDEMPRESA,'
      ' IDPESSOA,IDTEMPLCHEQUE,IDUSUARIOINCLUSAO,JUROSPORDIA,'
      ' LANCAFINANC,LOTETRANSMISSAO,NOSSONUMERO,'
      ' NUMEMPRESABANCO,NUMRAZAOCC,PATHARQUIVOREM,'
      ' PATHARQUIVORET,PLACONTA,PLANO,PRAZOPROTESTO,RECPAG'
      'FROM'
      ' PORTADORFORMA'
      'WHERE'
      ' RECPAG = '#39'R'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 555
    Top = 57
    object qryPortFormDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryPortFormCODARQUIVOREMESSA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODARQUIVOREMESSA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODARQUIVOREMESSA'
      Visible = False
    end
    object qryPortFormCODBLOQCHE: TFloatField
      DisplayWidth = 10
      FieldName = 'CODBLOQCHE'
      Origin = 'BASEDADOS.PORTADORFORMA.CODBLOQCHE'
      Visible = False
    end
    object qryPortFormCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.PORTADORFORMA.CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryPortFormCODFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODFORMA'
      Visible = False
    end
    object qryPortFormCODFORMAPAGTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODFORMAPAGTO'
      Origin = 'BASEDADOS.PORTADORFORMA.CODFORMAPAGTO'
      Visible = False
    end
    object qryPortFormCODPORTADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTADOR'
      Origin = 'BASEDADOS.PORTADORFORMA.CODPORTADOR'
      Visible = False
    end
    object qryPortFormCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODPORTFORMA'
      Visible = False
    end
    object qryPortFormCODTIPOPAGTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPOPAGTO'
      Origin = 'BASEDADOS.PORTADORFORMA.CODTIPOPAGTO'
      Visible = False
    end
    object qryPortFormCONTROLEREMESSA: TFloatField
      DisplayWidth = 10
      FieldName = 'CONTROLEREMESSA'
      Origin = 'BASEDADOS.PORTADORFORMA.CONTROLEREMESSA'
      Visible = False
    end
    object qryPortFormDATACONTRREMESSA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATACONTRREMESSA'
      Origin = 'BASEDADOS.PORTADORFORMA.DATACONTRREMESSA'
      Visible = False
    end
    object qryPortFormDESCFINAN: TStringField
      DisplayWidth = 60
      FieldName = 'DESCFINAN'
      Origin = 'BASEDADOS.PORTADORFORMA.DESCFINAN'
      Visible = False
      Size = 60
    end
    object qryPortFormDMAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'DMAIS'
      Origin = 'BASEDADOS.PORTADORFORMA.DMAIS'
      Visible = False
    end
    object qryPortFormFLGEMITEAVISO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGEMITEAVISO'
      Origin = 'BASEDADOS.PORTADORFORMA.FLGEMITEAVISO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryPortFormIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.PORTADORFORMA.IDEMPRESA'
      Visible = False
    end
    object qryPortFormIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PORTADORFORMA.IDPESSOA'
      Visible = False
    end
    object qryPortFormIDTEMPLCHEQUE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTEMPLCHEQUE'
      Origin = 'BASEDADOS.PORTADORFORMA.IDTEMPLCHEQUE'
      Visible = False
    end
    object qryPortFormIDUSUARIOINCLUSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'BASEDADOS.PORTADORFORMA.IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryPortFormJUROSPORDIA: TFloatField
      DisplayWidth = 10
      FieldName = 'JUROSPORDIA'
      Origin = 'BASEDADOS.PORTADORFORMA.JUROSPORDIA'
      Visible = False
    end
    object qryPortFormLANCAFINANC: TStringField
      DisplayWidth = 1
      FieldName = 'LANCAFINANC'
      Origin = 'BASEDADOS.PORTADORFORMA.LANCAFINANC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryPortFormLOTETRANSMISSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'LOTETRANSMISSAO'
      Origin = 'BASEDADOS.PORTADORFORMA.LOTETRANSMISSAO'
      Visible = False
    end
    object qryPortFormNOSSONUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'NOSSONUMERO'
      Origin = 'BASEDADOS.PORTADORFORMA.NOSSONUMERO'
      Visible = False
    end
    object qryPortFormNUMEMPRESABANCO: TStringField
      DisplayWidth = 20
      FieldName = 'NUMEMPRESABANCO'
      Origin = 'BASEDADOS.PORTADORFORMA.NUMEMPRESABANCO'
      Visible = False
    end
    object qryPortFormNUMRAZAOCC: TStringField
      DisplayWidth = 10
      FieldName = 'NUMRAZAOCC'
      Origin = 'BASEDADOS.PORTADORFORMA.NUMRAZAOCC'
      Visible = False
      Size = 10
    end
    object qryPortFormPATHARQUIVOREM: TStringField
      DisplayWidth = 60
      FieldName = 'PATHARQUIVOREM'
      Origin = 'BASEDADOS.PORTADORFORMA.PATHARQUIVOREM'
      Visible = False
      Size = 60
    end
    object qryPortFormPATHARQUIVORET: TStringField
      DisplayWidth = 60
      FieldName = 'PATHARQUIVORET'
      Origin = 'BASEDADOS.PORTADORFORMA.PATHARQUIVORET'
      Visible = False
      Size = 60
    end
    object qryPortFormPLACONTA: TStringField
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.PORTADORFORMA.PLACONTA'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryPortFormPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PORTADORFORMA.PLANO'
      Visible = False
    end
    object qryPortFormPRAZOPROTESTO: TFloatField
      DisplayWidth = 10
      FieldName = 'PRAZOPROTESTO'
      Origin = 'BASEDADOS.PORTADORFORMA.PRAZOPROTESTO'
      Visible = False
    end
    object qryPortFormRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.PORTADORFORMA.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      ' C.IDPLANASS,C.IDCONTASS,C.IDREGRA,C.IDEMPRESA,C.IDPROVENTO,'
      ' C.IDPESSOA,C.CODPORTFORMA,C.IDTPPERIODICIDADE,C.PAGADOR,'
      ' C.TEMPOCOBR,C.IDPROVENTOATRASO,C.IDPROVENTODEVOL,C.PRIORIDADE,'
      ' C.FLGTOTAL,C.FLGCOBEVENTO,REGRA.NOMEREGRA,TP.NOME NOMETP,'
      ' PT.DESCRICAO,CT.NOME,C.FLGCOBCARNE'
      'FROM'
      ' CONTRIBASS C,REGRA,TPPERIODICIDADE TP,PORTADORFORMA PT,'
      ' CONTRIBUICAO CT'
      'WHERE'
      ' (C.IDPLANASS = :IDPLANASS) AND'
      ' (C.IDREGRA = REGRA.IDREGRA) AND'
      ' (TP.IDTPPERIODICIDADE = C.IDTPPERIODICIDADE) AND'
      ' (PT.CODPORTFORMA(+) = C.CODPORTFORMA) AND'
      ' (CT.IDCONTRIBUICAO = C.IDCONTASS)'
      ''
      ' ')
    UpdateObject = upddet
    ControlType.Strings = (
      'FLGCOBCARNE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 486
    Top = 57
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
    object qryDetNOME: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 38
      FieldName = 'NOME'
      Size = 60
    end
    object qryDetFLGCOBCARNE: TFloatField
      DisplayLabel = 'Carnê'
      DisplayWidth = 10
      FieldName = 'FLGCOBCARNE'
    end
    object qryDetNOMETP: TStringField
      DisplayLabel = 'Forma de Pagamento'
      DisplayWidth = 30
      FieldName = 'NOMETP'
      FixedChar = True
      Size = 30
    end
    object qryDetPAGADOR: TStringField
      DisplayLabel = 'Pagador'
      DisplayWidth = 8
      FieldName = 'PAGADOR'
      FixedChar = True
      Size = 1
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryDetPRIORIDADE: TFloatField
      DisplayLabel = 'Prioridade'
      DisplayWidth = 11
      FieldName = 'PRIORIDADE'
    end
    object qryDetNOMEREGRA: TStringField
      DisplayLabel = 'Regra'
      DisplayWidth = 60
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryDetIDPLANASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANASS'
      Visible = False
    end
    object qryDetIDCONTASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTASS'
      Visible = False
    end
    object qryDetIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Visible = False
    end
    object qryDetIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryDetIDPROVENTO: TFloatField
      DisplayWidth = 11
      FieldName = 'IDPROVENTO'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetCODPORTFORMA: TFloatField
      DisplayWidth = 14
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryDetIDTPPERIODICIDADE: TFloatField
      DisplayWidth = 18
      FieldName = 'IDTPPERIODICIDADE'
      Visible = False
    end
    object qryDetTEMPOCOBR: TFloatField
      DisplayWidth = 11
      FieldName = 'TEMPOCOBR'
      Visible = False
    end
    object qryDetIDPROVENTOATRASO: TFloatField
      DisplayWidth = 18
      FieldName = 'IDPROVENTOATRASO'
      Visible = False
    end
    object qryDetIDPROVENTODEVOL: TFloatField
      DisplayWidth = 17
      FieldName = 'IDPROVENTODEVOL'
      Visible = False
    end
    object qryDetFLGTOTAL: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTOTAL'
      Visible = False
    end
    object qryDetFLGCOBEVENTO: TFloatField
      DisplayWidth = 14
      FieldName = 'FLGCOBEVENTO'
      Visible = False
    end
  end
  object upddet: TUpdateSQL
    Left = 429
    Top = 60
  end
end
