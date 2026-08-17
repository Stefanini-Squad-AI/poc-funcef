inherited frmCalculaValorMaximo: TfrmCalculaValorMaximo
  Left = 111
  Top = 122
  HelpContext = 150104
  Caption = 'Calcula Valor Máximo para Empréstimo'
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
          Top = 224
          Width = 45
          Height = 13
          Caption = 'Rubrica'
        end
        object Label3: TLabel
          Left = 15
          Top = 66
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label4: TLabel
          Left = 351
          Top = 66
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label5: TLabel
          Left = 16
          Top = 18
          Width = 55
          Height = 13
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 120
          Top = 18
          Width = 33
          Height = 13
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cboRubrica: TwwDBLookupCombo
          Left = 15
          Top = 240
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
          Left = 16
          Top = 277
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
          Top = 80
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
          Top = 80
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
          Top = 104
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
          Top = 104
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
        object edtMatricula: TEdit
          Left = 16
          Top = 32
          Width = 97
          Height = 21
          Enabled = False
          TabOrder = 6
        end
        object edtNome: TEdit
          Left = 120
          Top = 32
          Width = 505
          Height = 21
          Enabled = False
          TabOrder = 7
        end
        object btnBuscaPart: TBitBtn
          Left = 624
          Top = 32
          Width = 24
          Height = 22
          Hint = 'Busca um Participante'
          TabOrder = 8
          OnClick = btnBuscaPartClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object btnLimpaPart: TBitBtn
          Left = 648
          Top = 32
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de Participante'
          TabOrder = 9
          OnClick = btnLimpaPartClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
        end
      end
      inherited TabSheet2: TTabSheet
        object Total: TLabel
          Left = 16
          Top = 174
          Width = 189
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Participantes enviados: '
          Visible = False
        end
        object Label8: TLabel
          Left = 18
          Top = 366
          Width = 219
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Participantes NÃO enviados: '
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
        Width = 327
        Caption = 'Calcula Valor Máximo [ Seleção ]'
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
    Left = 515
    Top = 379
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
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 596
    Top = 375
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
      Size = 100
    end
    object qryRubricasCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
  end
  object dsRubricas: TDataSource
    DataSet = qryRubricas
    Left = 652
    Top = 375
  end
  object dsTipoContrato: TDataSource
    DataSet = dtmLookEmptmo.qryLookTipoContr
    Left = 556
    Top = 111
  end
  object qryCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT '
      '     DPT.IDTITULAR, '
      '     DPT.IDPESSOA AS IDBENEF, '
      '     P.NOME, '
      '     MATRICS.MATRICULA, '
      '     ELP.IDPESSJUR AS IDPATRO, '
      '     NVL(PPP.IDPLANOPREV, PLBENEF.IDPLANOPREV) AS IDPLANOPREV, '
      '     PPP.IDSITPART, '
      '     PPP.INSCRICAONUMERO,'
      '     SP.FLGINTERNO, '
      '     PJ.NOME AS PATRO '
      'FROM '
      '     SITFUNC SFU, PESSOA P, PESSOAFISICA PF, DEPENTIT DPT, '
      
        '     DEPENDENTE DPD, SITDEPENDENTE SIT, PARTPREVPLAN PPP, ELEGPA' +
        'TRO ELP, '
      
        '     PESSOA PTIT, PLANPREV PPREV, PESSOA PJ, SITPLANOPREV SITP, ' +
        'SITPART SP, '
      '     ( '
      
        '      SELECT NVL(D.MATRICULA, E.MATRICULA) AS MATRICULA, D.IDPES' +
        'SOA, D.IDTITULAR '
      '      FROM DEPENTIT D, ELEGPATRO E, PARTPREVPLAN P '
      '      WHERE E.IDPESSOA = D.IDTITULAR '
      '      AND NVL(D.MATRICULA, E.MATRICULA) IS NOT NULL '
      '      AND P.IDPESSOA(+) = E.IDPESSOA '
      '      AND P.FLGDESATIVADO(+) = 0 '
      '      AND P.IDPESSJUR(+) = E.IDPESSJUR '
      '     ) MATRICS, '
      '    ( '
      '    SELECT '
      '        BF.IDTITULAR, '
      '        BF.IDPESSOA, '
      '        BF.IDPESSJUR, '
      '        BF.IDPLANOPREV, '
      '        PL.NOME AS PLANO '
      '    FROM BENEFBFCIARIO BF, PLANPREV PL, '
      '        (SELECT '
      '             IDPESSOA, '
      '             IDTITULAR, '
      '             MAX(DATAINICIO) AS DATAINICIO '
      '         FROM BENEFBFCIARIO '
      '         GROUP BY IDPESSOA, IDTITULAR) DT '
      '    WHERE BF.IDPLANOPREV = PL.IDPLANOPREV '
      '    AND   BF.DATAINICIO =  DT.DATAINICIO '
      '    AND   BF.IDPESSOA = DT.IDPESSOA '
      '    AND   BF.IDTITULAR = DT.IDTITULAR '
      
        '    GROUP BY BF.IDTITULAR, BF.IDPESSOA, BF.IDPESSJUR, BF.IDPLANO' +
        'PREV, PL.NOME '
      '     ) PLBENEF '
      'WHERE '
      '    (ELP.IDPESSJUR = PPP.IDPESSJUR(+)) '
      'AND (ELP.IDPESSOA  = PPP.IDPESSOA(+)) '
      'AND (ELP.IDPESSOA  = PTIT.IDPESSOA) '
      'AND (P.IDPESSOA    = DPT.IDPESSOA) '
      'AND (MATRICS.IDPESSOA = DPT.IDPESSOA) '
      'AND (MATRICS.IDTITULAR = DPT.IDTITULAR) '
      'AND ((PPP.FLGDESATIVADO = 1 AND  PPP.IDPESSOA NOT IN ( '
      
        '                                                     SELECT PPP1' +
        '.IDPESSOA '
      
        '                                                     FROM PARTPR' +
        'EVPLAN PPP1 '
      
        '                                                     WHERE PPP1.' +
        'IDPESSOA = PPP.IDPESSOA AND PPP1.IDPESSJUR = PPP.IDPESSJUR AND '
      
        '                                                     NVL(PPP1.FL' +
        'GDESATIVADO, 0) = 0 ) OR NVL(PPP.FLGDESATIVADO, 0) = 0) OR '
      
        '                                                     (PPP.IDPESS' +
        'OA IS NULL) '
      '                                                   ) '
      'AND (ELP.IDPESSOA     = DPT.IDTITULAR) '
      'AND (SFU.IDSITFUNC(+) = ELP.IDSITFUNC) '
      'AND (PPP.IDPLANOPREV  = PPREV.IDPLANOPREV(+)) '
      'AND (ELP.IDPESSJUR    = PJ.IDPESSOA(+)) '
      'AND (PPP.FLGDESATIVADO = 0) '
      'AND (PPP.IDSITPLANOPREV  = SITP.IDSITPLANOPREV (+)) '
      'AND (SP.IDSITPART(+)  = PPP.IDSITPART) '
      'AND (P.IDPESSOA  = PF.IDPESSOA) '
      'AND (PF.IDPESSOA = DPT.IDPESSOA) '
      'AND (PF.IDPESSOA = DPD.IDPESSOA) '
      'AND (DPD.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)) '
      'AND PLBENEF.IDPESSOA(+) = DPT.IDPESSOA '
      'AND PLBENEF.IDTITULAR(+) = DPT.IDTITULAR '
      
        'AND ELP.IDPESSJUR IN ( 42904, 1, 42908, 2113, 127094, 2002, 2003' +
        ', 42906, 42902, 42905, 42907 ) '
      'AND NVL(PPP.IDPLANOPREV, PLBENEF.IDPLANOPREV) IN ( 4, 6, 7 ) '
      
        'AND NOT EXISTS (SELECT 1 FROM CONTRATOEMPTMO CON WHERE CON.IDBEN' +
        'EF = DPT.IDPESSOA AND CON.FLGSITUACAO = '#39'A'#39') '
      
        'AND NOT EXISTS (SELECT 1 FROM TMPDESC T WHERE T.IDMODULO = 15 AN' +
        'D T.MESCOBRANCA = '#39'2006/12'#39' AND T.IDPESSOA = DPT.IDPESSOA AND T.' +
        'IDPROVENTO = 2483)'
      'AND DPT.IDPESSOA = 2320'
      'ORDER BY ELP.IDPESSJUR, DPT.IDPESSOA ASC '
      '')
    ValidateWithMask = True
    Left = 452
    Top = 383
    object qryCalculoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryCalculoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryCalculoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryCalculoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryCalculoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryCalculoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryCalculoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryCalculoPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryCalculoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryCalculoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
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
      '   MOE.MOESIGLA,'
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
      '   TIPOEMPTMO      TEP,'
      '   MOEDA           MOE'
      ''
      'WHERE'
      '       ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO )'
      '   AND ( TCE.IDTIPOCONTREMPTMO  = :PIDTIPOCONTREMPTMO )'
      '   AND ( TCE.MOECODIGO          = MOE.MOECODIGO(+) )'
      '')
    ValidateWithMask = True
    Left = 448
    Top = 332
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
    object qryTipoContratoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
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
    Left = 572
    Top = 31
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
      '     '#39'             '#39' AS MATRICULA, '
      '     SYSDATE AS DATACOBRANCA,'
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
    Left = 352
    Top = 359
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
      '  IDTMPDESC = :OLD_IDTMPDESC')
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
    Left = 348
    Top = 407
  end
end
