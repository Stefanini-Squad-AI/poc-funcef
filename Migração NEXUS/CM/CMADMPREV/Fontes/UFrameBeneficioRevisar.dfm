object FrameBeneficioRevisar: TFrameBeneficioRevisar
  Left = 0
  Top = 0
  Width = 1142
  Height = 244
  AutoScroll = False
  TabOrder = 0
  object dbChkBeneficio: TDBText
    Left = 26
    Top = 2
    Width = 90
    Height = 13
    AutoSize = True
    DataField = 'NOME'
    DataSource = dsFrameDadosBeneficio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbCheckBeneficio: TDBCheckBox
    Left = 8
    Top = 0
    Width = 17
    Height = 17
    DataField = 'PROCESSA'
    DataSource = dsFrameDadosBeneficio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object pnlDados: TPanel
    Left = 6
    Top = 19
    Width = 1131
    Height = 220
    TabOrder = 1
    Visible = False
    object dbgrdDadosBeneficioFuncef: TwwDBGrid
      Left = 2
      Top = 5
      Width = 1124
      Height = 84
      Selected.Strings = (
        'VLRENQUADRAMENTO'#9'10'#9'Enquadramento'
        'VALORSRB'#9'10'#9'Valor~SRB'
        'DATAINICIOFUND'#9'10'#9'DIB'
        'DATAINICIO'#9'10'#9'Data Início~Pagamento'
        'DATAFINAL'#9'10'#9'Data ~Final'
        'PERC_PENSAO'#9'10'#9'% aplicado~na Pensão'
        'BSTITULAR'#9'10'#9'Vlr BS~Titular'
        'FABTITULAR'#9'10'#9'Vlr FAB~Titular'
        'VLRBSTOTAL'#9'10'#9'Vlr Total~BS'
        'VLRBSATUAL'#9'10'#9'Vlr Atual~BS'
        'VLRFABTOTAL'#9'10'#9'Vlr Total~FAB'
        'VLRFABATUAL'#9'10'#9'Vlr Atual~FAB'
        'VALORTOTAL'#9'10'#9'Valor~Total'
        'VALORATUAL'#9'10'#9'Valor~Atual'
        'VLRBASEDEFICIT'#9'10'#9'Base~Déficit'
        'VLRINFINSS'#9'10'#9'RMI Inss'
        'VALORBASE1'#9'10'#9'Opção 1'
        'VALORBASE2'#9'10'#9'Opção 2'
        'VALORBASE3'#9'10'#9'Opção 3'
        'DIBBENEFANT'#9'10'#9'DIB Benefício~Anterior'
        'VALORBENEFANT'#9'10'#9'Valor Benefício~Anterior')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      ShowVertScrollBar = False
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsFrameDadosBeneficio
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
      OnFieldChanged = dbgrdDadosBeneficioFuncefFieldChanged
    end
    object dbgrdDadosBeneficioINSS: TwwDBGrid
      Left = 2
      Top = 5
      Width = 1124
      Height = 76
      Selected.Strings = (
        'VLRENQUADRAMENTO'#9'10'#9'Enquadramento'
        'VALORSRB'#9'10'#9'Valor~SRB'
        'DATAINICIOFUND'#9'10'#9'DIB'
        'DATAINICIO'#9'10'#9'Data Início~Pagamento'
        'DATAFINAL'#9'10'#9'Data ~Final'
        'VALORTOTAL'#9'10'#9'Valor ~Total'
        'VALORATUAL'#9'10'#9'Valor~Atual'
        'VLRINFINSS'#9'10'#9'RMI Inss'
        'VALORBASE1'#9'10'#9'Opção 1'
        'VALORBASE2'#9'10'#9'Opção 2'
        'VALORBASE3'#9'10'#9'Opção 3'
        'DIBBENEFANT'#9'10'#9'DIB Benefício~Anterior'
        'VALORBENEFANT'#9'10'#9'Valor Benefício~Anterior')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = False
      ShowVertScrollBar = False
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsFrameDadosBeneficio
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
      OnFieldChanged = dbgrdDadosBeneficioINSSFieldChanged
    end
    object GbLegenda: TGroupBox
      Left = 2
      Top = 92
      Width = 1124
      Height = 124
      Caption = 'Legenda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object lblanomesreemindiv: TLabel
        Left = 26
        Top = 72
        Width = 287
        Height = 13
        Caption = 'Revisar Por Mês Cobrança do Reembolso do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object DBText6: TDBText
        Left = 10
        Top = 20
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = dsFrameDadosBeneficio
      end
      object lblOpcao1: TLabel
        Left = 10
        Top = 45
        Width = 61
        Height = 13
        Caption = 'Opção 1 : '
      end
      object lblOpcao2: TLabel
        Left = 382
        Top = 45
        Width = 57
        Height = 13
        Caption = 'Opção 2 :'
      end
      object lblOpcao3: TLabel
        Left = 771
        Top = 45
        Width = 57
        Height = 13
        Caption = 'Opção 3 :'
      end
      object DBText7: TDBText
        Left = 199
        Top = 45
        Width = 178
        Height = 17
        DataField = 'NOMEVALORBASE1'
        DataSource = dsFrameDadosBeneficio
      end
      object DBText8: TDBText
        Left = 574
        Top = 45
        Width = 193
        Height = 17
        DataField = 'NOMEVALORBASE2'
        DataSource = dsFrameDadosBeneficio
      end
      object DBText5: TDBText
        Left = 963
        Top = 45
        Width = 155
        Height = 17
        DataField = 'NOMEVALORBASE3'
        DataSource = dsFrameDadosBeneficio
      end
      object GbReemindiv: TGroupBox
        Left = 324
        Top = 67
        Width = 226
        Height = 52
        Caption = 'Mês Cobrança Reembolso do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        Visible = False
        object Label70: TLabel
          Left = 23
          Top = 25
          Width = 61
          Height = 13
          Caption = 'Ano e Mês'
        end
        object edMesAno: TMaskEdit
          Left = 89
          Top = 20
          Width = 67
          Height = 21
          EditMask = '!9999/99;1;_'
          MaxLength = 7
          TabOrder = 0
          Text = '    /  '
        end
      end
      object chkmesreemindiv: TCheckBox
        Left = 10
        Top = 72
        Width = 17
        Height = 17
        TabOrder = 1
        OnClick = chkmesreemindivClick
      end
      object EdValorBase3: TcmMaskEditDlg
        Left = 833
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 2
        OnChange = EdValorBase3Change
        OnBtnClick = EdValorBase3BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
      object EdValorBase2: TcmMaskEditDlg
        Left = 444
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 3
        OnChange = EdValorBase2Change
        OnBtnClick = EdValorBase2BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
      object EdValorBase1: TcmMaskEditDlg
        Left = 69
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 4
        OnChange = EdValorBase1Change
        OnBtnClick = EdValorBase1BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
    end
  end
  object qryFrameDadosBeneficio: TwwQuery
    CachedUpdates = True
    AfterOpen = qryFrameDadosBeneficioAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS PROCESSA, B.NOME, B.NUMORDEMEVENTO,'
      ''
      
        '       BF.IDPESSJUR,        BF.IDPESSOA,         BF.IDTITULAR, B' +
        'F.IDPLANOPREV,'
      
        '       BF.SEQPROPOSTA,      BF.IDBENEFICIO,      BF.IDSITBENEFIC' +
        'IO,'
      '       BF.FLGPAGAINSS AS BENEFICIOPAGAINSS,'
      ''
      '       BP.FLGREFERENCIA,'
      '       BP.FLGPAGAINSS AS PLANOPAGAINSS,'
      
        '       BP.NOMEVALORBASE1,   BP.NOMEVALORBASE2,   BP.NOMEVALORBAS' +
        'E3,'
      ''
      
        '       PF.VLRENQUADRAMENTO, PF.VLRENQUADRAMENTO AS VLRENQUADRAME' +
        'NTO_ANT,'
      ''
      ''
      
        '       NVL(DECODE(BF.VALORBASE1,NULL,BPP.VALORBASE1, BF.VALORBAS' +
        'E1),0) VALORBASE1,'
      
        '       NVL(DECODE(BF.VALORBASE2,NULL,BPP.VALORBASE2, BF.VALORBAS' +
        'E2),0) VALORBASE2,'
      
        '       NVL(DECODE(BF.VALORBASE3,NULL,BPP.VALORBASE3, BF.VALORBAS' +
        'E3),0) VALORBASE3,'
      ''
      
        '       DECODE(BF.VALORBASE1,NULL,BPP.VALORBASE1, BF.VALORBASE1) ' +
        'AS VALORBASE1_ANT,'
      
        '       DECODE(BF.VALORBASE2,NULL,BPP.VALORBASE2, BF.VALORBASE2) ' +
        'AS VALORBASE2_ANT,'
      
        '       DECODE(BF.VALORBASE3,NULL,BPP.VALORBASE3, BF.VALORBASE3) ' +
        'AS VALORBASE3_ANT,'
      ''
      
        '       BF.DATAINICIO,       BF.DATAINICIO        AS DATAINICIO_A' +
        'NT,'
      
        '       BF.DATAFINAL,        BF.DATAFINAL         AS DATAFINAL_AN' +
        'T,'
      
        '       BF.DATAINICIOFUND,   BF.DATAINICIOFUND    AS DATAINICIOFU' +
        'ND_ANT,'
      
        '       BF.VALORATUAL,       BF.VALORATUAL        AS VALORATUAL_A' +
        'NT,'
      
        '       BF.VALORTOTAL,       BF.VALORTOTAL        AS VALORTOTAL_A' +
        'NT,'
      ''
      
        '       BF.VLRBSTOTAL,       BF.VLRBSTOTAL        AS VLRBSTOTAL_A' +
        'NT,'
      
        '       BF.VLRBSATUAL,       BF.VLRBSATUAL        AS VLRBSATUAL_A' +
        'NT,'
      
        '       BF.VLRFABTOTAL,      BF.VLRFABTOTAL       AS VLRFABTOTAL_' +
        'ANT,'
      
        '       BF.VLRFABATUAL,      BF.VLRFABATUAL       AS VLRFABATUAL_' +
        'ANT,'
      
        '       BF.VLRBASEDEFICIT,   BF.VLRBASEDEFICIT    AS VLRBASEDEFIC' +
        'IT_ANT,'
      ''
      
        '       BF.DIBBENEFANT,      BF.DIBBENEFANT       AS DIBBENEFANT_' +
        'ANT,'
      
        '       BF.VALORSRB,         BF.VALORSRB          AS VALORSRB_ANT' +
        ','
      
        '       BF.VLRINFINSS,       BF.VLRINFINSS        AS VLRINFINSS_A' +
        'NT,'
      
        '       BF.VLRCALCINSS,      BF.VLRCALCINSS       AS VLRCALCINSS_' +
        'ANT,'
      
        '       BF.VALORBENEFANT,    BF.VALORBENEFANT     AS VALORBENEFAN' +
        'T_ANT,'
      
        '       BF.DATAINICIOINSS,   BF.DATAREQUERIMENTO,  BF.VALORCOTAS,' +
        ' BF.IDPLANOORIGEM,'
      
        '       '#39'                                                        ' +
        '       '#39' AS NOMEBENEFANT,'
      '       '#39'                    '#39' AS TITULOBENEFANT,'
      '       BF.NUMEROPROCESSO,'
      '       BP.IDREGRACALCOP1,   BP.NOMEVALORBASE1,'
      '       BP.IDREGRACALCOP2,   BP.NOMEVALORBASE2,'
      '       BP.IDREGRACALCOP3,   BP.NOMEVALORBASE3,'
      
        '       BP.IDRUBRICAATRASO , BP.IDRUBDEVOLUCAO, BP.IDRUBRICAREVIS' +
        'AO,'
      ''
      '       PP.IDSITPART, PP.SALPARTICIPACAO,'
      '       PF.DATANASC, PF.NUMDEPIRRF,'
      
        '       NVL(PF.FLGMOLESTIAGRAVE,0) FLGMOLESTIAGRAVE, NVL(PF.FLGIS' +
        'ENTOIRRF,0) FLGISENTOIRRF,'
      '       BTT.IDRESPONSAVEL, BTT.PERCENTUAL AS PERCENTUALPENSAO,'
      
        '       PP.idsitplanoprev,    BF.FONTEPAGADORA,       BF.IDPLANPR' +
        'EVCONTAB,'
      
        '       BP.IDREGRACALCULO,    BP.IDREGRAPAGAMENTO,    BP.IDREGRAC' +
        'ALCBASEDEFICIT,'
      
        '       BP.FLGAPRESENTABSFAB, BP.FLGAPRESENTADEFICIT, BF.DATAREQU' +
        'ERIMENTO,'
      
        '       BF.VALORBINSSANT1,    BF.VALORBINSSANT2,      BF.VALORBIN' +
        'SSANT3,'
      
        '       BF.FLGPROVISORIO,     BF.PERCPROVISORIO,      BF.PRAZOPRO' +
        'VISORIO,'
      ''
      '       --WO22176'
      
        '       BF.FABTITULAR,        BF.FABTITULAR      AS FABTITULAR_AN' +
        'T,'
      
        '       BF.BSTITULAR,         BF.BSTITULAR       AS BSTITULAR_ANT' +
        ','
      
        '       BF.VLRTOTALTITULAR,   BF.VLRTOTALTITULAR AS VLRTOTTIT_ANT' +
        ','
      '       BP.FLGAPRESENTABSFAB, BP.FLGAPRESENTADEFICIT,'
      '       (SELECT CASE'
      '                 WHEN'
      '                   BF.IDPESSOA <> BF.IDTITULAR AND'
      '                   BP.FLGAPRESENTABSFAB = 1 AND'
      '                   BF.DATAINICIOFUND >= P.DTNOVOCALCPENSASALDADA'
      '                 THEN 1'
      '                 ELSE 0'
      '               END'
      '          FROM PARAMAPREV P'
      '       ) AS FLGNOVOCALCPENSAO,'
      
        '       CM.FN_BF_BUSCA_PERC_PENSAO(BF.NUMEROPROCESSO, BF.VLRBSTOT' +
        'AL, BF.BSTITULAR, BTT.PERCENTUAL, '#39#39') AS PERC_PENSAO'
      'FROM'
      
        '  PESSOAFISICA PF, BENEFPLANOPART BPP, BENEFBFCIARIO BF, BENEFIC' +
        'IO B, BENEFPLANPREV BP,'
      '  PARTPREVPLAN PP, BFCIARIOTITPLAN BTT'
      'WHERE  BF.IDPESSJUR      = :IDPESSJUR'
      'AND    BF.IDPLANOPREV    = :IDPLANOPREV'
      'AND    BF.IDTITULAR      = :IDTITULAR'
      'AND    BF.IDPESSOA       = :IDPESSOA'
      'AND    BF.SEQPROPOSTA    = :SEQPROPOSTA'
      'AND    BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    B.IDBENEFICIO     = :IDBENEFICIO'
      'AND    BP.IDPLANOPREV    = BF.IDPLANOPREV'
      'AND    BP.IDBENEFICIO    = BF.IDBENEFICIO'
      'AND    PF.IDPESSOA       = BF.IDPESSOA'
      'AND    BPP.IDPESSJUR(+)  = BF.IDPESSJUR'
      'AND    BPP.IDPLANOPREV(+)= BF.IDPLANOPREV'
      'AND    BPP.IDPESSOA(+)   = BF.IDTITULAR'
      'AND    BPP.IDBENEFICIO(+)= BF.IDBENEFICIO'
      'AND    BF.IDPLANOORIGEM  = PP.IDPLANOPREV(+)'
      'AND    BF.IDTITULAR      = PP.IDPESSOA(+)'
      ''
      'AND    BF.IDPESSJUR   = BTT.IDPESSJUR'
      'AND    BF.IDTITULAR   = BTT.IDTITULAR'
      'AND    BF.IDPESSOA    = BTT.IDPESSOA'
      'AND    BF.IDPLANOPREV = BTT.IDPLANOPREV'
      'AND    BF.SEQPROPOSTA = BTT.SEQPROPOSTA'
      'AND    BF.IDPLANOORIGEM  = BTT.IDPLANOORIGEM'
      'AND    BF.IDBENEFICIO = BTT.IDBENEFICIO'
      ''
      'ORDER BY BP.FLGREFERENCIA DESC, B.NUMORDEMEVENTO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDadosBeneficoi
    ControlType.Strings = (
      'PROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 657
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object dsFrameDadosBeneficio: TwwDataSource
    DataSet = qryFrameDadosBeneficio
    Left = 791
    Top = 166
  end
  object QryUpdate: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 888
    Top = 175
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 1056
    Top = 127
  end
  object updDadosBeneficoi: TUpdateSQL
    ModifySQL.Strings = (
      
        'UPDATE CONTRIBUICAO SET NOME = :NOME WHERE IDCONTRIBUICAO=:IDCON' +
        'TRIBUICAO')
    InsertSQL.Strings = (
      
        'INSERT INTO CONTRIBUICAO (IDCONTRIBUICAO) VALUES (:IDCONTRIBUICA' +
        'O)')
    Left = 1047
    Top = 187
  end
  object qryDadosPessoaBeneficio: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT  DECODE(B.IDPLANOPREV, NULL, PP.IDPLANOPREV, B.IDPLANOPRE' +
        'V)'
      '      , PP.IDSITPART'
      '      , EL.IDSITFUNC'
      '      , PP.IDSITPLANOPREV'
      '      , NVL(B.IDBENEFICIO,0)'
      '      , SP.FLGINTERNO'
      
        '      , DECODE(B.IDPLANOORIGEM, NULL, PP.IDPLANOPREV, B.IDPLANOO' +
        'RIGEM)'
      'FROM'
      '   PROCESSOBENEF P,'
      '   BENEFBFCIARIO B,'
      '   ELEGPATRO EL,'
      '   PARTPREVPLAN PP,'
      '   PESSOA PES,'
      '   BENEFPLANPREV BPL,'
      '   BENEFICIO BF,'
      '   PESSOA PAT,'
      '   PLANPREV PL,'
      '   PESSOA BENEF,'
      '   SITPART SP,'
      '   DEPENTIT'
      'WHERE '
      '   ( PP.IDPESSJUR        = EL.IDPESSJUR ) AND'
      '   ( PP.IDPESSOA         = EL.IDPESSOA ) AND'
      '   ( PES.IDPESSOA        = EL.IDPESSOA ) AND'
      '   ( PAT.IDPESSOA        = PP.IDPESSJUR ) AND'
      '   ( PL.IDPLANOPREV      = PP.IDPLANOPREV ) AND'
      '   ( B.IDPESSJUR(+)      = PP.IDPESSJUR ) AND'
      '   ( B.IDPLANOORIGEM(+)  = PP.IDPLANOPREV ) AND'
      '   ( B.IDTITULAR(+)      = PP.IDPESSOA ) AND'
      '   ( B.SEQPROPOSTA(+)    = PP.SEQPROPOSTA ) AND'
      '   ( P.NUMEROPROCESSO(+) = B.NUMEROPROCESSO ) AND'
      '   ( BPL.IDPLANOPREV(+)  = B.IDPLANOPREV ) AND'
      '   ( BPL.IDBENEFICIO(+)  = B.IDBENEFICIO ) AND'
      '   ( BF.IDBENEFICIO(+)   = B.IDBENEFICIO ) AND'
      
        '   ( (BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND (BP' +
        'L.FLGPAGAINSS = 1))  OR (BPL.FLGREFERENCIA IS NULL ) ) AND'
      '   ( BENEF.IDPESSOA(+)   = B.IDPESSOA            ) AND'
      '   ( SP.IDSITPART = PP.IDSITPART ) AND'
      '   ( B.IDTITULAR = DEPENTIT.IDTITULAR(+) ) AND'
      '   ( B.IDPESSOA = DEPENTIT.IDPESSOA(+) ) AND'
      '   ( PP.IDPESSJUR =  :IDPESSJUR) AND'
      '   ( PL.IDPLANOPREV  = :IDPLANOPREV ) AND'
      '   ( B.IDTITULAR      = :IDTITULAR ) AND'
      '   ( B.IDPESSOA       = :IDPESSOA ) AND'
      '   ( B.NUMEROPROCESSO = :NUMEROPROCESSO) AND   '
      '   ( B.IDBENEFICIO   =  :IDBENEFICIO)')
    ValidateWithMask = True
    Left = 952
    Top = 175
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryBenefbfciario: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 992
    Top = 97
  end
  object qryDadosBeneficios: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS PROCESSA, B.NOME, B.NUMORDEMEVENTO,'
      ''
      
        '       BF.IDPESSJUR,        BF.IDPESSOA,         BF.IDTITULAR, B' +
        'F.IDPLANOPREV,'
      
        '       BF.SEQPROPOSTA,      BF.IDBENEFICIO,      BF.IDSITBENEFIC' +
        'IO,'
      '       BF.FLGPAGAINSS AS BENEFICIOPAGAINSS,'
      ''
      '       BP.FLGREFERENCIA,'
      '       BP.FLGPAGAINSS AS PLANOPAGAINSS,'
      
        '       BP.NOMEVALORBASE1,   BP.NOMEVALORBASE2,   BP.NOMEVALORBAS' +
        'E3,'
      ''
      
        '       PF.VLRENQUADRAMENTO, PF.VLRENQUADRAMENTO AS VLRENQUADRAME' +
        'NTO_ANT,'
      ''
      
        '       DECODE(BF.VALORBASE1,NULL,BPP.VALORBASE1, BF.VALORBASE1) ' +
        'VALORBASE1,'
      
        '       DECODE(BF.VALORBASE2,NULL,BPP.VALORBASE2, BF.VALORBASE2) ' +
        'VALORBASE2,'
      
        '       DECODE(BF.VALORBASE3,NULL,BPP.VALORBASE3, BF.VALORBASE3) ' +
        'VALORBASE3,'
      ''
      
        '       DECODE(BF.VALORBASE1,NULL,BPP.VALORBASE1, BF.VALORBASE1) ' +
        'AS VALORBASE1_ANT,'
      
        '       DECODE(BF.VALORBASE2,NULL,BPP.VALORBASE2, BF.VALORBASE2) ' +
        'AS VALORBASE2_ANT,'
      
        '       DECODE(BF.VALORBASE3,NULL,BPP.VALORBASE3, BF.VALORBASE3) ' +
        'AS VALORBASE3_ANT,'
      ''
      
        '       BF.DATAINICIO,       BF.DATAINICIO        AS DATAINICIO_A' +
        'NT,'
      
        '       BF.DATAFINAL,        BF.DATAFINAL         AS DATAFINAL_AN' +
        'T,'
      
        '       BF.DATAINICIOFUND,   BF.DATAINICIOFUND    AS DATAINICIOFU' +
        'ND_ANT,'
      
        '       BF.VALORATUAL,       BF.VALORATUAL        AS VALORATUAL_A' +
        'NT,'
      
        '       BF.VALORTOTAL,       BF.VALORTOTAL        AS VALORTOTAL_A' +
        'NT,'
      ''
      
        '       BF.VLRBSTOTAL,       BF.VLRBSTOTAL        AS VLRBSTOTAL_A' +
        'NT,'
      
        '       BF.VLRBSATUAL,       BF.VLRBSATUAL        AS VLRBSATUAL_A' +
        'NT,'
      
        '       BF.VLRFABTOTAL,      BF.VLRFABTOTAL       AS VLRFABTOTAL_' +
        'ANT,'
      
        '       BF.VLRFABATUAL,      BF.VLRFABATUAL       AS VLRFABATUAL_' +
        'ANT,'
      
        '       BF.VLRBASEDEFICIT,   BF.VLRBASEDEFICIT    AS VLRBASEDEFIC' +
        'IT_ANT,       '
      ''
      
        '       BF.DIBBENEFANT,      BF.DIBBENEFANT       AS DIBBENEFANT_' +
        'ANT,'
      
        '       BF.VALORSRB,         BF.VALORSRB          AS VALORSRB_ANT' +
        ','
      
        '       BF.VLRINFINSS,       BF.VLRINFINSS        AS VLRINFINSS_A' +
        'NT,'
      
        '       BF.VLRCALCINSS,      BF.VLRCALCINSS       AS VLRCALCINSS_' +
        'ANT,'
      
        '       BF.VALORBENEFANT,    BF.VALORBENEFANT     AS VALORBENEFAN' +
        'T_ANT,'
      '       BF.DATAINICIOINSS,   BF.DATAREQUERIMENTO,  BF.VALORCOTAS,'
      
        '       '#39'                                                        ' +
        '       '#39' AS NOMEBENEFANT,'
      '       '#39'                    '#39' AS TITULOBENEFANT,'
      '       BF.NUMEROPROCESSO,'
      '       BP.IDREGRACALCOP1,   BP.NOMEVALORBASE1,'
      '       BP.IDREGRACALCOP2,   BP.NOMEVALORBASE2,'
      '       BP.IDREGRACALCOP3,   BP.NOMEVALORBASE3,'
      
        '       BP.IDRUBRICAATRASO , BP.IDRUBDEVOLUCAO, BP.IDRUBRICAREVIS' +
        'AO,'
      ''
      '       PP.IDSITPART, PP.SALPARTICIPACAO,'
      '       PF.DATANASC, PF.NUMDEPIRRF,'
      
        '       NVL(PF.FLGMOLESTIAGRAVE,0) FLGMOLESTIAGRAVE, NVL(PF.FLGIS' +
        'ENTOIRRF,0) FLGISENTOIRRF,'
      '       BTT.IDRESPONSAVEL, BTT.PERCENTUAL AS PERCENTUALPENSAO,'
      '       PP.idsitplanoprev'
      '       , BF.FONTEPAGADORA'
      ''
      
        '       , BF.FABTITULAR, BF.BSTITULAR, BF.VLRTOTALTITULAR        ' +
        '                  --WO22176'
      
        '       , BP.FLGAPRESENTABSFAB, BP.FLGAPRESENTADEFICIT           ' +
        '                  --WO22176'
      
        '       , (SELECT DTNOVOCALCPENSASALDADA FROM PARAMAPREV) AS DATA' +
        'NOVOCALCPENSAO    --WO22176'
      '       '
      'FROM'
      
        '  PESSOAFISICA PF, BENEFPLANOPART BPP, BENEFBFCIARIO BF, BENEFIC' +
        'IO B, BENEFPLANPREV BP,'
      '  PARTPREVPLAN PP, BFCIARIOTITPLAN BTT'
      'WHERE  BF.IDPESSJUR      = :IDPESSJUR'
      'AND    BF.IDPLANOPREV    = :IDPLANOPREV'
      'AND    BF.IDTITULAR      = :IDTITULAR'
      'AND    BF.IDPESSOA       = :IDPESSOA'
      'AND    BF.SEQPROPOSTA    = :SEQPROPOSTA'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BP.IDPLANOPREV    = BF.IDPLANOPREV'
      'AND    BP.IDBENEFICIO    = BF.IDBENEFICIO'
      'AND    PF.IDPESSOA       = BF.IDPESSOA'
      'AND    BPP.IDPESSJUR(+)  = BF.IDPESSJUR'
      'AND    BPP.IDPLANOPREV(+)= BF.IDPLANOPREV'
      'AND    BPP.IDPESSOA(+)   = BF.IDTITULAR'
      'AND    BPP.IDBENEFICIO(+)= BF.IDBENEFICIO'
      'AND    BF.IDPLANOORIGEM  = PP.IDPLANOPREV(+)'
      'AND    BF.IDTITULAR      = PP.IDPESSOA(+)'
      ''
      'AND    BF.IDPESSJUR   = BTT.IDPESSJUR'
      'AND    BF.IDTITULAR   = BTT.IDTITULAR'
      'AND    BF.IDPESSOA    = BTT.IDPESSOA'
      'AND    BF.IDPLANOPREV = BTT.IDPLANOPREV'
      'AND    BF.SEQPROPOSTA = BTT.SEQPROPOSTA'
      'AND    BF.IDPLANOORIGEM  = BTT.IDPLANOORIGEM'
      'AND    BF.IDBENEFICIO = BTT.IDBENEFICIO'
      ''
      'ORDER BY BF.FONTEPAGADORA, BF.IDSITBENEFICIO'
      ' '
      ' ')
    ControlType.Strings = (
      'PROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 873
    Top = 43
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
end
