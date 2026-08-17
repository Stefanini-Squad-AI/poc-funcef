inherited frmCalculaValorDevido: TfrmCalculaValorDevido
  Left = 158
  Top = 127
  HelpContext = 150105
  Caption = 'Calcula Valor Devido de Empréstimo'
  ClientHeight = 471
  ClientWidth = 705
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 705
    Height = 438
    inherited pgcControle: TPageControl
      Width = 705
      Height = 405
      inherited TabSheet1: TTabSheet
        object Label2: TLabel
          Left = 15
          Top = 218
          Width = 45
          Height = 13
          Caption = 'Rubrica'
        end
        object Label3: TLabel
          Left = 15
          Top = 58
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label4: TLabel
          Left = 351
          Top = 58
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label1: TLabel
          Left = 560
          Top = 264
          Width = 124
          Height = 13
          Caption = 'Considera débitos até'
        end
        object cboRubrica: TwwDBLookupCombo
          Left = 15
          Top = 234
          Width = 666
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'130'#9'Descrição'#9'F')
          LookupTable = qryRubricas
          LookupField = 'IDPROVENTO'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object GroupBox1: TGroupBox
          Left = 256
          Top = 259
          Width = 289
          Height = 73
          Caption = ' Período da Folha '
          TabOrder = 1
          object Label15: TLabel
            Left = 24
            Top = 24
            Width = 116
            Height = 13
            Caption = 'Cobrança (mês/ano)'
          end
          object cboMes: TComboBox
            Left = 24
            Top = 38
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
          object DBspnAno: TwwDBSpinEdit
            Left = 168
            Top = 38
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 15
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
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 353
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
          LookupTable = dtmLookEmptmo.qryLookTipoContr
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
          OnCloseUp = DBcboTipoContratoCloseUp
        end
        inline molListaPatro: TmolListaPatro
          Left = 7
          Top = 96
          Width = 345
          Height = 121
          TabOrder = 4
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 97
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
          Left = 345
          Top = 96
          Width = 345
          Height = 113
          TabOrder = 5
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 329
            Height = 97
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
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 681
          TabOrder = 6
          TabStop = True
          inherited edtNome: TEdit
            Width = 425
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 624
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 648
          end
        end
        object edtDataRef: TwwDBDateTimePicker
          Left = 560
          Top = 278
          Width = 123
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
          TabOrder = 7
          UnboundDataType = wwDTEdtDate
          DisplayFormat = 'dd/mm/yyyy'
        end
        object grbEnvio: TGroupBox
          Left = 16
          Top = 259
          Width = 233
          Height = 73
          Caption = ' Gerar para '
          TabOrder = 8
          object chkFolhaBenef: TCheckBox
            Left = 16
            Top = 45
            Width = 161
            Height = 17
            Caption = 'Folha de Benefícios'
            TabOrder = 1
          end
          object chkFolhaPatro: TCheckBox
            Left = 16
            Top = 20
            Width = 161
            Height = 17
            Caption = 'Folha da Patrocinadora'
            TabOrder = 0
          end
        end
        object rdgTipoProc: TRadioGroup
          Left = 16
          Top = 336
          Width = 529
          Height = 57
          Caption = ' Tipo de Processamento '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Efetuar geração'
            'Desfazer geração')
          TabOrder = 9
        end
      end
      inherited TabSheet2: TTabSheet
        object Total: TLabel
          Left = 22
          Top = 174
          Width = 183
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Participantes gerados: '
          Visible = False
        end
        object TotalN: TLabel
          Left = 24
          Top = 366
          Width = 213
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Participantes NÃO gerados: '
          Visible = False
        end
        object Panel3: TPanel
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
          TabOrder = 0
        end
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 673
          Height = 135
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 1
        end
        object Panel4: TPanel
          Left = 16
          Top = 198
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Erros encontrados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object memErro: TMemo
          Left = 16
          Top = 224
          Width = 673
          Height = 137
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 3
        end
        object edtNumResult: TRealEdit
          Left = 232
          Top = 170
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0')
          TabOrder = 4
          Visible = False
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object edtNumErro: TRealEdit
          Left = 240
          Top = 362
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0')
          TabOrder = 5
          Visible = False
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
      end
    end
    inherited Panel1: TPanel
      Width = 705
      inherited fcLabel1: TfcLabel
        Width = 320
        Caption = 'Calcula Valor Devido [ Seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 438
    Width = 705
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230101
        ClickHelpContext = 230101
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 675
    Top = 65531
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '    P.IDPROVENTO, P.DESCRICAO, DECODE(R.CODPROVDESC,NULL,P.CODPR' +
        'OVDESC, R.CODPROVDESC) AS CODPROVDESC'
      'FROM'
      '    PROVDESC P, TIPOCONTREMPTMO TCE, RUBRICAXPESS R'
      'WHERE'
      '    P.FLGTPRUBRICA LIKE '#39'%E%'#39
      'AND P.FLGDESCONTO = 2'
      'AND P.IDPROVENTO = R.IDRUBRICA(+)'
      'AND (:PIDRUBRICA IS NULL OR P.IDPROVENTO = :PIDRUBRICA)'
      'AND (:PIDPATRO   IS NULL OR R.IDPESSOA   = :PIDPATRO)'
      'ORDER BY'
      '   DESCRICAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 548
    Top = 183
    ParamData = <
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
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end>
    object qryRubricasIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryRubricasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object qryRubricasCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
  end
  object dsRubricas: TDataSource
    DataSet = qryRubricas
    Left = 548
    Top = 207
  end
  object dsTipoContrato: TDataSource
    DataSet = dtmLookEmptmo.qryLookTipoContr
    Left = 556
    Top = 111
  end
  object qryCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      CON.IDPATRO,'
      '      CON.IDPLANOPREV,'
      '      CON.IDPESSOA,'
      '      CON.IDBENEF,'
      '      PTI.NOME AS NOME_TITULAR,'
      '      PBF.NOME AS NOME_BENEF,'
      '      SIT.FLGINTERNO,'
      '      PPP.INSCRICAONUMERO,'
      '      ELP.MATRICULA, '
      
        '      (NVL(SLD.HMESALDODEV, 0) + (NVL(PAR_DEV.VLR_DEV, 0) - NVL(' +
        'PAR_PAG.VLR_PAG, 0))) AS TOTAL_DEV'
      '   FROM'
      '      PESSOA          PBF,'
      '      PESSOA          PTI,'
      '      CONTRATOEMPTMO  CON,'
      '      DEPENTIT        DEP,'
      '      ELEGPATRO       ELP,'
      '      PARTPREVPLAN    PPP,'
      '      TIPOCONTREMPTMO TCE,'
      '      TIPOEMPTMO      TEP,'
      '      PATRO           PTR,'
      '      PLANPREV        PLP,'
      '      SITPART         SIT,'
      ''
      '      ('
      '      SELECT'
      '         CON.IDCONTRATOEMPTMO,'
      
        '         HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMEPARCELA, H' +
        'ME.HMENUMPARCELAS'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '         ('
      '         SELECT'
      
        '            CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHIST' +
        'MOVEMPTMO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      
        '            ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO ' +
        'TCE'
      '         WHERE'
      '                CON.FLGSITUACAO         <> '#39'C'#39
      ''
      ''
      '            AND CON.IDCONTRATOEMPTMO     = 399478'
      ''
      '            AND ITC.ITCTRATASALDODEV    <> 0'
      
        '            AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGEST' +
        'ORNADO = 0) )'
      '            AND ( HME.HMEDATAATUALIZA    <='
      '                  ('
      '                  SELECT'
      
        '                     DECODE(MAX(H.HMEDATAATUALIZA), NULL, TO_DAT' +
        'E('#39'31/05/2006'#39','#39'DD/MM/YYYY'#39'),'
      
        '                                                          MAX(H.' +
        'HMEDATAATUALIZA))'
      '                  FROM'
      '                     HISTMOVEMPTMO   H,'
      '                     CONTRATOEMPTMO  C,'
      '                     ITEMXTIPOCONTR  IT'
      '                  WHERE'
      
        '                         C.IDCONTRATOEMPTMO    = CON.IDCONTRATOE' +
        'MPTMO'
      
        '                     AND H.HMEDATAATUALIZA    <= TO_DATE('#39'31/05/' +
        '2006'#39','#39'DD/MM/YYYY'#39')'
      '                     AND IT.ITCTRATASALDODEV  <> 0'
      '                     AND HME.HMEANOCOMPETENCIA = 2006'
      '                     AND HME.HMEMESCOMPETENCIA = 05'
      
        '                     AND ( H.FLGESTORNADO      = 0 OR H.FLGESTOR' +
        'NADO IS NULL )'
      
        '                     AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMP' +
        'TMO'
      
        '                     AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTRE' +
        'MPTMO'
      '                     AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO'
      '                  )'
      '                )'
      ''
      
        '            AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, '#39'0' +
        '000'#39')))) || (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39'))))' +
        ' ) <= '#39'200605'#39' '
      ''
      
        '            AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ' +
        ')'
      
        '            AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO' +
        ' )'
      
        '            AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO' +
        ' )                          '
      
        '            AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO' +
        ' )'
      
        '            AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )   ' +
        '                            '
      
        '            AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )   ' +
        '                            '
      '            AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '         GROUP BY '
      
        '            CON.IDCONTRATOEMPTMO                                ' +
        '                            '
      
        '         ) MAX                                                  ' +
        '                            '
      '      WHERE '
      '             ( CON.FLGSITUACAO        <> '#39'C'#39' ) '
      '         AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '
      '         AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '
      '         AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '
      '      ) SLD,'
      '      ( '
      '      SELECT '
      
        '         CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) A' +
        'S VLR_DEV '
      '      FROM '
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '
      '      WHERE '
      
        '             CON.FLGSITUACAO       <> '#39'C'#39'                       ' +
        '                          '
      ''
      ''
      '         AND CON.IDCONTRATOEMPTMO   = 399478'
      ''
      
        '         AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7)       ' +
        '                            '
      
        '         AND HME.HMESEQCOBRANCA     = 1                         ' +
        '                            '
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )                        '
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )                    '
      ''
      
        '         AND HME.HMEDATAPREVISTA    <= TO_DATE('#39'31/05/2006'#39','#39'DD/' +
        'MM/YYYY'#39')               '
      ''
      '         AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      
        '      GROUP BY                                                  ' +
        '                            '
      '         CON.IDCONTRATOEMPTMO'
      
        '      ) PAR_DEV,                                                ' +
        '                           '
      ''
      '      ('
      '      SELECT '
      
        '         CON.IDCONTRATOEMPTMO,                                  ' +
        '                           '
      ''
      '         SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0),'
      
        '                                   DECODE(FLGABONADO, 1, NVL(HME' +
        '.HMEVLRPREVISTO, 0),                '
      
        '                                                         NVL(HME' +
        '.HMEVLREFETIVO, 0)))) AS VLR_PAG     '
      ''
      
        '      FROM                                                      ' +
        '                            '
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      
        '      WHERE                                                     ' +
        '                            '
      
        '             CON.FLGSITUACAO       <> '#39'C'#39'                       ' +
        '                          '
      ''
      '         AND CON.IDCONTRATOEMPTMO   = 399478'
      ''
      
        '         AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 6, 7)       ' +
        '                            '
      
        '         AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = ' +
        '1) )                        '
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )                    '
      ''
      
        '         AND HME.HMEDATAPREVISTA    <= TO_DATE('#39'31/05/2006'#39','#39'DD/' +
        'MM/YYYY'#39')               '
      ''
      
        '         AND (                                                  ' +
        '                                              '
      
        '             (HME.HMEDATAEFETIVA    <= TO_DATE('#39'31/05/2006'#39','#39'DD/' +
        'MM/YYYY'#39')) '
      
        '          OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <=' +
        ' TO_DATE('#39'31/05/2006'#39','#39'DD/MM/YYYY'#39')) )     '
      
        '          OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <=' +
        ' TO_DATE('#39'31/05/2006'#39','#39'DD/MM/YYYY'#39')) )'
      
        '             )                                                  ' +
        '                                              '
      ''
      
        '         AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )    ' +
        '                            '
      '      GROUP BY'
      
        '         CON.IDCONTRATOEMPTMO                                   ' +
        '                            '
      '      ) PAR_PAG'
      ''
      
        '   WHERE                                                        ' +
        '                            '
      ''
      '          TEP.IDEMPRESAPROP        = 1'
      ''
      '      AND CON.IDCONTRATOEMPTMO     = 399478'
      ''
      
        '      AND ( (SLD.HMESALDODEV       > 0) OR ((NVL(PAR_DEV.VLR_DEV' +
        ', 0) - NVL(PAR_PAG.VLR_PAG, 0)) > 0) )    '
      ''
      
        '      AND ( CON.FLGSITUACAO        <> '#39'C'#39' )                     ' +
        '                          '
      
        '      AND ( ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0))' +
        ' > 0) ) '
      
        '      AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO )     ' +
        '                            '
      
        '      AND ( CON.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+)' +
        ' )                          '
      
        '      AND ( CON.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+)' +
        ' )                          '
      
        '      AND ( CON.IDPESSOA           = PTI.IDPESSOA )             ' +
        '                            '
      
        '      AND ( CON.IDPESSOA           = ELP.IDPESSOA )             ' +
        '                            '
      
        '      AND ( CON.IDPATRO            = PTR.IDPESSOA )             ' +
        '                            '
      
        '      AND ( CON.IDBENEF            = PBF.IDPESSOA )             ' +
        '                            '
      
        '      AND ( CON.IDPESSOA           = PPP.IDPESSOA )             ' +
        '                            '
      
        '      AND ( CON.IDPATRO            = PPP.IDPESSJUR )            ' +
        '                            '
      
        '      AND ( ELP.IDPESSOA           = PPP.IDPESSOA )             ' +
        '                            '
      
        '      AND ( ELP.IDPESSJUR          = PPP.IDPESSJUR )            ' +
        '                            '
      
        '      AND ( PTR.IDPESSOA           = ELP.IDPESSJUR )            ' +
        '                            '
      
        '      AND ( CON.IDBENEF            = PBF.IDPESSOA )             ' +
        '                            '
      
        '      AND ( PTI.IDPESSOA           = ELP.IDPESSOA )             ' +
        '                            '
      
        '      AND ( PTI.IDPESSOA           = PPP.IDPESSOA )             ' +
        '                            '
      
        '      AND ( CON.IDPLANOPREV        = PLP.IDPLANOPREV )          ' +
        '                            '
      
        '      AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )    ' +
        '                            '
      
        '      AND ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO )         ' +
        '                            '
      
        '      AND ( ELP.IDPESSOA           = DEP.IDTITULAR )            ' +
        '                            '
      '      AND ( CON.IDBENEF            = DEP.IDPESSOA )'
      
        '      AND ( CON.IDPESSOA           = DEP.IDTITULAR )            ' +
        '                            '
      '      AND ( PPP.IDSITPART          = SIT.IDSITPART )'
      '      AND PPP.FLGDESATIVADO        = 0'
      ''
      ' ')
    ValidateWithMask = True
    Left = 492
    Top = 39
    object qryCalculoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryCalculoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryCalculoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryCalculoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryCalculoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryCalculoNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 60
    end
    object qryCalculoNOME_BENEF: TStringField
      FieldName = 'NOME_BENEF'
      Size = 60
    end
    object qryCalculoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryCalculoTOTAL_DEV: TFloatField
      FieldName = 'TOTAL_DEV'
    end
    object qryCalculoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryCalculoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TCE.IDTIPOCONTREMPTMO,'
      '   TCE.TCEDESCRICAO,'
      '   TCE.IDTIPOEMPTMO,'
      ''
      '   TCE.FLGOBRIGBENEF,'
      '   TCE.TCEMINRENOVA,'
      '   TCE.NUMPARCDESCONTO,'
      '   TCE.MOECODIGO,'
      '   TCE.FLGCONCESSAOZERO,'
      ''
      '   TCE.IDREGRAJURCONC,'
      '   TCE.IDREGRAJUREXIBE,'
      '   TCE.IDREGRAELEG,'
      '   TCE.IDREGRALIMITES,'
      '   TCE.IDREGRAPRAZOSCONC,'
      '   TCE.IDREGRAMARGEM,'
      '   TCE.IDREGRARESERVA,'
      '   TCE.IDREGRASALBAS,'
      '   TCE.IDREGRADATACRED,'
      '   TCE.IDREGRAPRAZOMAX,'
      ''
      '   TCE.TCELEGENDACALC,'
      
        '   NVL(TCE.TCELEGENDAEXIBE, TCE.TCELEGENDACALC) AS TCELEGENDAEXI' +
        'BE,'
      ''
      '   NVL(TCE.IDREGRAPRIMPARC, 0) AS IDREGRAPRIMPARC,'
      ''
      '   TEP.DESCTIPOEMPTMO,'
      '   TEP.TEPMAXCONTRATO'
      'FROM'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO )'
      '   AND ( TCE.IDTIPOCONTREMPTMO  =:PIDTIPOCONTREMPTMO )'
      '')
    ValidateWithMask = True
    Left = 496
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryTipoContratoTCEDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Contrato'
      DisplayWidth = 55
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object qryTipoContratoDESCTIPOEMPTMO: TStringField
      DisplayLabel = 'Tipo de Empréstimo'
      DisplayWidth = 30
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
      Visible = False
    end
    object qryTipoContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOEMPTMO'
      Visible = False
    end
    object qryTipoContratoIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAJURCONC'
      Visible = False
    end
    object qryTipoContratoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAELEG'
      Visible = False
    end
    object qryTipoContratoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRALIMITES'
      Visible = False
    end
    object qryTipoContratoIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAPRAZOSCONC'
      Visible = False
    end
    object qryTipoContratoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAMARGEM'
      Visible = False
    end
    object qryTipoContratoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRARESERVA'
      Visible = False
    end
    object qryTipoContratoTEPMAXCONTRATO: TFloatField
      FieldName = 'TEPMAXCONTRATO'
      Visible = False
    end
    object qryTipoContratoFLGOBRIGBENEF: TFloatField
      FieldName = 'FLGOBRIGBENEF'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.FLGOBRIGBENEF'
      Visible = False
    end
    object qryTipoContratoIDREGRASALBAS: TFloatField
      FieldName = 'IDREGRASALBAS'
      Visible = False
    end
    object qryTipoContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryTipoContratoFLGCONCESSAOZERO: TFloatField
      FieldName = 'FLGCONCESSAOZERO'
      Visible = False
    end
    object qryTipoContratoTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
      Visible = False
    end
    object qryTipoContratoIDREGRADATACRED: TFloatField
      FieldName = 'IDREGRADATACRED'
      Visible = False
    end
    object qryTipoContratoIDREGRAPRAZOMAX: TFloatField
      FieldName = 'IDREGRAPRAZOMAX'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAPRAZOMAX'
      Visible = False
    end
    object qryTipoContratoNUMPARCDESCONTO: TFloatField
      FieldName = 'NUMPARCDESCONTO'
      Visible = False
    end
    object qryTipoContratoIDREGRAPRIMPARC: TFloatField
      FieldName = 'IDREGRAPRIMPARC'
      Visible = False
    end
    object qryTipoContratoIDREGRAJUREXIBE: TFloatField
      FieldName = 'IDREGRAJUREXIBE'
    end
    object qryTipoContratoTCELEGENDACALC: TStringField
      FieldName = 'TCELEGENDACALC'
      Size = 10
    end
    object qryTipoContratoTCELEGENDAEXIBE: TStringField
      FieldName = 'TCELEGENDAEXIBE'
      Size = 10
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VWPARTICIPDEPEN .MATRICSHOW'
      'VWPARTICIPDEPEN .NOME'
      'VWPARTICIPDEPEN .PATRO'
      'VWPARTICIPDEPEN .PLANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Patrocinadora'
      'Plano')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN ')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN .IDPESSOA'
      'VWPARTICIPDEPEN .MATRICSHOW'
      'VWPARTICIPDEPEN .NOME')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '60'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 596
    Top = 65535
  end
  object qryTmpDesc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     0         AS IDTMPDESC,'
      '     '#39'       '#39' AS MESREFERENCIA,'
      '     '#39' '#39'       AS RECPAG,'
      '     0 AS IDPESSOA,'
      '     '#39' '#39' AS FLGTIPODESC,'
      '     0 AS VALOR,'
      '     0 AS IDTITULAR,'
      '     0 AS IDDESCONTO,'
      '     '#39'       '#39' AS MESCOBRANCA,'
      '     0 AS IDPESSJUR,'
      '     0 AS IDPROVENTO,'
      '     0 AS IDPLANOPREV,'
      '     0 AS FLGDESCONTO,'
      '     '#39'               '#39' AS CODPROVDESC,'
      '     '#39' '#39' AS FLGDESCFOLHA,'
      '     SYSDATE AS DATAREFERENCIA,'
      '     '#39'                            '#39' AS DESCRICAO,'
      '     '#39'   '#39' AS REFERENCIA,'
      '     '#39' '#39' AS SITENVIO,'
      '     0 AS VALORINFO,'
      '     0 AS INSCRICAONUMERO,'
      '     '#39'             '#39' AS MATRICULA,'
      '     SYSDATE AS DATACOBRANCA,'
      ''
      '     0 AS IDLOTE'
      'FROM'
      '    DUAL'
      'WHERE'
      '    1 = 2'
      ''
      ' '
      ' ')
    UpdateObject = updTmpDesc
    ValidateWithMask = True
    Left = 384
    Top = 23
    object qryTmpDescIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
    object qryTmpDescMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryTmpDescFLGTIPODESC: TStringField
      FieldName = 'FLGTIPODESC'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryTmpDescIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryTmpDescIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryTmpDescMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryTmpDescIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryTmpDescIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryTmpDescFLGDESCONTO: TFloatField
      FieldName = 'FLGDESCONTO'
    end
    object qryTmpDescCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      FixedChar = True
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
      FixedChar = True
      Size = 28
    end
    object qryTmpDescREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 3
    end
    object qryTmpDescSITENVIO: TStringField
      FieldName = 'SITENVIO'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescVALORINFO: TFloatField
      FieldName = 'VALORINFO'
    end
    object qryTmpDescDATACOBRANCA: TDateTimeField
      FieldName = 'DATACOBRANCA'
    end
    object qryTmpDescIDLOTE: TFloatField
      FieldName = 'IDLOTE'
    end
    object qryTmpDescINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryTmpDescMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
  end
  object updTmpDesc: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDTMPDESC = :IDTMPDESC,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  FLGTIPODESC = :FLGTIPODESC,'
      '  VALOR = :VALOR,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDDESCONTO = :IDDESCONTO,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPROVENTO = :IDPROVENTO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  FLGDESCONTO = :FLGDESCONTO,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  FLGDESCFOLHA = :FLGDESCFOLHA,'
      '  DATAREFERENCIA = :DATAREFERENCIA,'
      '  DESCRICAO = :DESCRICAO,'
      '  REFERENCIA = :REFERENCIA,'
      '  SITENVIO = :SITENVIO,'
      '  VALORINFO = :VALORINFO,'
      '  INSCRICAONUMERO = :INSCRICAONUMERO,'
      '  MATRICULA = :MATRICULA,'
      '  DATACOBRANCA = :DATACOBRANCA,'
      '  IDLOTE = :IDLOTE'
      'where'
      '  IDTMPDESC = :OLD_IDTMPDESC ')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (IDTMPDESC, MESREFERENCIA, RECPAG, IDPESSOA, FLGTIPODESC, VALO' +
        'R, '
      'IDTITULAR, '
      '   IDDESCONTO, MESCOBRANCA, IDPESSJUR, IDPROVENTO, IDPLANOPREV, '
      'FLGDESCONTO, '
      '   CODPROVDESC, FLGDESCFOLHA, DATAREFERENCIA, DESCRICAO, '
      'REFERENCIA, SITENVIO, '
      '   VALORINFO, INSCRICAONUMERO, MATRICULA, DATACOBRANCA, IDLOTE)'
      'values'
      
        '  (:IDTMPDESC, :MESREFERENCIA, :RECPAG, :IDPESSOA, :FLGTIPODESC,' +
        ' '
      ':VALOR, '
      
        '   :IDTITULAR, :IDDESCONTO, :MESCOBRANCA, :IDPESSJUR, :IDPROVENT' +
        'O, '
      ':IDPLANOPREV, '
      '   :FLGDESCONTO, :CODPROVDESC, :FLGDESCFOLHA, :DATAREFERENCIA, '
      ':DESCRICAO, '
      
        '   :REFERENCIA, :SITENVIO, :VALORINFO, :INSCRICAONUMERO, :MATRIC' +
        'ULA, '
      ':DATACOBRANCA, '
      '   :IDLOTE)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDTMPDESC = :OLD_IDTMPDESC')
    Left = 380
    Top = 47
  end
  object qryDesfazerCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.IDPATRO,'
      '   CON.IDPLANOPREV,'
      '   CON.IDPESSOA,'
      '   CON.IDBENEF,'
      '   TMP.IDTMPDESC'
      'FROM'
      '   CONTRATOEMPTMO  CON,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP,'
      '   TMPDESC         TMP,'
      '   PROVDESC        P'
      'WHERE'
      '       TEP.IDEMPRESAPROP        = 1'
      
        '   AND CON.IDPATRO              IN (42904, 42908, 2113, 127094, ' +
        '2002, 2003, 42906, 1, 42902, 42905, 42907)'
      '   AND CON.IDPLANOPREV          IN (23, 21, 4, 6, 7, 16, 22, 20)'
      '   AND TCE.IDTIPOEMPTMO         = 1'
      '   AND TEP.IDTIPOEMPTMO         = 1'
      '   AND CON.IDTIPOCONTREMPTMO    = 21'
      '   AND ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      '   AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '   AND ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO )'
      '   AND ( TMP.IDMODULO           = 15 )'
      '   AND ( TMP.IDDESCONTO         = CON.IDCONTRATOEMPTMO )'
      '   AND ( TMP.IDPROVENTO         = P.IDPROVENTO )'
      '   AND TMP.IDPROVENTO           = 2043'
      '   AND ( TMP.MESCOBRANCA        = '#39'2006/10'#39' )'
      '   AND ( TMP.FLGDESCFOLHA       IN ('#39'P'#39','#39'B'#39') )'
      'ORDER BY CON.IDPATRO, CON.IDCONTRATOEMPTMO'
      '')
    ValidateWithMask = True
    Left = 148
    Top = 183
    object qryDesfazerCalculoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryDesfazerCalculoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryDesfazerCalculoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryDesfazerCalculoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDesfazerCalculoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryDesfazerCalculoIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
  end
end
