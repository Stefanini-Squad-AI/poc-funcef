inherited frmCadParam: TfrmCadParam
  Left = 253
  Top = 178
  HelpContext = 230005
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 470
  ClientWidth = 608
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 608
    Height = 384
    BorderWidth = 2
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 604
      Height = 380
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Destacamento'
        object GroupBox1: TGroupBox
          Left = 9
          Top = 130
          Width = 282
          Height = 147
          Caption = ' Contas a Pagar '
          TabOrder = 0
          object Label47: TLabel
            Left = 11
            Top = 16
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object Label48: TLabel
            Left = 11
            Top = 103
            Width = 116
            Height = 13
            Caption = 'Tipo de Desembolso'
            Visible = False
          end
          object Label6: TLabel
            Left = 11
            Top = 61
            Width = 182
            Height = 13
            Caption = 'Portador / Forma de Pagamento'
          end
          object dblcTipoDoc: TwwDBLookupCombo
            Left = 11
            Top = 30
            Width = 260
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'#9'F'
              'RECPAG'#9'1'#9'P/R'#9'F')
            DataField = 'CODTIPDOCPAG'
            DataSource = ds
            LookupTable = cdsTipoDocCap
            LookupField = 'CODTIPDOC'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblcTipoDesemb: TwwDBLookupCombo
            Left = 11
            Top = 117
            Width = 260
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'#9'F')
            DataField = 'CODTIPDES'
            DataSource = ds
            LookupTable = cdsTipoDesemb
            LookupField = 'CODTIPRECDES'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 1
            Visible = False
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblkPortadorFormaCAP: TwwDBLookupCombo
            Left = 11
            Top = 75
            Width = 260
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            DataField = 'CODPORTFORMAPAG'
            DataSource = ds
            LookupTable = cdsPortadorFormaCAP
            LookupField = 'CODPORTFORMA'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
        end
        object GroupBox2: TGroupBox
          Left = 299
          Top = 130
          Width = 287
          Height = 147
          Caption = ' Contas a Receber '
          TabOrder = 1
          object Label1: TLabel
            Left = 11
            Top = 16
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object Label2: TLabel
            Left = 11
            Top = 104
            Width = 122
            Height = 13
            Caption = 'Tipo de Recebimento'
            Visible = False
          end
          object Label7: TLabel
            Left = 11
            Top = 62
            Width = 193
            Height = 13
            Caption = 'Portador / Forma de Recebimento'
          end
          object wwDBLookupCombo1: TwwDBLookupCombo
            Left = 11
            Top = 30
            Width = 260
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'#9'F'
              'RECPAG'#9'1'#9'P/R'#9'F')
            DataField = 'CODTIPDOCREC'
            DataSource = ds
            LookupTable = cdsTipoDocCar
            LookupField = 'CODTIPDOC'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object wwDBLookupCombo2: TwwDBLookupCombo
            Left = 11
            Top = 118
            Width = 260
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'Descrição'#9'F')
            DataField = 'CODTIPREC'
            DataSource = ds
            LookupTable = cdsTipoReceb
            LookupField = 'CODTIPRECDES'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 1
            Visible = False
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblkPortadorFormaCAR: TwwDBLookupCombo
            Left = 11
            Top = 76
            Width = 260
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            DataField = 'CODPORTFORMAREC'
            DataSource = ds
            LookupTable = cdsPortadorFormaCAR
            LookupField = 'CODPORTFORMA'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
        end
        object GroupBox3: TGroupBox
          Left = 9
          Top = 280
          Width = 577
          Height = 58
          Caption = 'Plano / Patro'
          TabOrder = 2
          object Label4: TLabel
            Left = 10
            Top = 15
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object Label5: TLabel
            Left = 292
            Top = 15
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object dblkPatrocinadora: TwwDBLookupCombo
            Left = 11
            Top = 30
            Width = 267
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Patrocinadora'#9'F')
            DataField = 'IDPATRO'
            DataSource = ds
            LookupTable = cdsPatrocinadora
            LookupField = 'IDPESSOA'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblkPlanoPrevidenciario: TwwDBLookupCombo
            Left = 293
            Top = 30
            Width = 267
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Plano Previdenciário'#9'F')
            DataField = 'IDPLANOPREV'
            DataSource = ds
            LookupTable = cdsPlanoPrevidenciario
            LookupField = 'IDPLANOPREV'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
        end
        object GroupBox4: TGroupBox
          Left = 9
          Top = 0
          Width = 578
          Height = 129
          TabOrder = 3
          object Label18: TLabel
            Left = 8
            Top = 13
            Width = 127
            Height = 13
            Caption = '% Acréscimo da Diária'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 6
            Top = 77
            Width = 120
            Height = 13
            Caption = '% Redução da Diária'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 446
            Top = 13
            Width = 71
            Height = 13
            Caption = 'Vl. Fixo Taxi'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 202
            Top = 13
            Width = 166
            Height = 13
            Caption = 'Dias Úteis para o Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblDiasUteisDestac: TLabel
            Left = 202
            Top = 77
            Width = 173
            Height = 13
            Caption = 'Dias Úteis para Destacamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbe1: TDBEdit
            Left = 35
            Top = 28
            Width = 68
            Height = 21
            Color = clWhite
            DataField = 'VLRPERCENTACRESCIMODIARIA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbe2: TDBEdit
            Left = 30
            Top = 92
            Width = 68
            Height = 21
            Color = clWhite
            DataField = 'VLRPERCENTREDUCAODIARIA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object dbe3: TDBEdit
            Left = 447
            Top = 28
            Width = 68
            Height = 21
            Color = clWhite
            DataField = 'VLRFIXOTAXITRECHO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object wwDBSpinEdit1: TwwDBSpinEdit
            Left = 246
            Top = 29
            Width = 61
            Height = 21
            Increment = 1
            DataField = 'DIASENVIODST'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object dbspnedtDiasDestac: TwwDBSpinEdit
            Left = 246
            Top = 92
            Width = 61
            Height = 21
            Increment = 1
            DataField = 'DIASBLOQDESTAC'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            UnboundDataType = wwDefault
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Outros'
        ImageIndex = 1
        object gbxDias: TGroupBox
          Left = 11
          Top = 213
          Width = 312
          Height = 62
          Caption = ' Dias Úteis para o Acerto de Contas das Viagens '
          TabOrder = 0
          Visible = False
          object dbspeAvalMax: TwwDBSpinEdit
            Left = 12
            Top = 23
            Width = 86
            Height = 21
            Increment = 1
            DataField = 'DIASACERTOCONTA'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
        object Panel1: TPanel
          Left = 9
          Top = 97
          Width = 570
          Height = 93
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object lblAssuntoMsg: TLabel
            Left = 9
            Top = 46
            Width = 132
            Height = 13
            Caption = 'Assunto da Mensagem:'
          end
          object lblEmailConexao: TLabel
            Left = 9
            Top = 6
            Width = 118
            Height = 13
            Caption = 'Conexão com e-mail:'
          end
          object dbedtAssuntoMsg: TDBEdit
            Left = 9
            Top = 61
            Width = 552
            Height = 21
            DataField = 'ASSUNTOMSG'
            DataSource = dsMsg
            TabOrder = 0
          end
          object dblkpConexaEmail: TwwDBLookupCombo
            Left = 9
            Top = 21
            Width = 552
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            DataField = 'IDEMAILCONEXAO'
            DataSource = dsMsg
            LookupTable = cdsEmailConexao
            LookupField = 'IDEMAILCONEXAO'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object dbrdgrpFlgTipoEnvio: TDBRadioGroup
          Left = 9
          Top = 20
          Width = 570
          Height = 57
          Caption = ' Forma de Envio da Mensagem Cobrando Acerto de Contas '
          Columns = 3
          DataField = 'FLGTIPOENVIO'
          DataSource = dsMsg
          Items.Strings = (
            'Nenhum'
            'E-mail'
            'Mensagem CM'
            'Ambos')
          TabOrder = 2
          Values.Strings = (
            '0'
            '1'
            '2'
            '3')
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 608
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 431
    Width = 608
    inherited tb97Fundo: TToolbar97
      Left = 416
      DockPos = 416
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230005
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 247
      DockPos = 247
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 517
    Top = 28
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 242
    Top = 49
  end
  inherited ImlPadrao: TImageList
    Left = 547
    Top = 9
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
    Left = 318
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
    object CdsMATRDIS: TStringField
      FieldName = 'MATRDIS'
      FixedChar = True
      Size = 8
    end
    object CdsMOEDAPROCTRAB: TFloatField
      FieldName = 'MOEDAPROCTRAB'
    end
    object CdsIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
    end
    object CdsIDRUBIRRF: TFloatField
      FieldName = 'IDRUBIRRF'
    end
    object CdsLIMADM: TFloatField
      FieldName = 'LIMADM'
    end
    object d: TFloatField
      FieldName = 'LIMDEM'
    end
    object CdsLIMAFAST: TFloatField
      FieldName = 'LIMAFAST'
    end
    object CdsLIMRETOR: TFloatField
      FieldName = 'LIMRETOR'
    end
    object CdsNUMSTEPS: TFloatField
      FieldName = 'NUMSTEPS'
    end
    object CdsTITSTEP1: TStringField
      FieldName = 'TITSTEP1'
      Size = 15
    end
    object CdsTITSTEP2: TStringField
      FieldName = 'TITSTEP2'
      Size = 15
    end
    object CdsTITSTEP3: TStringField
      FieldName = 'TITSTEP3'
      Size = 15
    end
    object CdsTITSTEP4: TStringField
      FieldName = 'TITSTEP4'
      Size = 15
    end
    object CdsTITSTEP5: TStringField
      FieldName = 'TITSTEP5'
      Size = 15
    end
    object CdsTITSTEP6: TStringField
      FieldName = 'TITSTEP6'
      Size = 15
    end
    object CdsTITSTEP7: TStringField
      FieldName = 'TITSTEP7'
      Size = 15
    end
    object CdsTITSTEP8: TStringField
      FieldName = 'TITSTEP8'
      Size = 15
    end
    object CdsTITSTEP9: TStringField
      FieldName = 'TITSTEP9'
      Size = 15
    end
    object CdsIDRUBFGTS: TFloatField
      FieldName = 'IDRUBFGTS'
    end
    object CdsIDRUBINSS: TFloatField
      FieldName = 'IDRUBINSS'
    end
    object CdsIDRUB13: TFloatField
      FieldName = 'IDRUB13'
    end
    object CdsIDRUBANTEC13: TFloatField
      FieldName = 'IDRUBANTEC13'
    end
    object CdsNORMALINI: TDateTimeField
      FieldName = 'NORMALINI'
    end
    object CdsNORMALFIM: TDateTimeField
      FieldName = 'NORMALFIM'
    end
    object CdsFERIASINI: TDateTimeField
      FieldName = 'FERIASINI'
    end
    object CdsFERIASFIM: TDateTimeField
      FieldName = 'FERIASFIM'
    end
    object CdsPGTO13INI: TDateTimeField
      FieldName = 'PGTO13INI'
    end
    object CdsPGTO13FIM: TDateTimeField
      FieldName = 'PGTO13FIM'
    end
    object CdsFLGDOISCARGOS: TFloatField
      FieldName = 'FLGDOISCARGOS'
    end
    object CdsFLGNIVELINDIV: TFloatField
      FieldName = 'FLGNIVELINDIV'
    end
    object CdsIDRUBFALTA: TFloatField
      FieldName = 'IDRUBFALTA'
    end
    object CdsFLGINTEGRACONT: TFloatField
      FieldName = 'FLGINTEGRACONT'
    end
    object CdsFLGINTEGRACAP: TFloatField
      FieldName = 'FLGINTEGRACAP'
    end
    object CdsTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object CdsTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object CdsFLGCRIASUBCONTA: TFloatField
      FieldName = 'FLGCRIASUBCONTA'
    end
    object CdsFLGSENHAUSOPES: TFloatField
      FieldName = 'FLGSENHAUSOPES'
    end
    object CdsFLGENDERINS: TFloatField
      FieldName = 'FLGENDERINS'
    end
    object CdsFLGENDERALT: TFloatField
      FieldName = 'FLGENDERALT'
    end
    object CdsFLGENDEREXC: TFloatField
      FieldName = 'FLGENDEREXC'
    end
    object CdsFLGTELEFINS: TFloatField
      FieldName = 'FLGTELEFINS'
    end
    object CdsFLGTELEFALT: TFloatField
      FieldName = 'FLGTELEFALT'
    end
    object CdsFLGTELEFEXC: TFloatField
      FieldName = 'FLGTELEFEXC'
    end
    object CdsFLGCONTTINS: TFloatField
      FieldName = 'FLGCONTTINS'
    end
    object CdsFLGCONTTALT: TFloatField
      FieldName = 'FLGCONTTALT'
    end
    object CdsFLGCONTTEXC: TFloatField
      FieldName = 'FLGCONTTEXC'
    end
    object CdsFLGCURSOINS: TFloatField
      FieldName = 'FLGCURSOINS'
    end
    object CdsFLGCURSOALT: TFloatField
      FieldName = 'FLGCURSOALT'
    end
    object CdsFLGCURSOEXC: TFloatField
      FieldName = 'FLGCURSOEXC'
    end
    object CdsFLGFERIAINS: TFloatField
      FieldName = 'FLGFERIAINS'
    end
    object CdsFLGFERIAALT: TFloatField
      FieldName = 'FLGFERIAALT'
    end
    object CdsFLGFERIAEXC: TFloatField
      FieldName = 'FLGFERIAEXC'
    end
    object CdsFLGEMPRGINS: TFloatField
      FieldName = 'FLGEMPRGINS'
    end
    object CdsFLGEMPRGALT: TFloatField
      FieldName = 'FLGEMPRGALT'
    end
    object CdsFLGEMPRGEXC: TFloatField
      FieldName = 'FLGEMPRGEXC'
    end
    object CdsFLGCTSALALT: TFloatField
      FieldName = 'FLGCTSALALT'
    end
    object CdsFLGLINHAINS: TFloatField
      FieldName = 'FLGLINHAINS'
    end
    object CdsFLGLINHAALT: TFloatField
      FieldName = 'FLGLINHAALT'
    end
    object CdsFLGLINHAEXC: TFloatField
      FieldName = 'FLGLINHAEXC'
    end
    object CdsINDDURACAOCONTR: TFloatField
      FieldName = 'INDDURACAOCONTR'
    end
    object CdsFLGNUMERAMATRIC: TFloatField
      FieldName = 'FLGNUMERAMATRIC'
    end
    object CdsTAMANHOMATRIC: TFloatField
      FieldName = 'TAMANHOMATRIC'
    end
    object CdsIDMOTIVORESCISAO: TFloatField
      FieldName = 'IDMOTIVORESCISAO'
    end
    object CdsIDPARAMRH: TFloatField
      FieldName = 'IDPARAMRH'
    end
    object CdsINDPOLITICA: TFloatField
      FieldName = 'INDPOLITICA'
    end
    object CdsIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object CdsCOLDOCUMENTO: TFloatField
      FieldName = 'COLDOCUMENTO'
    end
    object CdsTAMDOCUMENTO: TFloatField
      FieldName = 'TAMDOCUMENTO'
    end
    object CdsFLGFILTRAFATOR: TFloatField
      FieldName = 'FLGFILTRAFATOR'
    end
    object CdsFLGAVALALUNO: TFloatField
      FieldName = 'FLGAVALALUNO'
    end
    object CdsFLGCURSOXAVAL: TFloatField
      FieldName = 'FLGCURSOXAVAL'
    end
    object CdsVALMAXAVALTRN: TFloatField
      FieldName = 'VALMAXAVALTRN'
    end
    object CdsFLGBANCOHORAS: TFloatField
      FieldName = 'FLGBANCOHORAS'
    end
    object CdsPERBANCOHORAS: TFloatField
      FieldName = 'PERBANCOHORAS'
    end
    object CdsLIMBANCOHORAS: TFloatField
      FieldName = 'LIMBANCOHORAS'
    end
    object CdsDSRBANCOHORAS: TFloatField
      FieldName = 'DSRBANCOHORAS'
    end
    object CdsINDPERBCHORAS: TFloatField
      FieldName = 'INDPERBCHORAS'
    end
    object CdsDATBANCOHORAS: TDateTimeField
      FieldName = 'DATBANCOHORAS'
    end
    object CdsNORBANCOHORAS: TFloatField
      FieldName = 'NORBANCOHORAS'
    end
    object CdsFLGPERCPROB: TFloatField
      FieldName = 'FLGPERCPROB'
    end
    object CdsINDCONTABJUR: TFloatField
      FieldName = 'INDCONTABJUR'
    end
    object CdsINDORCAMPES: TFloatField
      FieldName = 'INDORCAMPES'
    end
    object CdsFLGBLOQCAND: TFloatField
      FieldName = 'FLGBLOQCAND'
    end
    object CdsPONTOINI: TDateTimeField
      FieldName = 'PONTOINI'
    end
    object CdsPONTOFIM: TDateTimeField
      FieldName = 'PONTOFIM'
    end
    object CdsDIRCONFIG: TStringField
      FieldName = 'DIRCONFIG'
      Size = 200
    end
    object CdsFLGUSAQUERY: TFloatField
      FieldName = 'FLGUSAQUERY'
    end
    object CdsDIASACERTOCONTA: TFloatField
      FieldName = 'DIASACERTOCONTA'
    end
    object CdsFLGCALENDST: TFloatField
      FieldName = 'FLGCALENDST'
    end
    object CdsRECPAGREC: TStringField
      FieldName = 'RECPAGREC'
      FixedChar = True
      Size = 1
    end
    object CdsCODTIPDES: TStringField
      FieldName = 'CODTIPDES'
      FixedChar = True
      Size = 15
    end
    object CdsRECPAGDES: TStringField
      FieldName = 'RECPAGDES'
      FixedChar = True
      Size = 1
    end
    object CdsCODTIPREC: TStringField
      FieldName = 'CODTIPREC'
      FixedChar = True
      Size = 15
    end
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsFLGMARCAAFAST: TFloatField
      FieldName = 'FLGMARCAAFAST'
    end
    object CdsFLGMARCAFERIAS: TFloatField
      FieldName = 'FLGMARCAFERIAS'
    end
    object CdsFLGALTERAPONTO: TFloatField
      FieldName = 'FLGALTERAPONTO'
    end
    object CdsCODTIPDOCREC: TFloatField
      FieldName = 'CODTIPDOCREC'
    end
    object CdsCODTIPDOCPAG: TFloatField
      FieldName = 'CODTIPDOCPAG'
    end
    object CdsCODPORTFORMAPAG: TFloatField
      FieldName = 'CODPORTFORMAPAG'
    end
    object CdsCODPORTFORMAREC: TFloatField
      FieldName = 'CODPORTFORMAREC'
    end
    object CdsIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object CdsIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object CdsDIASENVIODST: TFloatField
      FieldName = 'DIASENVIODST'
    end
    object CdsPRAZOPONTO: TFloatField
      FieldName = 'PRAZOPONTO'
    end
    object CdsFLGMARCADIAFOLGA: TFloatField
      FieldName = 'FLGMARCADIAFOLGA'
    end
    object CdsINDLIMITESAIDA: TFloatField
      FieldName = 'INDLIMITESAIDA'
    end
    object CdsFLGTIPOTRANSF: TFloatField
      FieldName = 'FLGTIPOTRANSF'
    end
    object CdsFLGFATORBANCONEG: TFloatField
      FieldName = 'FLGFATORBANCONEG'
    end
    object CdsFLGALTAUTOPONTO: TFloatField
      FieldName = 'FLGALTAUTOPONTO'
    end
    object CdsDATAVIGENCIAOBJ: TDateTimeField
      FieldName = 'DATAVIGENCIAOBJ'
    end
    object CdsDATACORROBJ: TDateTimeField
      FieldName = 'DATACORROBJ'
    end
    object CdsPLNCODIGOOBJ: TFloatField
      FieldName = 'PLNCODIGOOBJ'
    end
    object CdsVLRPERCENTACRESCIMODIARIA: TFloatField
      FieldName = 'VLRPERCENTACRESCIMODIARIA'
    end
    object CdsVLRPERCENTREDUCAODIARIA: TFloatField
      FieldName = 'VLRPERCENTREDUCAODIARIA'
    end
    object CdsVLRFIXOTAXITRECHO: TFloatField
      FieldName = 'VLRFIXOTAXITRECHO'
      DisplayFormat = '###,##0.00'
    end
    object CdsDIASBLOQDESTAC: TFloatField
      FieldName = 'DIASBLOQDESTAC'
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 485
    Top = 33
  end
  object CdsMsg: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 400
    Top = 8
  end
  object dsMsg: TDataSource
    DataSet = CdsMsg
    Left = 384
    Top = 24
  end
  object cdsEmailConexao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 478
    Top = 10
  end
  object cdsTipoDesemb: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 283
    Data = {
      5BB200009619E0BD01000000180000000600D30200000300000030010C434F44
      54495052454344455301004900000002000753554254595045020049000A0046
      697865644368617200055749445448020002000F000944455343524943414F01
      004900000001000557494454480200020023000F504C41434F4E544143524544
      49544F01004900000002000753554254595045020049000A0046697865644368
      61720005574944544802000200120005504C414E4F080004000000000008504C
      41434F4E544101004900000002000753554254595045020049000A0046697865
      6443686172000557494454480200020012000652454350414701004900000001
      0005574944544802000200070002000D44454641554C545F4F52444552020082
      00010000000200044C4349440400010009080000000000073031303030353011
      41636F72646F20456D7072E97374696D6F083231333730313034000000000080
      4540043533313105506167617200000007303033303032302241435245534349
      4D4F2056414C4F522044452042454D2050415452494D4F4E49414C0632313231
      3033000000000080454008313331313031313005506167617200000007303035
      3030383022414449414E54414D454E544F202D20435552534F5320452053454D
      494E4152494F5306323132313033000000000080454008313232313939303205
      506167617200000007303035303037391F414449414E54414D454E544F202D20
      4556454E544F5320494E5445524E4F5306323132313033000000000080454008
      313232313939303205506167617200000107303031303035301A41444943494F
      4E414C204445205452414E53464552CA4E434941063231323130330000000000
      80454005506167617200000007303130303034361D41444A5544494341444F53
      202D204F55545241532044455350455341530832313337303230350000000000
      804540083532373231353033055061676172000001073130373030313413414C
      554755454C204445204841524457415245063231323130330000000000804540
      055061676172000001073130373030313112414C554755454C20444520494DD3
      5645495306323132313033000000000080454005506167617200000107303035
      303031311D414C554755454C20444520494D4F564549532F434F4E444F4DCD4E
      494F063231323130330000000000804540055061676172000001073130373030
      313216414C554755454C20444520494E5354414C41C7D5455306323132313033
      0000000000804540055061676172000001073130373030313322414C55475545
      4C204445204DC15155494E41532045204551554950414D454E544F5306323132
      313033000000000080454005506167617200000107313037303031351E414C55
      4755454C204445204DD3564549532045205554454E53CD4C494F530632313231
      30330000000000804540055061676172000001073130373030313713414C5547
      55454C20444520534F4654574152450632313231303300000000008045400550
      61676172000001073130373030313613414C554755454C204445205645CD4355
      4C4F530632313231303300000000008045400550616761720000000731303630
      30313023415155495349C7C34F204445204D4154455249414C2D20414C4D4F58
      4152494641444F06323132313033000000000080454006313232323031055061
      67617200000107303034303030351D41515549534943414F204445204F555452
      4F53204D41544552494149530632313231303300000000008045400550616761
      7200000007313039303030311D415155495349C7C34F204D4154455249414C20
      5045524D414E454E544506323132313033000000000080454008313331313031
      313005506167617200000107303032303034310B415251554956495354415306
      3231323130330000000000804540055061676172000001073130373030303220
      415353494E415455524120444520504552494F4449434F532045204DCD444941
      0632313231303300000000008045400550616761720000010730303230303036
      0941554449544F52494106323132313033000000000080454005506167617200
      00000730303130303639204155582E20504C414E4F204D454449432E20434F50
      4152544943495041C7C34F063231323130330000000000804540083132323139
      393034055061676172000001073030313030363319415558494C494F20504C41
      4E4F204D45444943414D454E544F063231323130330000000000804540055061
      67617200000107303035303034301A42454E53204445205045512056414C4F52
      202D204C4956524F530632313231303300000000008045400550616761720000
      0107303035303034311A42454E53204445205045512056414C4F52202D204F55
      54524F5306323132313033000000000080454005506167617200000107303035
      303033382342454E53204445205045512056414C4F522D484152445741524553
      204520534F465457063231323130330000000000804540055061676172000001
      07303035303033392242454E53204445205045512056414C4F522D4D41515549
      4E41532045204551554950063231323130330000000000804540055061676172
      00000107313036303030371542454E532044452050455155454E4F2056414C4F
      5206323132313033000000000080454005506167617200000007313038303032
      3023424C4F515545494F204A55442E2D2050454E484F5241204F4E4C494E4520
      2D2041444D063231323130330000000000804540063132323430310550616761
      72000000073130383030313923424C4F515545494F204A55442E2D2050454E48
      4F5241204F4E4C494E45202D20494E5608323131393034303500000000008045
      4006313233383031055061676172000000073130383030313823424C4F515545
      494F204A55442E2D2050454E484F5241204F4E4C494E452D2050524556083231
      3139303430350000000000804540063132313530310550616761720000010730
      30353030363923424C4F515545494F204A5544494349414C202D2050454E484F
      5241204F4E2D4C494E4508323131393034303500000000008045400550616761
      72000000073130323030333523425241444553434F205341554445202D205041
      52542045582D454D5052454741444F5306323132313033000000000080454008
      313232313939303205506167617200000107313032303033341D425241444553
      434F205341554445202D2050415254494349504143414F063231323130330000
      00000080454005506167617200000107313037303035301043415254C34F2044
      452041434553534F063231323130330000000000804540055061676172001001
      07303035303032341043415254C34F2044452041434553534F00000000000044
      4005506167617200100107303031303034321E4345462D434F4E56454E494F2F
      43414958412054524142414C4841444F520000000000003E4005506167617200
      000107303036303030381643454E5452414C204445204154454E44494D454E54
      4F06323132313033000000000080454005506167617200000107313034303030
      3918434552544946494341C7C34F20444520474553544F524553063231323130
      3300000000008045400550616761720010010730303630303039054345544950
      0000000000000040055061676172001001073030393030303213434F41424520
      2D2041434552544F20494E535300000000000044400550616761720010010730
      30393030303322434F414245202D2052455041535345205245454D4220494E53
      532F505245564841420000000000004440055061676172001001073030393030
      303415434F414245202D20524550415353534520495252460000000000004440
      055061676172000000073031343030303713434F46494E53202D204D454E5341
      4C20524554083231323230313036000000000080454008323132323031303605
      506167617200000107313037303033371C434F4D42555354CD56454953204520
      4C55425249464943414E54455306323132313033000000000080454005506167
      6172000000073030353030373209434F4D495353D54553083231333730313034
      0000000000804540063532373130350550616761720000010731303130303431
      13434F4D4954CA53202D205245454D424F4C534F063231323130330000000000
      804540055061676172000000073030353030363418434F4E442E2044414E4F53
      204D415445524941495320464806323132313033000000000080454008323233
      3130313032055061676172000001073030353030333213434F4E44454E41C7C3
      4F204A5544494349414C06323132313033000000000080454005506167617200
      000107313037303033310A434F4E444F4DCD4E494F0632313231303300000000
      0080454005506167617200000107313037303033360F434F4E4455C7C34F2055
      5242414E41063231323130330000000000804540055061676172000001073030
      32303034391E434F4E445543414F20555242414E412F4553544143494F4E414D
      454E544F06323132313033000000000080454005506167617200000007313031
      303030341E434F4E53454C484549524F53202D20494E53532028415554D44E4F
      4D4F290832313232303130310000000000804540063231323130330550616761
      7200000107313031303030321D434F4E53454C484549524F53202D20494E5353
      2028454D50524553412908323132323031303100000000008045400550616761
      72000000073130313030303313434F4E53454C484549524F53202D2049525246
      0A32313232303130323032000000000080454006323132313033055061676172
      00000107313031303030311A434F4E53454C484549524F53202D2052454D554E
      455241C7C34F0632313231303300000000008045400550616761720000010730
      30313030343117434F4E53454C484F53202D2052454D554E455241C7C34F0632
      3132313033000000000080454005506167617200100107313033303031371D43
      4F4E53454C484F53204520434F4D4954CA53202D204449C15249415300000000
      00804540055061676172000001073130333030313620434F4E53454C484F5320
      4520434F4D4954CA53202D20484F535045444147454D06323132313033000000
      000080454005506167617200100107313033303031381E434F4E53454C484F53
      204520434F4D4954CA53202D20504153534147454D0000000000804540055061
      67617200000107313033303031391A434F4E53454C484F53204520434F4D4954
      CA53202D20544158490632313231303300000000008045400550616761720000
      01073030323030303522434F4E534552564143414F2F4C494D50455A412F5345
      52562E20415558494C4941520632313231303300000000008045400550616761
      72000001073030323030363114434F4E53554C544F5249412041545541524941
      4C06323132313033000000000080454005506167617200100107303032303034
      3019434F4E53554C544F52494120434F4E54524F4C41444F5249410000000000
      00004005506167617200000107303032303031321A434F4E53554C544F524941
      20444520494E464F524D41544943410632313231303300000000008045400550
      61676172000001073030323030353711434F4E53554C544F5249412044452052
      4806323132313033000000000080454005506167617200000107303032303031
      3016434F4E53554C544F5249412046494E414E43454952410632313231303300
      00000000804540055061676172000000073030323030313119434F4E53554C54
      4F52494120494D4F422E205041525449432E0632313231303300000000008045
      400A34323231303430323939055061676172000001073030323030393414434F
      4E53554C544F524941204A5552CD444943410632313231303300000000008045
      40055061676172000001073030323030333916434F4E53554C544F5249412054
      5249425554415249410A32313232303130323032000000000080454005506167
      6172000001073030353030303313434F4E545249422E4153534F434941544956
      4106323132313033000000000080454005506167617200000007303130303130
      381F434F4E545249425549C7D54553202D2041C7D54553204A55444943494149
      5308323131393130303300000000008045400832313139313030330550616761
      7200000107313037303033391A434F4E545249425549C7D54553204153534F43
      4941544956415306323132313033000000000080454005506167617200100107
      3030363030313012434F525245494F20454C455452D44E49434F000000000000
      004005506167617200000007303035303030320443504D460632313338303100
      00000000804540043131323205506167617200000107313034303030321B4355
      52534F204445204944494F4D412045535452414E474549524F06323132313033
      0000000000804540055061676172000001073030313030353510435552534F20
      4445204CCD4E4755415306323132313033000000000080454005506167617200
      000107313034303030331D435552534F532041434144CA4D49434F53202D2047
      5241445541C7C34F063231323130330000000000804540055061676172000001
      07313034303030351C435552534F532041434144CA4D49434F53202D204D4553
      545241444F063231323130330000000000804540055061676172000001073130
      343030303421435552534F532041434144CA4D49434F53202D2050D3532D4752
      41445541C7C34F06323132313033000000000080454005506167617200000007
      3130343030303823435552534F532041434144CA4D49434F532D204D45535452
      41444F20285245454D4229063231323130330000000000804540083132323139
      39303305506167617200000107303031303032331C435552534F532053454D49
      4E4152494F5320434F4E47524553534F53063231323130330000000000804540
      055061676172000001073130383030303110435553544153204A554449434941
      4953063231323130330000000000804540055061676172000001073130383030
      303212435553544F532050524F43455353554149530632313231303300000000
      008045400550616761720000000730303530303632134445502E205245435552
      53414C202D205350430632313231303300000000008045400832313239313230
      31055061676172000000073130383030313723444550D35349544F204A554449
      4349414C202D2041C7C34F205049532F434F46494E5306323132313033000000
      00008045400A3231323230313035303205506167617200000007313038303030
      3722444550D35349544F204A5544494349414C202D2041444D494E4953545241
      5449564F06323132313033000000000080454006313232343031055061676172
      00000007303134303031311A4445504F5349544F204A5544494349414C202D20
      434F46494E530632313231303300000000008045400A32313232303130363032
      055061676172000000073130383030303620444550D35349544F204A55444943
      49414C202D20494E56455354494D454E544F0832313139303430350000000000
      80454006313233383031055061676172001000073031343030313218444550D3
      5349544F204A5544494349414C202D204952504A000000000080454006323133
      3830310550616761720000000730313430303130174445504F5349544F204A55
      44494349414C202D205049530632313231303300000000008045400A32313232
      303130353032055061676172000000073130383030303520444550D35349544F
      204A5544494349414C202D20505245564944454E4349414C0832313139303430
      3500000000008045400631323135303105506167617200100007303130303130
      371B444550D35349544F204A5544494349414C202D2052455347415445000000
      0000804540063132313530310550616761720000000731303830303130224445
      50D35349544F20524543555253414C202D2041444D494E49535452415449564F
      0632313231303300000000008045400631323234303205506167617200000007
      3130383030303920444550D35349544F20524543555253414C202D20494E5645
      5354494D454E544F083231313930343035000000000080454006313233383032
      055061676172000000073130383030303820444550D35349544F205245435552
      53414C202D20505245564944454E4349414C0832313139303430350000000000
      8045400631323135303205506167617200000107303032303032311B44455345
      4E564F4C56494D454E544F20444520534F465457415245063231323130330000
      000000804540055061676172000001073030363030303213444553502E20432F
      20444956554C474143414F063231323130330000000000804540055061676172
      000001073030353030303411444553502E20444520434152544F52494F063231
      3231303300000000008045400550616761720000010731303730303430114445
      53502E20444520434152544F52494F0632313231303300000000008045400550
      6167617200000007303032303035311644455350414348414E5445532F414456
      4F4741444F530632313231303300000000008045400C34323931303430323939
      303705506167617200000107313037303035391C4445535045534120432F2045
      4D495353C34F20444520424F4C45544F06323132313033000000000080454005
      50616761720000010731303730303334154445535045534120434F4D2054454C
      45464F4E49410632313231303300000000008045400550616761720000000730
      313030303438234445535045534120544158412041444D2E2046475453205175
      6974612078205175697408323133373032303700000000008045400635323732
      3033055061676172000000073030353030353814444553504553415320414E54
      4543495041444153063231323130330000000000804540043131323205506167
      6172000001073030313030333223444553504553415320432F20455354414749
      4152494F532D53454755524F2056494441063231323130330000000000804540
      055061676172000001073030323030313419444553504553415320432F204D49
      43524F46494C4D4147454D063231323130330000000000804540055061676172
      000001073030313030323213444553504553415320432F204D4F524144494106
      323132313033000000000080454005506167617200000107303031303036341D
      444553504553415320432F2056494147454E53202D204449C152494153063231
      32313033000000000080454005506167617200000107303031303036351A4445
      53504553415320432F2056494147454E53202D20544158490632313231303300
      0000000080454005506167617200000107303031303033312144455350455341
      5320432F4553544147494F53202D2041555820414C494D454E54063231323130
      3300000000008045400550616761720000010730303130303330234445535045
      53415320432F4553544147494F53202D20415558205452414E53504F52540632
      3132313033000000000080454005506167617200000107303031303032352344
      4553504553415320432F4553544147494F53202D20424F4C53412F4553544147
      494F063231323130330000000000804540055061676172000001073030353030
      303915444553504553415320434F4D20414D4249454E54450632313231303300
      0000000080454005506167617200000107303035303032301044455350455341
      5320434F4D204745440632313231303300000000008045400550616761720000
      0107303035303031361A444553504553415320434F4D20504152544943495041
      4E54455306323132313033000000000080454005506167617200000107303035
      303037361E444556202D20414449414E542E2050524F4E544F20504147414D45
      4E544F0632313231303300000000008045400550616761720000000730313030
      3130311A4445562E204952205245534741544520524547524553534956410632
      3131323032000000000080454006323131323032055061676172000000073031
      34303030390D4445562E41444146554E43454606323132313033000000000080
      45400333333105506167617200100007303032303032331A4445564F4C2E2044
      452049525246204120434F4D50454E5341520000000000804540083132323930
      31303205506167617200000007303038303032331D4445564F4C2E2054415841
      2044452043555354D34449412046554E444F0632313231303300000000008045
      400632313231303305506167617200000007303035303036351D4445564F4C55
      C7C34F204445204352C94449544F20494E44455649444F063231323130330000
      0000008045400632313231303305506167617200000007303134303031351144
      45564F4C55C7C34F204445204952524606323133383031000000000080454006
      3231333830310550616761720000000730313430303137154445564F4C55C7C3
      4F204445205452494255544F5308323133363032303100000000008045400832
      31333630323031055061676172001001073031323030303720444946494E202D
      2041434F455320434F4D50524120504147544F20434F54415300000000000000
      4005506167617200100107303132303030361B444946494E202D2041434F4553
      20494E434F52502E20435553544F000000000000004005506167617200000007
      3031323030303417444946494E202D2041434F455320504147414D454E544F08
      3231333330353031000000000080454008313233333035303105506167617200
      0000073031323030303518444946494E202D2041434F45532053554253435249
      43414F0832313333303230310000000000804540083132333330323031055061
      676172001001073031323030343221444946494E202D2041504C494341C7C34F
      204F50C7D545532049424F564553504100000000000044400550616761720000
      00073031323030343112444946494E202D2041504F5254452046495004313132
      3200000000008045400431313232055061676172000000073031323030363115
      444946494E202D204343422041504C494341C7C34F0832313332303230360000
      0000008045400A31323332303230363031055061676172000000073031323030
      303115444946494E202D204344422041504C49434143414F0832313332303130
      3700000000008045400A31323332303130373031055061676172000000073031
      323030363413444946494E202D20434F4E53554C544F52494106323132313033
      00000000008045400A3432323130343032393905506167617200000007303132
      303035371A444946494E202D20434F4E545241544F204445204F50C7D5455308
      3231333330323031000000000080454008313233333032303105506167617200
      0000073031323030363023444946494E202D20435553542E452041444D2E2054
      49542E52454E41495353414E4345083231333430333031000000000080454008
      3532343130333032055061676172000000073031323030353423444946494E20
      2D20435553542E452041444D2E54CD54202D20434152542E41C7D54553083231
      3333303230310000000000804540063532333231300550616761720000000730
      31323030363522444946494E202D20435553542E452041444D2E5449542D2045
      4D50522E41C74F45530832313333303730310000000000804540063532333731
      30055061676172000000073031323030363622444946494E202D20435553542E
      452041444D2E544954554C4F53202D20414E4752410832313334303330310000
      0000008045400835323431303330320550616761720000000730313230303637
      21444946494E202D20435553542E452041444D2E544954554C4F53202D204341
      424F083231333430333031000000000080454008353234313033303205506167
      6172000000073031323030353523444946494E202D20435553542E452041444D
      2E54CD54554C4F53202D204445422E5256083231333431313031000000000080
      4540083531343130343031055061676172000000073031323030373323444946
      494E202D20435553544F44494120452041444D2E544954554C4F53202D204649
      0832313334303330310000000000804540083532343130333032055061676172
      000000073031323030353123444946494E202D2043555354D344494120452041
      444D2E54CD54554C4F53202D204C480432313332000000000080454004313132
      32055061676172000000073031323030373223444946494E202D20435553544F
      44494120452041444D2E544954554C4F53202D204E5008323133323032303500
      000000008045400A353232313032303530340550616761720000000730313230
      30353923444946494E202D2043555354D344494120452041444D2E54CD54554C
      4F532D20434342043131323200000000008045400A3532323130333036303405
      5061676172000000073031323030373123444946494E202D20435553544F4449
      4120452041444D2E544954554C4F532D20434442083231333230313037000000
      00008045400A3532323130313037303405506167617200000007303132303035
      3223444946494E202D2043555354D344494120452041444D2E54CD54554C4F53
      2D204C434908323133323031303100000000008045400A353232313031303130
      34055061676172000000073031323030353023444946494E202D2043555354D3
      44494120452041444D2E54CD54554C4F532D204C465408323133313031303400
      0000000080454008353231313034313005506167617200000007303132303034
      3923444946494E202D2043555354D344494120452041444D2E54CD54554C4F53
      2D204C544E083231333130313033000000000080454008353231313033313005
      5061676172000000073031323030343823444946494E202D2043555354D34449
      4120452041444D2E54CD54554C4F532D204E544E083231333130313032000000
      0000804540083532313130323130055061676172000000073031323030373623
      444946494E202D20435553544F44494120452041444D2E544954554C4F532D20
      52444208323133323031303800000000008045400A3532323130313038303405
      5061676172000000073031323030373422444946494E202D20435553544F4449
      4120452041444D2E544954554C4F532D46494108323133343034303100000000
      0080454008353234313034303205506167617200000007303132303033322344
      4946494E202D20444542454E545552455320434F4E5645525349564549532041
      504C08323133323032303200000000008045400A313233323032303230310550
      61676172000000073031323030333323444946494E202D20444542454E545552
      4553204E414F20434F4E5645522041504C494308323133323032303300000000
      008045400A313233323032303330310550616761720000010730313230303133
      1A444946494E202D2044455350455341532042414E4341524941530632313231
      3033000000000080454005506167617200000007303132303036381B44494649
      4E202D2044455620444520465241C7C34F20424F4E4946083231333330323031
      0000000000804540063531333230340550616761720000000730313230303730
      19444946494E202D204445562E2044452050524F56454E544F53083231333330
      3230310000000000804540063531333230330550616761720010010730313230
      30303915444946494E202D204641512041504C49434143414F0000000000003E
      40055061676172001001073031323030343516444946494E202D204649444320
      41504C494341C7C34F0000000000004440055061676172000000073031323030
      303815444946494E202D204649462041504C49434143414F0832313334303330
      3100000000008045400831323334303330310550616761720000000730313230
      30363913444946494E202D204649462052455347415445043131323200000000
      00804540043131323205506167617200000007303132303031301D444946494E
      202D2046554E444F2041434F45532041504C49434143414F0832313334303430
      3100000000008045400831323334303430310550616761720010010730313230
      3031311C444946494E202D2046554E444F20494D4F422041504C49434143414F
      0000000000000040055061676172001001073031323030313415444946494E20
      2D2046555455524F20494E444943450000000000003D40055061676172001001
      07303132303034360F444946494E202D20494F46204E544E0000000000004440
      055061676172001001073031323030323715444946494E202D204C4349204150
      4C49434143414F0000000000003E400550616761720010010730313230303338
      15444946494E202D204C46542041504C494341C7C34F0000000000003E400550
      61676172001001073031323030303214444946494E202D204C482041504C4943
      4143414F0000000000003E400550616761720010010730313230303033184449
      46494E202D204C48205245534944554F20504147544F00000000000000400550
      61676172000000073031323030333715444946494E202D204C544E2041504C49
      4341C7C34F08323133313031303300000000008045400A313233313031303330
      31055061676172000000073031323030343422444946494E202D204E4F544120
      50524F4D4953534F5249412041504C49434143414F0832313331303130310000
      0000008045400A31323331303130313031055061676172000000073031323030
      34331B444946494E202D204E4F564F5320494E56455354494D454E544F530431
      3132320000000000804540043131323205506167617200000007303132303033
      3615444946494E202D204E544E2041504C494341C7C34F083231333130313032
      00000000008045400A3132333130313032303105506167617200100107303132
      3030313523444946494E202D204F5554524153204445535020415449564F5320
      4D4F42494C494152000000000000444005506167617200100107303132303031
      3220444946494E202D204F55545241532044455350204D455243204120564953
      5441000000000000004005506167617200000007303132303035381644494649
      4E202D20504147414D454E544F2D20434E500632323332303200000000008045
      400632323332303205506167617200000007303132303033301A444946494E20
      2D20504F5550414E43412041504C494341C7C34F083231333230313039000000
      0000804540043131323205506167617200100107303132303033351A44494649
      4E202D20504F5550414E434120424C4F51554541444100000000000044400550
      61676172000000073031323030373516444946494E202D20524442202041504C
      494341C7C34F08323133323031303800000000008045400A3132333230313038
      303105506167617200100107303132303033311F444946494E202D2053454355
      524954495A41C7C34F2041504C49434143414F0000000000003E400550616761
      7200000007303132303036330E444946494E202D2053454755524F0832313334
      3034303100000000008045400835323431303430350550616761720000000730
      31323030333923444946494E202D205441584120444520434F52524554414745
      4D204520454D4F4C554D08323133333034303100000000008045400831323333
      30343031055061676172000000073031323030323818444946494E202D205441
      584120444520435553544F444941083231333430333031000000000080454008
      353234313033303205506167617200100107303132303033341B444946494E20
      2D205441584120444520504552464F524D414E43450000000000004440055061
      67617200000007303132303036320D444946494E202D20544158415308323133
      3330323031000000000080454006353233323033055061676172001001073031
      323030343018444946494E202D205445524D4F20444520454E45524749410000
      000000003E40055061676172000000073031323030353323444946494E2D2043
      5553542E452041444D2E54CD542D204445422E4EC34F2E432E52460832313332
      3032303300000000008045400A35323231303230333034055061676172000000
      073031323030343723444946494E2D20435553542E452041444D2E54CD54554C
      4F532D204445422E432E524608323133323032303200000000008045400A3532
      3231303230323034055061676172000001073130313030313721444952494745
      4E544520414449414E54414D454E544F203133BA2046C9524941530831323232
      3033303300000000008045400550616761720000010731303130303136204449
      524947454E544553202D20414449414E54414D454E544F2046C9524941530831
      3232323033303200000000008045400550616761720000010731303130303232
      214449524947454E544553202D204153534953542E204F444F4E544F4CD34749
      4341063231323130330000000000804540055061676172000001073130313030
      31391F4449524947454E544553202D20444553434F4E544F20454E5449444144
      4553063231323931310000000000804540055061676172000001073130333030
      3032144449524947454E544553202D204449C152494153063231323130330000
      0000008045400550616761720000010731303130303135114449524947454E54
      4553202D20464754530832313232303230320000000000804540055061676172
      0000010731303130303132154449524947454E544553202D20464C2050414754
      4F06323132313033000000000080454005506167617200000107313033303030
      31174449524947454E544553202D20484F535045444147454D06323132313033
      0000000000804540055061676172000001073130313030313411444952494745
      4E544553202D20494E5353083231323230323031000000000080454005506167
      61720000010731303130303133114449524947454E544553202D20495252460A
      3231323230313032303100000000008045400550616761720000010731303330
      303033154449524947454E544553202D20504153534147454D06323132313033
      0000000000804540055061676172000001073130313030323112444952494745
      4E544553202D2050434D534F0632313231303300000000008045400550616761
      7200000107313031303031381B4449524947454E544553202D20504C414E4F20
      4445205341DA4445063231323130330000000000804540055061676172000001
      0731303130303230224449524947454E544553202D205245504153534520434F
      4E545249425549C7D54553063231323931310000000000804540055061676172
      0000010731303130303131144449524947454E544553202D2053414CC152494F
      0632313231303300000000008045400550616761720000010731303130303233
      1B4449524947454E544553202D2053454755524F204445205649444106323132
      3130330000000000804540055061676172000001073130333030303411444952
      4947454E544553202D2054415849063231323130330000000000804540055061
      67617200000007303132303037381E444952494E202D20434342204445564F4C
      55C7414F204445204A55524F5308323133323033303600000000008045400A35
      313231303330363032055061676172000000073031323030383023444952494E
      202D205245435550455241C7C34F20444520494E56455354494D454E544F0832
      3133343037303100000000008045400835323431303731300550616761720000
      00073031323030373912444952494E202D2053414C44414D454E544F04313132
      3200000000008045400431313232055061676172000000073031323030373715
      444952494E202D2053504520504147414D454E544F0832313333303530310000
      0000008045400831323333303530310550616761720000010731303730303031
      18444956554C4741C7C34F2045205055424C4943494441444506323132313033
      000000000080454005506167617200000107313037303036301B4544554341C7
      C34F2046494E414E4345495241204520505245562E0632313231303300000000
      0080454005506167617200000007303130303036331E454D5052C95354494D4F
      202D20444550D35349544F204A5544494349414C083231333730313034000000
      000080454006313233383031055061676172000000073031303030353820454D
      5052C95354494D4F202D204465766F6C75E7F56573205175697461E7E36F0A31
      32333730313032303400000000008045400A3132333730313032303405506167
      6172000001073030353030343214454E434152474F532046494E414E43454952
      4F53063231323130330000000000804540055061676172000001073030353030
      323710454E455247494120454C45545249434106323132313033000000000080
      4540055061676172000001073130373030333210454E455247494120454CC954
      5249434106323132313033000000000080454005506167617200000007303032
      30303936234551554950414D454E544F532F205245444953554C20494E462E20
      2D20535749544348063231323130330000000000804540063231323130330550
      6167617200000107303035303030370E4553544143494F4E414D454E544F0632
      3132313033000000000080454005506167617200000107313032303035311B45
      5354414749C152494F53202D20424F4C53412D455354C147494F063231323130
      3300000000008045400550616761720000010731303730303531104556454E54
      4F532045585445524E4F53063231323130330000000000804540055061676172
      0000010730303530303238104556454E544F532045585445524E4F5306323132
      3130330000000000804540055061676172000001073130373030353210455645
      4E544F5320494E5445524E4F5306323132313033000000000080454005506167
      61720000010730303530303737104556454E544F5320494E5445524E4F530632
      3132313033000000000080454005506167617200000007303031303130311E46
      494E20484142202D204156414C4941C7C34F20444520494DD356454953083231
      3337303230350000000000804540063532373230360550616761720000000730
      3130303035391B46494E20484142204445564F4C205052455354204241495841
      44410A3132333730323032303600000000008045400A31323337303230323036
      05506167617200000007303130303036301F46494E20484142204445564F4C20
      5052455354204EC34F20424149584144410A3132333730323032303500000000
      008045400A313233373032303230350550616761720010010730303230303832
      1C46494E414E432E2048414249544143494F4E414C2D454C4F4E455448000000
      0000004440055061676172000000073030353030373820474153544F20524545
      4D424F4C53C156454C20504F5220544552434549524F53063231323130330000
      0000008045400831323231393930320550616761720000000730303730303830
      204745494D4F202F204745415245202D20494D504F53544F2044452052454E44
      4106323133383031000000000080454004313132320550616761720000010730
      303730303236184745494D4F2F4745415045202D20434F4E444F4D494E494F06
      323132313033000000000080454005506167617200100107303037303037381E
      4745494D4F2F4745415245202D2041434552544F2044452044454249544F0000
      0000000044400550616761720010010730303730303338214745494D4F2F4745
      415245202D20414449414E54414D454E544F20484F5445495300000000000044
      400550616761720010010730303730303038234745494D4F2F4745415245202D
      20415155495349C7414F20494E5354414C41C7D5455300000000000044400550
      616761720010010730303730303639174745494D4F2F4745415245202D204155
      4449544F52494100000000000044400550616761720010010730303730303336
      1F4745494D4F2F4745415245202D204241495841204445204849504F54454341
      00000000000044400550616761720000000730303730303430144745494D4F2F
      4745415245202D20434155C7C34F08323133363031303100000000008045400A
      313233363031303430310550616761720010010730303730303731224745494D
      4F2F4745415245202D2043454E552D50524F2053494E414C495A4143414F0000
      0000000044400550616761720010010730303730303535234745494D4F2F4745
      415245202D20434F4D45524320454D505245454E442E502E46CD530000000000
      0044400550616761720010010730303730303134234745494D4F2F4745415245
      202D20434F4D45524320454D505245454E44494D454E544F0000000000004440
      0550616761720010010730303730303032234745494D4F2F4745415245202D20
      434F4D504C454D454E544F20415155495349C7C34F0000000000004440055061
      6761720000000730303730303736224745494D4F2F4745415245202D20436F6E
      64656E61E7E36F20416C69656E61E7E36F063231323130330000000000804540
      04313132320550616761720010010730303730303433234745494D4F2F474541
      5245202D20434F4E535420534F432020574554274E2057494C44000000000000
      44400550616761720010010730303730303432234745494D4F2F474541524520
      2D20434F4E535420534F4320434145534152205041524B000000000000444005
      50616761720010010730303730303431234745494D4F2F4745415245202D2043
      4F4E535420534F432052454E41495353414E4345000000000000444005506167
      61720010010730303730303135214745494D4F2F4745415245202D20434F4E53
      554C20532F20415155495349C7C34F0000000000004440055061676172001001
      0730303730303536234745494D4F2F4745415245202D20434F4E53554C20532F
      415155495320502E46CD53490000000000004440055061676172001001073030
      37303034381A4745494D4F2F4745415245202D20434F4E53554C544F52494153
      00000000000044400550616761720010010730303730303539234745494D4F2F
      4745415245202D20434F4E53554C544F5249415320502E46CD53494341000000
      000000444005506167617200100107303037303034361D4745494D4F2F474541
      5245202D20434F2D504152544943495041C7C34F000000000000444005506167
      61720010010730303730303137224745494D4F2F4745415245202D20434F5049
      41532048454C494F475241464943415300000000000044400550616761720010
      010730303730303136204745494D4F2F4745415245202D20434F525245542E20
      532F204C4F4341C7C34F00000000000044400550616761720010010730303730
      303637214745494D4F2F4745415245202D20434F525245544147454D20532F20
      56454E4441000000000000444005506167617200000107303037303034352347
      45494D4F2F4745415245202D2044455350204D41524B4554494E472F5055424C
      4943083231333431323031000000000080454005506167617200100107303037
      30303632204745494D4F2F4745415245202D2044455350455341532042414E43
      4152494153000000000000444005506167617200100107303037303034392147
      45494D4F2F4745415245202D20444553504553415320434152544F5249414953
      00000000000044400550616761720010010730303730303437214745494D4F2F
      4745415245202D2044455350455341532044452053454755524F530000000000
      00444005506167617200100107303037303033341F4745494D4F2F4745415245
      202D204445535045534153204449564552534153000000000000444005506167
      61720010010730303730303531234745494D4F2F4745415245202D2044455350
      4553415320494D4F42494C494152494153000000000000444005506167617200
      10010730303730303739234745494D4F2F4745415245202D2044455350455341
      532052454E4149535353414E4345000000000000444005506167617200100107
      303037303032391F4745494D4F2F4745415245202D2044455350455341532054
      454C45464F4E4500000000000044400550616761720000000730303730303532
      234745494D4F2F4745415245202D204445562052454345495441532044495645
      525341530A323133363034303330310000000000804540043131323205506167
      617200100107303037303030391D4745494D4F2F4745415245202D204445562E
      20504147544F204F425241000000000000444005506167617200000007303037
      30303633214745494D4F2F4745415245202D20462E20494D4F42202D20415641
      4C4941C7C34F0832313334313230310000000000804540043131323205506167
      61720000000730303730303734234745494D4F2F4745415245202D2046444F20
      494D4F4220494E5445524D2056454E4441083231333431323031000000000080
      454004313132320550616761720010010730303730303636234745494D4F2F47
      45415245202D2046444F2E20494D4F4220434F4E53554C544F52494100000000
      000044400550616761720010010730303730303031224745494D4F2F47454152
      45202D20474153544F5320434F4D20415155495349C7C34F0000000000004440
      0550616761720010010730303730303534234745494D4F2F4745415245202D20
      474552454E432E4F4252415320502E46CD534943410000000000004440055061
      6761720010010730303730303138234745494D4F2F4745415245202D20474552
      454E4349414D454E544F20494D4F564549530000000000004440055061676172
      0010010730303730303133214745494D4F2F4745415245202D20474552454E43
      49414D454E544F204F4252415300000000000044400550616761720010010730
      303730303139224745494D4F2F4745415245202D20484F4E4F522E2050524F46
      495353494F4E4149530000000000004440055061676172001001073030373030
      3537234745494D4F2F4745415245202D20484F4E4F524152494F532050524F46
      2E502E464953000000000000444005506167617200100107303037303033301E
      4745494D4F2F4745415245202D20494D504F53544F5320452054415841530000
      0000000044400550616761720010010730303730303035234745494D4F2F4745
      415245202D20494E434F52502E20432F20444956494441204345460000000000
      0044400550616761720010010730303730303331124745494D4F2F4745415245
      202D20494E535300000000000044400550616761720010010730303730303235
      124745494D4F2F4745415245202D204950545500000000000044400550616761
      720010010730303730303234124745494D4F2F4745415245202D204954424900
      000000000044400550616761720010010730303730303332164745494D4F2F47
      45415245202D204C415544454D494F0000000000004440055061676172001001
      0730303730303339154745494D4F2F4745415245202D204C454153494E470000
      0000000044400550616761720010010730303730303630234745494D4F2F4745
      415245202D204D414E555420534F46545741524520502E464953490000000000
      0044400550616761720010010730303730303530214745494D4F2F4745415245
      202D204D414E5554454E43414F20534F46545741524500000000000044400550
      616761720010010730303730303333144745494D4F2F4745415245202D204D55
      4C54415300000000000044400550616761720010010730303730303034124745
      494D4F2F4745415245202D204F42524100000000000044400550616761720010
      010730303730303036224745494D4F2F4745415245202D204F42524120432F49
      4E434F52502050415452494D0000000000004440055061676172001001073030
      3730303033214745494D4F2F4745415245202D20504147414D454E544F204151
      55495349C7C34F00000000000044400550616761720010010730303730303130
      154745494D4F2F4745415245202D2050494E5455524100000000000044400550
      616761720010010730303730303131164745494D4F2F4745415245202D205245
      464F524D41530000000000004440055061676172001001073030373030323823
      4745494D4F2F4745415245202D20524547495354524F20444520455343524954
      555241000000000000444005506167617200100107303037303033351F474549
      4D4F2F4745415245202D20524547554C2E20444520494D4F5645495300000000
      000044400550616761720000000730303730303132224745494D4F2F47454152
      45202D2052455041524F2F41444150542F434F4E534552560A32313336303430
      3330310000000000804540083532363430333038055061676172000000073030
      3730303737234745494D4F2F4745415245202D20524550415353452044452048
      4F4E4F524152494F530A32313336303430333031000000000080454008353236
      34303330370550616761720010010730303730303533204745494D4F2F474541
      5245202D205245534741544520444520414C554755454C000000000000444005
      50616761720010010730303730303337234745494D4F2F4745415245202D2052
      455353415243494D454E544F20414C554755454C000000000000444005506167
      61720010010730303730303538234745494D4F2F4745415245202D2053455256
      204156414C494143414F20502E46495349000000000000444005506167617200
      00010730303730303231234745494D4F2F4745415245202D2053455256204156
      414C4941C7C34F2050415452494D063231323130330000000000804540055061
      6761720010010730303730303230184745494D4F2F4745415245202D20564947
      494C414E43494100000000000044400550616761720010010730303730303037
      234745494D4F2F4745415245202D415155495320494E53542045515549502045
      5350454300000000000044400550616761720010010730303730303434234745
      494D4F2F4745415245202D44455350204F504552205041525155452054454D41
      5400000000000044400550616761720010010730303730303233234745494D4F
      2F474541524520444556205041525445205041524320444520414C49454E0000
      0000000044400550616761720010010730303730303232234745494D4F2F4745
      415245204445564F4C20474152414E204F4252494720414C49454E0000000000
      0044400550616761720010010730303730303635224745494D4F2F4745415245
      2D43504D462046554E444F20494D4F42494C49C152494F000000000000444005
      50616761720000000730303730303631224745494D4F2F47454152452D435249
      41C7C34F2044452046554E444F5320494D4F4204313132320000000000804540
      04313132320550616761720010010730303730303634234745494D4F2F474541
      52452D462E494D4F422D5055424C4943204D41524B4554494E47000000000000
      44400550616761720000010730303730303730234745494D4F2F47454152452D
      46444F20494D4F422E2052454355502E20494E56455354083231333431323031
      00000000008045400550616761720010010730303730303638224745494D4F2F
      47454152452D464920474153544F5320524543555045524156C9495300000000
      000044400550616761720000000730303730303733234745494D4F2F47454152
      452D494D4F562041444A5544494341444F20434F4E534552560A323133363034
      3033303100000000008045400431313232055061676172000001073030373030
      3735214745494D4F2F47454152452D52454355502E444520494E56455354494D
      454E544F06323132313033000000000080454005506167617200000007303037
      30303732234745494D4F2F47454152452D5345525620524541562E20494D4F56
      2E2041444A55442E083231333730323035000000000080454008353237323135
      303205506167617200000107303035303032360E47454A5552202D20434155C7
      C34F063231323130330000000000804540055061676172000001073030323030
      32341847454A5552202D20435553544153204A55444943494149530632313231
      3033000000000080454005506167617200000107303032303038381A47454A55
      52202D20435553544F532050524F434553535541495306323132313033000000
      000080454005506167617200000007303032303032351947454A5552202D2044
      45504F5349544F20524543555253414C06323132313033000000000080454006
      31323135303205506167617200000007303032303039301B47454A5552202D20
      4445564F4C55C7C34F20444520414C564152C106323132313033000000000080
      45400333333105506167617200100107303035303037352347454A5552202D20
      4D554C54415320452050454E414C49442E204A55444943494149530000000000
      80454005506167617200000007303035303036381D47454A5552202D20524550
      4153534520444520484F4E4F52C152494F530632313231303300000000008045
      4006323132313033055061676172001001073031313030313520474550414220
      2D2041434552544F204D4F562E2046494E414E432E20504D5050000000000000
      00400550616761720000000730313130303138204745504142202D2041444941
      4E542E204445434953C34F204A5544494349414C083231313930343035000000
      0000804540063132313530310550616761720000000730313130303032224745
      504142202D20414449414E542E204558545241464F4C4841204352454449544F
      0832313131303430310000000000804540063132313230330550616761720000
      000730313130303039224745504142202D20414449414E542E2050454E53414F
      20414C494D454E54494349410832313131303430310000000000804540083231
      3131303430310550616761720000000730313130303031194745504142202D20
      415558494C494F202D2046554E4552414C0A3231313130323033303100000000
      008045400A323131313032303330310550616761720000000730313130303036
      1A4745504142202D20434F4E5349474E41434F45532043414958410832313131
      3034303100000000008045400631323132303305506167617200000007303131
      30303034164745504142202D20434F4E5349474E41544152494F530832313131
      3034303100000000008045400832313131303430310550616761720000000730
      313130303139204745504142202D20434F52522E204D4F4E2E2041C7C34F204A
      5544494349414C08333232393938303100000000008045400833323239393830
      3105506167617200100107303131303031311F4745504142202D20444553434F
      4E544F20434F4E54522E20504543554C494F0000000000004440055061676172
      0010010730313130303130174745504142202D20444553434F4E544F2046554E
      4345460000000000004440055061676172001001073031313030313320474550
      4142202D204445562E20434F4E54522E204155582E20504543554C494F000000
      000000004005506167617200000007303131303030371D4745504142202D2045
      4E5449444144455320434F4E56454E454E544553083231313930333031000000
      0000804540083231313930333031055061676172000000073031313030303312
      4745504142202D204952524620464F4C48410632313132303100000000008045
      400632313132303105506167617200000007303131303032331B474550414220
      2D204952524620464F4C4841204A5544494349414C0632313132303100000000
      008045400632313132303105506167617200000007303131303030381C474550
      4142202D205041472E20415558494C494F20504543554C494F08323131313034
      3031000000000080454008323131313034303105506167617200100107303131
      303031371E4745504142202D20504147544F2052454E444120414E5445434950
      414441000000000000444005506167617200100107303131303031361C474550
      4142202D20504543554C494F20502F204D4F5254452F52454200000000000044
      4005506167617200000007303131303030351F4745504142202D2050524F5645
      4E544F5320464C2E2042454E45464943494F0832313131303430310000000000
      80454008323131313034303105506167617200000007303131303032361E4745
      504142202D205245454D422E2041C7C34F204A55442E20434149584108313231
      3930333033000000000080454008313231393033303305506167617200000007
      303131303031341B4745504142202D20524547554C4152495A4143414F20464F
      4C48410832313131303430310000000000804540083231313130343031055061
      6761720000000730313130303235224745504142202D20524550415353452046
      4F4C48412042454E45464943494F204648083231313930333031000000000080
      4540083231313930333031055061676172000000073031313030313216474550
      4142202D20525542524943415320434149584108323131393033303100000000
      0080454008323131393033303105506167617200000007303032303039382347
      45504152202D20434F4E53554C544F52494120444520494E56455354494D454E
      544F083231333431313031000000000080454008353234313131303605506167
      61720000000730313030303136224745524154202D202046494E204841422044
      45564F4C55432050524553544143414F0A313233373032303230350000000000
      8045400A3132333730323032303505506167617200000007303130303036341C
      4745524154202D204445564F4C2E20544158412041444D204647545308323133
      3730323037000000000080454008323133373032303705506167617200000007
      30313030303132184745524154202D20454D5052455354494D4F20504147544F
      08323133373031303400000000008045400A3132333730313031303105506167
      617200000007303130303031331E4745524154202D20454D5052455354494D4F
      205047544F2053454755524F0832313337303130350000000000804540083231
      3337303130340550616761720000000730313030303532234745524154202D20
      4648202D2041434552544F20494E44455820494E504320582054520832313337
      3032303600000000008045400832313337303230360550616761720000000730
      313030303434224745524154202D20464846204445562E204445504F5349544F
      20494E44455649444F0A3132333730323032303500000000008045400A313233
      3730323032303505506167617200000007303130303031391F4745524154202D
      2046494E2048414220434D204E41204445564F4C55C7C34F0A31323337303230
      3230350000000000804540063531373230320550616761720000000730313030
      3030311F4745524154202D2046494E20484142204445564F4C5543414F20414D
      4F52540A3132333730323032303500000000008045400A313233373032303230
      350550616761720000000730313030303135234745524154202D2046494E2048
      414220464754532044414D50204445564F4C5543414F08323133373032303500
      000000008045400A313233373032303230330550616761720000000730313030
      3130301E4745524154202D2046494E204841422046475453204445564F4C5543
      414F08323133373032303500000000008045400A313233373032303230380550
      616761720000000730313030303437234745524154202D2046494E2048414220
      4D554C54415320452050454E414C494441444508323133373032303500000000
      008045400A343232313035393930320550616761720000000730313030303137
      1F4745524154202D2046494E20484142205041474D454E544F2053454755524F
      0832313337303230350000000000804540083231333730323034055061676172
      00000007303130303036321D4745524154202D2046494E2053494E495354524F
      2052455041535341520832313337303230340000000000804540083231333730
      32303405506167617200000007303130303033341B4745524154202D20494D4F
      564549532041444A5544494341444F5308323133373032303500000000008045
      4006353237323039055061676172000000073031303030343323474552415420
      2D20494D4F56454C2041444A5544494341444F204156414C4941C7414F083231
      3337303230350000000000804540083532373231353032055061676172000000
      0730313030303432234745524154202D20494D4F56454C2041444A5544494341
      444F20544158412F545249420832313337303230350000000000804540083532
      3732313530310550616761720000000730313030303134204745524154202D20
      5245504153534520494F4620532F454D5052455354494D4F0832313337303130
      3300000000008045400832313337303130330550616761720000000730313030
      303636194745524154202D2053494E495354524F20494E44455649444F0A3132
      333730313032303400000000008045400A313233373031303230340550616761
      720000000730313030303635194745524154204445564F4C5543414F20505245
      53544143414F0A3132333730323032303500000000008045400A313233373032
      3032303505506167617200100107303130303032351B474553454720202D2052
      4553474154452044452052455345525641000000000000444005506167617200
      00000730313030303339234745534547202D2041432E204AD349412F434F4E54
      5249422E20454D2041545241534F083231313930343035000000000080454008
      3231313930333032055061676172000000073031303030313023474553454720
      2D2041432E205245504153534520434F4E545220454D5052454741444F0A3132
      3131303230333031000000000080454008333131333031303105506167617200
      00000730313030303039214745534547202D2041432E20524550415353452043
      4F4E545220454D50524553410A31323131303130313031000000000080454008
      3331313130313031055061676172000000073031303030333821474553454720
      2D2041432E2053454755524F204445204AD349412F41545241534F0832313139
      3034303500000000008045400832313139303330320550616761720000000730
      313030303131224745534547202D2041434552544F20434F4E54524942204155
      544F2046494E414E430A31323131303130343031000000000080454006333131
      34303105506167617200000007303130303033331E4745534547202D20414345
      52544F20444520434F4E54524942554943414F08323131393034303500000000
      008045400633323935303305506167617200100107303130303032361B474553
      4547202D2041434552544F20454E54524520504C414E4F530000000000000040
      05506167617200100107303130303034311B4745534547202D20434F4E545249
      425549C7C34F2046554E43454600000000000044400550616761720010010730
      313030303430224745534547202D20434F525245C7C34F204D4F4E4554C15249
      4120524553474154450000000000004440055061676172000000073031303031
      3036204745534547202D204355535445494F204155544F504154524F43494E41
      444F530832313139303230340000000000804540063334323130340550616761
      720000000730313030313033204745534547202D204355535445494F20494E53
      5449545549444F52202845532908323131393032303200000000008045400633
      34323130320550616761720000000730313030313035224745534547202D2043
      55535445494F205041525449432E2041535349535449444F530A323131393032
      3033303100000000008045400833343231303330320550616761720000000730
      3130303130341E4745534547202D204355535445494F205041525449432E2041
      5449564F530A3231313930323033303100000000008045400833343231303330
      3105506167617200000007303130303130321C4745534547202D204355535445
      494F20504154524F43494E41444F520832313139303230310000000000804540
      063334323130310550616761720000000730313030303535234745534547202D
      20444556204A55524F532C204D554C544153204520434D202D20415408323131
      3130333036000000000080454004333132320550616761720000000730313030
      3035311D4745534547202D204445562E20434F4E5452494220494E4445564944
      4108323131393034303500000000008045400833313133303130310550616761
      720000000730313030303232234745534547202D204952524620532F52455347
      415445204D454E53414C4944414445530632313231303300000000008045400A
      3231323230313032303205506167617200000007303130303033371F47455345
      47202D204AD349412F434F4E545249422E20454D2041545241534F0C31323131
      303130333031303100000000008045400A333133323032303330310550616761
      720010010730313030303035204745534547202D204F55545241532044455350
      2042454E2E20434F4D504C454D00000000000044400550616761720000000730
      313030303037224745534547202D20504147544F205245534741544520434F4E
      545249425549C7C34F0832313131303330310000000000804540083231313130
      33303105506167617200100107303130303033321A4745534547202D2050454E
      53C34F20414C494D454E54494349410000000000004440055061676172000000
      07303130303035361A4745534547202D20504F52544142494C49444144452045
      4150430832313139303430350000000000804540063332333230320550616761
      7200000007303130303035371A4745534547202D20504F52544142494C494441
      4445204546504308323131393034303500000000008045400633323332303105
      50616761720000000730313030303234224745534547202D2052455041535345
      20534153534520434F4E545249425549C7C34F08323131393033303200000000
      0080454008323131393033303205506167617200000007303130303033302047
      45534547202D20524553474154452044452046554E444F5328434C5542452906
      3231323130330000000000804540063231323931310550616761720000000730
      3130303033361D4745534547202D2053454755524F204445204AD349412F4154
      5241534F08313231313031303400000000008045400831323139303130320550
      6167617200000007303130303033351F4745534547202D205452414E53462E20
      444520434F4E545249425549C7C34F0632313231303500000000008045400833
      3131313031303105506167617200100107303130303032392347455345472D20
      414E5445432E20524553472E20444520434F4E545249422E2052454200000000
      0000444005506167617200000007303130303035332147455345472D44455620
      434F4E54204143414F204A554420454D5052454741444F083231313930343035
      0000000000804540083331313330313031055061676172000000073031303030
      35342147455345472D44455620434F4E54204143414F204A554420504154524F
      43494E2E08323131393034303500000000008045400833313131303130310550
      6167617200000007303130303030382247455345472D49525246205245534741
      544520444520434F4E545249425549C7C34F0632313132303200000000008045
      400632313132303205506167617200000107313037303035341F47455354C34F
      2F504C414E454A414D454E544F20455354524154C94749434F06323132313033
      0000000000804540055061676172000001073030333030323121475541524441
      2045204D414E5554454E43414F20444520444F43554D454E544F530632313231
      30330000000000804540055061676172001001073939393030303118486F6D6F
      6C6F6761E7E36F20496E76657374696D656E746F000000000000004005506167
      6172000000073030353030373319484F4E4F52C152494F532044452053554355
      4D42CA4E43494108323231313031303500000000008045400333333105506167
      6172000001073130383030303314484F4E4F52C152494F532050455249434941
      4953063231323130330000000000804540055061676172000000073130383030
      313323484F4E4F52C152494F5320535543554D42CA4E434941202D2041444D49
      4E49535452410632323231303300000000008045400632323231303305506167
      6172000000073130383030313223484F4E4F52C152494F5320535543554D42CA
      4E434941202D20494E56455354494D454E083232333130313036000000000080
      4540083232333130313036055061676172000000073130383030313123484F4E
      4F52C152494F5320535543554D42CA4E434941202D20505245564944454E4349
      0832323131303130350000000000804540083232313130313035055061676172
      000001073031343030303810494D504F53544F53204520544158415306323132
      3130330000000000804540055061676172000001073030323030353220494D50
      52455353C34F20434F52524553504F4E442E204153534F434941444F53063231
      32313033000000000080454005506167617200100107313036303030381A494D
      5052455353C34F20444520434F4E5452412D4348455155450000000000804540
      05506167617200000007303035303032321F494E44494341C7C34F2044452044
      494E484549524F20412050454E484F5241063231323130330000000000804540
      0631323135303105506167617200000107303033303031371E494E464F524D41
      54494341202D204C4F434143414F2F534F465457415245063231323130330000
      00000080454005506167617200000007303134303031331C494E5353202D2043
      455353C34F204445204DC34F2D44452D4F425241063231323130330000000000
      804540083231323230313031055061676172001001073031343030313422494E
      5353202D2043455353C34F204445204DC34F2D44452D4F425241204D554C5441
      000000000000444005506167617200000107303033303031341F494E5354414C
      2E2F494E4652414553542E20414755412045204553474F544F06323132313033
      0000000000804540055061676172000001073030333030313522494E5354414C
      2E2F494E4652414553542E20454E455247494120454C45545249434106323132
      3130330000000000804540055061676172000001073030333030313616494E53
      54414C2E2F494E4652414553542E204950545506323132313033000000000080
      4540055061676172000001073030333030313219494E5354414C2E2F494E4652
      414553542E204C4F434143414F06323132313033000000000080454005506167
      617200000107303033303031331C494E5354414C2E2F494E4652414553542E20
      4D414E5554454E43414F06323132313033000000000080454005506167617200
      000007303035303031331A49505455202D20494DD3564549532041444A554449
      4341444F53063231323130330000000000804540083532373231353031055061
      67617200000107313039303030320F495054552F544C50204520495056410632
      3132313033000000000080454005506167617200000007303131303032341749
      525246204558455243CD43494F20414E544552494F5208313231393032303200
      0000000080454008313231393032303205506167617200000107303036303030
      331C4A4F524E414953205245564953544153205055424C494341434F45530632
      3132313033000000000080454005506167617200000107303035303030360A4C
      4156414E44455249410632313231303300000000008045400550616761720000
      0107313037303033350A4C4156414E4445524941063231323130330000000000
      80454005506167617200000107303035303030351A4C45495455524120444520
      44494152494F204A5544494349414C0632313231303300000000008045400550
      616761720000010730303230303536234D414E5554454E43414F20434F4D5055
      5441444F5245532F5045524946455249434F5306323132313033000000000080
      45400550616761720000010730303230303034134D414E5554454E43414F2053
      4F46545741524506323132313033000000000080454005506167617200000107
      303032303039310E4D414E5554454E43414F2057454206323132313033000000
      00008045400550616761720000010730303430303034104D4154455249414C20
      444520434F504106323132313033000000000080454005506167617200000107
      31303630303034104D4154455249414C20444520434F50410632313231303300
      000000008045400550616761720000010731303630303031164D415445524941
      4C20444520455850454449454E54450632313231303300000000008045400550
      616761720000000730303430303036214D4154455249414C2044452048494749
      454E45204520434F4E534552564143414F063231323130330000000000804540
      0A3432393130353031303205506167617200000107313036303030321D4D4154
      455249414C2044452048494749454E452045204C494D50455A41063231323130
      3300000000008045400550616761720000010730303430303037174D41544552
      49414C20444520494E464F524D41544943410632313231303300000000008045
      400550616761720000010731303630303036174D4154455249414C2044452049
      4E464F524DC15449434106323132313033000000000080454005506167617200
      000107313036303030331C4D4154455249414C20454CC9545249434F2F454C45
      5452D44E49434F06323132313033000000000080454005506167617200000107
      30303430303032134D4154455249414C20455850454449454E54450632313231
      303300000000008045400550616761720000010730303430303039114D415445
      5249414C20494D50524553534F06323132313033000000000080454005506167
      61720000010731303630303035114D4154455249414C20494D50524553534F06
      323132313033000000000080454005506167617200000107303035303031301B
      4D4154455249414C20502F204556454E544F5320534F43494149530632313231
      3033000000000080454005506167617200000007303034303030380C4D454449
      43414D454E544F530632313231303300000000008045400A3432313130353031
      303105506167617200000107303033303031391B4D4F56454953204520555445
      4E53494C494F53202D204C4F4341C70632313231303300000000008045400550
      616761720000010730303330303138204D4F564549532045205554454E53494C
      494F53202D204D414E5554454E43414F06323132313033000000000080454005
      50616761720000010730303530303135144D554C54415320452050454E414C49
      4441444553063231323130330000000000804540055061676172000001073130
      38303030341F4D554C54415320452050454E414C494441444553202D204A5544
      494349414C063231323130330000000000804540055061676172000000073030
      3530303435204E4F564F20504C414E4F202D20414C554755454C204445204551
      554950414D2E0632313231303300000000008045400631333331303405506167
      617200000007303035303036311C4E4F564F20504C414E4F202D20414C554755
      454C20494D4F5645495306323132313033000000000080454006313333313034
      0550616761720000000730303530303436184E4F564F20504C414E4F202D2043
      4F4E53554C544F52494106323132313033000000000080454006313333313034
      0550616761720000000730303530303437214E4F564F20504C414E4F202D2044
      4553504553415320432F2054454C45464F4E4506323132313033000000000080
      45400631333331303405506167617200000007303035303035361D4E4F564F20
      504C414E4F202D20454E455247494120454C4554524943410632313231303300
      0000000080454006313333313034055061676172000000073030353030343414
      4E4F564F20504C414E4F202D204556454E544F53063231323130330000000000
      804540063133333130340550616761720000000730303530303637234E4F564F
      20504C414E4F202D20494D5052455353414F20444520434F52524553504F4E06
      3231323130330000000000804540063133333130340550616761720000000730
      303530303539114E4F564F20504C414E4F202D20495054550632313231303300
      0000000080454006313333313034055061676172000000073030353030353713
      4E4F564F20504C414E4F202D204F5554524F5306323132313033000000000080
      4540063133333130340550616761720000000730303530303633234E4F564F20
      504C414E4F202D205345525649C74F532041444D20544552434549524F530632
      3132313033000000000080454006313333313034055061676172000000073030
      3530303636224E4F564F20504C414E4F202D205345525649C74F532044452050
      4F53544147454E53063231323130330000000000804540063133333130340550
      616761720000010730303230303834204F5554524F532050524F46495353494F
      4E41495320434F4E5452415441444F5306323132313033000000000080454005
      506167617200000007303131303032301E5041472E2043504D46202872657361
      7263692E20746572636569726F73290632313231303300000000008045400431
      31323205506167617200000007313038303031341D504147414D454E544F2044
      4520434F4E44454E41C7C34F202D2041444D0632313231303300000000008045
      400631323234303105506167617200000007313038303031361E504147414D45
      4E544F20444520434F4E44454E41C7C34F202D20505245560832313139303430
      3500000000008045400631323135303105506167617200000007313038303031
      351D504147454D454E544F20444520434F4E44454E41C7C34F202D20494E5608
      3231313930343035000000000080454006313233383031055061676172000001
      073130323030333022504553532E2046554E434546202D205245454D422E2041
      55582E2046554E4552414C063231323130330000000000804540055061676172
      000001073130323030323723504553532E2046554E4345462D5245454D424F4C
      534F20434F4E442E20555242414E410632313231303300000000008045400550
      6167617200000107313031303033341C504553534F414C202043454449444F20
      2D2042454E4546CD43494F530632313231303300000000008045400550616761
      7200000107313031303033331A504553534F414C202043454449444F202D2045
      4E434152474F5306323132313033000000000080454005506167617200000107
      3130313030333119504553534F414C202043454449444F202D2053414CC15249
      4F06323132313033000000000080454005506167617200100107303031303035
      371B504553534F414C2043454449444F202D2042454E4546CD43494F53000000
      0000004440055061676172000001073130333030313218504553534F414C2043
      454449444F202D204449C1524941530632313231303300000000008045400550
      61676172001001073030313030353619504553534F414C2043454449444F202D
      20454E434152474F530000000000004440055061676172000001073130333030
      31311B504553534F414C2043454449444F202D20484F535045444147454D0632
      3132313033000000000080454005506167617200000107313031303033361550
      4553534F414C2043454449444F202D20494E5353083231323230313031000000
      0000804540055061676172000000073130313030333515504553534F414C2043
      454449444F202D20495252460A32313232303130323032000000000080454006
      323132313033055061676172000001073130333030313319504553534F414C20
      43454449444F202D20504153534147454D063231323130330000000000804540
      05506167617200000107313031303033321C504553534F414C2043454449444F
      202D2052454D554E455241C7C34F063231323130330000000000804540055061
      676172000001073030313030323418504553534F414C2043454449444F202D20
      53414CC152494F06323132313033000000000080454005506167617200000107
      3130333030313415504553534F414C2043454449444F202D2054415849063231
      3231303300000000008045400550616761720000000730303130303531235045
      53534F414C2046554E434546202D20414449414E542E203133BA2046C9524941
      5308313232323033303200000000008045400831323232303330320550616761
      7200000007303031303030311F504553534F414C2046554E434546202D204144
      49414E542E204645524941530831323232303330320000000000804540083132
      32323033303205506167617200000107313032303031351F504553534F414C20
      46554E434546202D20414449414E542E2046C952494153083132323230333032
      0000000000804540055061676172000001073130323030313622504553534F41
      4C2046554E434546202D20414449414E542E3133BA2046C95249415308313232
      3230333033000000000080454005506167617200000107313032303032341F50
      4553534F414C2046554E434546202D204153534953542E204F444F4E542E0632
      3132313033000000000080454005506167617200000107303031303032392350
      4553534F414C2046554E434546202D20415353495354CA4E434941204F444F4E
      544F063231323130330000000000804540055061676172000001073130323030
      333321504553534F414C2046554E434546202D204155582E204D45444943414D
      454E544F06323132313033000000000080454005506167617200000107303031
      3030313220504553534F414C2046554E434546202D20444553432E20454E5449
      4441444553063231323931310000000000804540055061676172000001073030
      31303031331C504553534F414C2046554E434546202D20444553432E46554E43
      4546063231323931310000000000804540055061676172000000073130323030
      323123504553534F414C2046554E434546202D20444553434F4E544F20454E54
      4944414445530632313239313100000000008045400632313239313105506167
      6172000001073130323030353223504553534F414C2046554E434546202D2044
      45535045534120432F204D4F5241444941063231323130330000000000804540
      05506167617200000107303031303031341E504553534F414C2046554E434546
      202D2044455350455341532050414D5306323132313033000000000080454005
      5061676172000000073130323030333622504553534F414C2046554E43454620
      2D204445562E20494E5355462E2053414C444F06323132313032000000000080
      4540083132323130343031055061676172000001073130333030303718504553
      534F414C2046554E434546202D204449C1524941530632313231303300000000
      0080454005506167617200100107313032303031371E504553534F414C204655
      4E434546202D2046C9524941532050454E53C34F000000000080454005506167
      6172001000073130323030313415504553534F414C2046554E434546202D2046
      4754530000000000804540083231323230323032055061676172001000073030
      313030303815504553534F414C2046554E434546202D20464754530000000000
      8045400832313232303230320550616761720010000730303130303631235045
      53534F414C2046554E434546202D2046494E414E432E2048414249544143494F
      4E00000000008045400632313239313105506167617200000107303031303030
      3919504553534F414C2046554E434546202D20464C20504147544F0632313231
      3032000000000080454005506167617200000107313032303031311950455353
      4F414C2046554E434546202D20464C20504147544F0632313231303200000000
      0080454005506167617200000107313033303030361B504553534F414C204655
      4E434546202D20484F535045444147454D063231323130330000000000804540
      055061676172000001073130323030313315504553534F414C2046554E434546
      202D20494E535308323132323032303100000000008045400550616761720000
      00073030313030303615504553534F414C2046554E434546202D20494E535308
      3231323230323031000000000080454008323132323032303105506167617200
      0000073030313030303415504553534F414C2046554E434546202D2049525246
      0A3231323230313032303100000000008045400A323132323031303230310550
      61676172000001073130323030313215504553534F414C2046554E434546202D
      20495252460A3231323230313032303100000000008045400550616761720000
      0107313033303030381F504553534F414C2046554E434546202D205041535341
      47454D2041C95245410632313231303300000000008045400550616761720000
      01073130323030323316504553534F414C2046554E434546202D2050434D534F
      0632313231303300000000008045400550616761720000010730303130303236
      16504553534F414C2046554E434546202D2050434D534F063231323130330000
      00000080454005506167617200000107303031303031311F504553534F414C20
      46554E434546202D20504C414E4F204445205341554445063231323130330000
      00000080454005506167617200000107313032303032301F504553534F414C20
      46554E434546202D20504C414E4F204445205341DA4445063231323130330000
      000000804540055061676172000001073030313030363020504553534F414C20
      46554E43454620205245454D422E20504F53544147454E530632313231303300
      00000000804540055061676172000001073130323030323623504553534F414C
      2046554E434546202D205245454D424F4C534F20414C494D454E542E06323132
      3130330000000000804540055061676172000001073130323030323920504553
      534F414C2046554E434546202D205245454D424F4C534F20504F53542E063231
      3231303300000000008045400550616761720000010731303230303238225045
      53534F414C2046554E434546202D205245454D424F4C534F20524550524F442E
      0632313231303300000000008045400550616761720000000730303130303135
      1F504553534F414C2046554E434546202D205245504153534520434F4E54522E
      0632313239313100000000008045400632313239313105506167617200000107
      3130323030323221504553534F414C2046554E434546202D2052455041535345
      20434F4E545249422E0632313239313100000000008045400550616761720000
      01073030313030313022504553534F414C2046554E434546202D205245534349
      53414F20434F4E545241544F0632313231303200000000008045400550616761
      72000001073130323030333122504553534F414C2046554E434546202D205245
      53434953C34F20434F4E545241544F0632313231303300000000008045400550
      61676172000000073030313030303721504553534F414C2046554E434546202D
      2053414C4152494F20454455434143414F083231323230323031000000000080
      454008323132323032303105506167617200000007313032303032351F504553
      534F414C2046554E434546202D2053454755524F204445205649444106323132
      3130330000000000804540063231323931310550616761720000000730303130
      3033351F504553534F414C2046554E434546202D2053454755524F2044452056
      4944410632313231303300000000008045400632313239313105506167617200
      0001073130333030303915504553534F414C2046554E434546202D2054415849
      0632313231303300000000008045400550616761720000010731303230303139
      23504553534F414C2046554E434546202D205449434B455420414C494D454E54
      41C7C34F06323132313033000000000080454005506167617200000107313032
      3030313820504553534F414C2046554E434546202D2056414C45205452414E53
      504F525445063231323130330000000000804540055061676172000000073030
      313030303220504553534F414C2046554E434546202D2056414C45205452414E
      53504F5254450632313231303300000000008045400631323232303405506167
      6172000000073030313030313620504553534F414C2046554E4345462041432E
      20434F4E54522E20534F4349414C063231323130330000000000804540063231
      32393131055061676172000001073030313030343821504553534F414C204655
      4E4345462D2041442E204645524941532050454E53414F063231323130320000
      000000804540055061676172000001073130333030313023504553534F414C20
      46554E4345462D20504153534147454D20524F444F5649C15249410632313231
      3033000000000080454005506167617200000007303031303035322350455353
      4F414C2046554E4345462D434F4E545249422046554E43454620414420313306
      3231323130330000000000804540083132323230333036055061676172000000
      07303031303035331C504553534F414C2046554E4345462D504F532047524144
      554143414F063231323130330000000000804540043131323205506167617200
      0001073030313030343922504553534F414C2046554E4345462D5245454D422E
      524550524F442C204C4547414C06323132313033000000000080454005506167
      61720000010731303530303038235046202D20434F4E5345525641C7C34F2F4C
      494D50455A412F534552562E474552414C063231323130330000000000804540
      0550616761720000010731303530303035215046202D20434F4E53554C542E20
      4445205245435552534F532048554D414E4F5306323132313033000000000080
      45400550616761720000010731303530303031195046202D20434F4E53554C54
      4F52494120415455415249414C06323132313033000000000080454005506167
      61720000010731303530303032195046202D20434F4E53554C544F5249412043
      4F4E54C142494C06323132313033000000000080454005506167617200000107
      31303530303033195046202D20434F4E53554C544F524941204A5552CD444943
      4106323132313033000000000080454005506167617200000107313035303030
      341C5046202D20484F4E4F52C152494F53204144564F434154CD43494F530632
      3132313033000000000080454005506167617200000107313035303030371B50
      46202D204D414E5554454EC7C34F204445204841524457415245063231323130
      33000000000080454005506167617200000107313035303030361B5046202D20
      4D414E5554454EC7C34F20444520534F46545741524506323132313033000000
      00008045400550616761720000010731303530303039235046202D205245454D
      422E434F4E442E20555242414E412D534552562E20544552432E063231323130
      3300000000008045400550616761720000010731303530303130235046202D20
      5245454D424F4C534F20414C494D454E542E2D534552562E20544552432E0632
      3132313033000000000080454005506167617200000107313033303032372350
      46202D205345525649C74F20444520544552434549524F202D20504153534147
      454D063231323130330000000000804540055061676172000001073130333030
      3235235046202D205345525649C74F5320444520544552432E202D20484F5350
      45444147454D0632313231303300000000008045400550616761720000010731
      303330303236235046202D205345525649C74F5320444520544552434549524F
      53202D204449C152494106323132313033000000000080454005506167617200
      00010731303330303238215046202D205345525649C74F532044452054455243
      4549524F53202D20544158490632313231303300000000008045400550616761
      72000000073031343030303610504953202D204D454E53414C20524554083231
      3232303130350000000000804540083231323230313035055061676172000001
      073130353031303322504A202D2041444D2E204341525445495241202046494E
      414E432E2048414249542E063231323130330000000000804540055061676172
      000001073130353030363422504A202D2041554449544F524941204154554152
      49414C2F42454E4546CD43494F53063231323130330000000000804540055061
      676172000001073130353030363317504A202D2041554449544F52494120434F
      4E54C142494C0632313231303300000000008045400550616761720000010731
      30353030363523504A202D20434F4E5345525641C7C34F2F4C494D50455A412F
      534552562E474552414C06323132313033000000000080454005506167617200
      0001073130353030353521504A202D20434F4E53554C542E2044452052454355
      52534F532048554D414E4F530632313231303300000000008045400550616761
      72001001073130353030373919504A202D20434F4E53554C542E20454D505245
      53415249414C000000000080454005506167617200100107313035303038321B
      504A202D20434F4E53554C542E20494E56455354494D454E544F530000000000
      804540055061676172001001073130353030383023504A202D20434F4E53554C
      542E20504152412050524F4A45544F2045535452415445470000000000804540
      055061676172000000073130353030383322504A202D20434F4E53554C542E20
      504F5254414C20444520474F5645524E414EC741063231323130330000000000
      80454006313332313033055061676172000001073130353030353119504A202D
      20434F4E53554C544F52494120415455415249414C0632313231303300000000
      00804540055061676172000001073130353030353219504A202D20434F4E5355
      4C544F52494120434F4E54C142494C0632313231303300000000008045400550
      6167617200000107313035303130321C504A202D20434F4E53554C544F524941
      20494D4F42494C49C15249410632313231303300000000008045400550616761
      72000001073130353030353319504A202D20434F4E53554C544F524941204A55
      52CD444943410632313231303300000000008045400550616761720000010731
      3035303036301D504A202D20435553544F4D495A41C7C34F20444520534F4654
      5741524506323132313033000000000080454005506167617200000107313035
      3030373120504A202D2044455350455341204D4943524F46494C4D2E2F444947
      4954414C2E063231323130330000000000804540055061676172000001073130
      35303130311D504A202D20474552454E4349414D454E544F20444520494DD356
      4549530632313231303300000000008045400550616761720000010731303530
      30363223504A202D2047455354C34F2F504C414E454A414D454E544F20455354
      524154C947494306323132313033000000000080454005506167617200000107
      3130353030373319504A202D2047554152444120444520444F43554D454E544F
      5306323132313033000000000080454005506167617200000107313035303035
      341C504A202D20484F4E4F52C152494F53204144564F434154CD43494F530632
      3132313033000000000080454005506167617200100107313035303037362250
      4A202D20494D505245532E20434F4E5452412D43484551554520415353495354
      2E0000000000804540055061676172000001073130353030363623504A202D20
      4D414E55542E205245502E204520494E5354414C2E2D414D4249454E54450632
      3132313033000000000080454005506167617200000107313035303036382050
      4A202D204D414E55542E205245502E204520494E5354414C2E2D4DD356454C06
      3231323130330000000000804540055061676172000001073130353030363723
      504A202D204D414E55542E2C205245502E204520494E5354414C2E2D4D415155
      494E410632313231303300000000008045400550616761720000010731303530
      30363923504A202D204D414E55542E2C205245502E204520494E5354414C2E2D
      5645CD43554C4F06323132313033000000000080454005506167617200000107
      313035303035371B504A202D204D414E5554454EC7C34F204445204841524457
      4152450632313231303300000000008045400550616761720000010731303530
      3035361B504A202D204D414E5554454EC7C34F20444520534F46545741524506
      3231323130330000000000804540055061676172000001073130353030363113
      504A202D204D414E5554454EC7C34F2057454206323132313033000000000080
      4540055061676172000001073130353030373822504A202D205245454D422E20
      414C494D454E5441C7C34F2D534552562E544552432E06323132313033000000
      0000804540055061676172000001073130353030373723504A202D205245454D
      422E20434F4E442E20555242414E412D534552562E544552432E063231323130
      33000000000080454005506167617200000107313035303037341F504A202D20
      524550524F442E2C204C4547414C2E204520454E43414445522E063231323130
      33000000000080454005506167617200000107313035303035391C504A202D20
      5345475552414EC74120494E535449545543494F4E414C063231323130330000
      000000804540055061676172000001073130333030323923504A202D20534552
      562E20444520544552434549524F202D20484F535045444147454D0632313231
      30330000000000804540055061676172000001073130353030383120504A202D
      20534552562E20494E464F524D41C7C34F2046494E414E434549524106323132
      3130330000000000804540055061676172000001073130353030373523504A20
      2D205345525649C74F2044452050524F5445C7C34F20414F204352C94449544F
      0632313231303300000000008045400550616761720000010731303330303330
      21504A202D205345525649C74F20444520544552434549524F202D204449C152
      4941063231323130330000000000804540055061676172000001073130333030
      333123504A202D205345525649C74F20444520544552434549524F202D205041
      53534147454D0632313231303300000000008045400550616761720000010731
      30333030333221504A202D205345525649C74F5320444520544552434549524F
      53202D2054415849063231323130330000000000804540055061676172000001
      073130353030353816504A202D2054454C4550524F43455353414D454E544F06
      3231323130330000000000804540055061676172000001073130353030373217
      504A202D205452494147454D20444F43554D454E54414C063231323130330000
      000000804540055061676172000001073130353030373022504A2D4D414E5554
      2E2C5245502E20494E5354414C2E2D494E464F524DC154494341063231323130
      33000000000080454005506167617200000007313032303033321E504C414E4F
      204445205341DA4445202D2045582D454D5052454741444F5306323132313033
      0000000000804540083132323139393032055061676172000001073130323030
      343311504C414E4F204D45444943414D454E544F063231323130330000000000
      804540055061676172000000073130323030343422504C414E4F204D45444943
      414D454E544F202D20434F504152544943495041C7C34F063231323130330000
      0000008045400831323231393930340550616761720000000731303230303435
      21504C414E4F204D45444943414D454E544F202D2045582D454D505245474144
      4F53063231323130330000000000804540083132323139393034055061676172
      000001073030323030313522504F53544147454E532F5452414E53504F525445
      20444520454E434F4D454E444153063231323130330000000000804540055061
      676172001001073030303030323314507265766973616F202D204164766F6361
      6369610000000000003E40055061676172001001073030303030313214507265
      766973616F202D2041717569736963616F0000000000003E4005506167617200
      100107303030303030331A507265766973616F202D20417578696C696F204675
      6E6572616C0000000000003E4005506167617200100107303030303030371C50
      7265766973616F202D20436C75626520496D6F62696C696172696F0000000000
      003E40055061676172001001073030303030313423507265766973616F202D20
      44657370657361732047657261697320496D6F62696C69610000000000003E40
      05506167617200100107303030303031311F507265766973616F202D20456D70
      7265656E6420656D2050726F647563616F0000000000003E4005506167617200
      1001073030303030313516507265766973616F202D20456D7072657374696D6F
      730000000000003E400550616761720010010730303030303032205072657669
      73616F202D20456E7469646164657320436F6E76656E656E7465730000000000
      003E4005506167617200100107303030303031361F507265766973616F202D20
      46696E616E632E2048616269746163696F6E616C0000000000003E4005506167
      617200100107303135303030311D505245564953414F202D20464F4C48412044
      4520504147414D454E544F0000000000003E4005506167617200100107303030
      303030311A507265766973616F202D20466F6C686120506167616D656E746F00
      00000000003E4005506167617200100107303030303031332350726576697361
      6F202D20486F74656973206520456E74726574656E696D656E746F7300000000
      00003E40055061676172001001073030303030313723507265766973616F202D
      20496D706F73746F7320652054617861732046696E616E632E0000000000003E
      40055061676172001001073030303030303621507265766973616F202D20496D
      706F73746F73206520546178617320507265762E0000000000003E4005506167
      6172001001073030303030323722507265766973616F202D204D617175696E61
      732065204571756970616D656E746F730000000000003E400550616761720010
      0107303030303032381E507265766973616F202D204D6F766569732065205574
      656E73696C696F730000000000003E4005506167617200100107303030303032
      3522507265766973616F202D204F757472617320446573702047657261697320
      41646D2E0000000000003E400550616761720010010730303030303330215072
      65766973616F202D204F75747261732053616964617320446976657273617300
      00000000003E4005506167617200100107303030303032342150726576697361
      6F202D204F7574726F7320536572762E20507265737461646F73000000000000
      3E4005506167617200100107303030303030381C507265766973616F202D2050
      6563756C696F20706F72204D6F7274650000000000003E400550616761720010
      01073030303030313819507265766973616F202D20506573736F616C2046756E
      6365660000000000003E40055061676172001001073030303030303422507265
      766973616F202D205067746F20526573672E20436F6E74726962756963616F00
      00000000003E4005506167617200100107303030303032312150726576697361
      6F202D2050726F63657373616D656E746F206465204461646F73000000000000
      3E40055061676172001001073030303030303915507265766973616F202D2052
      656E646120466978610000000000003E40055061676172001001073030303030
      313019507265766973616F202D2052656E646120566172696176656C00000000
      00003E40055061676172001001073030303030303517507265766973616F202D
      205265706173736520494E53530000000000003E400550616761720010010730
      30303030323222507265766973616F202D205365727669636F73204573706563
      69616C697A61646F730000000000003E40055061676172001001073030303030
      323913507265766973616F202D20536F6674776172650000000000003E400550
      61676172001001073030303030323016507265766973616F202D20547265696E
      616D656E746F0000000000003E40055061676172001001073030303030323623
      507265766973616F202D205472696275746F73206520436F6E74726962756963
      6F65730000000000003E4005506167617200100107303030303031391C507265
      766973616F202D2056696167656E73206520457374616461730000000000003E
      4005506167617200000107303031303034362350524F472E205155414C494441
      4445202D20444956554C472E2045205055424C49434906323132313033000000
      000080454005506167617200000107303031303036381950524F472E20515541
      4C4944414445202D204556454E544F5306323132313033000000000080454005
      506167617200000107303031303034352350524F472E205155414C4944414445
      202D2053454D494E4152494F532C20435552534F063231323130330000000000
      80454005506167617200000107303031303034342150524F472E205155414C49
      444144452D4156414C2E204DC9442E2F46495349434106323132313033000000
      000080454005506167617200000107303031303035342050524F4752414D4120
      2D20472E204C41424F52414C2E2F5649472E205045534F063231323130330000
      00000080454005506167617200000107313032303034321A50524F4752414D41
      2047494E415354494341204C41424F52414C0632313231303300000000008045
      4005506167617200000107303031303130321550524F4752414D41204D4F5449
      564143494F4E414C063231323130330000000000804540055061676172000001
      07313032303034311A50524F4752414D41205155414C49444144452044452056
      4944410632313231303300000000008045400550616761720000000730303530
      3031341050524F4E544F20504147414D454E544F063231323130330000000000
      80454008313232323033303105506167617200000007313031303032351C5155
      4152454E54454E41202D20494E53532028415554D44E4F4D4F29083231323230
      3130310000000000804540063231323130330550616761720000010731303130
      3032361B51554152454E54454E41202D20494E53532028454D50524553412908
      3231323230313031000000000080454005506167617200000007313031303032
      371151554152454E54454E41202D20495252460A323132323031303230320000
      0000008045400632313231303305506167617200000107313031303032341451
      554152454E54454E41202D2053414CC152494F06323132313033000000000080
      4540055061676172000001073030323030393216524543525554414D454E544F
      20452053454C4543414F06323132313033000000000080454005506167617200
      000107303032303038331D52454355502E494E56455354494D454E544F53202D
      2041205649535441083231333330323031000000000080454005506167617200
      00010730303230303237235245454D4220414C494D454E544143414F2F414456
      4F4741444F5320434F4E54524154063231323130330000000000804540055061
      6761720000010730303230303238205245454D4220434F4E445543414F205552
      42414E412F4144564F4741444F53200632313231303300000000008045400550
      616761720000010730303230303535235245454D4220435553544153204A5544
      4943494149532F4144564F4741444F5320434F06323132313033000000000080
      454005506167617200000107303032303034381A5245454D4220444956554C47
      4143414F2F4144564F4741444F53063231323130330000000000804540055061
      67617200000107303032303032391F5245454D42204553544143494F4E414D45
      4E544F2F4144564F4741444F5320063231323130330000000000804540055061
      6761720000010730303230303332235245454D42204C49472054454C45462F41
      44564F4741444F5320434F4E5452415441440632313231303300000000008045
      400550616761720000010730303230303331235245454D4220504F5354414745
      4E532F4144564F4741444F5320434F4E54524154414406323132313033000000
      000080454005506167617200000107303032303033331F5245454D4220545241
      4E53504F52544520444F432E2F4144564F4741444F5306323132313033000000
      00008045400550616761720000010730303230303330225245454D4220584552
      4F58204C4547414C20454E434152442F4144564F4741444F5306323132313033
      000000000080454005506167617200000107303035303033341E5245454D422E
      20414C494D454E544143414F20434F4E53554C544F5249410632313231303300
      000000008045400550616761720010010730303130303632165245454D422E20
      415558494C494F2046554E4552414C0000000000004440055061676172000001
      0730303530303335195245454D422E204C494741434F455320434F4E53554C54
      4F52063231323130330000000000804540055061676172000001073030353030
      33371B5245454D422E204D4154455249414C20434F4E53554C544F5249410632
      3132313033000000000080454005506167617200000107303035303033361C52
      45454D422E20504F53544147454E5320434F4E53554C544F5249410632313231
      303300000000008045400550616761720000010730303530303532185245454D
      424F4C534F20444520414C494D454E5441C7C34F063231323130330000000000
      8045400550616761720000010730303230303533205245454D424F4C534F2044
      4520444553504553415320434152544F52494149530632313231303300000000
      008045400550616761720000010730303530303534175245454D424F4C534F20
      444520484F535045444147454D06323132313033000000000080454005506167
      617200000107303036303030371A5245454D424F4C534F204C49472E2054454C
      45464F4E49434153063231323130330000000000804540055061676172000000
      07303035303033311A5245454D424F4C534F205441584920434F4E53554C544F
      5249410632313231303300000000008045400632313231303305506167617200
      000107303035303032391B5245454D424F4C534F2056494147454E5320434F4E
      53554C544F520632313231303300000000008045400550616761720000000730
      313030303439165245504153534520434F4E442E204A5544494349414C083231
      3337303130340000000000804540083231333730313034055061676172000000
      07303131303032311F524550415353452044452049525246202D204445562E20
      444550D35349544F063231323130330000000000804540063231313230310550
      616761720000000730303530303439155245504153534520484F4E4F522E2046
      554E434546063231323130330000000000804540063231323130330550616761
      7200000007303131303032321A52455041535345205245454D424F4C534F2049
      4E53532F43454608323131393031303100000000008045400631323132303105
      50616761720000010730303430303031165245504F534943414F204445204D41
      5445524941495306313232323031000000000080454005506167617200000107
      303032303031371F524550524F442E204C4547414C495A2E204520454E434144
      45524E4143414F06323132313033000000000080454005506167617200000107
      303032303033371D52455353415243204445535045534153204445204144564F
      4741444F53063231323130330000000000804540055061676172000001073030
      31303035392352455353415243494D454E544F20444520434F4E545249422E20
      524554524F415449560632313231303300000000008045400550616761720000
      0007313037303035332052455353415243494D454E544F20504552444153202D
      204D555455C152494F530632313231303300000000008045400A343231313035
      3130393905506167617200100107303134303031391B525241202D2049525246
      20464F4C48412041535349535449444F53000000000080454005506167617200
      00010730303230303837175345475552414EC74120494E535449545543494F4E
      414C063231323130330000000000804540055061676172000001073130373030
      35371253454755524F2044452056454943554C4F530632313231303300000000
      0080454005506167617200100107303035303037301253454755524F20504552
      44412F524F55424F000000000000444005506167617200000107303032303036
      3019534552562E20494E464F524D2E20454C455452D44E494341530632313231
      3033000000000080454005506167617200000007303032303037321B53455256
      2E544552432E202D20434F46494E202D20494E56455354063231323130330000
      0000008045400632313338303105506167617200000007303032303037331B53
      4552562E544552432E202D2043534C4C202D20494E564553542E063231323130
      3300000000008045400632313338303105506167617200000007303032303036
      3923534552562E544552432E202D205049532F434F46494E532F43534C4C2049
      4E564553540A3231333639393035303300000000008045400A32313336393930
      353033055061676172000000073030323030373120534552562E544552432E20
      2D205049532F506173657020202D20494E564553540632313338303100000000
      008045400632313338303105506167617200000107313037303033331D534552
      5649C74F20444520454E434F4D454E44412045204D414C4F5445063231323130
      3300000000008045400550616761720000010731303730303033225345525649
      C74F20444520494E464F524D41C7D5455320454C455452D44E49434153063231
      3231303300000000008045400550616761720010010730303230303638225345
      525649434F20444520544552432E202D205049532F434F46494E532F43534C4C
      000000000080454005506167617200000007303032303036361D534552564943
      4F20444520544552434549524F53202D20434F46494E53063231323130330000
      0000008045400832313232303130370550616761720000000730303230303637
      1B5345525649434F20444520544552434549524F53202D2043534C4C06323132
      3130330000000000804540083231323230313037055061676172001001073030
      32303030311B5345525649434F20444520544552434549524F53202D20494E53
      5300000000008045400550616761720000000730303230303730235345525649
      434F20444520544552434549524F53202D204952524620494E564553542E0A32
      31333639393035303200000000008045400A3231333639393035303205506167
      61720000000730303230303635205345525649434F2044452054455243454952
      4F53202D205049532F5061736570083231323230313037000000000080454008
      32313232303130370550616761720000010730303230303538125345525649C7
      4F53204445204255464645540632313231303300000000008045400550616761
      7200000107303032303037361F5345525649C74F532044452050524F5445C7C3
      4F20414F204352C94449544F0632313231303300000000008045400550616761
      7200100107303032303030321C5345525649434F532044452054455243454952
      4F53202D20495252460000000000804540055061676172001001073030323030
      30331B5345525649434F5320444520544552434549524F53202D204953530000
      0000008045400550616761720000010730303230303230105345525649434F53
      204D454449434F53063231323130330000000000804540055061676172000000
      0730303230303937235345525649434F5320544552434549524F53202D20494E
      5353202D20494DD3564549530A3231333639393035303400000000008045400A
      3231333639393035303405506167617200000007313037303035381C54414649
      43202D20544158412044452046495343414C495A41C7C34F0632313231303300
      0000000080454006313232323036055061676172000000073031303030343520
      544158412041444D2E2046475453205155495441205155495441202D20434546
      0832313337303230370000000000804540083231333730323037055061676172
      00000007303130303130391F54415841204445204355535445494F2041444D2E
      20454D5052C95354494D4F083231333730313034000000000080454008323133
      3730313034055061676172000001073031343030313614544158412044452046
      495343414C495A41C7C34F063231323130330000000000804540055061676172
      000001073130373030343914544158412044452046495343414C495A41C7C34F
      0632313231303300000000008045400550616761720000010731303730303535
      105441584120444520494E43CA4E44494F063231323130330000000000804540
      055061676172000001073130373030333820544158492041205345525649C74F
      202D20504553534F414C205052D35052494F0632313231303300000000008045
      4005506167617200000007303036303030340D54454C45464F4E45204649584F
      0632313231303300000000008045400A34323131303530353034055061676172
      00000107303036303030350E54454C45464F4E45204D4F56454C063231323130
      33000000000080454005506167617200000107303036303030311154454C4550
      524F43455353414D454E544F0632313231303300000000008045400550616761
      720000000730303830303132225445534F55202D2041434552544F2044452043
      52C94449544F20494E44455649444F0632313231303300000000008045400832
      313239313230310550616761720000000730303830303034195445534F55202D
      2041434552544F532044452044C94249544F0431313232000000000080454004
      3131323205506167617200000007303038303030381B5445534F55202D204152
      5245444F4E44414D454E544F2043504D46063231333830310000000000804540
      04313132320550616761720010000730303830303231225445534F55202D2042
      4C4F512E4A55442F50454E48204F4E204C494E45202D20424200000000008045
      4004313132320550616761720010000730303830303230235445534F55202D20
      424C4F512E4A55442F50454E48204F4E204C494E45202D204345460000000000
      80454004313132320550616761720010000730303830303232225445534F5520
      2D20424C4F512E4A55442F50454E48204F4E204C494E45202D20464800000000
      0080454004313132320550616761720010000730303830303136225445534F55
      202D20435245442041432E20454E54524520504C414E4F5328494E5629000000
      0000804540083231333439393130055061676172001000073030383030313322
      5445534F55202D20435245442E20414320454E54524520504C414E4F53284144
      4D29000000000080454008323133343939313005506167617200100007303038
      30303134235445534F55202D20435245442E20414320454E54524520504C414E
      4F53285052455629000000000080454008323133343939313005506167617200
      10000730303830303037215445534F55202D204445422E20414320454E545245
      20504C414E4F532841444D290000000000804540083132333439393130055061
      6761720010000730303830303137215445534F55202D204445422E2041432045
      4E54524520504C414E4F5328494E562900000000008045400832313334393931
      300550616761720010000730303830303135225445534F55202D204445422E20
      414320454E54524520504C414E4F532850524556290000000000804540083231
      3334393931300550616761720000000730303830303031195445534F55202D20
      44C94249544F20432F43202D2043504D46063231333830310000000000804540
      04313132320550616761720010010730303830303032235445534F55202D2044
      C94249544F20454D20432F432041204944454E54494649434152000000000000
      444005506167617200000007303038303030351A5445534F55202D2044C94249
      544F205452414E53462E20432F430A3131313233303031303100000000008045
      400A313131323330303130310550616761720000000730303830303131195445
      534F55202D2044C94249544F5320494E44455649444F53063231323130330000
      0000008045400431313232055061676172000000073030383030303617544553
      4F55202D204553544F524E4F204352C94449544F063231323130330000000000
      8045400832313239313230310550616761720000000730303830303130215445
      534F55202D20494D504C414E542053414C444F20494E494349414C20432F430A
      3131313233303031303100000000008045400431313232055061676172001001
      0730303830303033175445534F55202D204F5554524153204445535045534153
      00000000000044400550616761720000000730303830303039195445534F5520
      2D205245434F4C48494D454E544F20494E535306323132313033000000000080
      4540083231323230313031055061676172000001073030323030313917544553
      4F55202D2054415841532042414E43C152494153063231323130330000000000
      8045400550616761720010000730303830303138235445534F552D41432E44C9
      4249544F202D20424C4F515545494F204A5544494349414C0000000000804540
      04313132320550616761720010000730303830303139225445534F552D41432E
      44C94249544F202D2050454E484F5241204A5544494349414C00000000008045
      40043131323205506167617200000007303031303035381B5449434B45542041
      4C494D454E5441C7C34F2F5245464549C7C34F06323132313033000000000080
      4540063132323230350550616761720000010730303230303830225449434B45
      5420452056414C45205452414E53502E202D2054582044452041444D2E063231
      3231303300000000008045400550616761720000010731303330303232155452
      45494E414D454E544F202D204449C15249415306323132313033000000000080
      4540055061676172000001073130333030323118545245494E414D454E544F20
      2D20484F535045444147454D0632313231303300000000008045400550616761
      72000001073130333030323316545245494E414D454E544F202D205041535341
      47454D0632313231303300000000008045400550616761720000010731303330
      30323412545245494E414D454E544F202D205441584906323132313033000000
      000080454005506167617200000107313034303030361B545245494E414D454E
      544F20444520434F4E53454C484549524F530632313231303300000000008045
      4005506167617200000107313034303030371A545245494E414D454E544F2050
      4553534F414C2043454449444F06323132313033000000000080454005506167
      617200000107303031303037301A545245494E414D454E544F20504553534F41
      4C2043454449444F063231323130330000000000804540055061676172000001
      073130343030303122545245494E414D454E544F2C2053454D494EC152494F20
      4520434F4E47524553534F063231323130330000000000804540055061676172
      0010010730303230303434125452494147454D20444F43554D454E54414C0000
      000000003E40055061676172000001073030363030303611545620504F522041
      5353494E41545552410632313231303300000000008045400550616761720000
      01073130373030353609554E49464F524D455306323132313033000000000080
      454005506167617200000107303033303031300F56454943554C4F53202D2049
      5056410632313231303300000000008045400550616761720000010730303330
      3030371256454943554C4F53202D204C4F434143414F06323132313033000000
      000080454005506167617200000107303033303030381556454943554C4F5320
      2D204D414E5554454E43414F0632313231303300000000008045400550616761
      7200000107303032303032361D56494147454E532F4144564F4741444F532043
      4F4E5452415441444F53063231323130330000000000804540055061676172}
    object cdsTipoDesembDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object cdsTipoDesembCODTIPRECDES: TStringField
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object cdsTipoDesembPLACONTACREDITO: TStringField
      DisplayWidth = 18
      FieldName = 'PLACONTACREDITO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object cdsTipoDesembPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Visible = False
    end
    object cdsTipoDesembPLACONTA: TStringField
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object cdsTipoDesembRECPAG: TStringField
      DisplayWidth = 7
      FieldName = 'RECPAG'
      Visible = False
      Size = 7
    end
  end
  object cdsTipoDocCap: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 108
  end
  object cdsTipoReceb: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 322
    Top = 257
    Data = {
      656500009619E0BD01000000180000000600800100000300000030010C434F44
      54495052454344455301004900000002000753554254595045020049000A0046
      697865644368617200055749445448020002000F000944455343524943414F01
      004900000001000557494454480200020023000F504C41434F4E544143524544
      49544F01004900000002000753554254595045020049000A0046697865644368
      61720005574944544802000200120005504C414E4F080004000000000008504C
      41434F4E544101004900000002000753554254595045020049000A0046697865
      6443686172000557494454480200020012000652454350414701004900000001
      0005574944544802000200070002000D44454641554C545F4F52444552020082
      00010000000200044C4349440400010009080000000000073030313030303317
      41434552544F202D204445564F4C2E2053414C4152494F083132323139393032
      0000000000804540063231323130320752656365626572000000073130323030
      30311641434552544F202D204445564F4C2E53414CC152494F08313232313939
      3032000000000080454006323132313032075265636562657200000007313032
      303031341F41434552544F202D20494E535546494349CA4E4349412044452053
      414C444F08313232313939303200000000008045400831323231303430310752
      65636562657200000007303033303031301A41434552544F2044452050524F4E
      544F20504147414D454E544F0831323231393930320000000000804540083132
      323230333031075265636562657200000107303033303030341541434552544F
      20444553502E204A554449434941530831323231393930320000000000804540
      075265636562657200000007303135303030311C416C69656E61E7E36F202D20
      4D756C746120436F6E7472617475616C0C313233363035303230313031000000
      0000804540063531363530310752656365626572001001073130363030303118
      414C49454E41C7C34F2044452042454E53204DD3564549530000000000804540
      075265636562657200000007303039303030361C41504F525445204445205245
      5345525641204D4154454DC1544943410A313231313031303130310000000000
      804540083331313130323031075265636562657200000007303039303030341D
      41504F52544520504543554C494F205452414E53204A5544494349414C083132
      3139303430340000000000804540083132313930343034075265636562657200
      000007303039303030352241542E204D4F4E45544152494120532F2041444941
      4E54414D454E544F20494E535306333139323032000000000080454006333139
      3230320752656365626572000000073031303030363618434F454D46202D2043
      5553544153204A55444943494149530A31323337303230323035000000000080
      45400A3432323130353036303107526563656265720000000730313030303131
      1F434F4E54524942204155544F2046494E414E434941444F20454D5052455341
      0A31323131303130343031000000000080454006333131343031075265636562
      6572000000073031303030303922434F4E545249422E204155544F2046494E41
      4E434941444F20454D5052454741444F0A313231313031303430310000000000
      80454006333131343031075265636562657200000007303130303037381F434F
      4E545249425549C7D54553202D2041C7D54553204A5544494349414953083231
      3139313030330000000000804540083231313931303033075265636562657200
      1001073030313030313423434F4F504152544943495041C7C34F204155582E20
      444F454EC741202D204345444944000000000000444007526563656265720000
      00073030313030313320434F504152544943495041C7C34F20504C414E4F204D
      45444943414D454E544F08313232313939303200000000008045400831323231
      393930340752656365626572001001073130323030303621434F504152544943
      495041C7C34F20504C414E4F204D45444943414D454E544F5300000000008045
      40075265636562657200000107313037303030360F4352C94449544F20444520
      49434D5308313232313939303200000000008045400752656365626572000000
      0730303130303036104372E96469746F20496E64657669646F08313232313939
      3032000000000080454006323132313033075265636562657200000107303032
      303030330D444553432E20434F4D505241530632313231303300000000008045
      400752656365626572000000073030333030333117444556202D20444553502E
      20444520434152544F52494F0632313231303300000000008045400A34323931
      3035393930370752656365626572000000073031333030303413444556202D20
      5645CD43554C4F5320495056410632313231303300000000008045400A343239
      31303531303033075265636562657200000107303031303031351E4445562050
      524F4752414D41205155414C4944414445204445205649444108313232313939
      30320000000000804540075265636562657200000107303133303030391A4445
      562E20415353494E41545552412050455249D34449434F530A34323931303530
      3330320000000000804540075265636562657200000107313031303030321C44
      45562E20434F4E53454C484F53202D2052454D554D455241C7C34F0632313231
      3033000000000080454007526563656265720000000730313430303039134445
      562E20444520415252454D415441C7C34F083132323139393032000000000080
      45400A3132333730323033303107526563656265720000000730303330303333
      164445562E20444550D35349544F20494E44455649444F063231323130330000
      0000008045400632313231303307526563656265720010010730313330303037
      154445562E204556454E544F5320494E5445524E4F5300000000000044400752
      6563656265720000010731303630303032214445562E20494E5354414C2E2F49
      4E4652414553542E204D414E5554454E43414F06323132313033000000000080
      454007526563656265720000010730303230303034214445562E20494E535441
      4C2E2F494E4652414553542E204D414E5554454E43414F063231323130330000
      000000804540075265636562657200000007303131303031381F4445562E2049
      52204E4F524D414C202D20434F4E442E204A5544494349414C06323131323031
      0000000000804540063231313230310752656365626572000000073031333030
      3038154445562E204D4154455249414C20444520434F50410632313231303300
      000000008045400A343239313035303130310752656365626572000000073030
      3130303137164445562E204D454E53414C494441444520415043454608313232
      3139393032000000000080454004343139320752656365626572000001073030
      3330303335224445562E204D554C54415320452050454E414C49444144455320
      2D20524543414C4C083132323139393032000000000080454007526563656265
      7200000007303033303032320E4445562E20504147414D454E544F0831323231
      3939303200000000008045400431313232075265636562657200000007303033
      303033340E4445562E20504147414D454E544F08313232313939303200000000
      008045400A343239313035303630320752656365626572000000073030393030
      3038194445562E20504147414D454E544F5320494E44455649444F5306313231
      3230330000000000804540063132313230330752656365626572001000073031
      3330303035214445562E20504153534147454E5320534552562E20432F205445
      52434549524F5300000000008045400A34323231303330373033075265636562
      657200000107313031303030311B4445562E20504553534F414C204345444944
      4F2053414CC152494F0632313231303300000000008045400752656365626572
      00000107303031303032301B4445562E20504553534F414C2046554E43454620
      2D2050434D534F08313232313939303200000000008045400752656365626572
      0000000730303130303136214445562E20504553534F414C2046554E43454620
      2D2056414C45205452414E535006313232323034000000000080454006313232
      323034075265636562657200000107303031303032321E4445562E2050455353
      4F414C2046554E434546204155582E20414C494D2E0831323231393930320000
      00000080454007526563656265720000000730303130303139234445562E2050
      4553534F414C2046554E43454620444553432E20454E54494441444553083132
      3231393930320000000000804540063231323931310752656365626572000000
      0730313330303131234445562E20504553534F414C2046554E4345462D20504C
      414E4F204445205341DA44450831323231393930320000000000804540083132
      323139393032075265636562657200000007313032303031361A4445562E2050
      4C414E4F2053415544452045204F444F4E544F2E063231323130330000000000
      8045400632313231303307526563656265720000010730303130303233124445
      562E2050D35320475241445541C7C34F08313232313939303200000000008045
      4007526563656265720000010730313330303132204445562E20504F53544147
      454D2F5452414E53504F52544520444520454E432E0632313231303300000000
      0080454007526563656265720000010731303230303137224445562E2050524F
      472E5155414C49442E2D4156414C204DC9442E2F464953494341063231323130
      330000000000804540075265636562657200100107313032303030331F444556
      2E2050524F4752414D41205155414C4944414445204445205649444100000000
      0080454007526563656265720000010730303130303130234445562E20524545
      4D422E20435552534F204944494F4D412045535452414E474549520831323231
      3939303200000000008045400752656365626572001000073031333030303613
      4445562E205245454D424F4C534F205441584900000000008045400A34323231
      30353037303107526563656265720000010730313330303130164445562E2054
      454C4550524F43455353414D454E544F06323132313033000000000080454007
      526563656265720000000730303330303236154445562E444550D35349544F20
      4A5544494349414C083132323139393032000000000080454006313231353031
      07526563656265720000000730313430303130154445562E444550D35349544F
      20524543555253414C0831323231393930320000000000804540063132313530
      32075265636562657200000107303134303030321D4445564F4C204155582041
      4C494D454E542E204553544147494152494F0831323231393930320000000000
      80454007526563656265720010000730313030303736224445564F4C2E204445
      50D35349544F204A5544494349414C202D205245534741544500000000008045
      4006313231353031075265636562657200000007303134303031321D4445564F
      4C2E20544158412044452043555354D34449412046554E444F06323132313033
      0000000000804540063231323130330752656365626572001001073130323030
      3032194445564F4C55C7C34F202D20424F4C53412D455354C147494F00000000
      00804540075265636562657200000007303133303030331E4445564F4C55C7C3
      4F202D204445535020432F20444956554C4741C7C34F06323132313033000000
      00008045400A3432393130353033303107526563656265720010000730303130
      3030381A4445564F4C55C7C34F20414449414E542044452046C9524941530000
      0000008045400831323232303330320752656365626572000000073130323030
      3035204445564F4C55C7C34F20414449414E54414D454E544F2044452046C952
      4941530831323231393930320000000000804540083132323230333032075265
      636562657200000107313037303030371F4445564F4C55C7C34F2042454E5320
      44452050455155454E4F2056414C4F5208313232313939303200000000008045
      4007526563656265720000010730303130303034174445564F4C5543414F2042
      4F4C5341204553544147494F0831323231393930320000000000804540075265
      63656265720000010731303430303037224445564F4C55C7C34F204345525449
      46494341C7C34F20444520474553544F52455308313232313939303200000000
      0080454007526563656265720000010731303330303137224445564F4C55C7C3
      4F20434F4E53454C484F2F434F4D4954CA2D204449C152494153083132323139
      3930320000000000804540075265636562657200000107313033303031382344
      45564F4C55C7C34F20434F4E53454C484F2F434F4D4954CA2D20504153534147
      454D083132323139393032000000000080454007526563656265720000010731
      3033303031391F4445564F4C55C7C34F20434F4E53454C484F2F434F4D4954CA
      2D20544158490831323231393930320000000000804540075265636562657200
      00010731303330303136224445564F4C55C7C34F20434F4E53454C484F2F434F
      4D4954CA2D484F53504544414708313232313939303200000000008045400752
      6563656265720000010730303130303037234445564F4C55C7C34F20434F4E54
      5249425549C7C34F20415353495354454E4349414C0831323231393930320000
      00000080454007526563656265720000010731303430303033234445564F4C55
      C7C34F20435552534F2041434144CA4D49434F202D20475241445541C7083132
      3231393930320000000000804540075265636562657200100107313034303030
      35234445564F4C55C7C34F20435552534F2041434144CA4D49434F202D204D45
      5354524144000000000080454007526563656265720010010731303430303034
      234445564F4C55C7C34F20435552534F2041434144CA4D49434F2D2050D3532D
      475241440000000000804540075265636562657200100107313038303030321C
      4445564F4C55C7C34F20435553544F532050524F434553535541495300000000
      0080454007526563656265720000010730303130303032144445564F4C554341
      4F204445204449C1524941530831323231393930320000000000804540075265
      636562657200100107303133303030311C4445564F4C55C7C34F204445204556
      454E544F5320534F434941495300000000000044400752656365626572000001
      0731303730303038214445564F4C55C7C34F204445204D554C54415320452050
      454E414C49444144455306323132313033000000000080454007526563656265
      720000010730313430303131154445564F4C55C7C34F20444520504153534147
      454D083132323139393032000000000080454007526563656265720000010730
      313430303033114445564F4C5543414F2044452054C158490831323231393930
      3200000000008045400752656365626572001001073030333030313716444556
      4F4C55C7C34F204445502E524543555253414C00000000000044400752656365
      62657200000107303033303031311B4445564F4C55C7C34F20444550D3534954
      4F204A5544494349414C08313232313939303200000000008045400752656365
      62657200100107313032303030341C4445564F4C55C7C34F20444553434F4E54
      4F20454E54494441444553000000000080454007526563656265720010010731
      3033303030321E4445564F4C55C7C34F204449524947454E544553202D204449
      C152494153000000000080454007526563656265720010010731303330303031
      214445564F4C55C7C34F204449524947454E544553202D20484F535045444147
      454D0000000000804540075265636562657200100107313033303030331F4445
      564F4C55C7C34F204449524947454E544553202D20504153534147454D000000
      0000804540075265636562657200100107313033303030341B4445564F4C55C7
      C34F204449524947454E544553202D2054415849000000000080454007526563
      656265720010010731303730303033184445564F4C55C7C34F204556454E544F
      2045585445524E4F000000000080454007526563656265720010010731303730
      303034184445564F4C55C7C34F204556454E544F20494E5445524E4F00000000
      00804540075265636562657200100107313038303030331E4445564F4C55C7C3
      4F20484F4E4F52C152494F532050455249434941495300000000008045400752
      6563656265720010010731303830303034234445564F4C55C7C34F204D554C54
      4120452050454E414C4944414445202D203437354A0000000000804540075265
      63656265720010010731303330303132214445564F4C55C7C34F20504553534F
      414C2043454449444F2D204449C1524941530000000000804540075265636562
      65720010010731303330303133224445564F4C55C7C34F20504553534F414C20
      43454449444F2D20504153534147454D00000000008045400752656365626572
      00100107313033303031341E4445564F4C55C7C34F20504553534F414C204345
      4449444F2D205441584900000000008045400752656365626572001001073130
      3330303131234445564F4C55C7C34F20504553534F414C2043454449444F2D48
      4F535045444147454D0000000000804540075265636562657200100107313033
      30303037214445564F4C55C7C34F20504553534F414C2046554E4345462D2044
      49C1524941530000000000804540075265636562657200100107313033303030
      38224445564F4C55C7C34F20504553534F414C2046554E4345462D2050415353
      4147454D0000000000804540075265636562657200100107313033303030391E
      4445564F4C55C7C34F20504553534F414C2046554E4345462D20544158490000
      00000080454007526563656265720010010731303330303036234445564F4C55
      C7C34F20504553534F414C2046554E4345462D484F535045444147454D000000
      000080454007526563656265720010010731303430303032234445564F4C55C7
      C34F205245454D422E204944494F4D412045535452414E474549524F00000000
      0080454007526563656265720010010731303330303236204445564F4C55C7C3
      4F205345525649C74F202D205046202D204449C1524941530000000000804540
      07526563656265720010010731303330303235234445564F4C55C7C34F205345
      525649C74F202D205046202D20484F535045444147454D000000000080454007
      526563656265720010010731303330303237214445564F4C55C7C34F20534552
      5649C74F202D205046202D20504153534147454D000000000080454007526563
      6562657200100107313033303032381D4445564F4C55C7C34F205345525649C7
      4F202D205046202D205441584900000000008045400752656365626572001001
      0731303330303330204445564F4C55C7C34F205345525649C74F202D20504A20
      2D204449C1524941530000000000804540075265636562657200100107313033
      30303239234445564F4C55C7C34F205345525649C74F202D20504A202D20484F
      535045444147454D000000000080454007526563656265720010010731303330
      303331214445564F4C55C7C34F205345525649C74F202D20504A202D20504153
      534147454D000000000080454007526563656265720010010731303330303332
      1D4445564F4C55C7C34F205345525649C74F202D20504A202D20544158490000
      000000804540075265636562657200000107303133303030321A4445564F4C55
      C7C34F205441584920502E204A5552CD44494341083132323139393032000000
      000080454007526563656265720000010731303430303031154445564F4C55C7
      C34F20545245494E414D454E544F083132323139393032000000000080454007
      526563656265720010010731303330303232204445564F4C55C7C34F20545245
      494E414D454E544F53202D204449C15249415300000000008045400752656365
      6265720010010731303330303231234445564F4C55C7C34F20545245494E414D
      454E544F53202D20484F535045444147454D0000000000804540075265636562
      65720010010731303330303233214445564F4C55C7C34F20545245494E414D45
      4E544F53202D20504153534147454D0000000000804540075265636562657200
      100107313033303032341D4445564F4C55C7C34F20545245494E414D454E544F
      53202D2054415849000000000080454007526563656265720000000730313230
      30303518444946494E202D2041434F4553204449564944454E444F530A313233
      3330323035303200000000008045400A31323333303230353032075265636562
      6572001001073031323030313522444946494E202D2041434F45532044495649
      44454E444F53204120434C415353494600000000000044400752656365626572
      000000073031323030303419444946494E202D2041434F455320524543454249
      4D454E544F0A3132333330323035303100000000008045400831323333303230
      31075265636562657200000007303132303030361C444946494E202D2041434F
      455320524556455253414F20435553544F0A3132333330323035303100000000
      0080454008313233333032303107526563656265720000000730313230303435
      17444946494E202D2041434F52444F204A5544494349414C0A31323333303230
      3530320000000000804540063531333230310752656365626572000000073031
      323030353323444946494E202D20414D4F5254495A41C7C34F202D204E4F5441
      2050524F4D4953534F0A3132333230323035303400000000008045400A313233
      32303230353031075265636562657200100107303132303034371A444946494E
      202D20414D4F5254495A41C7C34F204445204343420000000000004440075265
      6365626572001001073031323030343223444946494E202D20414D4F5254495A
      41C7C34F2044452046554E444F20494D4F42494C000000000000444007526563
      65626572000000073031323030313721444946494E202D20414D4F5254495A41
      43414F2046554E444F2041434F45532020083132333430343032000000000080
      4540083132333430343031075265636562657200100107303132303034311F44
      4946494E202D20414D4F5254495A41C7C34F2046554E444F5320464944430000
      0000000044400752656365626572000000073031323030343620444946494E20
      2D20434342204A55524F53202D204349412046454348414441530A3132333230
      333036303400000000008045400A313233323033303630310752656365626572
      000000073031323030303113444946494E202D20434442205245534741544504
      3131323200000000008045400431313232075265636562657200000007303132
      303033321A444946494E202D20444542454E5455524553202D204A55524F530A
      3132333230323033303400000000008045400A31323332303230333031075265
      6365626572000000073031323030323520444946494E202D20444542454E5455
      52455320434F4E56455253495645495320043131323200000000008045400431
      3132320752656365626572000000073031323030323623444946494E202D2044
      4542454E5455524553204E414F20434F4E5645525349564549530A3132333230
      323033303400000000008045400A313233323032303330310752656365626572
      000000073031323030313614444946494E202D20445047452052455347415445
      0A3132333230313038303400000000008045400A313233323031303830310752
      656365626572001001073031323030333121444946494E202D20454D50524553
      54494D4F53204120434C41535349464943415200000000000044400752656365
      626572001001073031323030313119444946494E202D20454D5052455354494D
      4F532041434F45530000000000003E4007526563656265720000000730313230
      30343817444946494E202D204553544F524E4F20444520544158410832313333
      3032303100000000008045400635313332303107526563656265720000000730
      31323030353020444946494E202D204553544F524E4F20444520544158412043
      5553544F44494108323133323032303600000000008045400431313232075265
      6365626572001001073031323030303813444946494E202D2046415120524553
      4741544500000000000044400752656365626572001001073031323030333622
      444946494E202D2046444F20494D4F422E202D20414D4F5254495A2E20434F54
      4153000000000000444007526563656265720000000730313230303037134449
      46494E202D204649462052455347415445083132333430333032000000000080
      4540083132333430333031075265636562657200000007303132303031321B44
      4946494E202D2046554E444F2041434F45532052455347415445083132333430
      3430320000000000804540083132333430343032075265636562657200000007
      303132303031341D444946494E202D2046554E444F20494D4F42204449564944
      454E444F53083132333431323032000000000080454008353134313132303207
      5265636562657200100107303132303031331A444946494E202D2046554E444F
      20494D4F42205245534741544500000000000000400752656365626572000000
      073031323030313920444946494E202D204A55524F5320444520434150495441
      4C2050524F5052494F0A3132333330323035303200000000008045400A313233
      333032303530320752656365626572001001073031323030323021444946494E
      202D204A55524F53204C455452415320494D4F42494C49415249415300000000
      000044400752656365626572000000073031323030323211444946494E202D20
      4C4349204A55524F530A3132333230383031303400000000008045400A313233
      323038303130310752656365626572000000073031323030323113444946494E
      202D204C434920524553474154450A3132333230383031303400000000008045
      400A313233323038303130310752656365626572000000073031323030323813
      444946494E202D204C465420524553474154450A313233313031303430340000
      0000008045400A31323331303130343034075265636562657200100107303132
      3030303310444946494E202D204C48204A55524F530000000000003E40075265
      6365626572001001073031323030303212444946494E202D204C482052455347
      4154450000000000003E40075265636562657200100107303132303032371344
      4946494E202D204C544E20524553474154450000000000003E40075265636562
      6572001001073031323030333520444946494E202D204E4F54412050524F4D49
      53534F52494120524553474154450000000000003E4007526563656265720010
      0107303132303033331C444946494E202D204E544E204445564F4C55C7C34F20
      444520494F460000000000004440075265636562657200000007303132303030
      3911444946494E202D204E544E204A55524F530A313233313031303230340000
      0000008045400A31323331303130323031075265636562657200000007303132
      3030313013444946494E202D204E544E20524553474154450A31323331303130
      32303400000000008045400A3132333130313032303107526563656265720000
      00073031323030313811444946494E202D204E544E2056454E44410A31323331
      30313032303400000000008045400A3132333130313032303107526563656265
      72001001073031323030333818444946494E202D204F50434F45532044452049
      4E44494345000000000000444007526563656265720000000730313230303430
      20444946494E202D204F50455241C7D5455320434F4D50524F4D495353414441
      5304313132320000000000804540043131323207526563656265720000000730
      31323030323318444946494E202D20504F5550414EC741205245534741544504
      3131323200000000008045400431313232075265636562657200000007303132
      3030353223444946494E202D205245432E204445204A55524F53202D204E4F54
      412050524F4D49530A3132333230323035303400000000008045400A31323332
      303230353031075265636562657200000007303132303033391C444946494E20
      2D2052454342544F204120434C41535349464943415204313132320000000000
      8045400431313232075265636562657200100107303132303034332244494649
      4E202D2052454342544F204445204F50C7D5455320444520434F4D5052410000
      0000000044400752656365626572001001073031323030343421444946494E20
      2D2052454342544F204445204F50C7D545532044452056454E44410000000000
      0044400752656365626572000000073031323030343915444946494E202D2052
      454342544F20465241C7C34F0A31323333303230353031000000000080454006
      3531333230340752656365626572000000073031323030353120444946494E20
      2D2052454342544F204A55524F5320454D5052455354494D4F53083132333330
      3730340000000000804540083132333330373033075265636562657200000007
      303132303035341A444946494E202D205245434542494D454E544F202D20434C
      45500A3132333330353035303900000000008045400A31323333303530353039
      075265636562657200000007303132303033371A444946494E202D2052455345
      525641204D4154454DC1544943410A3132313130313031303100000000008045
      4008333133323031303507526563656265720010010730313230303334174449
      46494E202D205245534741544520444520464944430000000000004440075265
      636562657200100107303132303032391E444946494E202D2052455353415243
      20444553502042414E4341524941530000000000004440075265636562657200
      100107303132303032341D444946494E202D2053454355524954495A41C7C34F
      2052455347415445000000000000444007526563656265720010010730313230
      30333018444946494E202D205445524D4F20444520454E455247494100000000
      00003E40075265636562657200000007303132303035381F444952494E202D20
      434342204A55524F53202D2043494120414245525441530A3132333230323036
      303400000000008045400A313233323032303630310752656365626572000000
      07303132303036301C444952494E202D20444542454E5455524553202D205245
      53474154450A3132333230323033303400000000008045400A31323332303230
      3330310752656365626572000000073031323030353923444952494E202D2052
      454342544F20444520494E43454E5449564F20454D5052455354083132333330
      3730340000000000804540063531333730320752656365626572000000073031
      323030353619444952494E202D20524543454954415320444956455253415308
      3132333430333031000000000080454008353134313033303107526563656265
      72000000073031323030353723444952494E202D205245504153534520444520
      5441584120444520435553544F4449410A353232313033303630340000000000
      8045400A35323231303330363034075265636562657200000007303132303035
      3512444952494E202D2053414C44414D454E544F043131323200000000008045
      400431313232075265636562657200000107303033303032381C454E45524749
      4120454CC9545249434120524550524553202D20424108313232313939303200
      00000000804540075265636562657200000007303033303031350F4553544F52
      4E4F2044452043504D4608323133373031303400000000008045400431313232
      07526563656265720000000730303730303131234745494D4F2F474541524520
      2D2041434552544F5320444520435245442E4944454E540C3132333630343033
      3034303100000000008045400431313232075265636562657200100007303037
      30303039224745494D4F2F4745415245202D2041636572746F73206465205265
      632E466C61747300000000008045400C31323336303530323034303207526563
      656265720000000730303730303136184745494D4F2F4745415245202D204143
      4F52444F204345460C3132333630343032303430310000000000804540083231
      32393132303107526563656265720000000730303730303134204745494D4F2F
      4745415245202D20414C554755454C20414E544543495041444F0C3132333630
      3430333034303100000000008045400A32313336303430333032075265636562
      65720010000730303730303130234745494D4F2F4745415245202D2046554E44
      2E5245532E2052454E41495353414E434500000000008045400E313233363034
      303430323034303207526563656265720010010730303730303137214745494D
      4F2F4745415245202D2052454320414C49454E41C7C34F2052454E4441000000
      000080454007526563656265720000000730303730303133204745494D4F2F47
      45415245202D2052454320434F4E46204445204449564944410C313233363034
      30333034303100000000008045400C3132333630343033303430310752656365
      62657200000007303037303031321B4745494D4F2F4745415245202D20524543
      20444520434155C7C34F0A3132333630313034393900000000008045400A3132
      333630313034303107526563656265720000000730303730303036224745494D
      4F2F4745415245202D2052454320494D4F5620434C4153534946494341520835
      3236343033313300000000008045400C31323336303430333034303107526563
      656265720000000730303730303034234745494D4F2F4745415245202D205245
      432E20494D4F564549532044495645525341530C313233363034303330343031
      0000000000804540043131323207526563656265720010010730303730303035
      224745494D4F2F4745415245202D205245432E2053494E414C20414C49454E41
      43414F0000000000003E40075265636562657200100107303037303030312347
      45494D4F2F4745415245202D20524543454954415320494D4F42494C49415249
      41530000000000004440075265636562657200100107303037303030321D4745
      494D4F2F4745415245202D2056454E444120444520494D4F56454C0000000000
      003E4007526563656265720000000730303730303135234745494D4F2F474541
      5245202D4241495841204445204143524553432E2056414C4F520E3132333630
      34303430313034303100000000008045400E3132333630343034303130323031
      07526563656265720010000730303730303033224745494D4F2F47454152452D
      205245432E2046554E444F204445205245534552564100000000008045400E31
      3233363034303430323034303207526563656265720000010730303330303138
      1A47454A5552202D20435553544F532050524F43455353554149530831323231
      3939303200000000008045400752656365626572000000073030333030323417
      47454A5552202D204445562E20484F4E4F52C152494F53083132323139393032
      00000000008045400C3432323130343032303330310752656365626572000000
      07303134303031331647454A5552202D204445562E204952204E4F524D414C06
      3231313230310000000000804540063231313230310752656365626572001001
      07303033303032331F47454A5552202D204445564F4C2E20435553544153204A
      5544494349414953000000000000444007526563656265720000000730303330
      3033322047454A5552202D204C4556414E542E20484F4E4F522E205045524943
      4941495308313232313939303200000000008045400A34323231303530363033
      075265636562657200000007303134303030381A47454A5552202D2050524F43
      4553534F2041444D2D415449564F083132323139393032000000000080454006
      313232343031075265636562657200000007303033303032372047454A555220
      2D205245432E20505245432E20482E535543554D42CA4E434941063132333939
      3800000000008045400431313232075265636562657200000007303033303032
      351B47454A5552202D205245432E205245504153534520484F4E4F522E083132
      3231393930320000000000804540063231323130330752656365626572000000
      07303033303031322147454A5552202D205245434542494D454E544F20444520
      505245434154D352494F06313233393938000000000080454006313233393938
      075265636562657200000007303033303031342347454A5552202D2052454345
      42494D454E544F20484F4E4F52C152494F20535543554D043131323200000000
      0080454006323233323034075265636562657200000007303134303030341947
      454A5552202D20524547554C4152495A41C7C34F202D20490831323139303330
      3500000000008045400333333107526563656265720010010730313430303035
      1F47454A5552202D20524547554C4152495A41C7C34F2032303034202D204949
      0000000000004440075265636562657200100107303033303030362347454A55
      52202D20524553534152432E20444553502E20444520544552434549524F5300
      00000000000040075265636562657200000007303033303031332147454A5552
      202D20535543554D42454E4349412046554E4345462028414C44452906313233
      3939380000000000804540043131323207526563656265720000000730313130
      303032214745504142202D20414449414E5420455854524120464F4C48412044
      454249544F063132313230330000000000804540063132313230330752656365
      62657200100107303131303030361E4745504142202D20434F4E54522E204155
      58494C494F20504543554C494F00000000000044400752656365626572000000
      0730313130303132114745504142202D20434F4E56CA4E494F53083132323139
      3930320000000000804540043431393207526563656265720000000730313130
      3031301C4745504142202D204445562E20415558494C494F2046554E4552414C
      0A3231313130323033303100000000008045400A323131313032303330310752
      6563656265720000000730313130303037214745504142202D204445562E2049
      52204445504F5349544F204A5544494349414C06323131323031000000000080
      454006323131323031075265636562657200000007303131303030311F474550
      4142202D204445562E2050454E53414F20414C494D454E544943494108323131
      3130343031000000000080454008323131313034303107526563656265720010
      010730313130303039194745504142202D204553542E204155582E2046554E45
      52414C0000000000003E40075265636562657200000007303131303030382147
      45504142202D204553542E205041472E20464F4C48412042454E45464943494F
      0832313131303430310000000000804540083231313130343031075265636562
      65720000000730313130303035234745504142202D204553542E504147544F20
      42454E454620455854524120464F4C4841063132313230330000000000804540
      06313231323033075265636562657200000007303131303031371E4745504142
      202D205245454D422E2041C7C34F204A55442E20434149584108313231393033
      3033000000000080454008313231393033303307526563656265720000000730
      313130303134234745504142202D205245454D424F4C534F2043504D4620532F
      42454E45464943494F5306323133383031000000000080454004313132320752
      6563656265720010010730313130303033224745504142202D20534941504520
      41432E20434F4E545249422E20504543554C494F000000000000444007526563
      656265720000000730313130303034234745504142202D20534941504520454E
      54494420434F4E56454E202D2041434552544F08323131393033303100000000
      0080454008323131393033303107526563656265720000000730313130303133
      1E47455041422D436F6D70656E7361E7E36F2049525246202D2044434F4D5006
      3231313230310000000000804540083132313930323032075265636562657200
      1001073030373030303820474550524F2F4745414349202D205245432E204144
      4D2E204449564552534153000000000000444007526563656265720000000730
      313030303730224745524154202D20435245442E204944454E542E2043414958
      412053454755524F530832313337303130340000000000804540083231333730
      31303407526563656265720010010730313030303133214745524154202D2045
      4D505245535420524543454220455854524120464F4C48410000000000004440
      075265636562657200000007303130303033371C4745524154202D20454D5052
      4553542E20464F4C4841204341495841043131323200000000008045400A3132
      3337303130323031075265636562657200000007303130303033341D47455241
      54202D20454D50524553542E20464F4C48412046554E4345460A313233373031
      3032303100000000008045400A31323337303130323031075265636562657200
      100107303130303033331D4745524154202D20454D50524553542E2052454354
      4F2E205349415045000000000000444007526563656265720000000730313030
      303635204745524154202D20454D5052C95354494D4F2041432E205052455354
      41C7C34F0A3132333730313032303100000000008045400A3132333730313032
      303107526563656265720000000730313030303536234745524154202D20454D
      5052455354494D4F2041434552544F20434F4E43455353C34F08323133373031
      3034000000000080454008323133373031303407526563656265720000000730
      313030303632234745524154202D20454D5052C95354494D4F2041434552544F
      2053414C444F204445560A3132333730313031303100000000008045400A3132
      3337303130313031075265636562657200000007303130303035381B47455241
      54202D20454D5052C95354494D4F205155495441C7C34F0A3132333730313032
      303400000000008045400A313233373031303230340752656365626572000000
      07303130303031321E4745524154202D20454D5052455354494D4F2052454345
      42494D454E544F0A3132333730313032303100000000008045400A3132333730
      313032303107526563656265720000000730313030303233224745524154202D
      2046494E2048414220432E4D2E20532F20464754532F50524553540832313337
      3032303200000000008045400635313732303207526563656265720000000730
      313030303439204745524154202D2046494E2048414220464754532051756974
      617851756974610A3132333730323032303800000000008045400A3132333730
      3230323038075265636562657200000007303130303032361E4745524154202D
      2046494E2048414220464754532F50524553544143414F083231333730323032
      0000000000804540083231333730323032075265636562657200000007303130
      303031391C4745524154202D2046494E20484142204C49512053494E49535452
      4F08323133373032303300000000008045400832313337303230330752656365
      6265720000000730313030303230194745524154202D2046494E204841422050
      5245535441C7C34F0A3132333730323032303500000000008045400A31323337
      3032303230350752656365626572000000073031303030353523474552415420
      2D2046494E20484142205245432E20434F4E544120434F5252454E54450A3132
      333730323032303600000000008045400A313233373032303230360752656365
      62657200000007303130303030311D4745524154202D2046494E2E204841422E
      20414D4F5254495A41C7C34F0A3132333730323032303500000000008045400A
      3132333730323032303507526563656265720000000730313030303737224745
      524154202D205245504153534520464F4C48412042454E45464943494F204648
      0A3132333730323032303500000000008045400A313233373032303230350752
      6563656265720000000730313030303739194745524154202D2053494E495354
      524F20494E44455649444F0A3132333730313032303400000000008045400A31
      3233373031303230340752656365626572000000073031303030353123474552
      4154202D454D5052455354494D4F2053415353452046414C4543494D454E544F
      0A3132333730313032303400000000008045400A313233373031303230320752
      6563656265720010010730313030303436234745534547202D2041432E204AD3
      49412F434F4E545249422E20454D2041545241534F0000000000004440075265
      63656265720010010730313030303435224745534547202D2041432E20534547
      55524F204445204AD349412F2041545241534F00000000000044400752656365
      62657200000007303130303033391E4745534547202D2041434552544F204445
      20434F4E545249425549C7414F0A313231313031303130310000000000804540
      0A31323131303130313031075265636562657200100107303130303035392347
      45534547202D20434F4E54204143414F204A5544494349414C20454D50524547
      4144000000000000444007526563656265720010010730313030303630234745
      534547202D20434F4E54204143414F204A5544494349414C20504154524F4349
      4E0000000000004440075265636562657200000007303130303035371D474553
      4547202D20434F4E545249425549C7C34F20494E4445564944410A3132313130
      3130313031000000000080454008323131393034303707526563656265720000
      0007303130303037351F4745534547202D204355535445494F204155544F5041
      54524F43494E41444F0831323231303130340000000000804540063431313130
      34075265636562657200000007303130303037321B4745534547202D20435553
      5445494F20494E535449545549444F5208313232313031303200000000008045
      4006343131313032075265636562657200000007303130303037342347455345
      47202D204355535445494F205041525449434950414E5445204153534953540A
      3132323130313033303200000000008045400834313131303330320752656365
      6265720000000730313030303733234745534547202D204355535445494F2050
      41525449434950414E544520415449564F530A31323231303130333031000000
      0000804540083431313130333031075265636562657200000007303130303037
      311C4745534547202D204355535445494F20504154524F43494E41444F520831
      3232313031303100000000008045400834313131303130310752656365626572
      0000000730313030303631204745534547202D204445562E204D454E53414C49
      444144452028434C554245290632313239313100000000008045400632313239
      313107526563656265720000000730313030303338234745534547202D204553
      544F524E4F20414E5445432E524553472E434F4E542E52454208323131313033
      3031000000000080454008323131313033303107526563656265720000000730
      313030303036234745534547202D204553544F524E4F20524553474154452043
      4F4E545249425549C7C308323131313033303100000000008045400832313131
      30333031075265636562657200000007303130303035321E4745534547202D20
      464846204352C94449544F5320494E44455649444F530A313233373032303230
      3500000000008045400A31323337303230323035075265636562657200000007
      30313030303438234745534547202D2046494E20484142205245434542494D45
      4E544F204449564552534F083231333730323035000000000080454008323133
      3730323035075265636562657200000007303130303034341D4745534547202D
      2046494E2053494E495354524F20524550415353415208323133373032303400
      0000000080454008323133373032303407526563656265720010010730313030
      303034234745534547202D204F55545241532052454345495441532042454E20
      434F4D504C454D00000000000044400752656365626572001001073031303030
      36331A4745534547202D20504F52544142494C49444144452045415043000000
      0000004440075265636562657200100107303130303036341A4745534547202D
      20504F52544142494C4944414445204546504300000000000044400752656365
      6265720010010730313030303335204745534547202D2050524553542E434F4E
      544153204345462F505245564841420000000000004440075265636562657200
      10010730313030303330214745534547202D20524550415353452041504C4943
      2E20502F454E5449444144450000000000004440075265636562657200000007
      303130303030381F4745534547202D205245504153534520434F4E545220454D
      5052454741444F0C313231313031303330313031000000000080454008333131
      3330313031075265636562657200000007303130303030371C4745534547202D
      205245504153534520434F4E54524942554943414F0A31323131303130313031
      0000000000804540083331313130313031075265636562657200100107303130
      303034371D4745534547202D2053454755524F204445204AD349412F41545241
      534F0000000000003E4007526563656265720000000730313030303533234745
      534547202D20544158412041444D204647545320515549544120582051554954
      4108323133373032303700000000008045400832313337303230370752656365
      62657200100107303130303034302347455345472D20434F4E54524942204155
      544F2046494E414E432028424F4C45544F290000000000004440075265636562
      6572001001073939393030303118486F6D6F6C6F6761E7E36F20496E76657374
      696D656E746F0000000000000040075265636562657200100007303039303030
      371E494E5353204553542E205041472E20464F4C48412042454E45464943494F
      0000000000804540083231313130343031075265636562657200000007303033
      3030333023495220494E44455649444F20505245434154D352494F202D205245
      535449545549C7C3063132333939380000000000804540063132333939380752
      6563656265720010010730313030303433234A4F49412F41504F52544520434F
      4E54524942204155544F2046494E414E434941444F0000000000004440075265
      636562657200100107303130303031301C4A4F49412F41504F52544520444520
      434F4E545249425549C7D5455300000000000044400752656365626572000000
      07303135303030331C4A55524F53202D20446573626C6F717565696F204A7564
      696369616C083132333430333032000000000080454008353134313033303107
      526563656265720000000731303830303037234C4556414E542E204445502E20
      4A5544494349414C2D2041444D494E4953545241544908313232313939303200
      0000000080454006313232343031075265636562657200000007313038303030
      36234C4556414E542E204445502E204A5544494349414C2D20494E5645535449
      4D454E544F063231333830310000000000804540063132333830310752656365
      6265720000000731303830303035234C4556414E542E204445502E204A554449
      4349414C2D20505245564944454E4349414C0831323139303330350000000000
      8045400631323135303107526563656265720000000731303830303130234C45
      56414E542E204445502E20524543555253414C2D2041444D494E495354524154
      4908313232313939303200000000008045400631323234303207526563656265
      720000000731303830303039234C4556414E542E204445502E20524543555253
      414C2D20494E56455354494D454E544F06323133383031000000000080454006
      31323338303207526563656265720000000731303830303038234C4556414E54
      2E204445502E20524543555253414C2D20505245564944454E4349414C083132
      3139303330350000000000804540063132313530320752656365626572001000
      0731303830303137194C4556414E542E20444550D35349544F2D204445535045
      5341000000000080454006333139323033075265636562657200100107313038
      303030311D4C4556414E54414D454E544F20435553544153204A554449434941
      4953000000000080454007526563656265720000000730303330303136214C45
      56414E54414D454E544F204445204445504F5349544F204A5544494349414C08
      3132323139393032000000000080454006313231353031075265636562657200
      10000730303330303139224C4556414E54414D454E544F204445502E4A554449
      4349414C202D20494E5645535400000000008045400631323338303107526563
      656265720000000730303130303231164D454E53414C4944414445202D204D45
      53545241444F0831323231393930320000000000804540083132323139393033
      075265636562657200100107303038303032392350454449444F204445205245
      535449545549C7C34F2D416E697374696120322E323232000000000000444007
      52656365626572000000073030313030303122504553534F414C2046554E4345
      46202D2041432E204C49512E20464C2E504147544F0632313231303200000000
      0080454008313232313034303107526563656265720010000730303130303039
      1C504553534F414C2046554E434546202D2041434552544F20494E5353000000
      0000804540083231323230323031075265636562657200000007313032303030
      3720504553534F414C2046554E434546202D20444553432E20454E5449444144
      4553063231323931310000000000804540063231323931310752656365626572
      0000000730303130303131145049532041424F4E4F2F52454E44494D454E544F
      0831323231393930320000000000804540043131323207526563656265720010
      01073030303030313214507265766973616F202D20416C69656E6163616F0000
      000000003E400752656365626572001001073030303030313013507265766973
      616F202D20416C7567756569730000000000003E400752656365626572001001
      07303030303030371A507265766973616F202D20417578696C696F2050656375
      6C696F0000000000003E40075265636562657200100107303030303030361C50
      7265766973616F202D20436C75626520496D6F62696C696172696F0000000000
      003E400752656365626572001001073030303030313120507265766973616F20
      2D20456D707265656E642E20656D2050726F647563616F0000000000003E4007
      52656365626572001001073030303030313416507265766973616F202D20456D
      7072657374696D6F730000000000003E40075265636562657200100107303030
      303031351F507265766973616F202D2046696E616E632E204861626974616369
      6F6E616C0000000000003E400752656365626572001001073030303030313823
      507265766973616F202D204F757472617320456E747261646173204469766572
      7361730000000000003E40075265636562657200100107303030303031332150
      7265766973616F202D204F7574726173205265632E20646520496D6F76656973
      0000000000003E40075265636562657200100107303030303030332350726576
      6973616F202D204F7574726173205265632E507265766964656E636961697300
      00000000003E40075265636562657200100107303030303031371F5072657669
      73616F202D204F75747261732052656365697461732041646D2E000000000000
      3E400752656365626572001001073030303030303218507265766973616F202D
      205061727469636970616E7465730000000000003E4007526563656265720010
      01073030303030303119507265766973616F202D20506174726F63696E61646F
      7261730000000000003E40075265636562657200100107303030303031361250
      7265766973616F202D20506573736F616C0000000000003E4007526563656265
      7200100107303030303030351E507265766973616F202D205072657374616361
      6F20646520436F6E7461730000000000003E4007526563656265720010010730
      3030303031391D507265766973616F202D20526563656974617320646520486F
      7465697300000000000044400752656365626572001001073030303030323020
      507265766973E36F202D2052656365697461732064652053686F7070696E6773
      0000000000004440075265636562657200100107303030303030341950726576
      6973616F202D205265656D626F6C736F20494E53530000000000003E40075265
      6365626572001001073030303030303815507265766973616F202D2052656E64
      6120466978610000000000003E40075265636562657200100107303030303030
      3919507265766973616F202D2052656E646120566172696176656C0000000000
      003E400752656365626572001001073030303030323220507265766973E36F20
      2D20547265696E616D656E746F73206520437572736F73000000000080454007
      5265636562657200100107303030303032311D507265766973E36F202D205669
      6167656E73206520457374616469617300000000008045400752656365626572
      0000000730313430303031125245432E2041444D2E2044495645525341530831
      3232313939303200000000008045400434313932075265636562657200000007
      31303830303135185245432E484F4E4F52C152494F532041444146554E434546
      0632313231303300000000008045400632313231303307526563656265720000
      0007303135303030341E5265636562696D656E746F20646520416C756775656C
      202D2052454E44410C3132333630343033303430310000000000804540083531
      3634303330340752656365626572000001073030333030323016524543454249
      4D454E544F20444520444F41C7D5455308313232313939303200000000008045
      4007526563656265720000000731303830303134195245434542494D454E544F
      20444520505245434154D352494F063132333939380000000000804540063132
      3339393807526563656265720000000730313530303032115265636562696D65
      6E746F2054414320320C31323336303530323031303200000000008045400C31
      3233363035303230313032075265636562657200000107303033303030371552
      4543454954412041444D2E204449564552534153083132323139393032000000
      0000804540075265636562657200000107313032303030391E5245454D422032
      205649412043415254C34F202D2041555820414C494D2E083132323139393032
      0000000000804540075265636562657200000107313032303031301E5245454D
      422032205649412043415254C34F2053415544452F4F444F4E54083132323139
      3930320000000000804540075265636562657200000107313032303031331D52
      45454D4220444520464F544F434F50494120504152544943554C415208313232
      3139393032000000000080454007526563656265720000010731303230303131
      1E5245454D42204445204C494741C7D5455320504152544943554C4152455308
      3132323139393032000000000080454007526563656265720000010731303230
      3031321C5245454D4220444520504F53544147454D20504152544943554C4152
      0831323231393930320000000000804540075265636562657200000007303031
      30303138155245454D422E20435552534F204D4553545241444F083132323139
      3930320000000000804540083132323139393033075265636562657200000107
      303134303030360D5245454D422E204449C15249410831323231393930320000
      00000080454007526563656265720000000730303330303338165245454D422E
      204D554C544120444520434F46494E5308313232393031303400000000008045
      400A343239313035313030320752656365626572000000073030333030333713
      5245454D422E204D554C54412044452050495308313232393031303400000000
      008045400A343239313035313030310752656365626572001001073030333030
      3336175245454D422E5452414E53502E454E434F4D454E444153000000000080
      454007526563656265720010010731303430303036235245454D424F4C534F20
      435552534F2041434144CA4D49434F202D204D45535452414400000000008045
      4007526563656265720000010731303230303135185245454D424F4C534F2044
      4520414C494D454E5441C7C34F08313232313939303200000000008045400752
      65636562657200000107313037303030351C5245454D424F4C534F2044455350
      45534120434F4D2043D350494153083132323139393032000000000080454007
      5265636562657200100107313037303030311C5245454D424F4C534F20454E43
      4F4D454E44412045204D414C4F54450000000000804540075265636562657200
      000007303131303031360E5245454D424F4C534F20494E535306313231323031
      0000000000804540063132313230310752656365626572000000073030393030
      30331C5245454D424F4C534F20494E53532D415449564F532046554E43454606
      3132313230310000000000804540043131323207526563656265720010010731
      3037303030321C5245454D424F4C534F204C494741C7C34F2054454C4546D44E
      4943410000000000804540075265636562657200000007303134303030371A52
      4547554C4152495A41C7C34F202D205041472E20474550414206313231323033
      0000000000804540063132313230330752656365626572000000073130383030
      313323524547554C4152495A41C7C34F204445502E20524543555253414C2D20
      41444D494E490832323232303230320000000000804540063433313130320752
      656365626572000000073130383030313223524547554C4152495A41C7C34F20
      4445502E20524543555253414C2D20494E564553540631323338303200000000
      0080454004353331310752656365626572000000073130383030313123524547
      554C4152495A41C7C34F204445502E20524543555253414C2D20505245564944
      0831323139303330350000000000804540033333310752656365626572000000
      073130383030313616524547554C4152495A41C7C34F20444550D35349544F06
      3231323130330000000000804540063132333830310752656365626572000000
      07303130303036371B5245494E53435249C7C34F204A5544494349414C205248
      2030303808323131393034303700000000008045400832313139303430370752
      65636562657200000007303130303038301A5245504153534520544158412044
      4520454D5052C95354494D4F0831323231393930320000000000804540083132
      3231393930320752656365626572000000073030393030303223524553455256
      41204D4154454D41544943412045582D43414958412053454755524F53083132
      3131393930310000000000804540083331333230313035075265636562657200
      1001073030333030323921524553534152432E20444520444553502E20455845
      522E414E544552494F5245530000000000004440075265636562657200100107
      303037303030371F524553534152432E204445535020494D4F5645495320414C
      49454E41444F5300000000000000400752656365626572000001073030333030
      30382152455353415243494D204445204D554C54415320452050454E414C4944
      4144455308313232313939303200000000008045400752656365626572000001
      07303033303030391D52455353415243494D454E544F20434F4E4455C7C34F20
      555242414E410831323231393930320000000000804540075265636562657200
      000107303033303032312352455353415243494D454E544F2044452044455350
      45534153204A5544494349414953083132323139393032000000000080454007
      5265636562657200000107303033303030331652455353415243494D454E544F
      204445205845524F580831323231393930320000000000804540075265636562
      657200000107303033303030352052455353415243494D454E544F2044455350
      2E20444520544552434549524F53083132323139393032000000000080454007
      5265636562657200000107303033303030321D52455353415243494D454E544F
      204C49472E54454C45464F4E4943415308313232313939303200000000008045
      40075265636562657200000107303033303030312152455353415243494D454E
      544F20504F53544147454D2F5452414E53504F52544508313232313939303200
      00000000804540075265636562657200000007303038303033301A524554454E
      C7C34F2049525246202D20505245434154D352494F0631323339393800000000
      0080454006313233393938075265636562657200000007303038303033342254
      45534F55202D2041434552544F204352C9442E2041204944454E544946494341
      5208323132393132303100000000008045400435313938075265636562657200
      00000730303830303230215445534F55202D2041434552544F2044452044C942
      49544F20494E44455649444F0431313232000000000080454004313132320752
      65636562657200100107303038303031351B5445534F55202D2041434552544F
      205245534720434F4E5452494200000000000000400752656365626572000000
      07303038303030341A5445534F55202D2041434552544F53204445204352C944
      49544F0431313232000000000080454004313132320752656365626572001000
      0730303830303032215445534F55202D204352454420454D20432F4320412049
      44454E5449464943415200000000008045400832313239313230310752656365
      6265720010000730303830303033225445534F55202D20435245442E20414320
      454E54524520504C414E4F532841444D29000000000080454008313233343939
      313007526563656265720010000730303830303237225445534F55202D204352
      45442E20414320454E54524520504C414E4F5328494E56290000000000804540
      0831323334393931300752656365626572001000073030383030323623544553
      4F55202D20435245442E20414320454E54524520504C414E4F53285052455629
      0000000000804540083132333439393130075265636562657200000007303038
      303030311A5445534F55202D204352C94449544F20432F43202D2043504D4606
      3231333830310000000000804540043131323207526563656265720000000730
      3038303030351B5445534F55202D204352454449544F205452414E53462E2043
      2F430A3131313233303031303100000000008045400A31313132333030313031
      075265636562657200000007303038303031391A5445534F55202D204352C944
      49544F5320494E44455649444F53043131323200000000008045400832313239
      3132303107526563656265720010000730303830303234215445534F55202D20
      44454220414320454E54524520504C414E4F5328505245562900000000008045
      4008323133343939313007526563656265720010000730303830303235215445
      534F55202D204445422E20414320454E54524520504C414E4F5328494E562900
      0000000080454008323133343939313007526563656265720010010730303830
      303231235445534F55202D2044454249544F20414320454E54524520504C414E
      4F532841444D2900000000008045400752656365626572000000073030383030
      3132145445534F55202D204553544F524E4F2043504D46063231333830310000
      0000008045400431313232075265636562657200100007303038303030361954
      45534F55202D204553544F524E4F2044452044454249544F0000000000804540
      0832313239313230310752656365626572000000073030383030323817544553
      4F55202D204553544F524E4F2054415249464153083132323139393032000000
      00008045400A3432393130353939303107526563656265720010000730303830
      303134235445534F55202D2046494E20494D4F422046554E434546204120434C
      4153534946494300000000008045400832313337303230350752656365626572
      0010000730303830303137225445534F55202D205245434549544120494D4F56
      204120434C415353494649434152000000000080454008323132393132303107
      526563656265720000000730303830303133195445534F55202D205245434549
      5441532044495645525341530632313231303300000000008045400C31323239
      3031303330323033075265636562657200100107303038303031301A5445534F
      55202D205245454D424F4C534F20444553504553415300000000000044400752
      65636562657200100107303038303031361F5445534F55202D20524553534152
      4320444553502E20544552434549524F53000000000000004007526563656265
      720010010730303830303131235445534F55202D2052455353415243494D454E
      544F20504147544F20494E444556494400000000000044400752656365626572
      0010000730303830303233235445534F55202D205641522E4E45474154495641
      20414320454E54524520504C414E4F0000000000804540083532343139393033
      07526563656265720010000730303830303232235445534F55202D205641522E
      504F5349544956412041432E20454E54524520504C414E000000000080454008
      353134313939303107526563656265720000000730303830303138235445534F
      55202D494D504C414E542044452053414C444F20494E494349414C20432F4304
      3131323200000000008045400431313232075265636562657200100007303038
      30303332225445534F552D444553424C4F512E4A55442F50454E48204F4E4C49
      4E45202D20424200000000008045400431313232075265636562657200100007
      30303830303331235445534F552D444553424C4F512E4A55442F50454E48204F
      4E4C494E45202D20434546000000000080454004313132320752656365626572
      0010000730303830303333225445534F552D444553424C4F512E4A55442F5045
      4E48204F4E4C494E45202D204648000000000080454004313132320752656365
      6265720010010730303830303039195445534F5552202D205245535341524320
      4445205845524F58000000000000004007526563656265720010010730303830
      303038215445534F5552202D2052455353415243204C49472E2054454C45464F
      4E49434153000000000000004007526563656265720010010730303830303037
      1F5445534F5552202D205245535341524320504F53544147454D2F5452414E50
      0000000000000040075265636562657200100007303032303030311456454E44
      412044452042454E53204D4F5645495300000000008045400831333131303131
      300752656365626572}
  end
  object cdsTipoDocCar: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 322
    Top = 106
  end
  object qry: TCMSqlParams
    SQL.Strings = (
      'select * from paramRH')
    ClientDataSet = Cds
    Left = 240
    Top = 85
  end
  object cdsPatrocinadora: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 46
    Top = 513
    Data = {
      AE0100009619E0BD010000001800000002001000000003000000690008494450
      4553534F410800040000000000044E4F4D450100490000000100055749445448
      020002003C0002000D44454641554C545F4F5244455202008200010000000200
      044C434944040001000908000000000000000000000840044342545500000000
      00003A76374105434F4D554D00000000000010F63041044350544D0000000000
      00661F38410343545300000000000000C05B400A464C554D495452454E530000
      00000000000000400E46554E4441C7C34F205245464552000000000000000010
      40054D4554524F00000000000048823241124D4554524F202D204F50504F5254
      52414E53000000000000019C3741084D4554524F464F520000000000000000F0
      3F055246465341000000000000CAF630410D5246465341202D20412E4C2E4C00
      0000000000D2F630410B5246465341202D2043464E000000000000C6F630410B
      5246465341202D20464341000000000000D0F630410B5246465341202D204654
      4300000000000039F630410B5246465341202D204D5253000000000000BCF630
      41105246465341202D204E4F564F45535445}
  end
  object cdsPlanoPrevidenciario: TCMClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'IDPATRO'
    MasterFields = 'IDPESSOA'
    MasterSource = dsPatrocinadora
    PacketRecords = 0
    Params = <>
    Left = 303
    Top = 484
    Data = {
      2D0A00009619E0BD01000000180000000300390000000300000064000B494450
      4C414E4F505245560800040000000000044E4F4D450100490000000100055749
      445448020002003200074944504154524F08000400000000000100044C434944
      04000100090800000000000000000000F03F05434F4D554D000000000000F03F
      0000000000000000F03F05434F4D554D00000000000000400000000000000000
      F03F05434F4D554D00000000000008400000000000000000F03F05434F4D554D
      0000000000C05B400000000000000000F03F05434F4D554D0000000010F63041
      0000000000000000F03F05434F4D554D00000000D2F630410000000000000000
      F03F05434F4D554D00000000488232410000000000000000F03F05434F4D554D
      000000003A763741000000000000000008401B4D455452D420436F6E74726962
      7569E7E36F20446566696E696461000000000000F03F00000000000000000840
      1B4D455452D420436F6E747269627569E7E36F20446566696E69646100000000
      00000840000000000000000008401B4D455452D420436F6E747269627569E7E3
      6F20446566696E6964610000000000001040000000000000000008401B4D4554
      52D420436F6E747269627569E7E36F20446566696E6964610000000048823241
      000000000000000008401B4D455452D420436F6E747269627569E7E36F204465
      66696E696461000000003A76374100000000000000002C401E42656E6566ED63
      696F20446566696E69646F2052464653412F5245464552000000000000F03F00
      000000000000002C401E42656E6566ED63696F20446566696E69646F20524646
      53412F5245464552000000000000004000000000000000002C401E42656E6566
      ED63696F20446566696E69646F2052464653412F524546455200000000000008
      4000000000000000002C401E42656E6566ED63696F20446566696E69646F2052
      464653412F5245464552000000000000104000000000000000002C401E42656E
      6566ED63696F20446566696E69646F2052464653412F52454645520000000000
      C05B4000000000000000002C401E42656E6566ED63696F20446566696E69646F
      2052464653412F52454645520000000010F6304100000000000000002C401E42
      656E6566ED63696F20446566696E69646F2052464653412F5245464552000000
      0039F6304100000000000000002C401E42656E6566ED63696F20446566696E69
      646F2052464653412F524546455200000000BCF6304100000000000000002C40
      1E42656E6566ED63696F20446566696E69646F2052464653412F524546455200
      000000C6F6304100000000000000002C401E42656E6566ED63696F2044656669
      6E69646F2052464653412F524546455200000000CAF630410000000000000000
      2C401E42656E6566ED63696F20446566696E69646F2052464653412F52454645
      5200000000D0F6304100000000000000002C401E42656E6566ED63696F204465
      66696E69646F2052464653412F524546455200000000D2F63041000000000000
      00002C401E42656E6566ED63696F20446566696E69646F2052464653412F5245
      464552000000004882324100000000000000002C401E42656E6566ED63696F20
      446566696E69646F2052464653412F5245464552000000003A76374100000000
      000000002C401E42656E6566ED63696F20446566696E69646F2052464653412F
      524546455200000000019C3741000000000000008040401B524546455220436F
      6E747269627569E7E36F20446566696E696461000000000000F03F0000000000
      00008040401B524546455220436F6E747269627569E7E36F20446566696E6964
      610000000000000040000000000000008040401B524546455220436F6E747269
      627569E7E36F20446566696E6964610000000000C05B40000000000000008040
      401B524546455220436F6E747269627569E7E36F20446566696E696461000000
      0010F63041000000000000008040401B524546455220436F6E747269627569E7
      E36F20446566696E6964610000000048823241000000000000008042401B5246
      46534120436F6E747269627569E7E36F20446566696E696461000000000000F0
      3F000000000000008042401B524646534120436F6E747269627569E7E36F2044
      6566696E6964610000000000000040000000000000008042401B524646534120
      436F6E747269627569E7E36F20446566696E6964610000000000000840000000
      000000008042401B524646534120436F6E747269627569E7E36F20446566696E
      6964610000000000C05B40000000000000008042401B524646534120436F6E74
      7269627569E7E36F20446566696E6964610000000010F6304100000000000000
      8042401B524646534120436F6E747269627569E7E36F20446566696E69646100
      00000039F63041000000000000008042401B524646534120436F6E7472696275
      69E7E36F20446566696E69646100000000BCF63041000000000000008042401B
      524646534120436F6E747269627569E7E36F20446566696E69646100000000C6
      F63041000000000000008042401B524646534120436F6E747269627569E7E36F
      20446566696E69646100000000CAF63041000000000000008042401B52464653
      4120436F6E747269627569E7E36F20446566696E69646100000000D0F6304100
      0000000000008042401B524646534120436F6E747269627569E7E36F20446566
      696E69646100000000D2F63041000000000000008042401B524646534120436F
      6E747269627569E7E36F20446566696E69646100000000488232410000000000
      00008042401B524646534120436F6E747269627569E7E36F20446566696E6964
      61000000003A7637410000000000000000444020464C554D495452454E532043
      6F6E747269627569E7E36F20446566696E6964610000000000C05B4000000000
      00000000444020464C554D495452454E5320436F6E747269627569E7E36F2044
      6566696E69646100000000C6F630410000000000000000444020464C554D4954
      52454E5320436F6E747269627569E7E36F20446566696E696461000000003A76
      3741000000000000000046401A4342545520436F6E747269627569E7E36F2044
      6566696E6964610000000000000040000000000000000046401A434254552043
      6F6E747269627569E7E36F20446566696E696461000000000000084000000000
      0000000046401A4342545520436F6E747269627569E7E36F20446566696E6964
      610000000010F63041000000000000000046401A4342545520436F6E74726962
      7569E7E36F20446566696E696461000000003A76374100000000000000004640
      1A4342545520436F6E747269627569E7E36F20446566696E6964610000000001
      9C374100000000000000804E401E4D4554524F464F5220436F6E747269627569
      E7E36F20446566696E696461000000000000104000000000000000804E401E4D
      4554524F464F5220436F6E747269627569E7E36F20446566696E696461000000
      00019C374100000000000000C05940194F70657261E7F565732041646D696E69
      737472617469766173000000003A763741}
  end
  object cdsPortadorFormaCAR: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 323
    Top = 191
    Data = {
      3D2000009619E0BD0100000018000000040083000000030000007F000C434F44
      504F5254464F524D4108000400000000000B434F44504F525441444F52080004
      000000000008434F44464F524D4108000400000000000944455343524943414F
      01004900000001000557494454480200020032000100044C4349440400010009
      08000000000000000000C05B4000000000000008400000000000804640294345
      46202D20466F6C68612064652041737369737469646F73202D20457874726174
      6F20534941504900000000000000005C40000000000000084000000000000031
      4029434546202D20466F6C68612064652041737369737469646F73202D20442E
      4C2E452E2D20434149584100000000000000405C400000000000000840000000
      0000002A4022434546202D20466F6C68612064652041737369737469646F7320
      2D204F757472617300000000000000405D400000000000000840000000000000
      53401B434546202D20494D4F42202D2053454D2046494E414E434549524F0000
      0000000000C05C40000000000000204000000000000000402E53616E74616E64
      65722D436F6E746120496E76657374696D656E746F2D44656269746F20417574
      6F6D617469636F00000000000000005D4000000000000020400000000000001C
      402F53616E74616E6465722D436F6E746120496E76657374696D656E746F2D43
      72E96469746F204175746F6DE17469636F00000000000000805D400000000000
      00F03F0000000000001C40314242202D20436F6D65726369616C2053756C2F44
      46202D203432313039352D3620204372656469746F204175746F6D6174000000
      00000000C05D40000000000000224000000000000000401B434546202D204343
      492044E96269746F204175746F6DE17469636F00000000000000005E40000000
      0000000840000000000000264030434546202D20526573676174652064652043
      6F6E747269622E202D20466963686120646520436F6D70656E7361E7E36F0000
      0000000000405E400000000000000840000000000000344023434546202D2052
      65736761746520646520436F6E747269627569E7E36F202D20444F4300000000
      000000805E400000000000000840000000000080494016434546202D20536963
      6F62202D20323420686F72617300000000000000C05E40000000000000084000
      0000000080494016434546202D205369636F62202D20343820686F7261730000
      0000000000005F400000000000000840000000000000204018434546202D204F
      6E206C696E65202D20323420686F72617300000000000000C05F400000000000
      000840000000000000534029434546202D20494D4F42202D2053454D2046494E
      414E43202D20414E4F5320414E544552494F52455300000000000000805F4000
      00000000000840000000000000204018434546202D204F6E206C696E65202D20
      323420686F726173000000000000000060400000000000002640000000000000
      0040225820434546202D205061737369766F7320466572726F62616E202D2045
      525241444F00000000000000206040000000000000264000000000000000402D
      5820434546202D205061737369766F7320466572726F62616E202D2044656269
      746F204175746F6D617469636F00000000000000406040000000000000264000
      00000000000040225820434546202D205061737369766F7320466572726F6261
      6E202D2045525241444F00000000000000606040000000000000264000000000
      00000040225820434546202D205061737369766F7320466572726F62616E202D
      2045525241444F00000000000000806040000000000000264000000000000000
      40225820434546202D205061737369766F7320466572726F62616E202D204552
      5241444F00000000000000A06040000000000000284000000000000000403258
      20434546202D20417272656E64616D656E746F20466572726F62616E202D2020
      44656269746F204175746F6D617469636F00000000000000C060400000000000
      00244000000000000020402243414958412046696E616E6369616D656E746F20
      46475453202D204F6E206C696E6500000000000000E060400000000000002440
      000000000000004021434546202D20464754532046696E616E6369616D656E74
      6F202D2044656269746F00000000000000006140000000000000244000000000
      000000402C434546202D20464754532046696E616E6369616D656E746F202D20
      44656269746F204175746F6DE17469636F000000000000002061400000000000
      0028400000000000002040315820434546202D20417272656E64616D656E746F
      20466572726F62616E202D2020437265642E204175746F6D617469636F000000
      0000000040614000000000000022400000000000001C402F434546202D20436F
      72706F726174652043656E74657220434349202D204372656469746F20417574
      6F6D617469636F00000000000000606140000000000000084000000000000034
      401D434546202D20444F4320466F6C68612064652041737369737469646F7300
      0000000000008061400000000000002E4000000000000055402E53616E74616E
      6465722052656E61697373616E636520434349202D204372E96469746F204175
      746F6DE17469636F00000000000000A061400000000000002C40000000000000
      55402353616E74616E6465722052656E61697373616E63652031332E3030312E
      3336382D322000000000000000C061400000000000002C400000000000000040
      2953616E74616E6465722052656E61697373616E6365202D2044656269746F20
      4175746F6D617469636F00000000000000E06140000000000000084000000000
      004055402B434546202D20436F72706F726174652043656E746572202D20456E
      636F6E74726F20646520436F6E74617300000000000000006240000000000000
      084000000000008055402B434546202D20436F72706F726174652043656E7465
      72202D20456E636F6E74726F20646520436F6E74617300000000000000206240
      0000000000002E4000000000000000402D53616E74616E6465722052656E6169
      7373616E636520434349202D2044656269746F204175746F6DE17469636F0000
      00000000004062400000000000000840000000000000564029434546202D2043
      6F6272616EE76120456C6574726F6E696361202D204F7574726F732043616E61
      6973000000000000006062400000000000000840000000000000564032434546
      202D20436F6272616EE76120456C6574726F6E696361202D20436F6D70656E73
      61E7E36F20456C6574726F6E6963610000000000000080624000000000000008
      4000000000000056402C434546202D20436F6272616EE76120456C6574726F6E
      696361202D204E6F205072F37072696F2042616E636F00000000000000A06240
      0000000000000840000000000000564024434546202D20436F6272616EE76120
      456C6574726F6E696361202D204C6F74657269636100000000000000C0624000
      00000000000840000000000000564031434546202D20436F6272616EE7612045
      6C6574726F6E696361202D20436F6D70656E732E20436F6E76656E63696F6E61
      6C00000000000000E06240000000000000084000000000000056402743454620
      2D20436F6272616EE76120456C6574726F6E696361202D20456D20436172746F
      72696F00000000000000006340000000000000084000000000000056402D4345
      46202D20436F6272616EE76120456C6574726F6E696361202D20436F72726573
      702E2042616E636172696F000000000000002063400000000000000840000000
      0000C0554027434546202D20436F6272616EE76120456C6574726F6E69636120
      2D204348204C6F74657269636100000000000000406340000000000000084000
      00000000C055402C434546202D20436F6272616EE76120456C6574726F6E6963
      61204348202D204F7574726F732043616E616973000000000000006063400000
      0000000008400000000000C0554030434546202D20436F6272616EE76120456C
      6574726F6E696361204348202D20436F72726573702E2042616E636172696F00
      00000000000080634000000000000008400000000000C0554031434546202D20
      436F6272616EE76120456C6574726F6E696361204348202D20436F6D702E2043
      6F6E76656E63696F6E616C00000000000000A063400000000000000840000000
      0000C055402F434546202D20436F6272616EE76120456C6574726F6E69636120
      4348202D20436F6D702E20456C6574726F6E69636100000000000000C0634000
      000000000008400000000000C055402A434546202D20436F6272616EE7612045
      6C6574726F6E696361204348202D20456D20436172746F72696F000000000000
      00E0634000000000000008400000000000C055402F434546202D20436F627261
      6EE76120456C6574726F6E696361204348202D204E6F2050726F7072696F2042
      616E636F00000000000000006440000000000000084000000000008049401743
      4546202D205369636F6220456D7072E97374696D6F7300000000000000206440
      000000000000204000000000004055402842616E636F2053616E74616E646572
      2D434349202D20456E636F6E74726F20646520436F6E74617300000000000000
      406440000000000000184000000000004055402542616E636F2053616E74616E
      64657220202D20456E636F6E74726F20646520436F6E74617300000000000000
      606440000000000000184000000000008055402442616E636F2053616E74616E
      646572202D20456E636F6E74726F20646520436F6E7461730000000000000080
      6440000000000000204000000000008055402842616E636F2053616E74616E64
      657220434349202D20456E636F6E74726F20646520436F6E7461730000000000
      0000A06440000000000000F03F00000000000000402E42616E636F20646F2042
      726173696C202D203432313039352D36202D2044656269746F204175746F6D61
      7469636F00000000000000C06440000000000000F03F0000000000001C402442
      616E636F20646F2042726173696C202D204372656469746F204175746F6D6174
      69636F00000000000000E06440000000000000304000000000000000402B4345
      46202D20426C6F717565696F204A7564696369616C202D2044E96269746F2061
      75746F6DE17469636F0000000000000000654000000000000030400000000000
      001C4031434546202D20436F72706F7261746520426C6F712E204A7564696369
      616C202D204372E9642E204175746F6D617469636F0000000000000020654000
      0000000000324000000000000000403053616E74616E64657220416E67726120
      31332E3030322E3235342D39202D2044656269746F204175746F6D617469636F
      00000000000000406540000000000000334000000000000000402F53616E7461
      6E646572204361626F2031332E3030322E3235352D36202D2044656269746F20
      4175746F6D617469636F00000000000000606540000000000000324000000000
      004056401C53616E74616E64657220416E6772612031332E3030322E3235342D
      3900000000000000806540000000000000334000000000008056401B53616E74
      616E646572204361626F2031332E3030322E3235352D3600000000000000A065
      40000000000000084000000000000057400E434546202D20436F6E74E162696C
      00000000000000C0654000000000000008400000000000C0564010434546202D
      20456D20457370E963696500000000000000E065400000000000000840000000
      000080574032434546202D20436F72706F726174652043656E7465722D46696E
      616E632E2048616269746163696F6E616C202D20464754530000000000000000
      664000000000000008400000000000C057402C434546202D20436F72706F7261
      74652046696E616E632E2048616269746163202D20456D7072E97374696D6F00
      000000000000206640000000000000084000000000004057402F434546202D20
      436F72706F726174652043656E746572202D204648202D205265637572736F73
      2050726F7072696F730000000000000060664000000000000035400000000000
      001C4020425241444553434F204343202D204372656469746F204175746F6D61
      7469636F0000000000000080664000000000000036400000000000001C402142
      5241444553434F20434349202D204372656469746F204175746F6D617469636F
      00000000000000A0664000000000000037400000000000001C40294252414445
      53434F2052454E41495353414E4345202D204372656469746F204175746F6D61
      7469636F00000000000000C0664000000000000038400000000000001C402D42
      5241444553434F2052454E41495353414E434520434349202D20437265646974
      6F204175746F6D617469636F00000000000000E0664000000000000039400000
      000000001C4024425241444553434F20414E475241202D20204372656469746F
      204175746F6D617469636F000000000000000068400000000000003A40000000
      000000004022427261646573636F204A49524155202D2044E96269746F204175
      746F6DE17469636F000000000000004068400000000000000840000000000040
      584014434546202D205369636F62202D20323033313136000000000000006068
      400000000000000840000000000080584014434546202D205369636F62202D20
      3230333132310000000000000000674000000000000035400000000000000040
      1F427261646573636F204343202D2044E96269746F204175746F6DE17469636F
      0000000000000020674000000000000036400000000000000040204272616465
      73636F20434349202D2044E96269746F204175746F6DE17469636F0000000000
      00004067400000000000003740000000000000004028427261646573636F2052
      454E41495353414E4345202D2044E96269746F204175746F6DE17469636F0000
      0000000000606740000000000000384000000000000000402C42726164657363
      6F2052454E41495353414E434520434349202D2044E96269746F204175746F6D
      E17469636F000000000000008067400000000000003940000000000000004022
      427261646573636F20414E475241202D2044E96269746F204175746F6DE17469
      636F00000000000000A06740000000000000084000000000004054402D434546
      202D205445442D5472616E73666572656E63696120456C6574726F6E69636120
      446973706F6E6976656C00000000000000E06740000000000000084000000000
      008055402C434546202D20456E636F6E74726F20646520436F6E746173202D20
      504741202D205265636562696D656E746F00000000000000C067400000000000
      00084000000000004055402A434546202D20456E636F6E74726F20646520436F
      6E746173202D20504741202D20506167616D656E746F00000000000000206840
      0000000000003A400000000000001C402A425241444553434F204A4952415520
      4343203631343832302D34202D204372656469746F204175746F6D0000000000
      0000806840000000000000084000000000008049400D4341495841202D205349
      4743420014000000000000F03F11446573636F6E746F20656D20466F6C686100
      000000000000000040000000000000084000000000000051401B434546202D20
      426F726465726F2044656269746F20656D20432F430000000000000000084000
      00000000000840000000000000F03F0C434546202D2043686571756500000000
      0000000014400000000000000840000000000000004017434546202D20446562
      69746F204175746F6D617469636F00000000000000001C400000000000000840
      00000000000014400B434546202D205369766174000000000000000020400000
      000000000840000000000000184009434546202D20444F430000000000000000
      224000000000000008400000000000001C4018434546202D204372656469746F
      204175746F6D617469636F000000000000000024400000000000000840000000
      00000020400D434546202D204F6E206C696E6500000000000000002840000000
      00000008400000000000004140165820434546202D204365746970202D20446F
      6320313400000000000000002C40000000000000084000000000000038401443
      4546202D20436F6E76EA6E696F205349434F5600000000000000003040000000
      000000084000000000000038402C434546202D20436F6E76EA6E696F20536963
      6F762037323533202D20466F6C686120456D7072656761646F73000000000000
      00003240000000000000084000000000008048400B434546202D205369636F76
      00000000000000003440000000000000084000000000008049400B434546202D
      205369636F6200000000000000004A4000000000000014400000000000003840
      2B5820434546202D20436C75626520496D6F62696C69E172696F20202D20436F
      6E76656E696F205349434F560000000000000000494000000000000014400000
      000000005140235820434546202D20436C75626520496D6F62696C69E172696F
      202D20426F72646572F400000000000000804A40000000000000144000000000
      0000F03F225820434546202D20436C75626520496D6F62696C69E172696F202D
      2043686571756500000000000000804C4000000000000008400000000000004D
      40145820434546202D20436574697020446F6320313400000000000000804D40
      000000000000F03F0000000000001C401C4242202D204372E96469746F204175
      746F6DE17469636F20494E535300000000000000405140000000000000184000
      0000000000F03F1B53616E74616E64657220202D20436865717565204E6F6D69
      6E616C00000000000000C05140000000000000184000000000000000401D5361
      6E74616E646572202D2044656269746F204175746F6DE17469636F0000000000
      0000005240000000000000184000000000000034401D53616E74616E64657220
      2D20444F43206F7574726F732042616E636F7300000000000000405240000000
      000000184000000000000041401853616E74616E646572202D20434554495020
      2D20444F43200000000000000000534000000000000018400000000000004D40
      1853616E74616E646572202D20436574697020446F6320313400000000000000
      805340000000000000184000000000000018401053616E74616E64657220202D
      20444F430000000000000000544000000000000018400000000000001C401E53
      616E74616E646572202D204372656469746F204175746F6D617469636F000000
      0000000080554000000000000014400000000000001C402E5820434546202D20
      436C75626520496D6F62696C69E172696F202D204372656469746F204175746F
      6DE17469636F00000000000000C0554000000000000014400000000000405240
      225820434546202D20436C75626520496D6F62696C69E172696F202D20436865
      7175650000000000000000564000000000000014400000000000804840215820
      434546202D20436C75626520496D6F62696C69E172696F202D205369636F7600
      00000000000040564000000000000008400000000000C0524028434546202D20
      436F72706F726174652033303130302D31202D2053454D2046494E414E434549
      524F000000000000008056400000000000000840000000000000534032434546
      202D20436F72706F726174652043656E746572202D2030333030303330313030
      2D31202D2053454D2046494E414E4300140000000000C05640135349434F5620
      2D20456D7072E97374696D6F7300000000000000005740000000000000084000
      000000000038402F434546202D20436F6E76EA6E696F205369636F7620343236
      31202D20466F6C68612064652041737369737469646F7300000000000000C057
      40000000000000084000000000000038402F434546202D20436F6E76EA6E696F
      205369636F762036303734202D20466F6C68612064652041737369737469646F
      7300000000000000005840000000000000084000000000000038402C43454620
      2D20436F6E76EA6E696F205369636F762036303437202D20466F6C6861204173
      7369737469646F73000000000000004058400000000000000840000000000000
      38402C434546202D20436F6E76EA6E696F205369636F762036303435202D2046
      6F6C68612041737369737469646F7300140000000000805840285349434F5620
      2D20436F6E76656E696F2036303435202D20466F6C6861204173736973746964
      6F7300000000000000C058400000000000000840000000000000344009434546
      202D20444F430000000000000000594000000000000008400000000000003840
      26434546202D20436F6E76EA6E696F205369636F762036303238202D20456D70
      72657374696D6F000000000000004057400000000000001C400000000000001C
      403242616E636F20497461FA20436F6E74612054657263656972697A61646120
      2D204372E96469746F204175746F6DE17469636F000000000000008059400000
      000000001C4000000000000000403142616E636F20497461FA202D20436F6E74
      612054657263656972697A6164612044E96269746F204175746F6D617469636F
      00000000000000C05940000000000000144000000000000000402D5820434546
      202D20436C75626520496D6F62696C69E172696F202D2044656269746F204175
      746F6D617469636F00000000000000005A400000000000000840000000000080
      4840205369636F76202D20456D7072657374696D6F20436F6E76656E696F2036
      30303200000000000000405A4000000000000008400000000000804840275369
      636F76202D20436F6E747269627569633F6F20466163756C746174697661202D
      203630333400000000000000805A400000000000000840000000000000204029
      436172746120436F6272616EE761202D20436F6E747269627569E7E36F204661
      63756C74617469766100000000000000C05A4000000000000008400000000000
      804940205369636F62202D20436F6E747269627569E7E36F20466163756C7461
      7469766100000000000000005B40000000000000084000000000000038403143
      4546202D20436F6E76EA6E696F205369636F762036303633202D205265736720
      646520436F6E747269627569E7F5657300000000000000405B40000000000000
      084000000000008048401B434546202D205369636F76202D20436F6E76EA6E69
      6F203630373400000000000000805B4000000000000008400000000000002440
      20434546202D204465766F6C75E7E36F20646520436F6E747269627569E7F565
      73}
  end
  object cdsPortadorFormaCAP: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 52
    Top = 194
    Data = {
      3D2000009619E0BD0100000018000000040083000000030000007F000C434F44
      504F5254464F524D4108000400000000000B434F44504F525441444F52080004
      000000000008434F44464F524D4108000400000000000944455343524943414F
      01004900000001000557494454480200020032000100044C4349440400010009
      08000000000000000000C05B4000000000000008400000000000804640294345
      46202D20466F6C68612064652041737369737469646F73202D20457874726174
      6F20534941504900000000000000005C40000000000000084000000000000031
      4029434546202D20466F6C68612064652041737369737469646F73202D20442E
      4C2E452E2D20434149584100000000000000405C400000000000000840000000
      0000002A4022434546202D20466F6C68612064652041737369737469646F7320
      2D204F757472617300000000000000405D400000000000000840000000000000
      53401B434546202D20494D4F42202D2053454D2046494E414E434549524F0000
      0000000000C05C40000000000000204000000000000000402E53616E74616E64
      65722D436F6E746120496E76657374696D656E746F2D44656269746F20417574
      6F6D617469636F00000000000000005D4000000000000020400000000000001C
      402F53616E74616E6465722D436F6E746120496E76657374696D656E746F2D43
      72E96469746F204175746F6DE17469636F00000000000000805D400000000000
      00F03F0000000000001C40314242202D20436F6D65726369616C2053756C2F44
      46202D203432313039352D3620204372656469746F204175746F6D6174000000
      00000000C05D40000000000000224000000000000000401B434546202D204343
      492044E96269746F204175746F6DE17469636F00000000000000005E40000000
      0000000840000000000000264030434546202D20526573676174652064652043
      6F6E747269622E202D20466963686120646520436F6D70656E7361E7E36F0000
      0000000000405E400000000000000840000000000000344023434546202D2052
      65736761746520646520436F6E747269627569E7E36F202D20444F4300000000
      000000805E400000000000000840000000000080494016434546202D20536963
      6F62202D20323420686F72617300000000000000C05E40000000000000084000
      0000000080494016434546202D205369636F62202D20343820686F7261730000
      0000000000005F400000000000000840000000000000204018434546202D204F
      6E206C696E65202D20323420686F72617300000000000000C05F400000000000
      000840000000000000534029434546202D20494D4F42202D2053454D2046494E
      414E43202D20414E4F5320414E544552494F52455300000000000000805F4000
      00000000000840000000000000204018434546202D204F6E206C696E65202D20
      323420686F726173000000000000000060400000000000002640000000000000
      0040225820434546202D205061737369766F7320466572726F62616E202D2045
      525241444F00000000000000206040000000000000264000000000000000402D
      5820434546202D205061737369766F7320466572726F62616E202D2044656269
      746F204175746F6D617469636F00000000000000406040000000000000264000
      00000000000040225820434546202D205061737369766F7320466572726F6261
      6E202D2045525241444F00000000000000606040000000000000264000000000
      00000040225820434546202D205061737369766F7320466572726F62616E202D
      2045525241444F00000000000000806040000000000000264000000000000000
      40225820434546202D205061737369766F7320466572726F62616E202D204552
      5241444F00000000000000A06040000000000000284000000000000000403258
      20434546202D20417272656E64616D656E746F20466572726F62616E202D2020
      44656269746F204175746F6D617469636F00000000000000C060400000000000
      00244000000000000020402243414958412046696E616E6369616D656E746F20
      46475453202D204F6E206C696E6500000000000000E060400000000000002440
      000000000000004021434546202D20464754532046696E616E6369616D656E74
      6F202D2044656269746F00000000000000006140000000000000244000000000
      000000402C434546202D20464754532046696E616E6369616D656E746F202D20
      44656269746F204175746F6DE17469636F000000000000002061400000000000
      0028400000000000002040315820434546202D20417272656E64616D656E746F
      20466572726F62616E202D2020437265642E204175746F6D617469636F000000
      0000000040614000000000000022400000000000001C402F434546202D20436F
      72706F726174652043656E74657220434349202D204372656469746F20417574
      6F6D617469636F00000000000000606140000000000000084000000000000034
      401D434546202D20444F4320466F6C68612064652041737369737469646F7300
      0000000000008061400000000000002E4000000000000055402E53616E74616E
      6465722052656E61697373616E636520434349202D204372E96469746F204175
      746F6DE17469636F00000000000000A061400000000000002C40000000000000
      55402353616E74616E6465722052656E61697373616E63652031332E3030312E
      3336382D322000000000000000C061400000000000002C400000000000000040
      2953616E74616E6465722052656E61697373616E6365202D2044656269746F20
      4175746F6D617469636F00000000000000E06140000000000000084000000000
      004055402B434546202D20436F72706F726174652043656E746572202D20456E
      636F6E74726F20646520436F6E74617300000000000000006240000000000000
      084000000000008055402B434546202D20436F72706F726174652043656E7465
      72202D20456E636F6E74726F20646520436F6E74617300000000000000206240
      0000000000002E4000000000000000402D53616E74616E6465722052656E6169
      7373616E636520434349202D2044656269746F204175746F6DE17469636F0000
      00000000004062400000000000000840000000000000564029434546202D2043
      6F6272616EE76120456C6574726F6E696361202D204F7574726F732043616E61
      6973000000000000006062400000000000000840000000000000564032434546
      202D20436F6272616EE76120456C6574726F6E696361202D20436F6D70656E73
      61E7E36F20456C6574726F6E6963610000000000000080624000000000000008
      4000000000000056402C434546202D20436F6272616EE76120456C6574726F6E
      696361202D204E6F205072F37072696F2042616E636F00000000000000A06240
      0000000000000840000000000000564024434546202D20436F6272616EE76120
      456C6574726F6E696361202D204C6F74657269636100000000000000C0624000
      00000000000840000000000000564031434546202D20436F6272616EE7612045
      6C6574726F6E696361202D20436F6D70656E732E20436F6E76656E63696F6E61
      6C00000000000000E06240000000000000084000000000000056402743454620
      2D20436F6272616EE76120456C6574726F6E696361202D20456D20436172746F
      72696F00000000000000006340000000000000084000000000000056402D4345
      46202D20436F6272616EE76120456C6574726F6E696361202D20436F72726573
      702E2042616E636172696F000000000000002063400000000000000840000000
      0000C0554027434546202D20436F6272616EE76120456C6574726F6E69636120
      2D204348204C6F74657269636100000000000000406340000000000000084000
      00000000C055402C434546202D20436F6272616EE76120456C6574726F6E6963
      61204348202D204F7574726F732043616E616973000000000000006063400000
      0000000008400000000000C0554030434546202D20436F6272616EE76120456C
      6574726F6E696361204348202D20436F72726573702E2042616E636172696F00
      00000000000080634000000000000008400000000000C0554031434546202D20
      436F6272616EE76120456C6574726F6E696361204348202D20436F6D702E2043
      6F6E76656E63696F6E616C00000000000000A063400000000000000840000000
      0000C055402F434546202D20436F6272616EE76120456C6574726F6E69636120
      4348202D20436F6D702E20456C6574726F6E69636100000000000000C0634000
      000000000008400000000000C055402A434546202D20436F6272616EE7612045
      6C6574726F6E696361204348202D20456D20436172746F72696F000000000000
      00E0634000000000000008400000000000C055402F434546202D20436F627261
      6EE76120456C6574726F6E696361204348202D204E6F2050726F7072696F2042
      616E636F00000000000000006440000000000000084000000000008049401743
      4546202D205369636F6220456D7072E97374696D6F7300000000000000206440
      000000000000204000000000004055402842616E636F2053616E74616E646572
      2D434349202D20456E636F6E74726F20646520436F6E74617300000000000000
      406440000000000000184000000000004055402542616E636F2053616E74616E
      64657220202D20456E636F6E74726F20646520436F6E74617300000000000000
      606440000000000000184000000000008055402442616E636F2053616E74616E
      646572202D20456E636F6E74726F20646520436F6E7461730000000000000080
      6440000000000000204000000000008055402842616E636F2053616E74616E64
      657220434349202D20456E636F6E74726F20646520436F6E7461730000000000
      0000A06440000000000000F03F00000000000000402E42616E636F20646F2042
      726173696C202D203432313039352D36202D2044656269746F204175746F6D61
      7469636F00000000000000C06440000000000000F03F0000000000001C402442
      616E636F20646F2042726173696C202D204372656469746F204175746F6D6174
      69636F00000000000000E06440000000000000304000000000000000402B4345
      46202D20426C6F717565696F204A7564696369616C202D2044E96269746F2061
      75746F6DE17469636F0000000000000000654000000000000030400000000000
      001C4031434546202D20436F72706F7261746520426C6F712E204A7564696369
      616C202D204372E9642E204175746F6D617469636F0000000000000020654000
      0000000000324000000000000000403053616E74616E64657220416E67726120
      31332E3030322E3235342D39202D2044656269746F204175746F6D617469636F
      00000000000000406540000000000000334000000000000000402F53616E7461
      6E646572204361626F2031332E3030322E3235352D36202D2044656269746F20
      4175746F6D617469636F00000000000000606540000000000000324000000000
      004056401C53616E74616E64657220416E6772612031332E3030322E3235342D
      3900000000000000806540000000000000334000000000008056401B53616E74
      616E646572204361626F2031332E3030322E3235352D3600000000000000A065
      40000000000000084000000000000057400E434546202D20436F6E74E162696C
      00000000000000C0654000000000000008400000000000C0564010434546202D
      20456D20457370E963696500000000000000E065400000000000000840000000
      000080574032434546202D20436F72706F726174652043656E7465722D46696E
      616E632E2048616269746163696F6E616C202D20464754530000000000000000
      664000000000000008400000000000C057402C434546202D20436F72706F7261
      74652046696E616E632E2048616269746163202D20456D7072E97374696D6F00
      000000000000206640000000000000084000000000004057402F434546202D20
      436F72706F726174652043656E746572202D204648202D205265637572736F73
      2050726F7072696F730000000000000060664000000000000035400000000000
      001C4020425241444553434F204343202D204372656469746F204175746F6D61
      7469636F0000000000000080664000000000000036400000000000001C402142
      5241444553434F20434349202D204372656469746F204175746F6D617469636F
      00000000000000A0664000000000000037400000000000001C40294252414445
      53434F2052454E41495353414E4345202D204372656469746F204175746F6D61
      7469636F00000000000000C0664000000000000038400000000000001C402D42
      5241444553434F2052454E41495353414E434520434349202D20437265646974
      6F204175746F6D617469636F00000000000000E0664000000000000039400000
      000000001C4024425241444553434F20414E475241202D20204372656469746F
      204175746F6D617469636F000000000000000068400000000000003A40000000
      000000004022427261646573636F204A49524155202D2044E96269746F204175
      746F6DE17469636F000000000000004068400000000000000840000000000040
      584014434546202D205369636F62202D20323033313136000000000000006068
      400000000000000840000000000080584014434546202D205369636F62202D20
      3230333132310000000000000000674000000000000035400000000000000040
      1F427261646573636F204343202D2044E96269746F204175746F6DE17469636F
      0000000000000020674000000000000036400000000000000040204272616465
      73636F20434349202D2044E96269746F204175746F6DE17469636F0000000000
      00004067400000000000003740000000000000004028427261646573636F2052
      454E41495353414E4345202D2044E96269746F204175746F6DE17469636F0000
      0000000000606740000000000000384000000000000000402C42726164657363
      6F2052454E41495353414E434520434349202D2044E96269746F204175746F6D
      E17469636F000000000000008067400000000000003940000000000000004022
      427261646573636F20414E475241202D2044E96269746F204175746F6DE17469
      636F00000000000000A06740000000000000084000000000004054402D434546
      202D205445442D5472616E73666572656E63696120456C6574726F6E69636120
      446973706F6E6976656C00000000000000E06740000000000000084000000000
      008055402C434546202D20456E636F6E74726F20646520436F6E746173202D20
      504741202D205265636562696D656E746F00000000000000C067400000000000
      00084000000000004055402A434546202D20456E636F6E74726F20646520436F
      6E746173202D20504741202D20506167616D656E746F00000000000000206840
      0000000000003A400000000000001C402A425241444553434F204A4952415520
      4343203631343832302D34202D204372656469746F204175746F6D0000000000
      0000806840000000000000084000000000008049400D4341495841202D205349
      4743420014000000000000F03F11446573636F6E746F20656D20466F6C686100
      000000000000000040000000000000084000000000000051401B434546202D20
      426F726465726F2044656269746F20656D20432F430000000000000000084000
      00000000000840000000000000F03F0C434546202D2043686571756500000000
      0000000014400000000000000840000000000000004017434546202D20446562
      69746F204175746F6D617469636F00000000000000001C400000000000000840
      00000000000014400B434546202D205369766174000000000000000020400000
      000000000840000000000000184009434546202D20444F430000000000000000
      224000000000000008400000000000001C4018434546202D204372656469746F
      204175746F6D617469636F000000000000000024400000000000000840000000
      00000020400D434546202D204F6E206C696E6500000000000000002840000000
      00000008400000000000004140165820434546202D204365746970202D20446F
      6320313400000000000000002C40000000000000084000000000000038401443
      4546202D20436F6E76EA6E696F205349434F5600000000000000003040000000
      000000084000000000000038402C434546202D20436F6E76EA6E696F20536963
      6F762037323533202D20466F6C686120456D7072656761646F73000000000000
      00003240000000000000084000000000008048400B434546202D205369636F76
      00000000000000003440000000000000084000000000008049400B434546202D
      205369636F6200000000000000004A4000000000000014400000000000003840
      2B5820434546202D20436C75626520496D6F62696C69E172696F20202D20436F
      6E76656E696F205349434F560000000000000000494000000000000014400000
      000000005140235820434546202D20436C75626520496D6F62696C69E172696F
      202D20426F72646572F400000000000000804A40000000000000144000000000
      0000F03F225820434546202D20436C75626520496D6F62696C69E172696F202D
      2043686571756500000000000000804C4000000000000008400000000000004D
      40145820434546202D20436574697020446F6320313400000000000000804D40
      000000000000F03F0000000000001C401C4242202D204372E96469746F204175
      746F6DE17469636F20494E535300000000000000405140000000000000184000
      0000000000F03F1B53616E74616E64657220202D20436865717565204E6F6D69
      6E616C00000000000000C05140000000000000184000000000000000401D5361
      6E74616E646572202D2044656269746F204175746F6DE17469636F0000000000
      0000005240000000000000184000000000000034401D53616E74616E64657220
      2D20444F43206F7574726F732042616E636F7300000000000000405240000000
      000000184000000000000041401853616E74616E646572202D20434554495020
      2D20444F43200000000000000000534000000000000018400000000000004D40
      1853616E74616E646572202D20436574697020446F6320313400000000000000
      805340000000000000184000000000000018401053616E74616E64657220202D
      20444F430000000000000000544000000000000018400000000000001C401E53
      616E74616E646572202D204372656469746F204175746F6D617469636F000000
      0000000080554000000000000014400000000000001C402E5820434546202D20
      436C75626520496D6F62696C69E172696F202D204372656469746F204175746F
      6DE17469636F00000000000000C0554000000000000014400000000000405240
      225820434546202D20436C75626520496D6F62696C69E172696F202D20436865
      7175650000000000000000564000000000000014400000000000804840215820
      434546202D20436C75626520496D6F62696C69E172696F202D205369636F7600
      00000000000040564000000000000008400000000000C0524028434546202D20
      436F72706F726174652033303130302D31202D2053454D2046494E414E434549
      524F000000000000008056400000000000000840000000000000534032434546
      202D20436F72706F726174652043656E746572202D2030333030303330313030
      2D31202D2053454D2046494E414E4300140000000000C05640135349434F5620
      2D20456D7072E97374696D6F7300000000000000005740000000000000084000
      000000000038402F434546202D20436F6E76EA6E696F205369636F7620343236
      31202D20466F6C68612064652041737369737469646F7300000000000000C057
      40000000000000084000000000000038402F434546202D20436F6E76EA6E696F
      205369636F762036303734202D20466F6C68612064652041737369737469646F
      7300000000000000005840000000000000084000000000000038402C43454620
      2D20436F6E76EA6E696F205369636F762036303437202D20466F6C6861204173
      7369737469646F73000000000000004058400000000000000840000000000000
      38402C434546202D20436F6E76EA6E696F205369636F762036303435202D2046
      6F6C68612041737369737469646F7300140000000000805840285349434F5620
      2D20436F6E76656E696F2036303435202D20466F6C6861204173736973746964
      6F7300000000000000C058400000000000000840000000000000344009434546
      202D20444F430000000000000000594000000000000008400000000000003840
      26434546202D20436F6E76EA6E696F205369636F762036303238202D20456D70
      72657374696D6F000000000000004057400000000000001C400000000000001C
      403242616E636F20497461FA20436F6E74612054657263656972697A61646120
      2D204372E96469746F204175746F6DE17469636F000000000000008059400000
      000000001C4000000000000000403142616E636F20497461FA202D20436F6E74
      612054657263656972697A6164612044E96269746F204175746F6D617469636F
      00000000000000C05940000000000000144000000000000000402D5820434546
      202D20436C75626520496D6F62696C69E172696F202D2044656269746F204175
      746F6D617469636F00000000000000005A400000000000000840000000000080
      4840205369636F76202D20456D7072657374696D6F20436F6E76656E696F2036
      30303200000000000000405A4000000000000008400000000000804840275369
      636F76202D20436F6E747269627569633F6F20466163756C746174697661202D
      203630333400000000000000805A400000000000000840000000000000204029
      436172746120436F6272616EE761202D20436F6E747269627569E7E36F204661
      63756C74617469766100000000000000C05A4000000000000008400000000000
      804940205369636F62202D20436F6E747269627569E7E36F20466163756C7461
      7469766100000000000000005B40000000000000084000000000000038403143
      4546202D20436F6E76EA6E696F205369636F762036303633202D205265736720
      646520436F6E747269627569E7F5657300000000000000405B40000000000000
      084000000000008048401B434546202D205369636F76202D20436F6E76EA6E69
      6F203630373400000000000000805B4000000000000008400000000000002440
      20434546202D204465766F6C75E7E36F20646520436F6E747269627569E7F565
      73}
  end
  object qryPortadorCAP: TCMSqlParams
    SQL.Strings = (
      '  select codportforma, codportador, codforma, descricao '
      '  from '
      '    portadorforma ')
    ClientDataSet = cdsPortadorFormaCAP
    Left = 164
    Top = 193
  end
  object qryPlanoPrevCTB: TCMSqlParams
    SQL.Strings = (
      'select'
      '  ppc.IDPLANOPREV, ppc.NOME, ppcp.IDPATRO'
      'from'
      '  PLANPREVCONTABIL ppc,'
      '  PLANPREVCONTABPATRO ppcp'
      'where'
      '  ppc.IDPLANOPREV = ppcp.IDPLANOPREV'
      '  and ppc.ATIVO = '#39'S'#39)
    ClientDataSet = cdsPlanoPrevidenciario
    Left = 391
    Top = 464
  end
  object qryPatrocinadora: TCMSqlParams
    SQL.Strings = (
      ' SELECT '
      '  PA.IDPESSOA, P.NOME'
      ' FROM'
      '  PESSOA P, PATRO PA'
      ' WHERE'
      '  (PA.IDPESSOA = P.IDPESSOA)'
      'ORDER BY'
      '  P.NOME')
    ClientDataSet = cdsPatrocinadora
    Left = 116
    Top = 477
  end
  object dsPatrocinadora: TwwDataSource
    AutoEdit = False
    DataSet = cdsPatrocinadora
    Left = 94
    Top = 409
  end
  object qryTipoDesemb: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      
        '        CODTIPRECDES, DESCRICAO, PLACONTACREDITO, PLANO, PLACONT' +
        'A,  '
      '        DECODE(RECPAG,'#39'P'#39','#39'Pagar'#39','#39'Receber'#39') AS RECPAG  '
      '      FROM  '
      '        TIPORECEBDESEMB  '
      '      WHERE  '
      '        (NVL(ATIVO,'#39'S'#39') <> '#39'N'#39') AND  '
      '        (RECPAG   = '#39'P'#39') AND'
      '        (ANASINT  = '#39'A'#39') AND  '
      '        (IDPESSOA = 1)'
      '      ORDER BY  '
      '        DESCRICAO')
    ClientDataSet = cdsTipoDesemb
    Left = 146
    Top = 283
  end
  object qryTipoReceb: TCMSqlParams
    SQL.Strings = (
      '  SELECT  '
      
        '        CODTIPRECDES, DESCRICAO, PLACONTACREDITO, PLANO, PLACONT' +
        'A,  '
      '        DECODE(RECPAG,'#39'P'#39','#39'Pagar'#39','#39'Receber'#39') AS RECPAG  '
      '      FROM  '
      '        TIPORECEBDESEMB  '
      '      WHERE  '
      '        (NVL(ATIVO,'#39'S'#39') <> '#39'N'#39') AND  '
      '        (RECPAG   = '#39'R'#39') AND'
      '        (ANASINT  = '#39'A'#39') AND  '
      '        (IDPESSOA = 1)'
      '      ORDER BY  '
      '        DESCRICAO')
    ClientDataSet = cdsTipoReceb
    Left = 476
    Top = 258
  end
  object qryPortadorCAR: TCMSqlParams
    SQL.Strings = (
      '  select codportforma, codportador, codforma, descricao '
      '  from '
      '    portadorforma ')
    ClientDataSet = cdsPortadorFormaCAR
    Left = 466
    Top = 189
  end
end
