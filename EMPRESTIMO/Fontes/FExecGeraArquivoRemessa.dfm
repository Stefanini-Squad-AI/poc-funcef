inherited frmExecGeraArquivoRemessa: TfrmExecGeraArquivoRemessa
  Left = 402
  Top = 221
  HelpContext = 150013
  Caption = 'Geração de Arquivo Eletrônico de Remessa'
  ClientWidth = 666
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 666
    inherited pgcControle: TPageControl
      Width = 666
      ActivePage = TabSheet2
      inherited TabSheet1: TTabSheet
        Caption = 'Geração de Arquivo Eletrônico de Remessa [ seleção ]'
        object Label3: TLabel
          Left = 168
          Top = 74
          Width = 222
          Height = 13
          Caption = 'Conta de Caixa X Forma de Pagamento'
        end
        object GroupBox3: TGroupBox
          Left = 168
          Top = 156
          Width = 329
          Height = 61
          Caption = ' Período de Datas (de Pagamento) '
          TabOrder = 1
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
        object DBcboPortadorForma: TwwDBLookupCombo
          Left = 168
          Top = 88
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookPortadorFormaP
          LookupField = 'CODPORTFORMA'
          Style = csDropDownList
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object chkVisualiza: TCheckBox
          Left = 176
          Top = 248
          Width = 321
          Height = 17
          Caption = 'Visualiza arquivo gerado'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Geração de Arquivo Eletrônico de Remessa [ Documento(s) ]'
        object Label1: TLabel
          Left = 16
          Top = 282
          Width = 188
          Height = 13
          Caption = 'Caminho para criação do arquivo'
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 17
          Top = 34
          Width = 624
          Height = 223
          Selected.Strings = (
            'NODOCUMENTO'#9'10'#9'Nº Doc.'#9'F'
            'NUMAPGR'#9'5'#9'Nº AP'#9'F'
            'NUMBANCO'#9'5'#9'Banco'#9'F'
            'NOME'#9'25'#9'Nome'#9'F'
            'PORTADORFORMA'#9'25'#9'Conta Caixa X Forma Pagto.'#9'F'
            'VALOR'#9'10'#9'Valor'#9'F'
            'STATUS_DOC'#9'10'#9'Status'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsDocumento
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
          IndicatorColor = icBlack
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 625
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Documentos'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object pnlPasta: TPanel
          Left = 16
          Top = 296
          Width = 601
          Height = 21
          Alignment = taLeftJustify
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Caption = 'C:\'
          Color = clWindow
          TabOrder = 2
          object lblDiretorio: TLabel
            Left = 588
            Top = 22
            Width = 19
            Height = 13
            Caption = 'C:\'
            Visible = False
          end
        end
        object btnEscolheDir: TBitBtn
          Left = 616
          Top = 295
          Width = 27
          Height = 24
          Hint = 'Seleciona a Pasta que será gravado os arquivos para banco'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnEscolheDirClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
            333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
            300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
            333337F373F773333333303330033333333337F3377333333333303333333333
            333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
            333337777F337F33333330330BB00333333337F373F773333333303330033333
            333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
            333377777F77377733330BBB0333333333337F337F33333333330BB003333333
            333373F773333333333330033333333333333773333333333333}
          NumGlyphs = 2
        end
      end
    end
    inherited Panel1: TPanel
      Width = 666
      inherited fcLabel1: TfcLabel
        Width = 551
        Caption = 'Geração de Arquivo Eletrônico de Remessa [ seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Width = 666
    inherited tb97Fundo: TToolbar97
      Left = 494
      DockPos = 580
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 110
      inherited ToolbarSep971: TToolbarSep97
        Left = 376
      end
      inherited ToolbarSep973: TToolbarSep97
        Left = 274
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 378
      end
      inherited ToolbarSep975: TToolbarSep97
        Left = 272
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 291
      end
      inherited bbtnCancelar: TBitBtn
        Left = 372
        Width = 4
        OnClick = bbtnCancelarClick
      end
      inherited btnVoltar: TBitBtn
        Width = 90
      end
      inherited btnContinuar: TBitBtn
        Left = 182
        Width = 90
      end
      object bbbtnContinuar: TBitBtn
        Left = 92
        Top = 0
        Width = 90
        Height = 27
        Caption = 'Continuar'
        Enabled = False
        ModalResult = 1
        TabOrder = 4
        Visible = False
        OnClick = bbbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
          B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
          BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
          BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
          BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        Layout = blGlyphRight
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 979
    Top = 11
  end
  object qryDocTXT: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0    as IDPESSOA,'
      '   0    as IDFORCLI,'
      '   0    as CODDOCUMENTO,'
      '   0.00 as VALOR,'
      '   0.00 as VALORDESCONTO,'
      '   0.00 as VALORJUROS,'
      ''
      '   '#39'01/01/1990'#39' as DATAVENCTO,'
      '   '#39'01/01/1990'#39' as DATAPROGRAMADA,'
      ''
      '   0     as NODOCUMENTO,'
      '   '#39'123'#39' as COMPLDOCUMENTO,'
      ''
      
        '   '#39'123456789012345678'#39'                                  as CONT' +
        'ALIQUIDO,'
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39'  as NOME' +
        ','
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39'  as RAZA' +
        'OSOCIAL,'
      
        '   '#39'123456789012345678'#39'                                  as NUMD' +
        'OCUMENTO,'
      
        '   '#39'123456789012345'#39'                                     as CONT' +
        'ACORRENTE,'
      
        '   '#39'1234567890'#39'                                          as CODB' +
        'ANCOFAVORECIDO,'
      
        '   '#39'123456789012345'#39'                                     as NUMA' +
        'GENCIA,'
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39'  as LOGR' +
        'ADOURO,'
      
        '   '#39'12345678'#39'                                            as NUME' +
        'RO,'
      
        '   '#39'12345678901234567890'#39'                                as COMP' +
        'LEMENTO,'
      
        '   '#39'12345678901234567890'#39'                                as BAIR' +
        'RO,'
      
        '   '#39'12345678901234567890'#39'                                as CIDA' +
        'DE,'
      
        '   '#39'123'#39'                                                 as CODE' +
        'STADO,'
      '   '#39'12345678'#39'                                            as CEP,'
      ''
      '   0     as TIPOMOEDA,'
      '   0     as NUMLOTE,'
      '   0     as CODPORTFORMA,'
      '   0     as CODPORTADOR,'
      '   0     as CODFORMAPAGTO,'
      '   0     as CODTIPOPAGTO,'
      '   '#39'0'#39'   as FLGEMITEAVISO,'
      '   0     as CODARQUIVOREMESSA,'
      '   0     as IDBANCO,'
      '   0     as DMAISALT,'
      '   0     as CODFORMAPGTOALT,'
      '   0     as VALORMAXIMO,'
      ''
      '   '#39'123456789012345'#39' as NOCONTACORR,'
      '   '#39'1234567890'#39'      as CODBARRA,'
      '   '#39'1234567890'#39'      as CODBARRAVALOR,'
      ''
      '   '#39'1'#39'                           as TIPO,'
      '   '#39'12345678901234567890'#39'        as NUMEMPRESABANCO,'
      '   '#39'1'#39'                           as DEBCRE,'
      '   '#39'1'#39'                           as TIPOCONTA,'
      '   '#39'AGENCIA'#39'                     as NOMEAGENCIA,'
      '   '#39'1234567890123456789012345'#39'   as LIVRE'
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1 = 2'
      ' ')
    UpdateObject = updDoc
    ValidateWithMask = True
    Left = 256
    Top = 168
    object qryDocTXTIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDocTXTIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryDocTXTCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDocTXTVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryDocTXTVALORDESCONTO: TFloatField
      FieldName = 'VALORDESCONTO'
    end
    object qryDocTXTVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
    end
    object qryDocTXTDATAVENCTO: TStringField
      FieldName = 'DATAVENCTO'
      FixedChar = True
      Size = 10
    end
    object qryDocTXTDATAPROGRAMADA: TStringField
      FieldName = 'DATAPROGRAMADA'
      FixedChar = True
      Size = 10
    end
    object qryDocTXTNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryDocTXTCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryDocTXTCONTALIQUIDO: TStringField
      FieldName = 'CONTALIQUIDO'
      FixedChar = True
      Size = 18
    end
    object qryDocTXTNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 50
    end
    object qryDocTXTRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      FixedChar = True
      Size = 50
    end
    object qryDocTXTNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryDocTXTCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      FixedChar = True
      Size = 15
    end
    object qryDocTXTCODBANCOFAVORECIDO: TStringField
      FieldName = 'CODBANCOFAVORECIDO'
      FixedChar = True
      Size = 10
    end
    object qryDocTXTNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryDocTXTLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      FixedChar = True
      Size = 50
    end
    object qryDocTXTNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 8
    end
    object qryDocTXTCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      FixedChar = True
    end
    object qryDocTXTBAIRRO: TStringField
      FieldName = 'BAIRRO'
      FixedChar = True
    end
    object qryDocTXTCIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
    end
    object qryDocTXTCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryDocTXTCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object qryDocTXTTIPOMOEDA: TFloatField
      FieldName = 'TIPOMOEDA'
    end
    object qryDocTXTNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
    object qryDocTXTCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryDocTXTCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
    end
    object qryDocTXTCODFORMAPAGTO: TFloatField
      FieldName = 'CODFORMAPAGTO'
    end
    object qryDocTXTCODTIPOPAGTO: TFloatField
      FieldName = 'CODTIPOPAGTO'
    end
    object qryDocTXTFLGEMITEAVISO: TStringField
      FieldName = 'FLGEMITEAVISO'
      FixedChar = True
      Size = 1
    end
    object qryDocTXTCODARQUIVOREMESSA: TFloatField
      FieldName = 'CODARQUIVOREMESSA'
    end
    object qryDocTXTIDBANCO: TFloatField
      FieldName = 'IDBANCO'
    end
    object qryDocTXTNOCONTACORR: TStringField
      FieldName = 'NOCONTACORR'
      FixedChar = True
      Size = 15
    end
    object qryDocTXTCODBARRA: TStringField
      FieldName = 'CODBARRA'
      FixedChar = True
      Size = 10
    end
    object qryDocTXTCODBARRAVALOR: TStringField
      FieldName = 'CODBARRAVALOR'
      FixedChar = True
      Size = 10
    end
    object qryDocTXTTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryDocTXTNUMEMPRESABANCO: TStringField
      FieldName = 'NUMEMPRESABANCO'
      FixedChar = True
    end
    object qryDocTXTDEBCRE: TStringField
      FieldName = 'DEBCRE'
      FixedChar = True
      Size = 1
    end
    object qryDocTXTTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      FixedChar = True
      Size = 1
    end
    object qryDocTXTNOMEAGENCIA: TStringField
      FieldName = 'NOMEAGENCIA'
      FixedChar = True
      Size = 7
    end
    object qryDocTXTLIVRE: TStringField
      FieldName = 'LIVRE'
      FixedChar = True
      Size = 25
    end
    object qryDocTXTDMAISALT: TFloatField
      FieldName = 'DMAISALT'
    end
    object qryDocTXTCODFORMAPGTOALT: TFloatField
      FieldName = 'CODFORMAPGTOALT'
    end
    object qryDocTXTVALORMAXIMO: TFloatField
      FieldName = 'VALORMAXIMO'
    end
  end
  object qryHistMovEmptmo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.IDCONTRATOEMPTMO,'
      '   HME.CODDOCUMENTO,'
      '   HME.IDITEMEMPTMO,'
      ''
      '   HME.HMETIPOMOV, HME.HMEORIGEM, HME.HMEPARCELA,'
      ''
      '   HME.HMEFORMACOBRANCA,'
      ''
      '   HME.HMECENTRALIZA, HME.HMEDESTACADO,'
      
        '   HME.HMEDATA, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMED' +
        'ATAEFETIVA, HME.HMEDATAATUALIZA,'
      ''
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '   HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA,'
      ''
      '   ABS(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO,'
      '   HME.HMEVLREFETIVO, HME.HMESALDODEV, HME.HMETXJUROS,'
      ''
      
        '   HME.FLGESTORNADO, HME.FLGBAIXADO, HME.FLGABONADO, HME.FLGENVI' +
        'O,'
      ''
      '   HME.HMERECPAG'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME,'
      '   PARAMEMPTMO   PEP'
      ''
      'WHERE'
      '       HME.CODDOCUMENTO          =:PCODDOCUMENTO'
      ''
      '   AND HME.HMEDATAPREVISTA = :PDATAPREVISTA'
      ''
      '   AND HME.HMEFORMACOBRANCA      = '#39'C'#39
      '   AND HME.HMERECPAG             = '#39'P'#39
      '   AND ( HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      
        '   AND ((PEP.FLGEXCEPCIONAL      = 1) OR (PEP.FLGEXCEPCIONAL    ' +
        '  <> 1 AND HME.HMETIPOMOV = 0))'
      
        '   AND ((PEP.FLGEXCEPCIONAL      = 1) OR (PEP.FLGEXCEPCIONAL    ' +
        '  <> 1 AND HME.HMEPARCELA = 0))')
    ValidateWithMask = True
    Left = 56
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PDATAPREVISTA'
        ParamType = ptUnknown
      end>
    object qryHistMovEmptmoIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
    object qryHistMovEmptmoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryHistMovEmptmoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.CODDOCUMENTO'
    end
    object qryHistMovEmptmoIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDITEMEMPTMO'
    end
    object qryHistMovEmptmoHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMETIPOMOV'
    end
    object qryHistMovEmptmoHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEORIGEM'
    end
    object qryHistMovEmptmoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEPARCELA'
    end
    object qryHistMovEmptmoHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovEmptmoHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMECENTRALIZA'
    end
    object qryHistMovEmptmoHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDESTACADO'
    end
    object qryHistMovEmptmoHMEDATA: TDateTimeField
      FieldName = 'HMEDATA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATA'
    end
    object qryHistMovEmptmoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAPREVISTA'
    end
    object qryHistMovEmptmoHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAVENCTO'
    end
    object qryHistMovEmptmoHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAEFETIVA'
    end
    object qryHistMovEmptmoHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAATUALIZA'
    end
    object qryHistMovEmptmoHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEANOCOMPETENCIA'
    end
    object qryHistMovEmptmoHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEMESCOMPETENCIA'
    end
    object qryHistMovEmptmoHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEANOCOBRANCA'
    end
    object qryHistMovEmptmoHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEMESCOBRANCA'
    end
    object qryHistMovEmptmoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLRPREVISTO'
    end
    object qryHistMovEmptmoHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLREFETIVO'
    end
    object qryHistMovEmptmoHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMESALDODEV'
    end
    object qryHistMovEmptmoHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMETXJUROS'
    end
    object qryHistMovEmptmoFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.FLGESTORNADO'
    end
    object qryHistMovEmptmoFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.FLGBAIXADO'
    end
    object qryHistMovEmptmoFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.FLGABONADO'
    end
    object qryHistMovEmptmoFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.FLGENVIO'
    end
    object qryHistMovEmptmoHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMERECPAG'
      FixedChar = True
      Size = 1
    end
  end
  object qryDocOutros: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DOC.CODDOCUMENTO,'
      '   DOC.IDPESSOA,'
      '   DOC.CODPORTFORMA,'
      '   DOC.IDFORCLI,'
      ''
      '   DOC.IDMODULO,'
      '   DOC.RECPAG,'
      '   DOC.NODOCUMENTO,'
      '   DOC.COMPLDOCUMENTO,'
      '   DOC.DATAVENCTO,'
      
        '   DECODE(DOC.STATUS, '#39'0'#39', '#39'Em Aberto'#39', '#39'2'#39', '#39'Pago'#39', '#39#39') AS STAT' +
        'US_DOC,'
      ''
      '   DOC.OPERACAO,'
      '   DOC.NUMAPGR,'
      ''
      '   PFO.DESCRICAO AS PORTADORFORMA,'
      ''
      '   LDC.VALOR,'
      ''
      '   PBA.NOME,'
      '   BAN.NUMBANCO'
      ''
      'FROM'
      '   PESSOA        PBA,'
      '   DOCUMENTO     DOC,'
      '   ('
      '   SELECT'
      '      LAN.CODDOCUMENTO,'
      '      LAN.NUMLANCTO,'
      '      LAN.VALOR,'
      '      LAN.DEBCRE,'
      '      LAN.OPERACAO,'
      '      LAN.HISTORICOCOMPL'
      '   FROM'
      '      LANCTODOCUM LAN'
      '   WHERE'
      '      LTRIM(RTRIM(LAN.OPERACAO)) = '#39'2'#39
      '   ) LDC,'
      '   PORTADORFORMA PFO,'
      '   BANCO         BAN'
      ''
      'WHERE'
      '       DOC.IDMODULO     = 15'
      '   AND DOC.RECPAG       = '#39'P'#39
      '   AND DOC.DATAVENCTO   BETWEEN :PDATAINI AND :PDATAFIM'
      
        '   AND ((:PCODPORTFORMA IS NULL) OR (DOC.CODPORTFORMA =:PCODPORT' +
        'FORMA))'
      '   AND DOC.CODDOCUMENTO = LDC.CODDOCUMENTO'
      '   AND DOC.CODPORTFORMA = PFO.CODPORTFORMA'
      '   AND DOC.IDFORCLI     = BAN.IDPESSOA'
      '   AND BAN.IDPESSOA     = PBA.IDPESSOA')
    ValidateWithMask = True
    Left = 128
    Top = 264
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end>
    object qryDocOutrosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDocOutrosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDocOutrosCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryDocOutrosIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryDocOutrosIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryDocOutrosRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryDocOutrosNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryDocOutrosCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryDocOutrosDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object qryDocOutrosSTATUS_DOC: TStringField
      FieldName = 'STATUS_DOC'
      Size = 9
    end
    object qryDocOutrosOPERACAO: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 2
    end
    object qryDocOutrosNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object qryDocOutrosPORTADORFORMA: TStringField
      FieldName = 'PORTADORFORMA'
      Size = 50
    end
    object qryDocOutrosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryDocOutrosNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryDocOutrosVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
  end
  object dtsDocumento: TwwDataSource
    DataSet = qryDocOutros
    Left = 40
    Top = 232
  end
  object qryDadosRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   E.LOGRADOURO,'
      '   E.NUMERO,'
      '   E.COMPLEMENTO,'
      '   E.BAIRRO,'
      '   C.NOME AS CIDADE,'
      '   S.CODESTADO,'
      '   E.CEP,'
      '   NVL(P.NUMDOCUMENTO, D.NUMDOCUMENTO) AS NUMDOCUMENTO,'
      '   P.NOME'
      ''
      'FROM'
      '   PESSOA    P,'
      '   ENDPESS   E,'
      '   DOCPESSOA D,'
      '   CIDADES   C,'
      '   ESTADO    S'
      'WHERE'
      '       P.IDPESSOA    =:PIDPESSOA'
      '   AND P.IDPESSOA    = E.IDPESSOA(+)'
      '   AND P.IDPESSOA    = D.IDPESSOA(+)'
      '   AND E.IDCIDADES   = C.IDCIDADES(+)'
      '   AND C.IDESTADO    = S.IDESTADO(+)')
    ValidateWithMask = True
    Left = 129
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryDadosRecLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryDadosRecNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryDadosRecCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryDadosRecBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryDadosRecCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryDadosRecCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryDadosRecCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryDadosRecNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qryDadosRecNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, CON.IDINSCRICAOEMPTMO, CON.IDCONTRQUITA' +
        'CAO,    CON.IDVERBA,'
      
        '   CON.FLGSITUACAO,      CON.FLGFORMAREC,       CON.PORTFORMAREC' +
        ',       CON.FLGFORMAPAG,'
      
        '   CON.CODFORMAPAG,      CON.PORTFORMAPAG,      CON.DATAASSINATU' +
        'RA,     CON.DATACREDITO,'
      
        '   CON.DATAPRIMPARC,     CON.DATACANC,          CON.DATASITUACAO' +
        ',       CON.PRAZO,'
      
        '   CON.VLRCONTRATO,      CON.VLRPARCELA,        CON.TXJUROS,    ' +
        '        CON.VLRPARCELAMES,'
      
        '   CON.VLRPARCATRASO,    CON.VLRDEBITO,         CON.VLRRESERVA, ' +
        '        CON.VLRSALDODEV,'
      
        '   CON.VLRPENDENCIA,     CON.VLRSALBASE,        CON.VLRMARGEM,  ' +
        '        CON.VLRMAXPERMIT,'
      
        '   CON.DATASALDODEV,     CON.DATAPENDENCIA,     CON.FLGSUSPENSAO' +
        'AUTO,   CON.IDTIPOSUSPEMPTMO,'
      
        '   CON.DATAINICIOSUSP,   CON.DATAFIMSUSP,       CON.ANOSUSPENSAO' +
        ',       CON.MESSUSPENSAO,'
      
        '   CON.USUARIOLIBSUSP,   CON.DATALIBSUSP,       CON.HORALIBSUSP,' +
        '        CON.IDEMPRESAPROP,'
      
        '   CON.IDPATRO,          CON.IDTIPOCONTREMPTMO, CON.TCEDESCRICAO' +
        ','
      ''
      
        '   CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS I' +
        'DPLANOORIGEM,'
      ''
      '   CON.IDTIPOEMPTMO,     CON.DESCTIPOEMPTMO,    CON.IDPESSOA,'
      ''
      
        '   CON.IDBENEF,          CON.IDCBANCARIA,       CON.IDCBANCARIAD' +
        'EB,     CON.MOECODIGO,'
      
        '   CON.MATRICULA,        CON.MATRICULA_TIT,     CON.INSCRICAONUM' +
        'ERO,    CON.SALPARTICIPACAO,'
      
        '   CON.SALMANTIDO,       CON.SALAUXDOENCA,      CON.IDREGRAMARGE' +
        'M,      CON.IDREGRARESERVA,'
      
        '   CON.IDREGRAELEG,      CON.IDREGRALIMITES,    CON.TCEDIASVALID' +
        'INSC,   CON.TCEDIASTOLERAINSC,'
      
        '   CON.TCEMAXCONTRATO,   CON.TCEMAXINSCR,       CON.TCEMAXPARC, ' +
        '        CON.TCEMINPARC,'
      
        '   CON.TCEMINQUIT,       CON.TCEMINRENOVA,      CON.FLGSEGURO,  ' +
        '        CON.IDSITPART,'
      
        '   CON.FLGINTERNO,       CON.SIT_TITULAR,       CON.SITDESCRICAO' +
        ',       CON.IDUSUARIO,'
      
        '   CON.NOME_TITULAR,     CON.CPF_TITULAR,       CON.NOME,       ' +
        '        CON.NOME_MUTUARIO,'
      '   CON.NUMDOCUMENTO,     CON.CPF_MUTUARIO,'
      ''
      '   CBA.CONTACORRENTE, 1 AS TIPOCONTA,'
      '   AGE.NUMAGENCIA, PAG.NOME AS NOMEAGENCIA,'
      '   BAN.NUMBANCO'
      '   ,'
      '   DCB.CONTACORRENTE AS CONTACORRENTEDEB,'
      '   1 AS TIPOCONTADEB,'
      '   DAG.NUMAGENCIA AS NUMAGENCIADEB,'
      '   DPA.NOME AS NOMEAGENCIADEB,'
      '   DBA.NUMBANCO AS NUMBANCODEB'
      'FROM'
      '   PESSOA          PAG,'
      '   VWCONTRATOEP    CON,'
      '   CONTABANCARIA   CBA,'
      '   AGENCIABANCARIA AGE,'
      '   BANCO           BAN'
      '   ,'
      '   PESSOA          DPA,'
      '   CONTABANCARIA   DCB,'
      '   AGENCIABANCARIA DAG,'
      '   BANCO           DBA'
      ''
      'WHERE'
      '       CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND CON.IDCBANCARIA      = CBA.IDCBANCARIA'
      '   AND CBA.IDAGENCIA        = AGE.IDPESSOA'
      '   AND AGE.IDBANCO          = BAN.IDPESSOA'
      '   AND AGE.IDPESSOA         = PAG.IDPESSOA'
      ''
      '   AND CON.IDCBANCARIADEB   = DCB.IDCBANCARIA'
      '   AND DCB.IDAGENCIA        = DAG.IDPESSOA'
      '   AND DAG.IDBANCO          = DBA.IDPESSOA'
      '   AND DAG.IDPESSOA         = DPA.IDPESSOA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 120
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCONTRATOEMPTMO'
    end
    object qryContratoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDINSCRICAOEMPTMO'
    end
    object qryContratoIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCONTRQUITACAO'
    end
    object qryContratoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDVERBA'
    end
    object qryContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryContratoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryContratoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
      Origin = 'BASEDADOS.VWCONTRATOEP.PORTFORMAREC'
    end
    object qryContratoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryContratoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
      Origin = 'BASEDADOS.VWCONTRATOEP.CODFORMAPAG'
    end
    object qryContratoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
      Origin = 'BASEDADOS.VWCONTRATOEP.PORTFORMAPAG'
    end
    object qryContratoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATAASSINATURA'
    end
    object qryContratoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATACREDITO'
    end
    object qryContratoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATAPRIMPARC'
    end
    object qryContratoDATACANC: TDateTimeField
      FieldName = 'DATACANC'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATACANC'
    end
    object qryContratoDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATASITUACAO'
    end
    object qryContratoPRAZO: TFloatField
      FieldName = 'PRAZO'
      Origin = 'BASEDADOS.VWCONTRATOEP.PRAZO'
    end
    object qryContratoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRCONTRATO'
    end
    object qryContratoVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRPARCELA'
    end
    object qryContratoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      Origin = 'BASEDADOS.VWCONTRATOEP.TXJUROS'
    end
    object qryContratoVLRPARCELAMES: TFloatField
      FieldName = 'VLRPARCELAMES'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRPARCELAMES'
    end
    object qryContratoVLRPARCATRASO: TFloatField
      FieldName = 'VLRPARCATRASO'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRPARCATRASO'
    end
    object qryContratoVLRDEBITO: TFloatField
      FieldName = 'VLRDEBITO'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRDEBITO'
    end
    object qryContratoVLRRESERVA: TFloatField
      FieldName = 'VLRRESERVA'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRRESERVA'
    end
    object qryContratoVLRSALDODEV: TFloatField
      FieldName = 'VLRSALDODEV'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRSALDODEV'
    end
    object qryContratoVLRPENDENCIA: TFloatField
      FieldName = 'VLRPENDENCIA'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRPENDENCIA'
    end
    object qryContratoVLRSALBASE: TFloatField
      FieldName = 'VLRSALBASE'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRSALBASE'
    end
    object qryContratoVLRMARGEM: TFloatField
      FieldName = 'VLRMARGEM'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRMARGEM'
    end
    object qryContratoVLRMAXPERMIT: TFloatField
      FieldName = 'VLRMAXPERMIT'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRMAXPERMIT'
    end
    object qryContratoDATASALDODEV: TDateTimeField
      FieldName = 'DATASALDODEV'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATASALDODEV'
    end
    object qryContratoDATAPENDENCIA: TDateTimeField
      FieldName = 'DATAPENDENCIA'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATAPENDENCIA'
    end
    object qryContratoFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGSUSPENSAOAUTO'
    end
    object qryContratoIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDTIPOSUSPEMPTMO'
    end
    object qryContratoDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATAINICIOSUSP'
    end
    object qryContratoDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATAFIMSUSP'
    end
    object qryContratoANOSUSPENSAO: TFloatField
      FieldName = 'ANOSUSPENSAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.ANOSUSPENSAO'
    end
    object qryContratoMESSUSPENSAO: TFloatField
      FieldName = 'MESSUSPENSAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.MESSUSPENSAO'
    end
    object qryContratoUSUARIOLIBSUSP: TStringField
      FieldName = 'USUARIOLIBSUSP'
      Origin = 'BASEDADOS.VWCONTRATOEP.USUARIOLIBSUSP'
      Size = 30
    end
    object qryContratoDATALIBSUSP: TDateTimeField
      FieldName = 'DATALIBSUSP'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATALIBSUSP'
    end
    object qryContratoHORALIBSUSP: TStringField
      FieldName = 'HORALIBSUSP'
      Origin = 'BASEDADOS.VWCONTRATOEP.HORALIBSUSP'
      Size = 8
    end
    object qryContratoIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDEMPRESAPROP'
    end
    object qryContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPATRO'
    end
    object qryContratoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPLANOPREV'
    end
    object qryContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDTIPOCONTREMPTMO'
    end
    object qryContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEDESCRICAO'
      Size = 60
    end
    object qryContratoIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPLANOORIGEM'
    end
    object qryContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDTIPOEMPTMO'
    end
    object qryContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPESSOA'
    end
    object qryContratoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDBENEF'
    end
    object qryContratoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCBANCARIA'
    end
    object qryContratoIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCBANCARIADEB'
    end
    object qryContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.VWCONTRATOEP.MOECODIGO'
    end
    object qryContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.VWCONTRATOEP.MATRICULA'
      Size = 15
    end
    object qryContratoMATRICULA_TIT: TStringField
      FieldName = 'MATRICULA_TIT'
      Origin = 'BASEDADOS.VWCONTRATOEP.MATRICULA_TIT'
      Size = 13
    end
    object qryContratoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
      Origin = 'BASEDADOS.VWCONTRATOEP.INSCRICAONUMERO'
    end
    object qryContratoSALPARTICIPACAO: TFloatField
      FieldName = 'SALPARTICIPACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.SALPARTICIPACAO'
    end
    object qryContratoSALMANTIDO: TFloatField
      FieldName = 'SALMANTIDO'
      Origin = 'BASEDADOS.VWCONTRATOEP.SALMANTIDO'
    end
    object qryContratoSALAUXDOENCA: TFloatField
      FieldName = 'SALAUXDOENCA'
      Origin = 'BASEDADOS.VWCONTRATOEP.SALAUXDOENCA'
    end
    object qryContratoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDREGRAMARGEM'
    end
    object qryContratoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDREGRARESERVA'
    end
    object qryContratoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDREGRAELEG'
    end
    object qryContratoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDREGRALIMITES'
    end
    object qryContratoTCEDIASVALIDINSC: TFloatField
      FieldName = 'TCEDIASVALIDINSC'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEDIASVALIDINSC'
    end
    object qryContratoTCEDIASTOLERAINSC: TFloatField
      FieldName = 'TCEDIASTOLERAINSC'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEDIASTOLERAINSC'
    end
    object qryContratoTCEMAXCONTRATO: TFloatField
      FieldName = 'TCEMAXCONTRATO'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEMAXCONTRATO'
    end
    object qryContratoTCEMAXINSCR: TFloatField
      FieldName = 'TCEMAXINSCR'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEMAXINSCR'
    end
    object qryContratoTCEMAXPARC: TFloatField
      FieldName = 'TCEMAXPARC'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEMAXPARC'
    end
    object qryContratoTCEMINPARC: TFloatField
      FieldName = 'TCEMINPARC'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEMINPARC'
    end
    object qryContratoTCEMINQUIT: TFloatField
      FieldName = 'TCEMINQUIT'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEMINQUIT'
    end
    object qryContratoTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEMINRENOVA'
    end
    object qryContratoFLGSEGURO: TStringField
      FieldName = 'FLGSEGURO'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGSEGURO'
      Size = 1
    end
    object qryContratoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDSITPART'
    end
    object qryContratoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryContratoSIT_TITULAR: TStringField
      FieldName = 'SIT_TITULAR'
      Origin = 'BASEDADOS.VWCONTRATOEP.SIT_TITULAR'
      Size = 50
    end
    object qryContratoSITDESCRICAO: TStringField
      FieldName = 'SITDESCRICAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.SITDESCRICAO'
      Size = 50
    end
    object qryContratoIDUSUARIO: TStringField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDUSUARIO'
      Size = 28
    end
    object qryContratoNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Origin = 'BASEDADOS.VWCONTRATOEP.NOME_TITULAR'
      Size = 60
    end
    object qryContratoCPF_TITULAR: TStringField
      FieldName = 'CPF_TITULAR'
      Origin = 'BASEDADOS.VWCONTRATOEP.CPF_TITULAR'
      FixedChar = True
      Size = 18
    end
    object qryContratoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.VWCONTRATOEP.NOME'
      Size = 60
    end
    object qryContratoNOME_MUTUARIO: TStringField
      FieldName = 'NOME_MUTUARIO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NOME_MUTUARIO'
      Size = 60
    end
    object qryContratoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryContratoCPF_MUTUARIO: TStringField
      FieldName = 'CPF_MUTUARIO'
      Origin = 'BASEDADOS.VWCONTRATOEP.CPF_MUTUARIO'
      FixedChar = True
      Size = 18
    end
    object qryContratoTIPOCONTA: TFloatField
      FieldName = 'TIPOCONTA'
    end
    object qryContratoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryContratoNOMEAGENCIA: TStringField
      FieldName = 'NOMEAGENCIA'
      Size = 60
    end
    object qryContratoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryContratoCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryContratoCONTACORRENTEDEB: TStringField
      FieldName = 'CONTACORRENTEDEB'
      Size = 15
    end
    object qryContratoTIPOCONTADEB: TFloatField
      FieldName = 'TIPOCONTADEB'
    end
    object qryContratoNUMAGENCIADEB: TStringField
      FieldName = 'NUMAGENCIADEB'
      FixedChar = True
      Size = 15
    end
    object qryContratoNOMEAGENCIADEB: TStringField
      FieldName = 'NOMEAGENCIADEB'
      Size = 60
    end
    object qryContratoNUMBANCODEB: TStringField
      FieldName = 'NUMBANCODEB'
      Size = 10
    end
  end
  object updDoc: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  VALOR = :VALOR,'
      '  VALORDESCONTO = :VALORDESCONTO,'
      '  VALORJUROS = :VALORJUROS,'
      '  DATAVENCTO = :DATAVENCTO,'
      '  DATAPROGRAMADA = :DATAPROGRAMADA,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  COMPLDOCUMENTO = :COMPLDOCUMENTO,'
      '  CONTALIQUIDO = :CONTALIQUIDO,'
      '  NOME = :NOME,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  CODBANCOFAVORECIDO = :CODBANCOFAVORECIDO,'
      '  NUMAGENCIA = :NUMAGENCIA,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  NUMERO = :NUMERO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  CODESTADO = :CODESTADO,'
      '  CEP = :CEP,'
      '  TIPOMOEDA = :TIPOMOEDA,'
      '  NUMLOTE = :NUMLOTE,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  CODPORTADOR = :CODPORTADOR,'
      '  CODFORMAPAGTO = :CODFORMAPAGTO,'
      '  CODTIPOPAGTO = :CODTIPOPAGTO,'
      '  FLGEMITEAVISO = :FLGEMITEAVISO,'
      '  CODARQUIVOREMESSA = :CODARQUIVOREMESSA,'
      '  IDBANCO = :IDBANCO,'
      '  DMAISALT = :DMAISALT,'
      '  CODFORMAPGTOALT = :CODFORMAPGTOALT,'
      '  VALORMAXIMO = :VALORMAXIMO,'
      '  NOCONTACORR = :NOCONTACORR,'
      '  CODBARRA = :CODBARRA,'
      '  CODBARRAVALOR = :CODBARRAVALOR,'
      '  TIPO = :TIPO,'
      '  NUMEMPRESABANCO = :NUMEMPRESABANCO,'
      '  DEBCRE = :DEBCRE,'
      '  TIPOCONTA = :TIPOCONTA,'
      '  NOMEAGENCIA = :NOMEAGENCIA,'
      '  LIVRE = :LIVRE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO and'
      '  VALOR = :OLD_VALOR and'
      '  VALORDESCONTO = :OLD_VALORDESCONTO and'
      '  VALORJUROS = :OLD_VALORJUROS and'
      '  DATAVENCTO = :OLD_DATAVENCTO and'
      '  DATAPROGRAMADA = :OLD_DATAPROGRAMADA and'
      '  NODOCUMENTO = :OLD_NODOCUMENTO and'
      '  COMPLDOCUMENTO = :OLD_COMPLDOCUMENTO and'
      '  CONTALIQUIDO = :OLD_CONTALIQUIDO and'
      '  NOME = :OLD_NOME and'
      '  RAZAOSOCIAL = :OLD_RAZAOSOCIAL and'
      '  NUMDOCUMENTO = :OLD_NUMDOCUMENTO and'
      '  CONTACORRENTE = :OLD_CONTACORRENTE and'
      '  CODBANCOFAVORECIDO = :OLD_CODBANCOFAVORECIDO and'
      '  NUMAGENCIA = :OLD_NUMAGENCIA and'
      '  LOGRADOURO = :OLD_LOGRADOURO and'
      '  NUMERO = :OLD_NUMERO and'
      '  COMPLEMENTO = :OLD_COMPLEMENTO and'
      '  BAIRRO = :OLD_BAIRRO and'
      '  CIDADE = :OLD_CIDADE and'
      '  CODESTADO = :OLD_CODESTADO and'
      '  CEP = :OLD_CEP and'
      '  TIPOMOEDA = :OLD_TIPOMOEDA and'
      '  NUMLOTE = :OLD_NUMLOTE and'
      '  CODPORTFORMA = :OLD_CODPORTFORMA and'
      '  CODPORTADOR = :OLD_CODPORTADOR and'
      '  CODFORMAPAGTO = :OLD_CODFORMAPAGTO and'
      '  CODTIPOPAGTO = :OLD_CODTIPOPAGTO and'
      '  FLGEMITEAVISO = :OLD_FLGEMITEAVISO and'
      '  CODARQUIVOREMESSA = :OLD_CODARQUIVOREMESSA and'
      '  IDBANCO = :OLD_IDBANCO and'
      '  DMAISALT = :OLD_DMAISALT and'
      '  CODFORMAPGTOALT = :OLD_CODFORMAPGTOALT and'
      '  VALORMAXIMO = :OLD_VALORMAXIMO and'
      '  NOCONTACORR = :OLD_NOCONTACORR and'
      '  CODBARRA = :OLD_CODBARRA and'
      '  CODBARRAVALOR = :OLD_CODBARRAVALOR and'
      '  TIPO = :OLD_TIPO and'
      '  NUMEMPRESABANCO = :OLD_NUMEMPRESABANCO and'
      '  DEBCRE = :OLD_DEBCRE and'
      '  TIPOCONTA = :OLD_TIPOCONTA and'
      '  NOMEAGENCIA = :OLD_NOMEAGENCIA and'
      '  LIVRE = :OLD_LIVRE')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDPESSOA, IDFORCLI, CODDOCUMENTO, VALOR, VALORDESCONTO, '
      'VALORJUROS, '
      '   DATAVENCTO, DATAPROGRAMADA, NODOCUMENTO, COMPLDOCUMENTO, '
      'CONTALIQUIDO, '
      '   NOME, RAZAOSOCIAL, NUMDOCUMENTO, CONTACORRENTE, '
      'CODBANCOFAVORECIDO, '
      '   NUMAGENCIA, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, '
      'CODESTADO, '
      '   CEP, TIPOMOEDA, NUMLOTE, CODPORTFORMA, CODPORTADOR, '
      'CODFORMAPAGTO, CODTIPOPAGTO, '
      '   FLGEMITEAVISO, CODARQUIVOREMESSA, IDBANCO, DMAISALT, '
      'CODFORMAPGTOALT, '
      '   VALORMAXIMO, NOCONTACORR, CODBARRA, CODBARRAVALOR, TIPO, '
      'NUMEMPRESABANCO, '
      '   DEBCRE, TIPOCONTA, NOMEAGENCIA, LIVRE)'
      'values'
      '  (:IDPESSOA, :IDFORCLI, :CODDOCUMENTO, :VALOR, :VALORDESCONTO, '
      ':VALORJUROS, '
      '   :DATAVENCTO, :DATAPROGRAMADA, :NODOCUMENTO, '
      ':COMPLDOCUMENTO, :CONTALIQUIDO, '
      '   :NOME, :RAZAOSOCIAL, :NUMDOCUMENTO, :CONTACORRENTE, '
      ':CODBANCOFAVORECIDO, '
      '   :NUMAGENCIA, :LOGRADOURO, :NUMERO, :COMPLEMENTO, :BAIRRO, '
      ':CIDADE, :CODESTADO, '
      '   :CEP, :TIPOMOEDA, :NUMLOTE, :CODPORTFORMA, :CODPORTADOR, '
      ':CODFORMAPAGTO, '
      '   :CODTIPOPAGTO, :FLGEMITEAVISO, :CODARQUIVOREMESSA, :IDBANCO, '
      ':DMAISALT, '
      '   :CODFORMAPGTOALT, :VALORMAXIMO, :NOCONTACORR, :CODBARRA, '
      ':CODBARRAVALOR, '
      '   :TIPO, :NUMEMPRESABANCO, :DEBCRE, :TIPOCONTA, :NOMEAGENCIA, '
      ':LIVRE)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO and'
      '  VALOR = :OLD_VALOR and'
      '  VALORDESCONTO = :OLD_VALORDESCONTO and'
      '  VALORJUROS = :OLD_VALORJUROS and'
      '  DATAVENCTO = :OLD_DATAVENCTO and'
      '  DATAPROGRAMADA = :OLD_DATAPROGRAMADA and'
      '  NODOCUMENTO = :OLD_NODOCUMENTO and'
      '  COMPLDOCUMENTO = :OLD_COMPLDOCUMENTO and'
      '  CONTALIQUIDO = :OLD_CONTALIQUIDO and'
      '  NOME = :OLD_NOME and'
      '  RAZAOSOCIAL = :OLD_RAZAOSOCIAL and'
      '  NUMDOCUMENTO = :OLD_NUMDOCUMENTO and'
      '  CONTACORRENTE = :OLD_CONTACORRENTE and'
      '  CODBANCOFAVORECIDO = :OLD_CODBANCOFAVORECIDO and'
      '  NUMAGENCIA = :OLD_NUMAGENCIA and'
      '  LOGRADOURO = :OLD_LOGRADOURO and'
      '  NUMERO = :OLD_NUMERO and'
      '  COMPLEMENTO = :OLD_COMPLEMENTO and'
      '  BAIRRO = :OLD_BAIRRO and'
      '  CIDADE = :OLD_CIDADE and'
      '  CODESTADO = :OLD_CODESTADO and'
      '  CEP = :OLD_CEP and'
      '  TIPOMOEDA = :OLD_TIPOMOEDA and'
      '  NUMLOTE = :OLD_NUMLOTE and'
      '  CODPORTFORMA = :OLD_CODPORTFORMA and'
      '  CODPORTADOR = :OLD_CODPORTADOR and'
      '  CODFORMAPAGTO = :OLD_CODFORMAPAGTO and'
      '  CODTIPOPAGTO = :OLD_CODTIPOPAGTO and'
      '  FLGEMITEAVISO = :OLD_FLGEMITEAVISO and'
      '  CODARQUIVOREMESSA = :OLD_CODARQUIVOREMESSA and'
      '  IDBANCO = :OLD_IDBANCO and'
      '  DMAISALT = :OLD_DMAISALT and'
      '  CODFORMAPGTOALT = :OLD_CODFORMAPGTOALT and'
      '  VALORMAXIMO = :OLD_VALORMAXIMO and'
      '  NOCONTACORR = :OLD_NOCONTACORR and'
      '  CODBARRA = :OLD_CODBARRA and'
      '  CODBARRAVALOR = :OLD_CODBARRAVALOR and'
      '  TIPO = :OLD_TIPO and'
      '  NUMEMPRESABANCO = :OLD_NUMEMPRESABANCO and'
      '  DEBCRE = :OLD_DEBCRE and'
      '  TIPOCONTA = :OLD_TIPOCONTA and'
      '  NOMEAGENCIA = :OLD_NOMEAGENCIA and'
      '  LIVRE = :OLD_LIVRE')
    Left = 57
    Top = 113
  end
  object dlgCaminho: TProcuraDirDlg
    Caption = 'Seleção de Caminho'
    Directory = 
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0
    Folder = foCustom
    ShowPath = False
    Title = 
      'Navegue na árvore de pastas e selecione o caminho desejado para ' +
      'gravação dos arquivos.'
    Left = 561
    Top = 322
  end
  object qryDocFuncef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DOC.CODDOCUMENTO,'
      '   DOC.IDPESSOA,'
      '   DOC.CODPORTFORMA,'
      '   DOC.IDFORCLI,'
      ''
      '   DOC.IDMODULO,'
      '   DOC.RECPAG,'
      '   DOC.NODOCUMENTO,'
      '   DOC.COMPLDOCUMENTO,'
      '   DOC.DATAVENCTO,'
      
        '   DECODE(DOC.STATUS, '#39'0'#39', '#39'Em Aberto'#39', '#39'2'#39', '#39'Pago'#39', '#39#39') AS STAT' +
        'US_DOC,'
      ''
      '   DOC.OPERACAO,'
      '   DOC.NUMAPGR,'
      ''
      '   PFO.DESCRICAO AS PORTADORFORMA,'
      ''
      '   LDC.VALOR,'
      ''
      '   PBA.NOME,'
      '   '#39'104'#39' AS NUMBANCO'
      ''
      'FROM'
      '   PESSOA        PBA,'
      '   DOCUMENTO     DOC,'
      '   ('
      '   SELECT'
      '      LAN.CODDOCUMENTO,'
      '      LAN.NUMLANCTO,'
      '      LAN.VALOR,'
      '      LAN.DEBCRE,'
      '      LAN.OPERACAO,'
      '      LAN.HISTORICOCOMPL'
      '   FROM'
      '      LANCTODOCUM LAN'
      '   WHERE'
      '      LTRIM(RTRIM(LAN.OPERACAO)) = '#39'2'#39
      '   ) LDC,'
      ''
      '   PORTADORFORMA PFO'
      'WHERE'
      '       DOC.IDMODULO     = 15'
      '   AND DOC.RECPAG       = '#39'P'#39
      '   AND DOC.DATAVENCTO   BETWEEN :PDATAINI AND :PDATAFIM'
      
        '   AND ((:PCODPORTFORMA IS NULL) OR (DOC.CODPORTFORMA =:PCODPORT' +
        'FORMA))'
      '   AND DOC.CODDOCUMENTO = LDC.CODDOCUMENTO'
      '   AND DOC.CODPORTFORMA = PFO.CODPORTFORMA'
      '   AND DOC.IDFORCLI     = PBA.IDPESSOA')
    ValidateWithMask = True
    Left = 128
    Top = 216
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object FloatField2: TFloatField
      FieldName = 'IDPESSOA'
    end
    object FloatField3: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object FloatField4: TFloatField
      FieldName = 'IDFORCLI'
    end
    object FloatField5: TFloatField
      FieldName = 'IDMODULO'
    end
    object StringField1: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object FloatField6: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object StringField2: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object StringField3: TStringField
      FieldName = 'STATUS_DOC'
      Size = 9
    end
    object StringField4: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 2
    end
    object FloatField7: TFloatField
      FieldName = 'NUMAPGR'
    end
    object StringField5: TStringField
      FieldName = 'PORTADORFORMA'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object StringField7: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryDocFuncefVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
  end
  object cdsTxt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 404
    Top = 199
    object cdsTxtIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsTxtIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object cdsTxtCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object cdsTxtVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsTxtVALORDESCONTO: TFloatField
      FieldName = 'VALORDESCONTO'
    end
    object cdsTxtVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
    end
    object cdsTxtDATAVENCTO: TStringField
      FieldName = 'DATAVENCTO'
      FixedChar = True
      Size = 10
    end
    object cdsTxtDATAPROGRAMADA: TStringField
      FieldName = 'DATAPROGRAMADA'
      FixedChar = True
      Size = 10
    end
    object cdsTxtNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object cdsTxtCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object cdsTxtCONTALIQUIDO: TStringField
      FieldName = 'CONTALIQUIDO'
      FixedChar = True
      Size = 18
    end
    object cdsTxtNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 50
    end
    object cdsTxtRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      FixedChar = True
      Size = 50
    end
    object cdsTxtNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object cdsTxtCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      FixedChar = True
      Size = 15
    end
    object cdsTxtCODBANCOFAVORECIDO: TStringField
      FieldName = 'CODBANCOFAVORECIDO'
      FixedChar = True
      Size = 10
    end
    object cdsTxtNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object cdsTxtLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      FixedChar = True
      Size = 50
    end
    object cdsTxtNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 8
    end
    object cdsTxtCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      FixedChar = True
    end
    object cdsTxtBAIRRO: TStringField
      FieldName = 'BAIRRO'
      FixedChar = True
    end
    object cdsTxtCIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
    end
    object cdsTxtCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object cdsTxtCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object cdsTxtTIPOMOEDA: TFloatField
      FieldName = 'TIPOMOEDA'
    end
    object cdsTxtNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
    object cdsTxtCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object cdsTxtCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
    end
    object cdsTxtCODFORMAPAGTO: TFloatField
      FieldName = 'CODFORMAPAGTO'
    end
    object cdsTxtCODTIPOPAGTO: TFloatField
      FieldName = 'CODTIPOPAGTO'
    end
    object cdsTxtFLGEMITEAVISO: TStringField
      FieldName = 'FLGEMITEAVISO'
      FixedChar = True
      Size = 1
    end
    object cdsTxtCODARQUIVOREMESSA: TFloatField
      FieldName = 'CODARQUIVOREMESSA'
    end
    object cdsTxtIDBANCO: TFloatField
      FieldName = 'IDBANCO'
    end
    object cdsTxtNOCONTACORR: TStringField
      FieldName = 'NOCONTACORR'
      FixedChar = True
      Size = 15
    end
    object cdsTxtCODBARRA: TStringField
      FieldName = 'CODBARRA'
      FixedChar = True
      Size = 10
    end
    object cdsTxtCODBARRAVALOR: TStringField
      FieldName = 'CODBARRAVALOR'
      FixedChar = True
      Size = 10
    end
    object cdsTxtTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsTxtNUMEMPRESABANCO: TStringField
      FieldName = 'NUMEMPRESABANCO'
      FixedChar = True
    end
    object cdsTxtDEBCRE: TStringField
      FieldName = 'DEBCRE'
      FixedChar = True
      Size = 1
    end
    object cdsTxtTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      FixedChar = True
      Size = 1
    end
    object cdsTxtNOMEAGENCIA: TStringField
      FieldName = 'NOMEAGENCIA'
      FixedChar = True
      Size = 7
    end
    object cdsTxtLIVRE: TStringField
      FieldName = 'LIVRE'
      FixedChar = True
      Size = 25
    end
    object cdsTxtDMAISALT: TFloatField
      FieldName = 'DMAISALT'
    end
    object cdsTxtCODFORMAPGTOALT: TFloatField
      FieldName = 'CODFORMAPGTOALT'
    end
    object cdsTxtVALORMAXIMO: TFloatField
      FieldName = 'VALORMAXIMO'
    end
  end
  object dsp: TDataSetProvider
    DataSet = qryDocTXT
    Constraints = True
    ResolveToDataSet = True
    Left = 340
    Top = 199
  end
  object qryDuplicadoFuncef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DOC.DATAEMISSAO,'
      '   DOC.CONTROLEREMESSA,'
      '   DOC.CODDOCUMENTO,'
      '   DOC.IDPESSOA,'
      '   DOC.CODPORTFORMA,'
      '   DOC.IDFORCLI,'
      ''
      '   DOC.IDMODULO,'
      '   DOC.RECPAG,'
      '   DOC.NODOCUMENTO,'
      '   DOC.COMPLDOCUMENTO,'
      '   DOC.DATAVENCTO,'
      
        '   DECODE(DOC.STATUS, '#39'0'#39', '#39'Em Aberto'#39', '#39'2'#39', '#39'Pago'#39', '#39#39') AS STAT' +
        'US_DOC,'
      ''
      '   DOC.OPERACAO,'
      '   DOC.NUMAPGR,'
      ''
      '   PFO.DESCRICAO AS PORTADORFORMA,'
      ''
      '   LDC.VALOR,'
      ''
      '   PBA.NOME,'
      '   '#39'104'#39' AS NUMBANCO'
      ''
      'FROM'
      '   PESSOA        PBA,'
      '   DOCUMENTO     DOC,'
      '   ('
      '   SELECT'
      '      LAN.CODDOCUMENTO,'
      '      LAN.NUMLANCTO,'
      '      LAN.VALOR,'
      '      LAN.DEBCRE,'
      '      LAN.OPERACAO,'
      '      LAN.HISTORICOCOMPL'
      '   FROM'
      '      LANCTODOCUM LAN'
      '   WHERE'
      '      LTRIM(RTRIM(LAN.OPERACAO)) = '#39'2'#39
      '   ) LDC,'
      ''
      '   PORTADORFORMA PFO'
      'WHERE'
      '       DOC.IDMODULO     = 15'
      '   AND DOC.RECPAG       = '#39'P'#39
      '   AND DOC.DATAVENCTO   BETWEEN :PDATAINI AND :PDATAFIM'
      
        '   AND ((:PCODPORTFORMA IS NULL) OR (DOC.CODPORTFORMA =:PCODPORT' +
        'FORMA))'
      '   AND DOC.EMISBLOQ = '#39'S'#39
      '   AND DOC.CODDOCUMENTO = LDC.CODDOCUMENTO'
      '   AND DOC.CODPORTFORMA = PFO.CODPORTFORMA'
      '   AND DOC.IDFORCLI     = PBA.IDPESSOA')
    ValidateWithMask = True
    Left = 216
    Top = 232
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end>
    object FloatField8: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object FloatField9: TFloatField
      FieldName = 'IDPESSOA'
    end
    object FloatField10: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object FloatField11: TFloatField
      FieldName = 'IDFORCLI'
    end
    object FloatField12: TFloatField
      FieldName = 'IDMODULO'
    end
    object StringField8: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object FloatField13: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object StringField9: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object StringField10: TStringField
      FieldName = 'STATUS_DOC'
      Size = 9
    end
    object StringField11: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 2
    end
    object FloatField14: TFloatField
      FieldName = 'NUMAPGR'
    end
    object StringField12: TStringField
      FieldName = 'PORTADORFORMA'
      Size = 50
    end
    object StringField13: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object StringField14: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object FloatField15: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryDuplicadoFuncefDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryDuplicadoFuncefCONTROLEREMESSA: TFloatField
      FieldName = 'CONTROLEREMESSA'
    end
  end
  object qryDuplicadoOutros: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DOC.DATAEMISSAO,'
      '   DOC.CONTROLEREMESSA,'
      '   DOC.CODDOCUMENTO,'
      '   DOC.IDPESSOA,'
      '   DOC.CODPORTFORMA,'
      '   DOC.IDFORCLI,'
      ''
      '   DOC.IDMODULO,'
      '   DOC.RECPAG,'
      '   DOC.NODOCUMENTO,'
      '   DOC.COMPLDOCUMENTO,'
      '   DOC.DATAVENCTO,'
      
        '   DECODE(DOC.STATUS, '#39'0'#39', '#39'Em Aberto'#39', '#39'2'#39', '#39'Pago'#39', '#39#39') AS STAT' +
        'US_DOC,'
      ''
      '   DOC.OPERACAO,'
      '   DOC.NUMAPGR,'
      ''
      '   PFO.DESCRICAO AS PORTADORFORMA,'
      ''
      '   LDC.VALOR,'
      ''
      '   PBA.NOME,'
      '   BAN.NUMBANCO'
      ''
      'FROM'
      '   PESSOA        PBA,'
      '   DOCUMENTO     DOC,'
      '   ('
      '   SELECT'
      '      LAN.CODDOCUMENTO,'
      '      LAN.NUMLANCTO,'
      '      LAN.VALOR,'
      '      LAN.DEBCRE,'
      '      LAN.OPERACAO,'
      '      LAN.HISTORICOCOMPL'
      '   FROM'
      '      LANCTODOCUM LAN'
      '   WHERE'
      '      LTRIM(RTRIM(LAN.OPERACAO)) = '#39'2'#39
      '   ) LDC,'
      '   PORTADORFORMA PFO,'
      '   BANCO         BAN'
      ''
      'WHERE'
      '       DOC.IDMODULO     = 15'
      '   AND DOC.RECPAG       = '#39'P'#39
      '   AND DOC.DATAVENCTO   BETWEEN :PDATAINI AND :PDATAFIM'
      
        '   AND ((:PCODPORTFORMA IS NULL) OR (DOC.CODPORTFORMA =:PCODPORT' +
        'FORMA))'
      '   AND DOC.EMISBLOQ = '#39'S'#39
      '   AND DOC.CODDOCUMENTO = LDC.CODDOCUMENTO'
      '   AND DOC.CODPORTFORMA = PFO.CODPORTFORMA'
      '   AND DOC.IDFORCLI     = BAN.IDPESSOA'
      '   AND BAN.IDPESSOA     = PBA.IDPESSOA')
    ValidateWithMask = True
    Left = 208
    Top = 296
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end>
    object FloatField16: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object FloatField17: TFloatField
      FieldName = 'IDPESSOA'
    end
    object FloatField18: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object FloatField19: TFloatField
      FieldName = 'IDFORCLI'
    end
    object FloatField20: TFloatField
      FieldName = 'IDMODULO'
    end
    object StringField15: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object FloatField21: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object StringField16: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object StringField17: TStringField
      FieldName = 'STATUS_DOC'
      Size = 9
    end
    object StringField18: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 2
    end
    object FloatField22: TFloatField
      FieldName = 'NUMAPGR'
    end
    object StringField19: TStringField
      FieldName = 'PORTADORFORMA'
      Size = 50
    end
    object StringField20: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object StringField21: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object FloatField23: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryDuplicadoOutrosDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryDuplicadoOutrosCONTROLEREMESSA: TFloatField
      FieldName = 'CONTROLEREMESSA'
    end
  end
  object dtsDuplicado: TwwDataSource
    DataSet = qryDuplicadoOutros
    Left = 360
    Top = 264
  end
end
