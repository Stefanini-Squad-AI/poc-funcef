inherited frmExecRecebimentoNovo: TfrmExecRecebimentoNovo
  Left = 121
  Top = 43
  ClientHeight = 417
  ClientWidth = 632
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 632
    Height = 384
    inherited pgcControle: TPageControl
      Width = 632
      Height = 351
      inherited TabSheet1: TTabSheet
        Caption = 'Seleção'
        object Label1: TLabel
          Left = 16
          Top = 90
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label3: TLabel
          Left = 320
          Top = 90
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        inline molMutuario: TmolMutuario
          Left = 8
          Top = 8
          Width = 609
          inherited btnBuscaPart: TBitBtn
            Left = 552
          end
          inherited btnLimpaPart: TBitBtn
            Left = 576
          end
          inherited edtNome: TEdit
            Width = 353
          end
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 48
          Width = 609
          TabOrder = 1
          inherited edtNome: TEdit
            Width = 369
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 104
          Width = 289
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
          LookupField = 'IDTIPOEMPTMO'
          ParentFont = False
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 320
          Top = 104
          Width = 289
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContrato
          LookupField = 'IDTIPOCONTREMPTMO'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 128
          Height = 177
          TabOrder = 4
          inherited Label6: TLabel
            Width = 94
          end
          inherited lstPatro: TCheckListBox
            Height = 153
          end
          inherited btnInvertePatro: TBitBtn
            OnClick = molListaPatrobtnInvertePatroClick
          end
          inherited btnMarcaTodosPatro: TBitBtn
            OnClick = molListaPatrobtnMarcaTodosPatroClick
          end
        end
        object grpRecebimento: TGroupBox
          Left = 320
          Top = 130
          Width = 289
          Height = 103
          Caption = ' Receber '
          TabOrder = 5
          object chkFolhaPatro: TCheckBox
            Left = 16
            Top = 16
            Width = 193
            Height = 17
            Caption = 'Folha da(s) Patrocinadora(s)'
            TabOrder = 0
          end
          object chkFolhaBenef: TCheckBox
            Left = 16
            Top = 36
            Width = 193
            Height = 17
            Caption = 'Folha de Benefícios'
            TabOrder = 1
          end
          object chkCaP: TCheckBox
            Left = 16
            Top = 57
            Width = 177
            Height = 17
            Caption = 'Financeiro (a Pagar)'
            TabOrder = 2
          end
          object chkCaR: TCheckBox
            Left = 16
            Top = 78
            Width = 177
            Height = 17
            Caption = 'Financeiro (a Receber)'
            TabOrder = 3
          end
        end
        object Panel2: TPanel
          Left = 320
          Top = 240
          Width = 289
          Height = 57
          TabOrder = 6
          object Label15: TLabel
            Left = 40
            Top = 8
            Width = 165
            Height = 13
            Caption = 'Débitos / Créditos (mês/ano)'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 192
            Top = 22
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2500
            MinValue = 1850
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMes: TComboBox
            Left = 40
            Top = 22
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
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
          end
        end
        object chkDiverg: TCheckBox
          Left = 24
          Top = 312
          Width = 249
          Height = 17
          Caption = 'NÃO receber itens divergentes (Folha)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 7
          Visible = False
        end
      end
      inherited TabSheet2: TTabSheet
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 593
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Resultado'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 593
          Height = 279
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 1
        end
      end
    end
    inherited Panel1: TPanel
      Width = 632
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 632
    inherited tb97Fundo: TToolbar97
      Left = 460
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 166
      inherited ToolbarSep973: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    Top = 11
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.IDCONTRATOEMPTMO,'
      '   HME.IDITEMEMPTMO,'
      ''
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '   HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA,'
      ''
      '   HME.HMETIPOMOV, HME.HMEORIGEM,'
      '   HME.HMERECPAG, HME.HMEFORMACOBRANCA, HME.HMESEQCOBRANCA,'
      ''
      '   HME.IDRUBRICA, HME.HMEPRIORIDADE,'
      ''
      
        '   HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMETXJUROS, HME.IDR' +
        'EGRA,'
      ''
      '   HME.HMEPARCELA, HME.HMENUMPARCELAS,'
      '   HME.HMECENTRALIZA, HME.HMEDESTACADO, HME.IDITEMCENTRALIZA,'
      ''
      
        '   ROUND(NVL(HME.HMEVLRPREVISTO, 0), 2) AS HMEVLRPREVISTO, HME.H' +
        'MEVLREFETIVO,'
      '   HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEDATAEFETIVA,'
      ''
      '   HME.FLGBAIXADO,'
      '   HME.FLGDIVERGPEND,'
      '   HME.FLGBAIXAMANUAL,'
      '   HME.FLGESTORNADO,'
      '   HME.FLGQUITADO,'
      '   HME.FLGABONADO'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME'
      ''
      'WHERE'
      '       ( HME.IDHISTMOVEMPTMO     =:PIDHISTMOVEMPTMO )'
      '   AND ( HME.IDCONTRATOEMPTMO    =:PIDCONTRATOEMPTMO )'
      ''
      
        '   AND ( ( HME.HMECENTRALIZA     = 1 ) OR ( HME.HMEDESTACADO = 1' +
        ' ) )'
      '   AND ( HME.HMETIPOMOV          <> 5 )'
      ''
      
        '   AND ( ( HME.FLGESTORNADO      IS NULL ) OR ( HME.FLGESTORNADO' +
        ' = 0 ) )'
      
        '   AND ( ( HME.FLGQUITADO        IS NULL ) OR ( HME.FLGQUITADO =' +
        ' 0 ) )'
      
        '   AND ( ( HME.FLGABONADO        IS NULL ) OR ( HME.FLGABONADO =' +
        ' 0 ) )')
    ValidateWithMask = True
    Left = 56
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryHistMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryHistMovHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryHistMovHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryHistMovHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryHistMovHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryHistMovHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryHistMovHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryHistMovHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryHistMovIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryHistMovHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryHistMovFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryHistMovFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryHistMovFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryHistMovFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryHistMovFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryHistMovFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
  end
  object qryTmpDesc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   TMP.MESREFERENCIA     , TMP.CODALTERADOR      , TMP.PLNCODIGO' +
        'PREV     , TMP.CODTIPRECDES      ,'
      
        '   TMP.CODSUBCONTA       , TMP.RECPAG            , TMP.IDEMPRESA' +
        'PROP     , TMP.CODTIPDOC         ,'
      
        '   TMP.PLACONTAD         , TMP.PLANO             , TMP.PLACONTAC' +
        '         , TMP.IDPESSOA          ,'
      
        '   TMP.CODDOCUMENTOPREV  , TMP.FLGTIPODESC       , TMP.CODPORTFO' +
        'RMA      , TMP.VALOR             ,'
      
        '   TMP.IDTITULAR         , TMP.IDPLANASS         , TMP.IDDESCONT' +
        'O        , TMP.UNIDNEGOC         ,'
      
        '   TMP.IDMOTIVO          , TMP.DATARECEBIMENTO   , TMP.CODCENTRO' +
        'RESPON   , TMP.MESCOBRANCA       ,'
      
        '   TMP.CODCENTROCUSTOD   , TMP.IDPESSJUR         , TMP.IDPROVENT' +
        'O        , TMP.CODCENTROCUSTOC   ,'
      
        '   TMP.IDPLANOPREV       , TMP.IDEMPRESA         , TMP.VALORRECE' +
        'BIDO     , TMP.NUMPRIORIDADE     ,'
      
        '   TMP.ORDEM             , TMP.MATRICULA         , TMP.INSCRICAO' +
        'NUMERO   , TMP.VALORBASE1        ,'
      
        '   TMP.VALORBASE2        , TMP.VALORBASE3        , TMP.FLGDESCON' +
        'TO       , TMP.CODRETORNO        ,'
      
        '   TMP.NUMDEPENDSEGURO   , TMP.CODPROVDESC       , TMP.FLGDESCFO' +
        'LHA      , TMP.DATAREFERENCIA    ,'
      
        '   TMP.DESCRICAO         , TMP.REFERENCIA        , TMP.FLGFORNPA' +
        'G        , TMP.FLGFORNCOMISS     ,'
      
        '   TMP.IDFUNDACAO        , TMP.CODDOCUMENTOEFET  , TMP.PLNCODIGO' +
        'EFET     , TMP.SISTORIGEM        ,'
      
        '   TMP.FLGALTERADOR      , TMP.PERIODO           , TMP.EXERCICIO' +
        '         , TMP.FLGATRASODEVOL    ,'
      
        '   TMP.DATACOBRANCA      , TMP.NODOCUMENTO       , TMP.COMPLDOCU' +
        'MENTO    , TMP.IDFAVORECIDO      ,'
      
        '   TMP.IDLOTE            , TMP.IDEMPCOBRANCA     , TMP.TIPCODIGO' +
        '         , TMP.SITENVIO          ,'
      
        '   TMP.SEQPROPOSTA       , TMP.FLGEXISTEHST      , TMP.NUMLANCTO' +
        '         , TMP.TRGDTINCLUSAO     ,'
      
        '   TMP.TRGUSERINCLUSAO   , TMP.LOTEPREVIA        , TMP.FONTEPAGA' +
        'DORA     , TMP.FLGINTEVENTO      ,'
      
        '   TMP.IDMODULO          , TMP.VALORINFO         , TMP.PARCELARU' +
        'B        , TMP.PRAZORUB          ,'
      '   TMP.IDPLANPREVCONTAB  , TMP.IDREGRACALCULO,'
      ''
      '   CON.FLGSITUACAO,'
      '   CON.IDTIPOCONTREMPTMO'
      ''
      'FROM'
      '   TMPDESC        TMP,'
      '   VWCONTRATOEP   CON'
      ''
      'WHERE'
      '       TMP.IDEMPRESAPROP      =:PIDEMPRESAPROP'
      '   AND TMP.IDMODULO           IN (15, 32)'
      '   AND TMP.SITENVIO           IN ('#39'1'#39', '#39'2'#39', '#39'X'#39')'
      '   AND TMP.FLGTIPODESC        = '#39'E'#39
      '   AND RTRIM(TMP.MESCOBRANCA) =:PMESCOBRANCA'
      '   AND TMP.IDPESSJUR          =:PIDPESSJUR'
      ''
      '   AND ( (:PFLGDESCFOLHA      IS NULL)'
      '         OR (:PFLGDESCFOLHA   = 1 AND TMP.FLGDESCFOLHA = '#39'P'#39')'
      '         OR (:PFLGDESCFOLHA   = 2 AND TMP.FLGDESCFOLHA = '#39'B'#39')'
      '       )'
      ''
      
        '   AND ( (:PSITENVIO          IS NULL) OR ((:PSITENVIO = 2) AND ' +
        '(TMP.VALOR = TMP.VALORRECEBIDO)) )'
      ''
      
        '   AND ( (:PIDTIPOEMPTMO      IS NULL) OR (CON.IDTIPOEMPTMO     ' +
        '  =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (CON.IDTIPOCONTREMPTMO' +
        '  =:PIDTIPOCONTREMPTMO) )'
      ''
      
        '   AND ( (:PIDPESSOA          IS NULL) OR (TMP.IDPESSOA  =:PIDPE' +
        'SSOA) )'
      
        '   AND ( (:PIDDESCONTO        IS NULL) OR ((TMP.IDDESCONTO =:PID' +
        'DESCONTO) AND (CON.IDCONTRATOEMPTMO =:PIDDESCONTO)) )'
      ''
      '   AND TMP.VALORRECEBIDO      IS NOT NULL'
      ''
      '   AND TMP.IDDESCONTO         = CON.IDCONTRATOEMPTMO'
      ''
      'ORDER BY'
      '   TMP.IDDESCONTO, TMP.MESREFERENCIA, TMP.IDPROVENTO')
    ValidateWithMask = True
    Left = 56
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end>
    object qryTmpDescMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object qryTmpDescPLNCODIGOPREV: TFloatField
      FieldName = 'PLNCODIGOPREV'
    end
    object qryTmpDescCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryTmpDescCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryTmpDescRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryTmpDescCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryTmpDescPLACONTAD: TStringField
      FieldName = 'PLACONTAD'
      FixedChar = True
      Size = 18
    end
    object qryTmpDescPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryTmpDescPLACONTAC: TStringField
      FieldName = 'PLACONTAC'
      FixedChar = True
      Size = 18
    end
    object qryTmpDescIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryTmpDescCODDOCUMENTOPREV: TFloatField
      FieldName = 'CODDOCUMENTOPREV'
    end
    object qryTmpDescFLGTIPODESC: TStringField
      FieldName = 'FLGTIPODESC'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryTmpDescVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryTmpDescIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryTmpDescIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
    end
    object qryTmpDescIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryTmpDescUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryTmpDescIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
    end
    object qryTmpDescDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
    end
    object qryTmpDescCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryTmpDescMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescCODCENTROCUSTOD: TStringField
      FieldName = 'CODCENTROCUSTOD'
      FixedChar = True
      Size = 10
    end
    object qryTmpDescIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryTmpDescIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryTmpDescCODCENTROCUSTOC: TStringField
      FieldName = 'CODCENTROCUSTOC'
      FixedChar = True
      Size = 10
    end
    object qryTmpDescIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryTmpDescIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryTmpDescVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
    end
    object qryTmpDescNUMPRIORIDADE: TFloatField
      FieldName = 'NUMPRIORIDADE'
    end
    object qryTmpDescORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object qryTmpDescMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryTmpDescINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryTmpDescVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryTmpDescVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
    end
    object qryTmpDescVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
    end
    object qryTmpDescFLGDESCONTO: TFloatField
      FieldName = 'FLGDESCONTO'
    end
    object qryTmpDescCODRETORNO: TStringField
      FieldName = 'CODRETORNO'
      FixedChar = True
      Size = 2
    end
    object qryTmpDescNUMDEPENDSEGURO: TStringField
      FieldName = 'NUMDEPENDSEGURO'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryTmpDescFLGDESCFOLHA: TStringField
      FieldName = 'FLGDESCFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
    end
    object qryTmpDescDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object qryTmpDescREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object qryTmpDescFLGFORNPAG: TFloatField
      FieldName = 'FLGFORNPAG'
    end
    object qryTmpDescFLGFORNCOMISS: TFloatField
      FieldName = 'FLGFORNCOMISS'
    end
    object qryTmpDescIDFUNDACAO: TFloatField
      FieldName = 'IDFUNDACAO'
    end
    object qryTmpDescCODDOCUMENTOEFET: TFloatField
      FieldName = 'CODDOCUMENTOEFET'
    end
    object qryTmpDescPLNCODIGOEFET: TFloatField
      FieldName = 'PLNCODIGOEFET'
    end
    object qryTmpDescSISTORIGEM: TStringField
      FieldName = 'SISTORIGEM'
      FixedChar = True
      Size = 2
    end
    object qryTmpDescFLGALTERADOR: TStringField
      FieldName = 'FLGALTERADOR'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescPERIODO: TFloatField
      FieldName = 'PERIODO'
    end
    object qryTmpDescEXERCICIO: TFloatField
      FieldName = 'EXERCICIO'
    end
    object qryTmpDescFLGATRASODEVOL: TStringField
      FieldName = 'FLGATRASODEVOL'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescDATACOBRANCA: TDateTimeField
      FieldName = 'DATACOBRANCA'
    end
    object qryTmpDescNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryTmpDescCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryTmpDescIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
    end
    object qryTmpDescIDLOTE: TFloatField
      FieldName = 'IDLOTE'
    end
    object qryTmpDescIDEMPCOBRANCA: TFloatField
      FieldName = 'IDEMPCOBRANCA'
    end
    object qryTmpDescTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      FixedChar = True
      Size = 2
    end
    object qryTmpDescSITENVIO: TStringField
      FieldName = 'SITENVIO'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryTmpDescFLGEXISTEHST: TFloatField
      FieldName = 'FLGEXISTEHST'
    end
    object qryTmpDescNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
    end
    object qryTmpDescTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryTmpDescTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryTmpDescLOTEPREVIA: TFloatField
      FieldName = 'LOTEPREVIA'
    end
    object qryTmpDescFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
    end
    object qryTmpDescFLGINTEVENTO: TStringField
      FieldName = 'FLGINTEVENTO'
      FixedChar = True
      Size = 2
    end
    object qryTmpDescIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryTmpDescVALORINFO: TFloatField
      FieldName = 'VALORINFO'
    end
    object qryTmpDescPARCELARUB: TFloatField
      FieldName = 'PARCELARUB'
    end
    object qryTmpDescPRAZORUB: TFloatField
      FieldName = 'PRAZORUB'
    end
    object qryTmpDescIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
    object qryTmpDescIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
    end
    object qryTmpDescFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
  end
  object qryItensCaPCaR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDCONTRATOEMPTMO, HME.CODDOCUMENTO,'
      
        '   ROUND(SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))), 2) AS VLR_PREVIST' +
        'O_DOC,'
      '   HME.HMEDATAVENCTO'
      'FROM'
      '   VW_MOVEP     HME,'
      '   DOCUMENTO    DOC,'
      '   VWCONTRATOEP CON'
      ''
      'WHERE'
      '       ( CON.IDEMPRESAPROP    =:PIDEMPRESAPROP )'
      '   AND ( CON.IDPATRO          =:IDPATRO )'
      ''
      '   AND ( HME.HMERECPAG        =:PHMERECPAG )'
      '   AND ( DOC.STATUS           = '#39'2'#39')'
      ''
      '   AND ( HME.HMEANOCOBRANCA   =:PHMEANOCOBRANCA )'
      '   AND ( HME.HMEMESCOBRANCA   =:PHMEMESCOBRANCA )'
      ''
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.EVENTO           <> 5 )'
      ''
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      ''
      
        '   AND ( (HME.HMECENTRALIZA   = 1)     OR ( HME.HMEDESTACADO    ' +
        '  = 1 ) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR ( HME.FLGESTORNADO    ' +
        '  = 0 ) )'
      
        '   AND ( (HME.FLGQUITADO      IS NULL) OR ( HME.FLGQUITADO      ' +
        '  = 0 ) )'
      
        '   AND ( (HME.FLGABONADO      IS NULL) OR ( HME.FLGABONADO      ' +
        '  = 0 ) )'
      ''
      
        '   AND ( (:PIDTIPOEMPTMO      IS NULL) OR (CON.IDTIPOEMPTMO     ' +
        '  =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (CON.IDTIPOCONTREMPTMO' +
        '  =:PIDTIPOCONTREMPTMO) )'
      ''
      
        '   AND ( (:PIDBENEF           IS NULL) OR (CON.IDBENEF          ' +
        '  =:PIDBENEF) )'
      
        '   AND ( (:PIDCONTRATOEMPTMO  IS NULL) OR (CON.IDCONTRATOEMPTMO ' +
        '  =:PIDCONTRATOEMPTMO) )'
      ''
      '   AND ( HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO )'
      '   AND ( HME.CODDOCUMENTO     = DOC.CODDOCUMENTO )'
      ''
      'GROUP BY'
      '   HME.IDCONTRATOEMPTMO, HME.CODDOCUMENTO, HME.HMEDATAVENCTO')
    ValidateWithMask = True
    Left = 144
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMERECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryItensCaPCaRVLR_PREVISTO_DOC: TFloatField
      FieldName = 'VLR_PREVISTO_DOC'
    end
    object qryItensCaPCaRIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensCaPCaRCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryItensCaPCaRHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
  end
  object qryContratosGeracao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOEMPTMO,'
      ''
      '   C.IDCONTRQUITACAO, TC.IDTIPOEMPTMO,'
      '   C.IDINSCRICAOEMPTMO, C.IDTIPOCONTREMPTMO,'
      ''
      '   C.IDPATRO, C.IDPLANOPREV, C.IDVERBA,'
      '   C.IDPESSOA, C.IDBENEF,'
      ''
      '   C.FLGSITUACAO, C.FLGFORMAREC, C.FLGFORMAPAG,'
      '   C.CODFORMAPAG, C.PORTFORMAREC, C.PORTFORMAPAG,'
      '   C.IDCBANCARIA,'
      ''
      '   C.DATAASSINATURA, C.DATASITUACAO,'
      '   C.DATACREDITO, C.DATAPRIMPARC,'
      '   C.DATACANC,'
      ''
      '   C.MOECODIGO, M.MOESIGLA,'
      ''
      '   C.VLRCONTRATO, C.VLRPARCELA, C.TXJUROS,'
      ''
      '   ULT.HMENUMPARCELAS,'
      '   ULT.HMEPARCELA,'
      ''
      '   TC.IDREGRAJURCONC,'
      '   TC.IDREGRALIMITES,'
      '   TC.IDREGRASUSPCOBR,'
      '   TC.IDREGRASLDDIA,'
      '   TC.IDREGRAJURANTCONC,'
      '   TC.IDREGRAELEG,'
      '   TC.IDREGRARESERVA,'
      '   TC.IDREGRAMARGEM,'
      '   TC.IDREGRAPRAZOSCONC,'
      ''
      '   I.DATAINSC,'
      '   ULT.DATAULTATUALIZA'
      ''
      'FROM'
      '   INSCRICAOEMPTMO I,'
      '   CONTRATOEMPTMO  C,'
      '   MOEDA           M,'
      '   TIPOCONTREMPTMO TC,'
      '   TIPOEMPTMO      TE,'
      ''
      '   ('
      '    SELECT'
      '      IDCONTRATOEMPTMO,'
      '      HMEPARCELA,'
      '      HMENUMPARCELAS,'
      '      MAX(HMEDATAATUALIZA) AS DATAULTATUALIZA'
      '    FROM'
      '      HISTMOVEMPTMO'
      '    WHERE'
      '      (HMEDATAATUALIZA < TO_DATE('#39'01/11/2001'#39','#39'dd/mm/yyyy'#39') )'
      '   GROUP BY'
      '      IDCONTRATOEMPTMO,'
      '      HMEPARCELA,'
      '      HMENUMPARCELAS'
      '   ) ULT'
      ''
      'WHERE'
      '       ( C.FLGSITUACAO        = '#39'A'#39' )'
      '   AND ( C.IDPATRO            IN ( 1 ) )'
      '   AND ( C.IDPLANOPREV        IN ( 1 ) )'
      '   AND ( TE.IDEMPRESAPROP     = 1 )'
      '   AND ( C.IDCONTRATOEMPTMO   = ULT.IDCONTRATOEMPTMO )'
      '   AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO )'
      '   AND ( C.IDINSCRICAOEMPTMO  = I.IDINSCRICAOEMPTMO )'
      '   AND ( C.IDINSCRICAOEMPTMO  = I.IDINSCRICAOEMPTMO )'
      '   AND ( C.MOECODIGO          = M.MOECODIGO(+) )')
    ValidateWithMask = True
    Left = 240
    Top = 184
    object qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosGeracaoIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryContratosGeracaoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryContratosGeracaoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryContratosGeracaoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratosGeracaoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryContratosGeracaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContratosGeracaoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryContratosGeracaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratosGeracaoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryContratosGeracaoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryContratosGeracaoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryContratosGeracaoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryContratosGeracaoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryContratosGeracaoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContratosGeracaoDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryContratosGeracaoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratosGeracaoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryContratosGeracaoDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryContratosGeracaoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratosGeracaoVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object qryContratosGeracaoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryContratosGeracaoHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryContratosGeracaoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryContratosGeracaoIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
    end
    object qryContratosGeracaoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
    end
    object qryContratosGeracaoIDREGRASUSPCOBR: TFloatField
      FieldName = 'IDREGRASUSPCOBR'
    end
    object qryContratosGeracaoIDREGRASLDDIA: TFloatField
      FieldName = 'IDREGRASLDDIA'
    end
    object qryContratosGeracaoIDREGRAJURANTCONC: TFloatField
      FieldName = 'IDREGRAJURANTCONC'
    end
    object qryContratosGeracaoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
    end
    object qryContratosGeracaoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
    end
    object qryContratosGeracaoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
    end
    object qryContratosGeracaoIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
    end
    object qryContratosGeracaoDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryContratosGeracaoDATAULTATUALIZA: TDateTimeField
      FieldName = 'DATAULTATUALIZA'
    end
    object qryContratosGeracaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratosGeracaoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
  end
  object qryBuscaParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDITEMEMPTMO,'
      '   HME.HMEPARCELA,'
      '   HME.HMENUMPARCELAS,'
      '   HME.HMESALDODEV,'
      '   HME.HMECENTRALIZA,'
      '   HME.HMEDESTACADO'
      'FROM'
      '   HISTMOVEMPTMO HME,'
      '   ('
      '   SELECT'
      '      MAX(H.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO H,'
      '      ('
      '      SELECT'
      '         MAX(HMEPARCELA) AS HMEPARCELA'
      '      FROM'
      '         HISTMOVEMPTMO'
      '      WHERE'
      '         IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '      ) P'
      '   WHERE'
      '          H.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      '      AND H.HMETIPOMOV        = 1'
      '      AND ( H.HMECENTRALIZA   = 1 OR H.HMEDESTACADO = 1 )'
      '      AND ( H.FLGESTORNADO    = 0 OR H.FLGESTORNADO IS NULL )'
      '      AND H.HMEPARCELA        = P.HMEPARCELA'
      '   ) PAR'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '   AND HME.IDHISTMOVEMPTMO    = PAR.IDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 240
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryBuscaParcelaIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryBuscaParcelaHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryBuscaParcelaHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryBuscaParcelaHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryBuscaParcelaHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryBuscaParcelaHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
  end
  object qryValorBaixadoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SUM(DECODE(LDO.OPERACAO, 5, LDO.VALOR, 0)) AS VALOR_BAIXADO'
      'FROM'
      '    LANCTODOCUM LDO,'
      '    DOCUMENTO   DOC'
      'WHERE'
      '       DOC.CODDOCUMENTO =:PCODDOCUMENTO'
      '   AND DOC.CODDOCUMENTO = LDO.CODDOCUMENTO')
    ValidateWithMask = True
    Left = 344
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryValorBaixadoDocVALOR_BAIXADO: TFloatField
      FieldName = 'VALOR_BAIXADO'
    end
  end
  object qryBuscaItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDITEMEMPTMO'
      'FROM'
      '   ITEMXTIPOCONTR'
      'WHERE'
      '       IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO'
      
        '   AND ( IDPROVENTON      =:PIDRUBRICA OR IDPROVENTOA =:PIDRUBRI' +
        'CA OR IDPROVENTOD =:PIDRUBRICA )'
      '   AND ITCEVENTO         IN (1, 4)'
      '   AND ( FLGCENTRALIZA   = 1 OR FLGDESTACADO = 1 )'
      'ORDER BY'
      '   IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 240
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end>
    object qryBuscaItemIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDITEMEMPTMO'
    end
  end
  object qryUpdateHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGBAIXADO       =:PFLGBAIXADO,'
      '   HME.FLGRECEBIMENTO   =:PFLGRECEBIMENTO,'
      '   HME.HMEDATAEFETIVA   =:PHMEDATAEFETIVA,'
      '   HME.HMEVLREFETIVO    =:PHMEVLREFETIVO,'
      '   HME.FLGDIVERGPEND    =:PFLGDIVERGPEND,'
      '   HME.FLGTIPODIVERG    =:PFLGTIPODIVERG,'
      '   HME.FLGDIVERGTRAT    =:PFLGDIVERGTRAT'
      'WHERE'
      '       HME.IDHISTMOVEMPTMO    =:PIDHISTMOVEMPTMO'
      '   AND HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 144
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGRECEBIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PHMEVLREFETIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGPEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPODIVERG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGTRAT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   TMPDESC'
      'SET'
      '   SITENVIO = '#39'9'#39
      'WHERE'
      '       ( IDMODULO    = 15 )'
      '   AND ( IDDESCONTO  =:PIDDESCONTO )'
      '   AND ( ORDEM       =:PORDEM )')
    ValidateWithMask = True
    Left = 56
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end>
  end
  object qryUltDataBaixaDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(DATALANCTO) AS DATA_BAIXA'
      'FROM'
      '   LANCTODOCUM'
      'WHERE'
      '       CODDOCUMENTO =:PCODDOCUMENTO'
      '   AND OPERACAO     = '#39'5'#39
      '   AND ESTORNO      IS NULL')
    ValidateWithMask = True
    Left = 412
    Top = 65535
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryUltDataBaixaDocDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
      Origin = 'BASEDADOS.LANCTODOCUM.DATALANCTO'
    end
  end
  object qryBaixaItensDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGBAIXADO             = NULL,'
      '   HME.FLGENVIO               = NULL,'
      '   HME.FLGDIVERGPEND          = NULL,'
      '   HME.HMEVLREFETIVO          = HME.HMEVLRPREVISTO,'
      '   HME.HMEDATAEFETIVA         =:PHMEDATAEFETIVA'
      'WHERE'
      '       ( HME.CODDOCUMENTO     =:PCODDOCUMENTO )'
      ''
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.EVENTO           <> 5 )'
      ''
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      ''
      
        '   AND ( (HME.HMECENTRALIZA   = 1)     OR ( HME.HMEDESTACADO    ' +
        '  = 1 ) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR ( HME.FLGESTORNADO    ' +
        '  = 0 ) )'
      
        '   AND ( (HME.FLGQUITADO      IS NULL) OR ( HME.FLGQUITADO      ' +
        '  = 0 ) )'
      
        '   AND ( (HME.FLGABONADO      IS NULL) OR ( HME.FLGABONADO      ' +
        '  = 0 ) )')
    ValidateWithMask = True
    Left = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'VALOR_BAIXADO'
    end
  end
  object qryItensABaixar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.IDCONTRATOEMPTMO,'
      '   HME.IDITEMEMPTMO,'
      '   HME.CODDOCUMENTO,'
      ''
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '   HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA,'
      ''
      '   HME.EVENTO, HME.HMEORIGEM,'
      '   HME.HMERECPAG, HME.HMEFORMACOBRANCA, HME.HMESEQCOBRANCA,'
      ''
      '   HME.IDRUBRICA, HME.HMEPRIORIDADE,'
      ''
      
        '   HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMETXJUROS, HME.IDR' +
        'EGRA,'
      ''
      '   HME.PARCELA, HME.PARCELAS_RESTANTES,'
      '   HME.HMECENTRALIZA, HME.HMEDESTACADO,'
      ''
      
        '   ROUND(NVL(HME.HMEVLRPREVISTO, 0), 2) AS HMEVLRPREVISTO, HME.H' +
        'MEVLREFETIVO,'
      '   HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEDATAEFETIVA,'
      ''
      '   HME.FLGBAIXADO,'
      '   HME.FLGDIVERGPEND,'
      '   HME.FLGBAIXAMANUAL,'
      '   HME.FLGESTORNADO,'
      '   HME.FLGQUITADO,'
      '   HME.FLGABONADO,'
      ''
      '   HME.IDTIPOCONTREMPTMO'
      'FROM'
      '   VW_MOVEP HME'
      'WHERE'
      '       ( HME.CODDOCUMENTO     =:PCODDOCUMENTO )'
      ''
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      ''
      
        '   AND ( (HME.HMECENTRALIZA   = 1)     OR ( HME.HMEDESTACADO    ' +
        '  = 1 ) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR ( HME.FLGESTORNADO    ' +
        '  = 0 ) )'
      
        '   AND ( (HME.FLGQUITADO      IS NULL) OR ( HME.FLGQUITADO      ' +
        '  = 0 ) )'
      
        '   AND ( (HME.FLGABONADO      IS NULL) OR ( HME.FLGABONADO      ' +
        '  = 0 ) )'
      ''
      'ORDER BY'
      '   ABS(ROUND(NVL(HME.HMEVLRPREVISTO, 0), 2)) DESC')
    ValidateWithMask = True
    Left = 144
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryItensABaixarIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryItensABaixarIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensABaixarIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryItensABaixarCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryItensABaixarHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryItensABaixarHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryItensABaixarHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryItensABaixarHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryItensABaixarEVENTO: TFloatField
      FieldName = 'EVENTO'
    end
    object qryItensABaixarHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryItensABaixarHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryItensABaixarHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryItensABaixarHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryItensABaixarIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryItensABaixarHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryItensABaixarHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryItensABaixarHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryItensABaixarHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryItensABaixarIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryItensABaixarPARCELA: TFloatField
      FieldName = 'PARCELA'
    end
    object qryItensABaixarPARCELAS_RESTANTES: TFloatField
      FieldName = 'PARCELAS_RESTANTES'
    end
    object qryItensABaixarHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryItensABaixarHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryItensABaixarHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryItensABaixarHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryItensABaixarHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryItensABaixarHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryItensABaixarHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryItensABaixarFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryItensABaixarFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryItensABaixarFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryItensABaixarFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryItensABaixarFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryItensABaixarFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryItensABaixarIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
  end
end
