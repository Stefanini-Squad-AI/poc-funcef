inherited frmDesenhoRelCartaCobrEP: TfrmDesenhoRelCartaCobrEP
  Left = 39
  Top = 209
  HelpContext = 150080
  Caption = 'Cartas de Cobrança'
  ClientHeight = 254
  ClientWidth = 631
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 631
    Height = 186
    inherited PnlImprime: TPanel
      Width = 629
      Height = 184
    end
    inherited PnlCadastro: TPanel
      Width = 629
      Height = 184
      inherited Label1: TLabel
        Left = 16
        Top = 10
      end
      inherited DeRelatorio: TwwDBEdit
        Left = 16
        Top = 24
        DataField = 'MODELOCARTA'
      end
      inherited BtnDesenho: TBitBtn
        Left = 488
        Top = 112
        Width = 121
        Height = 53
      end
      inline molContratoEmptmo: TmolContratoEmptmo
        Left = 8
        Top = 56
        Width = 609
        TabOrder = 2
        TabStop = True
        inherited edtNome: TEdit
          Width = 353
        end
        inherited btnBuscaContrato: TBitBtn
          Left = 552
        end
        inherited btnLimpaContrato: TBitBtn
          Left = 576
        end
      end
      object Panel1: TPanel
        Left = 16
        Top = 112
        Width = 257
        Height = 53
        TabOrder = 3
        object Label3: TLabel
          Left = 16
          Top = 20
          Width = 128
          Height = 13
          Caption = 'Data de Referência:   '
        end
        object edtDataRef: TwwDBDateTimePicker
          Left = 136
          Top = 16
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
          TabOrder = 0
          UnboundDataType = wwDTEdtDate
          DisplayFormat = 'dd/mm/yyyy'
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 631
    Height = 35
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 85
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 255
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 170
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 221
    Width = 631
    Height = 33
    inherited tb97Fundo: TToolbar97
      Left = 376
      DockPos = 465
      inherited sep1: TToolbarSep97
        Left = 248
      end
      inherited sep3: TToolbarSep97
        Left = 81
      end
      inherited BtnImprime: TToolbarButton97
        Width = 81
        Height = 27
        Enabled = False
        Spacing = 4
        Visible = False
      end
      object ToolbarSep972: TToolbarSep97 [3]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 2
        SizeVert = 1
      end
      inherited bbtnSair: TBitBtn
        Left = 84
        Height = 27
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Height = 27
        ClickHelpContext = 230030
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 203
      DockPos = 264
      inherited ToolbarSep971: TToolbarSep97
        Left = 83
      end
      object ToolbarSep973: TToolbarSep97 [1]
        Left = 167
        Top = 0
        Blank = True
        SizeHorz = 2
        SizeVert = 1
      end
      object ToolbarSep974: TToolbarSep97 [2]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
        SizeVert = 1
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 2
        Height = 27
      end
      inherited bbtnCancelar: TBitBtn
        Left = 86
        Height = 27
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 984
  end
  inherited ds: TwwDataSource
    Left = 408
    Top = 0
  end
  inherited upd: TUpdateSQL
    InsertSQL.Strings = (
      'insert into CARTACOBRANCA'
      
        '  (IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCAR' +
        'TA)'
      'values'
      
        '  (:IDCARTACOBRANCA, :MODELOCARTA, :IDREPORTS, :ORIGEMCM, :FLGTI' +
        'POCARTA)')
    Left = 376
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CC.MODELOCARTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CARTACOBRANCA CC')
    CamposChave.Strings = (
      'CC.IDCARTACOBRANCA'
      'CC.MODELOCARTA')
    Filtro.Strings = (
      'CC.IDREPORTS      IS NOT NULL'
      'CC.FLGTIPOCARTA   = '#39'E'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 504
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 937
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 448
    Top = 16
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDCARTACOBRANCA,'
      '   MODELOCARTA,'
      '   IDREPORTS,'
      '   ORIGEMCM,'
      '   FLGTIPOCARTA'
      'FROM'
      '   CARTACOBRANCA'
      'WHERE'
      '       IDCARTACOBRANCA  =:PIDCARTACOBRANCA'
      '   AND FLGTIPOCARTA     = '#39'E'#39)
    Left = 344
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCARTACOBRANCA'
        ParamType = ptInput
      end>
    object qryIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'BASEDADOS.CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object qryMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'BASEDADOS.CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object qryIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'BASEDADOS.CARTACOBRANCA.IDREPORTS'
    end
    object qryORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'BASEDADOS.CARTACOBRANCA.ORIGEMCM'
    end
    object qryFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'BASEDADOS.CARTACOBRANCA.FLGTIPOCARTA'
      FixedChar = True
      Size = 1
    end
  end
  inherited DsgnCM: TppDesigner
    Left = 312
    Top = 164
  end
  inherited MergeMenu: TMainMenu
    Left = 584
    Top = 0
  end
  inherited qryReports: TwwQuery
    Left = 432
    Top = 64
  end
  inherited PpDados: TppBDEPipeline
    CloseDataSource = True
    Left = 368
    Top = 164
  end
  inherited DsDados: TwwDataSource
    Left = 368
    Top = 152
  end
  inherited QryDados: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      '   PTI.NOME AS NOME_TITULAR,'
      '   PBF.NOME AS NOME_BENEF,'
      '   CON.IDPESSOA,'
      '   CON.IDBENEF,'
      '   CON.IDPATRO,'
      
        '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, '#39'Pensionista' +
        #39') AS SIT_PART,'
      '   DEP.MATRICULA AS MATRICULA,'
      '   ELP.MATRICULA AS MATRICULA_TIT,'
      '   PPP.INSCRICAONUMERO,'
      ''
      '   TO_DATE(:PDATA, '#39'DD/MM/YYYY'#39') AS DATA_CARTA,'
      ''
      '   EDP.LOGRADOURO,'
      '   CID.NOME AS CIDADE,'
      '   EST.CODESTADO,'
      '   EDP.NUMERO,'
      '   EDP.COMPLEMENTO,'
      '   EDP.BAIRRO,'
      '   EDP.CEP,'
      ''
      
        '   SLD.HMEDATAATUALIZA, SLD.HMESALDODEV, SLD.HMEPARCELA, SLD.HME' +
        'NUMPARCELAS,'
      '   TCE.TCEDESCRICAO,'
      '   (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS DEVE,'
      
        '   (NVL(SLD.HMESALDODEV, 0) + (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR' +
        '_PAG.VLR_PAG, 0))) AS TOTAL_DEV'
      'FROM'
      '   PESSOA          PBF,'
      '   PESSOA          PTI,'
      '   CONTRATOEMPTMO  CON,'
      '   DEPENTIT        DEP,'
      '   ELEGPATRO       ELP,'
      '   PARTPREVPLAN    PPP,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP,'
      '   PATRO           PTR,'
      '   PLANPREV        PLP,'
      '   SITPART         SIT,'
      '   ENDPESS         EDP,'
      '   CIDADES         CID,'
      '   ESTADO          EST,'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      
        '      HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMEPARCELA, HME.' +
        'HMENUMPARCELAS'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '      ('
      '      SELECT'
      
        '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOV' +
        'EMPTMO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '      WHERE'
      '             CON.FLGSITUACAO         <> '#39'C'#39
      'AND CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      
        '         AND CON.IDPATRO              IN (42904, 1, 42908, 2113,' +
        ' 2002, 42906, 2003, 42902, 42905, 42907)'
      '         AND CON.IDPLANOPREV          IN (4, 6, 7)'
      '         AND ITC.ITCTRATASALDODEV    <> 0'
      
        '         AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORN' +
        'ADO = 0) )'
      '         AND ( HME.HMEDATAATUALIZA    <='
      '               ('
      '               SELECT'
      
        '                  DECODE(MAX(H.HMEDATAATUALIZA), NULL, TO_DATE(:' +
        'PDATA, '#39'DD/MM/YYYY'#39'),'
      
        '                                                       MAX(H.HME' +
        'DATAATUALIZA))'
      '               FROM'
      '                  HISTMOVEMPTMO   H,'
      '                  CONTRATOEMPTMO  C,'
      '                  ITEMXTIPOCONTR  IT'
      '               WHERE'
      
        '                      C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPT' +
        'MO'
      
        '                  AND H.HMEDATAATUALIZA    <= TO_DATE(:PDATA, '#39'D' +
        'D/MM/YYYY'#39')'
      '                  AND IT.ITCTRATASALDODEV  <> 0'
      '                  AND HME.HMEANOCOMPETENCIA = 2003'
      '                  AND HME.HMEMESCOMPETENCIA = 05'
      
        '                  AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNAD' +
        'O IS NULL )'
      '                  AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO'
      
        '                  AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPT' +
        'MO'
      '                  AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO'
      '               )'
      '             )'
      
        '         AND ( (RTRIM(LTRIM(HME.HMEANOCOMPETENCIA))) || (RTRIM(L' +
        'TRIM(HME.HMEMESCOMPETENCIA))) ) <= 200305'
      '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '
      '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '
      '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) MAX'
      '   WHERE'
      '          ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO )'
      '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO )'
      '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO )'
      '   ) SLD,'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS V' +
        'LR_DEV '
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO       <> '#39'C'#39
      'AND CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7)'
      '      AND HME.HMESEQCOBRANCA     = 1'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      
        '      AND HME.HMEDATAPREVISTA    <= TO_DATE(:PDATA, '#39'DD/MM/YYYY'#39 +
        ')'
      '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) PAR_DEV,'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0),'
      
        '                                DECODE(FLGABONADO, 1, NVL(HME.HM' +
        'EVLRPREVISTO, 0),'
      
        '                                                      NVL(HME.HM' +
        'EVLREFETIVO, 0)))) AS VLR_PAG'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO       <> '#39'C'#39
      'AND CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7)'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      
        '      AND HME.HMEDATAPREVISTA    <= TO_DATE(:PDATA, '#39'DD/MM/YYYY'#39 +
        ')'
      '      AND ('
      
        '          (HME.HMEDATAEFETIVA    <= TO_DATE(:PDATA, '#39'DD/MM/YYYY'#39 +
        '))'
      
        '       OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO' +
        '_DATE(:PDATA, '#39'DD/MM/YYYY'#39')) )'
      
        '       OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO' +
        '_DATE(:PDATA, '#39'DD/MM/YYYY'#39')) )'
      '          )'
      '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) PAR_PAG'
      'WHERE'
      '       TEP.IDEMPRESAPROP        = 1'
      'AND CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      
        '   AND ( (SLD.HMESALDODEV       > 0) OR ((NVL(PAR_DEV.VLR_DEV, 0' +
        ') - NVL(PAR_PAG.VLR_PAG, 0)) > 0) )'
      '   AND ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      
        '   AND ( ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) > ' +
        '0) )'
      '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO )'
      '   AND ( CON.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDPESSOA           = PTI.IDPESSOA )'
      '   AND ( CON.IDPESSOA           = ELP.IDPESSOA )'
      '   AND ( CON.IDPATRO            = PTR.IDPESSOA )'
      '   AND ( CON.IDBENEF            = PBF.IDPESSOA )'
      '   AND ( CON.IDPESSOA           = PPP.IDPESSOA )'
      '   AND ( CON.IDPATRO            = PPP.IDPESSJUR )'
      '   AND ( ELP.IDPESSOA           = PPP.IDPESSOA )'
      '   AND ( ELP.IDPESSJUR          = PPP.IDPESSJUR )'
      '   AND ( PTR.IDPESSOA           = ELP.IDPESSJUR )'
      '   AND ( CON.IDBENEF            = PBF.IDPESSOA )'
      '   AND ( PTI.IDPESSOA           = ELP.IDPESSOA )'
      '   AND ( PTI.IDPESSOA           = PPP.IDPESSOA )'
      '   AND ( CON.IDPLANOPREV        = PLP.IDPLANOPREV )'
      '   AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '   AND ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO )'
      '   AND ( ELP.IDPESSOA           = DEP.IDTITULAR )'
      '   AND ( CON.IDBENEF            = DEP.IDPESSOA )'
      '   AND ( CON.IDPESSOA           = DEP.IDTITULAR )'
      '   AND ( PPP.IDSITPART          = SIT.IDSITPART )'
      '   AND ( CON.IDBENEF            = EDP.IDPESSOA(+) )'
      '   AND ( EDP.IDCIDADES          = CID.IDCIDADES(+) )'
      '   AND ( CID.IDESTADO           = EST.IDESTADO(+) )'
      '   AND PPP.FLGDESATIVADO        = 0 '
      'ORDER BY'
      '   PBF.NOME, CON.IDCONTRATOEMPTMO')
    Left = 432
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
        Value = '28/02/2003'
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
        Value = '325227'
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object QryDadosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object QryDadosNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 60
    end
    object QryDadosNOME_BENEF: TStringField
      FieldName = 'NOME_BENEF'
      Size = 60
    end
    object QryDadosSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 50
    end
    object QryDadosMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object QryDadosMATRICULA_TIT: TStringField
      FieldName = 'MATRICULA_TIT'
      Size = 13
    end
    object QryDadosINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object QryDadosLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object QryDadosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object QryDadosCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object QryDadosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object QryDadosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object QryDadosBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object QryDadosCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object QryDadosHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object QryDadosHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object QryDadosHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object QryDadosHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object QryDadosTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object QryDadosDEVE: TFloatField
      FieldName = 'DEVE'
    end
    object QryDadosTOTAL_DEV: TFloatField
      FieldName = 'TOTAL_DEV'
    end
    object QryDadosDATA_CARTA: TDateTimeField
      FieldName = 'DATA_CARTA'
    end
    object QryDadosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object QryDadosIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object QryDadosIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
  end
  inherited RptModelo: TppReport
    Template.FileName = ''
    Left = 312
    Top = 152
    DataPipelineName = 'PpDados'
    inherited ppDetailBand2: TppDetailBand
      mmHeight = 140494
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Prezado(a) Sr(a).'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 65617
        mmWidth = 27252
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Assunto: Débito de Empréstimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 81492
        mmWidth = 49742
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Contrato nº: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 87313
        mmWidth = 19844
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Matrícula: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 93663
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 87313
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 93663
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'NOME_BENEF'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 2910
        mmWidth = 24342
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Rua'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 7673
        mmWidth = 6615
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 12700
        mmWidth = 3440
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 17727
        mmWidth = 10319
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 22754
        mmWidth = 11906
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 27781
        mmWidth = 11906
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 42333
        mmTop = 27781
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 29369
        mmTop = 7673
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 25665
        mmTop = 12700
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 32544
        mmTop = 17727
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 33602
        mmTop = 22754
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 33602
        mmTop = 27781
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CEP'
        DataPipeline = PpDados
        DisplayFormat = '99999-999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 51065
        mmTop = 27781
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DATA_CARTA'
        DataPipeline = PpDados
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 44186
        mmTop = 50800
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 9790
        mmTop = 50800
        mmWidth = 13494
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = ', '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 40481
        mmTop = 50800
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'NOME_BENEF'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 65617
        mmWidth = 24342
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Saldo Devedor: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 51858
        mmTop = 114565
        mmWidth = 25665
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Valor em Aberto:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 51858
        mmTop = 119856
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DEVE'
        DataPipeline = PpDados
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 83873
        mmTop = 119856
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'HMESALDODEV'
        DataPipeline = PpDados
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 83873
        mmTop = 115094
        mmWidth = 23283
        BandType = 4
      end
    end
  end
  inherited QryCadModelo: TwwQuery
    Left = 504
    Top = 64
  end
end
