inherited frmExecEnvioSeguro: TfrmExecEnvioSeguro
  Left = 92
  Top = 178
  Caption = 'Envio de Seguro'
  ClientHeight = 414
  ClientWidth = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 710
    Height = 381
    inherited pgcControle: TPageControl
      Width = 710
      Height = 348
      inherited TabSheet1: TTabSheet
        object Label1: TLabel
          Left = 16
          Top = 58
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 360
          Top = 58
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object GroupBox3: TGroupBox
          Left = 360
          Top = 260
          Width = 329
          Height = 61
          Caption = ' Período de Datas '
          TabOrder = 0
          object Label5: TLabel
            Left = 32
            Top = 28
            Width = 27
            Height = 13
            Caption = 'de:  '
          end
          object Label6: TLabel
            Left = 174
            Top = 28
            Width = 27
            Height = 13
            Caption = 'até: '
          end
          object edtDataIni: TwwDBDateTimePicker
            Left = 56
            Top = 24
            Width = 97
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
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
            TabOrder = 0
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
          object edtDataFim: TwwDBDateTimePicker
            Left = 200
            Top = 24
            Width = 97
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
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
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 72
          Width = 329
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
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 360
          Top = 72
          Width = 329
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
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 609
          Height = 41
          TabOrder = 3
          inherited edtNome: TEdit
            Width = 369
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
            OnClick = molContratoEmptmobtnLimpaContratoClick
          end
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 104
          Width = 345
          Height = 169
          TabOrder = 4
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 145
          end
          inherited btnInvertePatro: TBitBtn
            Left = 295
            OnClick = molListaPatrobtnInvertePatroClick
          end
          inherited btnMarcaTodosPatro: TBitBtn
            Left = 316
            OnClick = molListaPatrobtnMarcaTodosPatroClick
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 352
          Top = 104
          Width = 345
          Height = 153
          TabOrder = 5
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 329
            Height = 129
          end
          inherited btnInvertePlano: TBitBtn
            Left = 295
            OnClick = molListaPlanobtnInvertePlanoClick
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 316
            OnClick = molListaPlanobtnMarcaTodosPlanoClick
          end
        end
      end
      inherited TabSheet2: TTabSheet
        object lblTotContrato: TLabel
          Left = 32
          Top = 325
          Width = 98
          Height = 13
          Caption = '10.000 Contratos'
          Visible = False
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 17
          Top = 34
          Width = 672
          Height = 287
          Selected.Strings = (
            'IDCONTRATOEMPTMO'#9'20'#9'Contrato'#9'F'
            'ITEDESCRICAO'#9'48'#9'Item'#9'F'
            'HMEVLRPREVISTO'#9'20'#9'Valor'#9'F'
            'HMEDATAPREVISTA'#9'15'#9'Data'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsContratosAEnviar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdHistMovCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdHistMovTopRowChanged
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Contratos a Enviar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object TabSheet3: TTabSheet
        ImageIndex = 2
        TabVisible = False
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 673
          Height = 285
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 16
          Top = 8
          Width = 673
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
          TabOrder = 1
        end
      end
    end
    inherited Panel1: TPanel
      Width = 710
      inherited fcLabel1: TfcLabel
        Width = 266
        Caption = 'Envio de Seguro [seleção]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 710
    inherited tb97Fundo: TToolbar97
      Left = 538
      DockPos = 602
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 128
      inherited ToolbarSep971: TToolbarSep97
        Left = 388
      end
      inherited ToolbarSep973: TToolbarSep97
        Left = 290
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 404
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 307
      end
      inherited bbtnCancelar: TBitBtn
        Left = 390
      end
      object btnGeraArquivo: TBitBtn
        Left = 174
        Top = 0
        Width = 116
        Height = 27
        Caption = '&Gera arquivo'
        Enabled = False
        ModalResult = 1
        TabOrder = 4
        OnClick = btnGeraArquivoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
    end
  end
  object qryContratosAEnviar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO,'
      '   HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA,'
      '   ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO,'
      '   HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO,'
      '   HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV,'
      '   HME.HMETIPOMOV,'
      '   (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39'))))'
      '   || '#39'/'#39' ||'
      
        '   (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, '#39'0000'#39')))) AS ANO' +
        'MESCOMPETENCIA,'
      '   ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV,'
      
        '   CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, CON.' +
        'DATACREDITO,'
      
        '   CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCB' +
        'ANCARIA,'
      
        '   CON.IDCBANCARIADEB, CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, ' +
        'CON.FLGINTERNO,'
      
        '   0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSP' +
        'EMPTMO,'
      '   CON.VLRCONTRATO, CON.NUMPARCELAS, CON.DATAPRIMPARC'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        C' +
        'ON.IDCONTRQUITACAO,'
      '      CON.IDVERBA,               CON.FLGSITUACAO,'
      '      CON.NUMPARCELAS               AS PRAZO,'
      
        '      CON.VLRCONTRATO,           CON.VLRPARCELA,               C' +
        'ON.TXJUROS,'
      
        '      TEP.IDEMPRESAPROP,         CON.IDPATRO,                  C' +
        'ON.IDPLANOPREV,'
      '      CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO,'
      '      TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO,'
      '      CON.IDPESSOA,              CON.IDBENEF,'
      '      CON.MOECODIGO, CON.IDCBANCARIADEB,'
      
        '      CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.I' +
        'DCBANCARIA,'
      '      ELP.MATRICULA                 AS MATRICULA_TIT,'
      '      CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO,'
      '      PPP.INSCRICAONUMERO,'
      '      NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO,'
      '      NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO,'
      '      NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA,'
      '      SIT.IDSITPART,             SIT.FLGINTERNO,'
      '      SIT.DESCRICAO                 AS SIT_TITULAR,'
      '      CON.NUMPARCELAS, CON.DATAPRIMPARC, CON.DATACREDITO,'
      
        '      DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, '#39'Pensioni' +
        'sta'#39') AS SITDESCRICAO'
      '   FROM'
      '      CONTRATOEMPTMO  CON,'
      '      PARTPREVPLAN    PPP,'
      '      ELEGPATRO       ELP,'
      '      PATRO           PTR,'
      '      PLANPREV        PLP,'
      '      TIPOCONTREMPTMO TCE,'
      '      TIPOEMPTMO      TEP,'
      '      SITPART         SIT,'
      '      SITPLANOPREV    SPP'
      '   WHERE'
      '          TEP.IDEMPRESAPROP     = 1'
      '      AND CON.IDTIPOCONTREMPTMO IN (1)'
      '      AND CON.FLGSITUACAO       <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO  = 3647256626'
      '      AND CON.IDPLANOPREV       IN (76, 19, 66, 2)'
      '      AND CON.IDPATRO           IN (91008, 1, 1236474)'
      '      AND CON.IDPATRO           = PTR.IDPESSOA'
      '      AND CON.IDPLANOPREV       = PLP.IDPLANOPREV'
      '      AND CON.IDPESSOA          = ELP.IDPESSOA'
      '      AND CON.IDPESSOA          = PPP.IDPESSOA'
      '      AND PTR.IDPESSOA          = ELP.IDPESSJUR'
      '      AND PTR.IDPESSOA          = PPP.IDPESSJUR'
      '      AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      '      AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO'
      '      AND PPP.IDSITPART         = SIT.IDSITPART'
      '      AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV'
      '      AND PPP.FLGDESATIVADO     = 0 '
      '   ) CON,'
      '   ITEMXTIPOCONTR  ITC,'
      '   ITEMEMPTMO      IRC,'
      '    ('
      '    SELECT'
      '       IDCONTRATOEMPTMO, HMEDATAPREVISTA, IDHISTMOVEMPTMO'
      '    FROM'
      '       HISTMOVEMPTMO'
      '    WHERE'
      '            (iditememptmo = 20)'
      '        AND (flgestornado is null or flgestornado = 0)'
      
        '        AND (HMEDATAPREVISTA >= TO_DATE('#39'16/12/2003'#39', '#39'DD/MM/YYY' +
        'Y'#39') )'
      
        '        AND (HMEDATAPREVISTA <= TO_DATE('#39'16/12/2003'#39', '#39'DD/MM/YYY' +
        'Y'#39') )'
      '    ) HCB'
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO  )'
      '   AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO )'
      '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )'
      '   AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO )'
      '   AND ( HME.IDHISTMOVEMPTMO   = HCB.IDHISTMOVEMPTMO )')
    ValidateWithMask = True
    Left = 192
    Top = 192
    object qryContratosAEnviarIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryContratosAEnviarIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosAEnviarIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryContratosAEnviarHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryContratosAEnviarIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryContratosAEnviarHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryContratosAEnviarHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryContratosAEnviarHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryContratosAEnviarHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryContratosAEnviarHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryContratosAEnviarHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryContratosAEnviarHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryContratosAEnviarHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryContratosAEnviarANOMESCOMPETENCIA: TStringField
      FieldName = 'ANOMESCOMPETENCIA'
      Size = 9
    end
    object qryContratosAEnviarCONTABAIXA: TStringField
      FieldName = 'CONTABAIXA'
      FixedChar = True
      Size = 18
    end
    object qryContratosAEnviarTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      FixedChar = True
      Size = 2
    end
    object qryContratosAEnviarITCTRATASALDODEV: TFloatField
      FieldName = 'ITCTRATASALDODEV'
    end
    object qryContratosAEnviarIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContratosAEnviarIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryContratosAEnviarIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryContratosAEnviarIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratosAEnviarCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryContratosAEnviarPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryContratosAEnviarPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryContratosAEnviarIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryContratosAEnviarIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
    end
    object qryContratosAEnviarIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratosAEnviarITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryContratosAEnviarFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryContratosAEnviarFLGATUALSALDOENV: TFloatField
      FieldName = 'FLGATUALSALDOENV'
    end
    object qryContratosAEnviarIDREGRAENVIOPARC: TFloatField
      FieldName = 'IDREGRAENVIOPARC'
    end
    object qryContratosAEnviarIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryContratosAEnviarDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratosAEnviarVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratosAEnviarNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryContratosAEnviarDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
  end
  object dtsContratosAEnviar: TwwDataSource
    DataSet = qryContratosAEnviar
    Left = 144
    Top = 208
  end
  object qryMatricula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    DEP.MATRICULA,'
      '    PES.NOME,'
      '    DOC.NUMDOCUMENTO'
      'FROM'
      '    DEPENTIT DEP,'
      '    PESSOA   PES,'
      '    DOCPESSOA DOC'
      'WHERE'
      '    DEP.IDPESSOA    = :PIDPESSOA'
      'AND DEP.IDTITULAR   = :PIDTITULAR'
      'AND PES.IDPESSOA    = DEP.IDPESSOA'
      'AND DOC.IDPESSOA    = DEP.IDPESSOA'
      'AND DOC.IDDOCUMENTO = 2'
      '')
    ValidateWithMask = True
    Left = 488
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptInput
      end>
    object qryMatriculaMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.DEPENTIT.MATRICULA'
      Size = 15
    end
    object qryMatriculaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryMatriculaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.DOCPESSOA.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
  end
end
