inherited frmExecCalculaSegCompl: TfrmExecCalculaSegCompl
  Left = 154
  Top = 231
  HelpContext = 150038
  Caption = 'Calcula Seguro Complementar'
  ClientHeight = 399
  ClientWidth = 686
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 686
    Height = 366
    object ntbCalculo: TNotebook
      Left = 0
      Top = 0
      Width = 686
      Height = 366
      Align = alClient
      PageIndex = 1
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Principal'
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 685
          Height = 257
          Selected.Strings = (
            'IDCONTRATOEMPTMO'#9'15'#9'Contrato'
            'MUTUARIO'#9'50'#9'Mutuário'
            'MATRICULA'#9'15'#9'Matrícula'#9'F'
            'VALOR'#9'10'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsResult
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Resultado'
        inline MolListaTipoContr1: TMolListaTipoContr
          Left = 8
          Top = 56
          Width = 673
          Height = 185
          TabOrder = 1
          inherited Label6: TLabel
            Width = 96
          end
          inherited lstTipoContr: TCheckListBox
            Width = 649
            Height = 153
          end
          inherited btnInverte: TBitBtn
            Left = 615
            Top = 15
          end
          inherited btnMarcaTodos: TBitBtn
            Left = 636
            Top = 15
          end
          inherited qry: TwwQuery
            Top = 48
          end
        end
        object rgFormaCobranca: TRadioGroup
          Left = 16
          Top = 243
          Width = 177
          Height = 108
          Caption = ' Forma de Cobrança '
          ItemIndex = 0
          Items.Strings = (
            'Manter Forma Original'
            'Folha de Benefícios'
            'Financeiro')
          TabOrder = 0
        end
        object Panel1: TPanel
          Left = 208
          Top = 248
          Width = 459
          Height = 104
          TabOrder = 2
          object Label15: TLabel
            Left = 16
            Top = 12
            Width = 95
            Height = 13
            Caption = 'Início (mês/ano)'
          end
          object Label1: TLabel
            Left = 240
            Top = 12
            Width = 81
            Height = 13
            Caption = 'Fim (mês/ano)'
          end
          object Label2: TLabel
            Left = 16
            Top = 56
            Width = 116
            Height = 13
            Caption = 'Cobrança (mês/ano)'
          end
          object Label5: TLabel
            Left = 240
            Top = 56
            Width = 97
            Height = 13
            Caption = 'Data lançamento'
          end
          object DBspnAnoIni: TwwDBSpinEdit
            Left = 160
            Top = 26
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMesIni: TComboBox
            Left = 16
            Top = 26
            Width = 145
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
          object cboMesFIm: TComboBox
            Left = 240
            Top = 26
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
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
          object DBSpnAnoFim: TwwDBSpinEdit
            Left = 384
            Top = 26
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object cboMesCob: TComboBox
            Left = 16
            Top = 70
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 4
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
          object spnAnoCob: TwwDBSpinEdit
            Left = 160
            Top = 70
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 5
            UnboundDataType = wwDefault
          end
          object edtDatalancto: TwwDBDateTimePicker
            Left = 240
            Top = 70
            Width = 105
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
            TabOrder = 6
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 16
          Width = 673
          TabOrder = 3
          inherited edtNome: TEdit
            Width = 409
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 608
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 632
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 366
    Width = 686
    inherited tb97Fundo: TToolbar97
      Left = 443
      DockPos = 443
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 164
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 247
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Ok'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 166
      end
      object bbtnAplicar: TBitBtn
        Left = 83
        Top = 0
        Width = 81
        Height = 27
        Caption = '&Confirmar'
        Default = True
        Enabled = False
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnAplicarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object qryContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   C.IDCONTRATOEMPTMO,'
      '   DEP.MATRICULA,'
      '   PES.NOME,'
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
      '   C.DATACANC, C.MOECODIGO, M.MOESIGLA,'
      ''
      '   C.VLRCONTRATO, C.VLRPARCELA, C.TXJUROS,'
      '   C.NUMPARCELAS,'
      ''
      '   I.DATAINSC,'
      '   SIT.IDSITPART, SIT.FLGINTERNO'
      'FROM'
      '   INSCRICAOEMPTMO I,'
      '   CONTRATOEMPTMO  C,'
      '   PARTPREVPLAN    PPP,'
      '   MOEDA           M,'
      '   TIPOCONTREMPTMO TC,'
      '   TIPOEMPTMO      TE,'
      '   SITPART         SIT,'
      '   DEPENTIT        DEP,'
      '   PESSOA          PES'
      ''
      'WHERE'
      '   ( C.FLGSITUACAO IN ('#39'A'#39', '#39'E'#39', '#39'J'#39') )'
      ''
      '   AND ( C.IDTIPOCONTREMPTMO  = -1 )'
      '   AND ( TC.IDTIPOCONTREMPTMO = -1 )'
      '   AND ( TE.IDEMPRESAPROP     = 1 )'
      '   AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO )'
      '   AND ( PES.IDPESSOA         = C.IDBENEF )'
      '   AND ( DEP.IDTITULAR        = C.IDPESSOA )'
      '   AND ( DEP.IDPESSOA         = C.IDBENEF )'
      '   AND ( C.IDPATRO            = PPP.IDPESSJUR )'
      '   AND ( C.IDBENEF            = PPP.IDPESSOA )'
      '   AND ( PPP.IDSITPART        = SIT.IDSITPART )'
      '   AND ( C.IDINSCRICAOEMPTMO  = I.IDINSCRICAOEMPTMO(+) )'
      '   AND ( C.MOECODIGO          = M.MOECODIGO(+) )'
      '   AND PPP.FLGDESATIVADO      = 0 ')
    ValidateWithMask = True
    Left = 144
    Top = 160
    object qryContratosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryContratosIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryContratosIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryContratosIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratosIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryContratosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContratosIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryContratosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratosIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryContratosFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryContratosFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryContratosFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryContratosCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryContratosPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryContratosPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryContratosIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryContratosDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContratosDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryContratosDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratosDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryContratosDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryContratosMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratosMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryContratosVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratosVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object qryContratosTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryContratosNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryContratosDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryContratosIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryContratosFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryContratosMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryContratosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object qryBuscaPeriodo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   EPSEGUROESPECIAL'
      'WHERE'
      
        '   PERIODOFINAL = (SELECT MAX(PERIODOFINAL) FROM EPSEGUROESPECIA' +
        'L)'
      'AND ROWNUM = 1   '
      ''
      '')
    ValidateWithMask = True
    Left = 416
    Top = 104
    object qryBuscaPeriodoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryBuscaPeriodoPERIODOINICIAL: TStringField
      FieldName = 'PERIODOINICIAL'
      Size = 6
    end
    object qryBuscaPeriodoPERIODOFINAL: TStringField
      FieldName = 'PERIODOFINAL'
      Size = 6
    end
    object qryBuscaPeriodoMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Size = 6
    end
  end
  object dsResult: TDataSource
    DataSet = qryResult
    Left = 216
    Top = 112
  end
  object updResult: TUpdateSQL
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDCONTRATOEMPTMO, MUTUARIO, MATRICULA, VALOR)'
      'values'
      '  (:IDCONTRATOEMPTMO, :MUTUARIO, :MATRICULA, :VALOR)')
    Left = 216
    Top = 100
  end
  object qryResult: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    0  AS IDCONTRATOEMPTMO,'
      '    '#39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39'  AS MUTUARIO,'
      '    '#39'XXXXXXXXXXXXX'#39'   AS MATRICULA,'
      '   0 AS VALOR'
      'FROM '
      '   DUAL'
      'WHERE'
      '   1 = 2')
    UpdateObject = updResult
    ValidateWithMask = True
    Left = 216
    Top = 88
    object qryResultIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryResultMUTUARIO: TStringField
      FieldName = 'MUTUARIO'
      FixedChar = True
      Size = 30
    end
    object qryResultMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryResultVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object qrySaldoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      HMESALDODEV,'
      '      HMETXJUROS,'
      '      HMEPARCELA,'
      '      HMEDATAATUALIZA, '
      '      HMENUMPARCELAS'
      '   FROM'
      '      HISTMOVEMPTMO HST'
      'WHERE'
      '   HST.IDHISTMOVEMPTMO ='
      '   (SELECT'
      
        '       MIN(DECODE(HMETIPOMOV,5,MAX(IDHISTMOVEMPTMO),MIN(IDHISTMO' +
        'VEMPTMO))) AS IDHISTMOVEMPTMO'
      '    FROM'
      '       HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '       ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TCE'
      '    WHERE'
      '        ( CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '    AND ( ITC.ITCTRATASALDODEV  <> 0 )'
      
        '    AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      '    AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '    AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '    AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '    AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '    AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '    AND ( HME.HMEDATAATUALIZA    = (SELECT MAX(HMEDATAATUALIZA)'
      '                                    FROM   HISTMOVEMPTMO'
      
        '                                    WHERE  IDCONTRATOEMPTMO = :P' +
        'IDCONTRATOEMPTMO'
      
        '                                    AND    (FLGESTORNADO    = 0 ' +
        'OR FLGESTORNADO IS NULL)'
      
        '                                    AND    HMEDATAATUALIZA  <= :' +
        'PHMEDATAATUALIZA) )'
      '    GROUP BY HMETIPOMOV'
      '    )'
      '')
    ValidateWithMask = True
    Left = 64
    Top = 160
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
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
    object qrySaldoAntHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qrySaldoAntHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qrySaldoAntHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qrySaldoAntHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qrySaldoAntHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
  end
  object qryBuscaItem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    ITEMXTIPOCONTR'
      'WHERE'
      '    IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'
      'AND IDITEMEMPTMO      = :PIDITEMEMPTMO')
    ValidateWithMask = True
    Left = 328
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end>
    object qryBuscaItemIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDTIPOCONTREMPTMO'
    end
    object qryBuscaItemIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDITEMEMPTMO'
    end
    object qryBuscaItemITCRECPAG: TStringField
      FieldName = 'ITCRECPAG'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCRECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaItemIDREGRACALC: TFloatField
      FieldName = 'IDREGRACALC'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDREGRACALC'
    end
    object qryBuscaItemIDREGRADEVOL: TFloatField
      FieldName = 'IDREGRADEVOL'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDREGRADEVOL'
    end
    object qryBuscaItemIDREGRADIARIA: TFloatField
      FieldName = 'IDREGRADIARIA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDREGRADIARIA'
    end
    object qryBuscaItemITCEVENTO: TFloatField
      FieldName = 'ITCEVENTO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCEVENTO'
    end
    object qryBuscaItemFLGCENTRALIZA: TFloatField
      FieldName = 'FLGCENTRALIZA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.FLGCENTRALIZA'
    end
    object qryBuscaItemFLGDESTACADO: TFloatField
      FieldName = 'FLGDESTACADO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.FLGDESTACADO'
    end
    object qryBuscaItemITCSEQCALCULO: TFloatField
      FieldName = 'ITCSEQCALCULO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCSEQCALCULO'
    end
    object qryBuscaItemITCPRIORIDADE: TFloatField
      FieldName = 'ITCPRIORIDADE'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCPRIORIDADE'
    end
    object qryBuscaItemITCTRATASALDODEV: TFloatField
      FieldName = 'ITCTRATASALDODEV'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCTRATASALDODEV'
    end
    object qryBuscaItemFLGTEMPORARIO: TFloatField
      FieldName = 'FLGTEMPORARIO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.FLGTEMPORARIO'
    end
    object qryBuscaItemITCPERIODICIDADE: TFloatField
      FieldName = 'ITCPERIODICIDADE'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCPERIODICIDADE'
    end
    object qryBuscaItemITCNUMVEZES: TFloatField
      FieldName = 'ITCNUMVEZES'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCNUMVEZES'
    end
    object qryBuscaItemIDPROVENTON: TFloatField
      FieldName = 'IDPROVENTON'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTON'
    end
    object qryBuscaItemIDPROVENTOA: TFloatField
      FieldName = 'IDPROVENTOA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTOA'
    end
    object qryBuscaItemIDPROVENTOD: TFloatField
      FieldName = 'IDPROVENTOD'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTOD'
    end
    object qryBuscaItemPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.PLANO'
    end
    object qryBuscaItemCONTABAIXA: TStringField
      FieldName = 'CONTABAIXA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.CONTABAIXA'
      FixedChar = True
      Size = 18
    end
    object qryBuscaItemCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.CODTIPDOC'
    end
    object qryBuscaItemTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.TIPCODIGO'
      FixedChar = True
      Size = 2
    end
    object qryBuscaItemIDPROVENTOS: TFloatField
      FieldName = 'IDPROVENTOS'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTOS'
    end
    object qryBuscaItemFLGGRAVAZERO: TFloatField
      FieldName = 'FLGGRAVAZERO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.FLGGRAVAZERO'
    end
  end
  object qryInsertPeriodo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'INSERT INTO EPSEGUROESPECIAL(IDTIPOCONTREMPTMO,PERIODOINICIAL,PE' +
        'RIODOFINAL,MESCOBRANCA)'
      
        'VALUES (:PIDTIPOCONTREMPTMO, :PPERIODOINICIAL, :PPERIODOFINAL, :' +
        'PMESCOBRANCA)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 328
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPERIODOINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPERIODOFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object StringField1: TStringField
      FieldName = 'PERIODOINICIAL'
      Size = 6
    end
    object StringField2: TStringField
      FieldName = 'PERIODOFINAL'
      Size = 6
    end
    object StringField3: TStringField
      FieldName = 'MESCOBRANCA'
      Size = 6
    end
  end
  object qryParcelasGeradas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SUM(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO'
      'FROM'
      '    HISTMOVEMPTMO HME'
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO )'
      '   AND ( HME.HMETIPOMOV       = 1 )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEDATAVENCTO >= SYSDATE )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEVLRPREVISTO   > 0 )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0) )'
      '   AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0)' +
        ' )'
      
        '   AND ( (HME.FLGSUSPENSAO    IS NULL) OR (HME.FLGSUSPENSAO = 0)' +
        ' )'
      'ORDER BY'
      '   HME.IDHISTMOVEMPTMO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 64
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasGeradasHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryParcelasAberto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    NVL(SUM(HMEVLRPREVISTO), 0) AS TOTAL'
      'FROM'
      '    HISTMOVEMPTMO'
      'WHERE'
      '    IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      'AND HMEDATAPREVISTA <= SYSDATE'
      'AND HMEDATAEFETIVA  IS NULL'
      'AND (HMECENTRALIZA  = 1 OR HMEDESTACADO = 1)'
      'AND (FLGESTORNADO   = 0 OR FLGESTORNADO IS NULL)'
      'AND HMETIPOMOV      = 1'
      'AND FLGBAIXADO      = 0')
    ValidateWithMask = True
    Left = 232
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasAbertoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 416
    Top = 160
  end
end
