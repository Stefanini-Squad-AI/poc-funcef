inherited frmCancEnvio: TfrmCancEnvio
  Left = 285
  Top = 24
  HelpContext = 150010
  Caption = 'Desfazer Envio'
  ClientHeight = 469
  ClientWidth = 632
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 632
    Height = 436
    inherited pgcControle: TPageControl
      Width = 632
      Height = 403
      inherited TabSheet1: TTabSheet
        Caption = 'Desfazer Envio [Seleção]'
        object Label1: TLabel
          Left = 16
          Top = 42
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label3: TLabel
          Left = 320
          Top = 42
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label7: TLabel
          Left = 16
          Top = 361
          Width = 111
          Height = 13
          Caption = 'Cód. Documento:   '
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 80
          Height = 169
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Height = 145
          end
          inherited btnInvertePatro: TBitBtn
            OnClick = molListaPatrobtnInvertePatroClick
          end
          inherited btnMarcaTodosPatro: TBitBtn
            OnClick = molListaPatrobtnMarcaTodosPatroClick
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 312
          Top = 80
          Width = 305
          Height = 97
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Height = 81
          end
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Width = 609
          inherited edtNome: TEdit
            Width = 353
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 56
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
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 320
          Top = 56
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
          LookupTable = dtmLookEmptmo.qryLookTipoContr
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
        object grpRecebimento: TGroupBox
          Left = 16
          Top = 248
          Width = 345
          Height = 61
          Caption = ' Enviados para: '
          TabOrder = 6
          object chkFolhaPatro: TCheckBox
            Left = 16
            Top = 16
            Width = 161
            Height = 17
            Caption = 'Folha da Patrocinadora'
            TabOrder = 0
          end
          object chkFolhaBenef: TCheckBox
            Left = 16
            Top = 36
            Width = 161
            Height = 17
            Caption = 'Folha de Benefícios'
            TabOrder = 1
          end
          object chkCaP: TCheckBox
            Left = 184
            Top = 16
            Width = 153
            Height = 17
            Caption = 'Financeiro (a Pagar)'
            TabOrder = 2
          end
          object chkCaR: TCheckBox
            Left = 184
            Top = 36
            Width = 153
            Height = 17
            Caption = 'Financeiro (a Receber)'
            TabOrder = 3
          end
        end
        object grpDataEfetiva: TGroupBox
          Left = 368
          Top = 301
          Width = 241
          Height = 49
          Caption = ' Data de Vencimento entre: '
          TabOrder = 9
          object Label4: TLabel
            Left = 116
            Top = 22
            Width = 8
            Height = 13
            Caption = 'e'
          end
          object edtDataVenctoIni: TwwDBDateTimePicker
            Left = 16
            Top = 18
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
          object edtDataVenctoFim: TwwDBDateTimePicker
            Left = 128
            Top = 18
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
        object Panel2: TPanel
          Left = 320
          Top = 184
          Width = 289
          Height = 57
          TabOrder = 5
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
        object GroupBox1: TGroupBox
          Left = 368
          Top = 248
          Width = 241
          Height = 49
          Caption = ' Data de Envio entre: '
          TabOrder = 8
          object Label2: TLabel
            Left = 116
            Top = 22
            Width = 8
            Height = 13
            Caption = 'e'
          end
          object edtDataEnvioIni: TwwDBDateTimePicker
            Left = 16
            Top = 18
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
          object edtDataEnvioFim: TwwDBDateTimePicker
            Left = 128
            Top = 18
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
        inline molUsuario: TmolUsuario
          Left = 8
          Top = 312
          Width = 353
          TabOrder = 7
          inherited Label5: TLabel
            Width = 271
            Caption = 'Usuário Responsável pelo Envio para CaP/CaR'
          end
          inherited edtUsuario: TEdit
            Width = 297
          end
          inherited btnBuscaUsuario: TBitBtn
            Left = 304
            OnClick = molUsuariobtnBuscaUsuarioClick
          end
          inherited btnLimpaUsuario: TBitBtn
            Left = 328
          end
        end
        object edtCodDocumento: TEdit
          Left = 120
          Top = 357
          Width = 121
          Height = 21
          Color = 12648447
          TabOrder = 10
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Desfazer Envio [Resultado]'
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 593
          Height = 135
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 1
        end
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
        object memErro: TMemo
          Left = 16
          Top = 210
          Width = 593
          Height = 135
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 3
        end
        object Panel4: TPanel
          Left = 16
          Top = 184
          Width = 593
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Ocorrências'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    inherited Panel1: TPanel
      Width = 632
      inherited fcLabel1: TfcLabel
        Width = 253
        Caption = 'Desfazer Envio [Seleção]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 436
    Width = 632
    inherited tb97Fundo: TToolbar97
      Left = 460
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 166
      inherited ToolbarSep973: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
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
      '   HME.HMERECPAG, HME.HMEFORMACOBRANCA, HME.HMETIPOFOLHA,'
      ''
      '   HME.HMESEQCOBRANCA,'
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
      '   AND ( HME.HMEANOCOBRANCA      =:PHMEANOCOBRANCA )'
      '   AND ( HME.HMEMESCOBRANCA      =:PHMEMESCOBRANCA )'
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
        ' 0 ) )'
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 232
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
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
    object qryHistMovHMETIPOFOLHA: TStringField
      FieldName = 'HMETIPOFOLHA'
      FixedChar = True
      Size = 1
    end
  end
  object qryTmpDesc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TMP.IDTMPDESC,'
      ''
      '   TMP.MESCOBRANCA, TMP.MESREFERENCIA,'
      '   TMP.FLGDESCFOLHA,'
      '   TMP.SITENVIO,'
      '   TMP.IDDESCONTO,'
      '   TMP.ORDEM, TMP.IDHISTMOVEMPTMO,'
      ''
      '   ROUND(NVL(TMP.VALOR, 0), 2)         AS VALOR,'
      '   ROUND(NVL(TMP.VALORRECEBIDO, 0), 2) AS VALORRECEBIDO,'
      '   TMP.DATARECEBIMENTO,'
      ''
      '   TMP.FLGTIPODESC,'
      '   TMP.FLGATRASODEVOL,'
      ''
      '   TMP.IDPROVENTO, TMP.CODPROVDESC,'
      ''
      '   TMP.MATRICULA, TMP.INSCRICAONUMERO,'
      '   TMP.IDTITULAR, TMP.IDPESSOA,'
      ''
      '   TMP.IDPESSJUR, TMP.IDPLANOPREV,'
      '   TMP.IDLOTE,'
      '   TMP.LOTEPREVIA,'
      ''
      '   TMP.NUMPRIORIDADE,'
      '   TMP.DESCRICAO,'
      ''
      '   TMP.DATAREFERENCIA, TMP.REFERENCIA,'
      '   TMP.DATACOBRANCA,'
      '   TMP.FLGDESCONTO,'
      ''
      '   TMP.RECPAG,'
      '   TMP.IDMODULO,'
      '   TMP.SISTORIGEM,'
      '   TMP.IDMOTIVO,'
      '   TMP.IDEMPRESAPROP,'
      '   TMP.IDEMPRESA,'
      '   TMP.IDFUNDACAO,'
      ''
      '   TMP.SEQPROPOSTA,'
      '   TMP.NODOCUMENTO, TMP.COMPLDOCUMENTO,'
      ''
      '   CON.FLGSITUACAO,'
      '   CON.IDTIPOCONTREMPTMO'
      ''
      'FROM'
      '   TMPDESC         TMP,'
      '   CONTRATOEMPTMO  CON,'
      '   TIPOCONTREMPTMO TCE'
      ''
      'WHERE'
      '       TMP.IDEMPRESAPROP      =:PIDEMPRESAPROP'
      '   AND TMP.IDMODULO           IN (15, 32)'
      ''
      '   AND (TMP.SITENVIO          IN ('#39'1'#39', '#39'2'#39', '#39'X'#39'))'
      ''
      
        '   AND ( (:PCRITICA           IS NULL) OR ( (:PCRITICA IS NOT NU' +
        'LL) AND (TMP.SITENVIO =:PCRITICA) ) )'
      ''
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
      
        '   AND ( (:PIDTIPOEMPTMO      IS NULL) OR (TCE.IDTIPOEMPTMO     ' +
        '  =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (CON.IDTIPOCONTREMPTMO' +
        '  =:PIDTIPOCONTREMPTMO) )'
      ''
      
        '   AND ( (:PIDPESSOA          IS NULL) OR (TMP.IDPESSOA  =:PIDPE' +
        'SSOA) )'
      
        '   AND ( (:PIDDESCONTO        IS NULL) OR ((TMP.IDDESCONTO =:PID' +
        'DESCONTO) AND (CON.IDCONTRATOEMPTMO =:PIDDESCONTO)) )'
      ''
      
        '   AND (:PHMEDATAEFETIVAINI   IS NULL OR DATARECEBIMENTO  >=:PHM' +
        'EDATAEFETIVAINI)'
      
        '   AND (:PHMEDATAEFETIVAFIM   IS NULL OR DATARECEBIMENTO  <=:PHM' +
        'EDATAEFETIVAFIM)'
      ''
      '   AND TMP.VALORRECEBIDO      IS NOT NULL'
      ''
      '   AND TMP.IDDESCONTO         = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      ''
      'ORDER BY'
      '   TMP.IDDESCONTO, TMP.MESREFERENCIA, TMP.IDPROVENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCRITICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCRITICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCRITICA'
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
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAFIM'
        ParamType = ptInput
      end>
    object qryTmpDescMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescFLGDESCFOLHA: TStringField
      FieldName = 'FLGDESCFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescSITENVIO: TStringField
      FieldName = 'SITENVIO'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryTmpDescORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object qryTmpDescVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryTmpDescVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
    end
    object qryTmpDescDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
    end
    object qryTmpDescFLGTIPODESC: TStringField
      FieldName = 'FLGTIPODESC'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescFLGATRASODEVOL: TStringField
      FieldName = 'FLGATRASODEVOL'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryTmpDescCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryTmpDescMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryTmpDescINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryTmpDescIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryTmpDescIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryTmpDescIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryTmpDescIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryTmpDescIDLOTE: TFloatField
      FieldName = 'IDLOTE'
    end
    object qryTmpDescLOTEPREVIA: TFloatField
      FieldName = 'LOTEPREVIA'
    end
    object qryTmpDescNUMPRIORIDADE: TFloatField
      FieldName = 'NUMPRIORIDADE'
    end
    object qryTmpDescDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object qryTmpDescDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
    end
    object qryTmpDescREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object qryTmpDescDATACOBRANCA: TDateTimeField
      FieldName = 'DATACOBRANCA'
    end
    object qryTmpDescFLGDESCONTO: TFloatField
      FieldName = 'FLGDESCONTO'
    end
    object qryTmpDescRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryTmpDescIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
    end
    object qryTmpDescIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryTmpDescIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryTmpDescIDFUNDACAO: TFloatField
      FieldName = 'IDFUNDACAO'
    end
    object qryTmpDescSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryTmpDescNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryTmpDescCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryTmpDescFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryTmpDescIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryTmpDescIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
    object qryTmpDescSISTORIGEM: TFloatField
      FieldName = 'SISTORIGEM'
    end
  end
  object qryItensCaPCaR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   HME.IDCONTRATOEMPTMO, HME.CODDOCUMENTO, HME.HMETIPOMOV,'
      
        '   ROUND(SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))), 2) AS VLR_PREVIST' +
        'O_DOC,'
      '   HME.HMEDATAVENCTO,'
      '   CON.IDPATRO, CON.IDPLANOPREV, '
      '   '#39' '#39' AS FLGAPAGA '
      'FROM '
      '   HISTMOVEMPTMO   HME, '
      '   DOCUMENTO       DOC, '
      '   CONTRATOEMPTMO  CON, '
      '   TIPOCONTREMPTMO TCE, '
      '   TIPOEMPTMO      TEP '
      'WHERE '
      '       TEP.IDEMPRESAPROP           = 1'
      '   AND CON.IDPATRO                 IN (91008, 1) '
      '   AND CON.IDPLANOPREV             IN (19, 66, 2) '
      '   AND DOC.RECPAG                  = '#39'R'#39
      '   AND LTRIM(RTRIM(DOC.STATUS))   <> '#39'2'#39' '
      '   AND HME.HMEANOCOBRANCA          = 2004'
      '   AND HME.HMEMESCOBRANCA          = 08'
      '   AND NVL(HME.FLGBAIXADO, 0)      = 0 '
      '   AND HME.FLGENVIO                IS NULL '
      '   AND HME.HMETIPOMOV              NOT IN (5, 8) '
      '   AND HME.HMEVLREFETIVO           IS NULL '
      '   AND HME.HMEDATAEFETIVA          IS NULL '
      
        '   AND (HME.HMECENTRALIZA          = 1      OR HME.HMEDESTACADO ' +
        '       = 1) '
      '   AND HME.IDCONTRATOEMPTMO        = 258921034933'
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '
      '   AND HME.CODDOCUMENTO          = DOC.CODDOCUMENTO '
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO '
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO '
      'GROUP BY'
      
        '   HME.IDCONTRATOEMPTMO, HME.CODDOCUMENTO, HME.HMETIPOMOV, HME.H' +
        'MEDATAVENCTO,'
      '   CON.IDPATRO, CON.IDPLANOPREV')
    ValidateWithMask = True
    Left = 232
    Top = 232
    object qryItensCaPCaRIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensCaPCaRCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryItensCaPCaRHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryItensCaPCaRVLR_PREVISTO_DOC: TFloatField
      FieldName = 'VLR_PREVISTO_DOC'
    end
    object qryItensCaPCaRHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryItensCaPCaRIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryItensCaPCaRIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryItensCaPCaRFLGAPAGA: TStringField
      FieldName = 'FLGAPAGA'
      FixedChar = True
      Size = 1
    end
  end
  object qryContratoUnico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select count(DISTINCT(ha.idcontratoemptmo)) AS QUANT'
      'from hmeenvio he'
      'inner join hmeall ha on he.idhistmovemptmo = ha.idhistmovemptmo'
      'where coddocumento = :PCODDOCUMENTO')
    ValidateWithMask = True
    Left = 56
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryContratoUnicoQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDCONTRATOEMPTMO'
    end
  end
end
