inherited frmCadEmissor: TfrmCadEmissor
  Left = 334
  Top = 62
  HelpContext = 790106
  Caption = 'Emissor'
  ClientHeight = 589
  ClientWidth = 832
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 832
    Height = 503
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 830
      Height = 396
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Emissores')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 732
        Height = 337
        ActivePage = TbsEmissor
        OnChange = pgctrlDetalheChange
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 724
            Height = 309
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 724
            Height = 309
            inherited pnlItemsDoc: TPanel
              Height = 307
              inherited pnlEmissao: TPanel
                Height = 49
              end
              inherited PnlValidade: TPanel
                Top = 190
              end
            end
            inherited pnlFoto: TPanel
              Width = 234
              Height = 307
              Visible = False
              inherited Bevel1: TBevel
                Height = 276
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 276
                Width = 234
                inherited btnAssociarimgPessoa: TButton
                  Top = 142
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 232
                Height = 276
                inherited imgPessoa: TDBImage
                  Top = 1
                end
              end
            end
            inherited lstDocumentos: TListView
              Height = 307
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 724
            Height = 309
            inherited grpTipoEnd: TGroupBox
              Left = 527
              Height = 309
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 724
            Height = 309
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited Panel1: TPanel [0]
            Width = 724
            Height = 309
          end
          inherited dbgTelefone: TwwDBGrid [1]
            Width = 724
            Height = 309
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 724
            Height = 309
          end
          inherited dbgContato: TwwDBGrid
            Width = 724
            Height = 309
          end
        end
        object TbsEmissor: TTabSheet
          Caption = 'Emissores'
          object LblSigla: TLabel
            Left = 8
            Top = 16
            Width = 102
            Height = 13
            Caption = 'Sigla do Emissor :'
          end
          object LblOrigem: TLabel
            Left = 8
            Top = 51
            Width = 109
            Height = 13
            Caption = 'Origem do Capital :'
          end
          object Label2: TLabel
            Left = 8
            Top = 85
            Width = 95
            Height = 13
            Caption = 'Tipo do Capital :'
          end
          object LblSetorEmissor: TLabel
            Left = 8
            Top = 120
            Width = 86
            Height = 13
            Caption = 'Setor Emissor :'
          end
          object Label6: TLabel
            Left = 8
            Top = 152
            Width = 104
            Height = 13
            Caption = 'Porte do Emissor :'
          end
          object lblAgenciaRisco: TLabel
            Left = 8
            Top = 216
            Width = 105
            Height = 13
            Caption = 'Agência de Risco:'
          end
          object LblRating: TLabel
            Left = 8
            Top = 248
            Width = 48
            Height = 13
            Caption = 'Ratings:'
          end
          object Label8: TLabel
            Left = 8
            Top = 185
            Width = 59
            Height = 13
            Caption = 'RiskBank:'
          end
          object Label7: TLabel
            Left = 10
            Top = 277
            Width = 153
            Height = 13
            Caption = 'Segmentação de Mercado:'
          end
          object DBESIGLA: TwwDBEdit
            Left = 121
            Top = 12
            Width = 179
            Height = 21
            DataField = 'SIGLAEMISSOR'
            DataSource = dsSubTipo
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBLkSetorEmissor: TwwDBLookupCombo
            Left = 121
            Top = 112
            Width = 256
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCSETOREMISSOR'#9'40'#9'Descrição do Setor'
              'CODSETOREMISSOR'#9'10'#9'Código'
              'SETORANALIT'#9'1'#9'(A/S)')
            DataField = 'IDSETOREMISSOR'
            DataSource = dsSubTipo
            LookupTable = qrySetorEmissor
            LookupField = 'CODSETOREMISSOR'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBLkOrigemCapital: TwwDBLookupCombo
            Left = 121
            Top = 48
            Width = 256
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCORICAPEMISSOR'#9'40'#9'Origem do Capital')
            DataField = 'CODORICAPEMISSOR'
            DataSource = dsSubTipo
            LookupTable = QryOrigemCapital
            LookupField = 'CODORICAPEMISSOR'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBLkTipoCapital: TwwDBLookupCombo
            Left = 121
            Top = 80
            Width = 256
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTPCAPEMISSOR'#9'40'#9'Tipo de Captial ')
            DataField = 'CODTPCAPEMISSOR'
            DataSource = dsSubTipo
            LookupTable = qryTipoCapital
            LookupField = 'CODTPCAPEMISSOR'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object pnlInstFin: TPanel
            Left = 416
            Top = 24
            Width = 265
            Height = 185
            BevelOuter = bvLowered
            TabOrder = 5
            object Label3: TLabel
              Left = 24
              Top = 128
              Width = 65
              Height = 13
              Caption = 'Mnemônico'
              FocusControl = DBEdit4
            end
            object Label4: TLabel
              Left = 25
              Top = 18
              Width = 164
              Height = 13
              Caption = 'Classe Instituição Financeira'
              FocusControl = DBEdit1
            end
            object Label5: TLabel
              Left = 24
              Top = 72
              Width = 80
              Height = 13
              Caption = 'Código CETIP'
            end
            object DBEdit1: TDBEdit
              Left = 24
              Top = 93
              Width = 124
              Height = 21
              DataField = 'CODCETIP'
              DataSource = dsSubTipo
              TabOrder = 0
            end
            object DBEdit4: TDBEdit
              Left = 24
              Top = 144
              Width = 164
              Height = 21
              DataField = 'CONTACETIP'
              DataSource = dsSubTipo
              TabOrder = 1
            end
            object cboClassInstFin: TwwDBLookupCombo
              Left = 24
              Top = 32
              Width = 233
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCLASSINSTFIN'#9'40'#9'Classes')
              DataField = 'IDCLASSINSTFIN'
              DataSource = dsSubTipo
              LookupTable = qryClassInstFin
              LookupField = 'IDCLASSINSTFIN'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object chkdbInstFin: TDBCheckBox
            Left = 424
            Top = 16
            Width = 145
            Height = 17
            Caption = 'Instituição Financeira'
            DataField = 'FLGINSTFIN'
            DataSource = dsSubTipo
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = chkdbInstFinClick
          end
          object dblkagenciarisco: TwwDBLookupCombo
            Left = 119
            Top = 209
            Width = 256
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCAGENCIARISCO'#9'30'#9'Agência de Risco'#9'F')
            DataField = 'IDAGENCIARISCO'
            DataSource = dsSubTipo
            LookupTable = QryAgenciaRisco
            LookupField = 'IDAGENCIARISCO'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object dbporteemissor: TwwDBComboBox
            Left = 120
            Top = 144
            Width = 257
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = False
            DataField = 'PORTEEMISSOR'
            DataSource = dsSubTipo
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'PEQUENO'#9'0'
              'MÉDIO'#9'1'
              'GRANDE'#9'2')
            Sorted = False
            TabOrder = 7
            UnboundDataType = wwDefault
          end
          object dbedtrating: TwwDBEdit
            Left = 119
            Top = 240
            Width = 121
            Height = 21
            DataField = 'RATING'
            DataSource = dsSubTipo
            TabOrder = 8
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBRealEdit2: TDBRealEdit
            Left = 119
            Top = 177
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 9
            WordWrap = False
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'RISKBANK'
            DataSource = dsSubTipo
          end
          object DbLkcSegmentacao: TwwDBLookupCombo
            Left = 166
            Top = 271
            Width = 250
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCSEGMENTACAO'#9'100'#9'Segmentação de Mercado'#9'F')
            DataField = 'IDSEGMENTACAO'
            DataSource = dsSubTipo
            LookupTable = qrySegmentacao
            LookupField = 'IDSEGMENTACAO'
            Options = [loRowLines]
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      inherited Dock973: TDock97
        Width = 822
      end
      inherited Dock974: TDock97
        Left = 736
        Height = 337
      end
    end
    inherited pnlMestre: TPanel
      Width = 830
      inherited LabelRAZAOSOCIAL: TLabel
        Top = 48
      end
      inherited lblPdGrupo: TLabel
        Top = 49
      end
      inherited dbedRazaoSocial: TDBEdit
        Top = 62
      end
      inherited edDBGrupo: TwwDBEdit
        Top = 62
      end
    end
  end
  inherited Dock972: TDock97
    Width = 832
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        DropdownMenu = PopEmiInst
      end
    end
  end
  inherited Dock971: TDock97
    Top = 550
    Width = 832
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 8
  end
  inherited dsDet: TwwDataSource
    Left = 311
    Top = 8
  end
  inherited ds: TwwDataSource
    Left = 500
    Top = 8
  end
  inherited upd: TUpdateSQL
    Left = 457
    Top = 8
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'EMISSOR.SIGLAEMISSOR'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'EMISSOR.FLGINSTFIN')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Sigla'
      'Nome do Emissor '
      'Razão Social'
      'Inst.Financ.')
    Tabelas.Strings = (
      'EMISSOR'
      'PESSOA')
    CamposChave.Strings = (
      'EMISSOR.IDEMISSOR')
    Filtro.Strings = (
      'EMISSOR.IDEMISSOR = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '40'
      '1')
    Left = 48
    Top = 51
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited qry: TwwQuery
    Left = 413
    Top = 8
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update EMISSOR'
      'set'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDSETOREMISSOR = :IDSETOREMISSOR,'
      '  SIGLAEMISSOR = :SIGLAEMISSOR,'
      '  CODORICAPEMISSOR = :CODORICAPEMISSOR,'
      '  CODTPCAPEMISSOR = :CODTPCAPEMISSOR,'
      '  FLGINSTFIN = :FLGINSTFIN,'
      '  IDCLASSINSTFIN = :IDCLASSINSTFIN,'
      '  CODCETIP = :CODCETIP,'
      '  CONTACETIP = :CONTACETIP,'
      '  IDAGENCIARISCO = :IDAGENCIARISCO,'
      '  PORTEEMISSOR = :PORTEEMISSOR,'
      '  RATING = :RATING,'
      '  RISKBANK = :RISKBANK,'
      '  IDSEGMENTACAO =:IDSEGMENTACAO'
      'where'
      '  IDEMISSOR = :OLD_IDEMISSOR'
      ' ')
    InsertSQL.Strings = (
      'insert into EMISSOR'
      
        '  (IDEMISSOR, IDSETOREMISSOR, SIGLAEMISSOR, CODORICAPEMISSOR, CO' +
        'DTPCAPEMISSOR,'
      
        '   FLGINSTFIN, IDCLASSINSTFIN, CODCETIP, CONTACETIP,IDAGENCIARIS' +
        'CO,PORTEEMISSOR,RATING,RISKBANK, IDSEGMENTACAO)'
      'values'
      
        '  (:IDEMISSOR, :IDSETOREMISSOR, :SIGLAEMISSOR, :CODORICAPEMISSOR' +
        ', :CODTPCAPEMISSOR, '
      
        '   :FLGINSTFIN, :IDCLASSINSTFIN, :CODCETIP, :CONTACETIP,:IDAGENC' +
        'IARISCO,:PORTEEMISSOR,:RATING,:RISKBANK,:IDSEGMENTACAO)')
    DeleteSQL.Strings = (
      'delete from EMISSOR'
      'where'
      '  IDEMISSOR = :OLD_IDEMISSOR')
    Left = 541
    Top = 8
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT   E.IDEMISSOR,E.IDSETOREMISSOR,'
      '    E.SIGLAEMISSOR,E.CODORICAPEMISSOR,'
      '  E.CODTPCAPEMISSOR, E.FLGINSTFIN,'
      '  E.IDCLASSINSTFIN, E.CODCETIP, E.CONTACETIP,'
      '                E.PORTEEMISSOR,E.IDAGENCIARISCO,'
      '                E.RATING, E.RISKBANK, E.IDSEGMENTACAO'
      ''
      'FROM EMISSOR E, AGENCIARISCO A'
      ''
      'WHERE ( E.IDEMISSOR =:IDPESSOA )  AND'
      '               (E.IDAGENCIARISCO = A.IDAGENCIARISCO(+))'
      ' ')
    Left = 589
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySubTipoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qrySubTipoIDSETOREMISSOR: TStringField
      FieldName = 'IDSETOREMISSOR'
      Size = 10
    end
    object qrySubTipoCODORICAPEMISSOR: TStringField
      FieldName = 'CODORICAPEMISSOR'
      Size = 3
    end
    object qrySubTipoCODTPCAPEMISSOR: TStringField
      FieldName = 'CODTPCAPEMISSOR'
      Size = 3
    end
    object qrySubTipoFLGINSTFIN: TStringField
      FieldName = 'FLGINSTFIN'
      Size = 1
    end
    object qrySubTipoIDCLASSINSTFIN: TFloatField
      FieldName = 'IDCLASSINSTFIN'
    end
    object qrySubTipoCODCETIP: TStringField
      FieldName = 'CODCETIP'
      Size = 15
    end
    object qrySubTipoCONTACETIP: TStringField
      FieldName = 'CONTACETIP'
    end
    object qrySubTipoSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
    object qrySubTipoIDAGENCIARISCO: TFloatField
      FieldName = 'IDAGENCIARISCO'
      Origin = 'BASEDADOS.EMISSOR.IDAGENCIARISCO'
    end
    object qrySubTipoPORTEEMISSOR: TStringField
      FieldName = 'PORTEEMISSOR'
      Origin = 'BASEDADOS.EMISSOR.PORTEEMISSOR'
      FixedChar = True
      Size = 1
    end
    object qrySubTipoRATING: TStringField
      FieldName = 'RATING'
      Size = 10
    end
    object qrySubTipoRISKBANK: TFloatField
      FieldName = 'RISKBANK'
    end
    object qrySubTipoIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
    end
  end
  inherited dsSubTipo: TwwDataSource
    Left = 621
    Top = 8
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 644
    Top = 143
  end
  inherited updPessoaFisica: TUpdateSQL
    Left = 585
    Top = 143
  end
  inherited qryPessoaFisica: TwwQuery
    Left = 543
    Top = 143
  end
  inherited ImageList1: TImageList
    Left = 222
    Top = 365
  end
  inherited qryTelefone: TwwQuery
    Left = 394
    Top = 143
  end
  inherited updTelefone: TUpdateSQL
    Left = 442
    Top = 143
  end
  inherited dsTelefone: TwwDataSource
    Left = 489
    Top = 143
  end
  inherited dsEndereco: TwwDataSource
    Left = 261
    Top = 365
  end
  inherited updEndereco: TUpdateSQL
    Left = 300
    Top = 365
  end
  inherited qryEndereco: TwwQuery
    Left = 143
    Top = 365
  end
  inherited qryContato: TwwQuery
    Left = 25
    Top = 365
  end
  inherited updContato: TUpdateSQL
    Left = 64
    Top = 365
  end
  inherited dsContato: TwwDataSource
    Left = 104
    Top = 365
  end
  inherited qryRamal: TwwQuery
    Left = 513
    Top = 412
  end
  inherited updRamal: TUpdateSQL
    Left = 557
    Top = 412
  end
  inherited dsRamal: TwwDataSource
    Left = 602
    Top = 412
  end
  inherited qryDocumento: TwwQuery
    Left = 379
    Top = 365
  end
  inherited dsDocumento: TwwDataSource
    Left = 423
    Top = 412
  end
  inherited updDocumento: TUpdateSQL
    Left = 468
    Top = 412
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 380
    Top = 8
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 293
    Top = 8
  end
  inherited Pessoa: TPessoa
    SubTipo = stEmissor
    MostraFoto = False
    Left = 316
    Top = 40
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 340
    Top = 365
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 334
    Top = 412
  end
  inherited qryImagensDoc: TwwQuery
    Left = 244
    Top = 412
  end
  object qrySetorEmissor: TwwQuery [43]
    DatabaseName = 'basedados'
    DataSource = dsImagensDoc
    SQL.Strings = (
      'select codsetorEmissor , descSetorEmissor , SetorAnalit'
      '  from SetorEmissor')
    ValidateWithMask = True
    Left = 157
    Top = 308
    object qrySetorEmissorDESCSETOREMISSOR: TStringField
      DisplayLabel = 'Descrição do Setor'
      DisplayWidth = 40
      FieldName = 'DESCSETOREMISSOR'
      Origin = 'SETOREMISSOR.DESCSETOREMISSOR'
      Size = 60
    end
    object qrySetorEmissorCODSETOREMISSOR: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODSETOREMISSOR'
      Origin = 'SETOREMISSOR.CODSETOREMISSOR'
      Size = 10
    end
    object qrySetorEmissorSETORANALIT: TStringField
      DisplayLabel = '(A/S)'
      DisplayWidth = 1
      FieldName = 'SETORANALIT'
      Origin = 'SETOREMISSOR.SETORANALIT'
      Size = 1
    end
  end
  object dsSetorEmissor: TwwDataSource [44]
    DataSet = qrySetorEmissor
    Left = 66
    Top = 412
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 379
    Top = 412
  end
  inherited qryTipoDoc: TwwQuery
    Left = 289
    Top = 412
  end
  inherited qryEstado: TwwQuery
    Left = 279
    Top = 117
  end
  inherited qryCidade: TwwQuery
    Top = 117
  end
  object QryOrigemCapital: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'Select CodOriCapEmissor,DESCORICAPEMISSOR'
      'From OrigemCapEmissor')
    ValidateWithMask = True
    Left = 157
    Top = 244
    object QryOrigemCapitalDESCORICAPEMISSOR: TStringField
      DisplayLabel = 'Origem do Capital'
      DisplayWidth = 40
      FieldName = 'DESCORICAPEMISSOR'
      Origin = 'ORIGEMCAPEMISSOR.DESCORICAPEMISSOR'
      Size = 60
    end
    object QryOrigemCapitalCODORICAPEMISSOR: TStringField
      DisplayLabel = 'Origem do Capital'
      DisplayWidth = 40
      FieldName = 'CODORICAPEMISSOR'
      Origin = 'ORIGEMCAPEMISSOR.CODORICAPEMISSOR'
      Visible = False
      Size = 3
    end
  end
  object qryTipoCapital: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select CodTpCapEmissor,DESCTPCAPEMISSOR'
      'from tipocapemissor')
    ValidateWithMask = True
    Left = 157
    Top = 276
    object qryTipoCapitalDESCTPCAPEMISSOR: TStringField
      DisplayLabel = 'Tipo de Captial '
      DisplayWidth = 40
      FieldName = 'DESCTPCAPEMISSOR'
      Origin = 'TIPOCAPEMISSOR.DESCTPCAPEMISSOR'
      Size = 60
    end
    object qryTipoCapitalCODTPCAPEMISSOR: TStringField
      DisplayLabel = 'Tipo de Captial '
      DisplayWidth = 40
      FieldName = 'CODTPCAPEMISSOR'
      Origin = 'TIPOCAPEMISSOR.CODTPCAPEMISSOR'
      Visible = False
      Size = 3
    end
  end
  object DSTipoCapital: TwwDataSource
    DataSet = qryTipoCapital
    Left = 110
    Top = 412
  end
  object DSOrigemCapital: TwwDataSource
    DataSet = QryOrigemCapital
    Left = 155
    Top = 412
  end
  object QryProcuraEmissor: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 200
    Top = 412
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 21
    Top = 412
  end
  object qryClassInstFin: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IdClassInstFin, DescClassInstFin '
      ''
      'From ClassInstFin'
      ''
      'Order By DescClassInstFin')
    ValidateWithMask = True
    Left = 182
    Top = 365
    object qryClassInstFinDESCCLASSINSTFIN: TStringField
      DisplayLabel = 'Classes'
      DisplayWidth = 40
      FieldName = 'DESCCLASSINSTFIN'
      Origin = 'CLASSINSTFIN.DESCCLASSINSTFIN'
      Size = 30
    end
    object qryClassInstFinIDCLASSINSTFIN: TFloatField
      FieldName = 'IDCLASSINSTFIN'
      Origin = 'CLASSINSTFIN.IDCLASSINSTFIN'
      Visible = False
    end
  end
  object dtsClassInstFin: TwwDataSource
    DataSet = qryClassInstFin
    Left = 421
    Top = 364
  end
  object PopEmiInst: TPopupMenu
    Left = 128
    Top = 48
    object Emissores1: TMenuItem
      Caption = 'Emissores'
      OnClick = Emissores1Click
    end
    object AgnciasBancrias1: TMenuItem
      Caption = 'Agências Bancárias'
      OnClick = AgnciasBancrias1Click
    end
  end
  object MSAgenciaBancaria: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P2.NOME'
      'PESSOA.NOME'
      'AGENCIABANCARIA.NUMAGENCIA'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Banco'
      'Agencia'
      'Numero Agencia'
      'Razão Social ')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'AGENCIABANCARIA'
      'PESSOA'
      'BANCO'
      'PESSOA P2')
    CamposChave.Strings = (
      'AGENCIABANCARIA.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'AGENCIABANCARIA.IDPESSOA = PESSOA.IDPESSOA'
      'AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA'
      'BANCO.IDPESSOA = P2.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '15'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 218
    Top = 56
  end
  object MSEmissor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EMISSOR.SIGLAEMISSOR'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'EMISSOR.FLGINSTFIN'
      'SEGMENTACAOMERCADO.DESCSEGMENTACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Sigla'
      'Nome do Emissor '
      'Razão Social'
      'Inst.Financ.'
      'Segmentação de Mercado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EMISSOR'
      'PESSOA'
      'SEGMENTACAOMERCADO')
    CamposChave.Strings = (
      'EMISSOR.IDEMISSOR'
      'EMISSOR.IDSEGMENTACAO')
    Filtro.Strings = (
      'EMISSOR.IDEMISSOR = PESSOA.IDPESSOA'
      'EMISSOR.IDSEGMENTACAO = SEGMENTACAOMERCADO.IDSEGMENTACAO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '40'
      '1'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 288
    Top = 43
  end
  object QryAgenciaRisco: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDAGENCIARISCO, DESCAGENCIARISCO'
      'FROM AGENCIARISCO '
      'ORDER BY DESCAGENCIARISCO')
    ValidateWithMask = True
    Left = 369
    Top = 253
    object QryAgenciaRiscoDESCAGENCIARISCO: TStringField
      DisplayLabel = 'Agência de Risco'
      DisplayWidth = 30
      FieldName = 'DESCAGENCIARISCO'
      Origin = 'BASEDADOS.AGENCIARISCO.DESCAGENCIARISCO'
      Size = 30
    end
    object QryAgenciaRiscoIDAGENCIARISCO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAGENCIARISCO'
      Origin = 'BASEDADOS.AGENCIARISCO.IDAGENCIARISCO'
      Visible = False
    end
  end
  object qrySegmentacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT '
      '  IDSEGMENTACAO, '
      '  DESCSEGMENTACAO '
      'FROM '
      '  SEGMENTACAOMERCADO'
      'WHERE IDGRUPO = 2')
    ValidateWithMask = True
    Left = 436
    Top = 492
    object qrySegmentacaoDESCSEGMENTACAO: TStringField
      DisplayLabel = 'Segmentação de Mercado'
      DisplayWidth = 100
      FieldName = 'DESCSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.DESCSEGMENTACAO'
      Size = 100
    end
    object qrySegmentacaoIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDSEGMENTACAO'
      Visible = False
    end
  end
end
