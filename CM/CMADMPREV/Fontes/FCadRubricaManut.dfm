inherited frmCadRubricaManut: TfrmCadRubricaManut
  Left = -4
  Top = -4
  Caption = 'Cadastro Manual de Rubricas de Manutenção'
  ClientHeight = 682
  ClientWidth = 1024
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1024
    Height = 596
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 85
      Width = 1022
      Height = 510
      Tabs.Strings = (
        'Rubricas')
      inherited Dock974: TDock97 [0]
        Left = 928
        Height = 451
      end
      inherited Dock973: TDock97
        Width = 1014
      end
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 924
        Height = 451
        inherited tbsDet: TTabSheet
          Caption = 'Rubricas'
          inherited pnlControlesDet: TPanel [0]
            Width = 916
            Height = 423
            object Label8: TLabel
              Left = 3
              Top = 58
              Width = 45
              Height = 13
              Caption = 'Rubrica'
            end
            object Label9: TLabel
              Left = 3
              Top = 97
              Width = 126
              Height = 13
              Caption = 'Valor Real da Rubrica'
            end
            object Label10: TLabel
              Left = 3
              Top = 139
              Width = 143
              Height = 13
              Caption = 'Valor Integral da Rubrica'
            end
            object grpMesAnoRef: TGroupBox
              Left = 3
              Top = 6
              Width = 160
              Height = 52
              Caption = 'Ano e Mês de Referência'
              TabOrder = 0
              object Label6: TLabel
                Left = 88
                Top = 24
                Width = 6
                Height = 16
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edAnoRef: TEdit
                Left = 8
                Top = 24
                Width = 73
                Height = 21
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object edMesRef: TEdit
                Left = 96
                Top = 24
                Width = 49
                Height = 21
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnExit = edMesRefExit
              end
            end
            object GroupBox1: TGroupBox
              Left = 171
              Top = 6
              Width = 160
              Height = 52
              Caption = 'Ano e Mês de Cobr/Pgmto'
              TabOrder = 1
              object Label7: TLabel
                Left = 88
                Top = 24
                Width = 6
                Height = 16
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edAnoCob: TEdit
                Left = 8
                Top = 24
                Width = 73
                Height = 21
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object edMesCob: TEdit
                Left = 96
                Top = 24
                Width = 49
                Height = 21
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnExit = edMesCobExit
              end
            end
            object dbrgrpFlgSRB: TDBRadioGroup
              Left = 160
              Top = 95
              Width = 174
              Height = 90
              Caption = ' Tipo '
              DataField = 'FLGSRB'
              DataSource = dsDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Ativo ou Mantido Total'
                'Aux. Doença'
                'INSS'
                'Sal. Virtual'
                'Mantido Parcial'
                'Outros')
              ParentFont = False
              TabOrder = 3
              Values.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '0')
            end
            object dblkpcmbRubrica: TwwDBLookupCombo
              Left = 3
              Top = 72
              Width = 331
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRPROVDESC'#9'130'#9'Rubrica'
                'IDRUBRICA'#9'10'#9'Código'#9'F')
              DataField = 'IDRUBRICA'
              DataSource = dsDet
              LookupTable = qryProvDesc
              LookupField = 'IDRUBRICA'
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object redValor: TMaskEdit
              Left = 3
              Top = 112
              Width = 121
              Height = 21
              TabOrder = 4
            end
            object redIntegral: TMaskEdit
              Left = 3
              Top = 154
              Width = 121
              Height = 21
              TabOrder = 5
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 916
            Height = 423
            Selected.Strings = (
              'MES'#9'9'#9'Mês de ~Referência'
              'MESCOBRANCA'#9'9'#9'Mês de ~Cob./Pag.'
              'IDRUBRICA'#9'12'#9'Código da Rubrica'
              'VALORPROVENTO'#9'12'#9'Valor (R$)'
              'DESCRICAO'#9'50'#9'Rubrica'
              'DESCFLGSRB'#9'30'#9'Tipo')
            TitleLines = 2
          end
        end
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 1022
      Height = 84
      object Label1: TLabel
        Left = 8
        Top = 3
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object Label2: TLabel
        Left = 378
        Top = 3
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label3: TLabel
        Left = 506
        Top = 3
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object Label4: TLabel
        Left = 8
        Top = 40
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label5: TLabel
        Left = 378
        Top = 40
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 17
        Width = 363
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 8
        Top = 54
        Width = 363
        Height = 21
        Color = clSilver
        DataField = 'NOMEPATRO'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 378
        Top = 54
        Width = 241
        Height = 21
        Color = clSilver
        DataField = 'NOMEPLANO'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 378
        Top = 17
        Width = 121
        Height = 21
        Color = clSilver
        DataField = 'MATRICULA'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 506
        Top = 17
        Width = 113
        Height = 21
        Color = clSilver
        DataField = 'INSCRICAONUMERO'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1024
  end
  inherited Dock971: TDock97
    Top = 643
    Width = 1024
    inherited tb97Fundo: TToolbar97
      Left = 683
      DockPos = 683
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 514
      DockPos = 514
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 960
    Top = 0
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 378
    Top = 334
  end
  inherited ds: TwwDataSource
    Left = 253
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA, NOME)'
      'values'
      '  (:IDPESSOA, :NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 303
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Data de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '10'
      '15'
      '30'
      '30')
    Left = 551
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 904
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME, EL.MATRICULA, PP.INSCRICAONUMERO,'
      '       PAT.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '       PP.IDPESSJUR, PP.IDPLANOPREV'
      
        'FROM   PESSOA P, PESSOA PAT, PLANPREV PL, ELEGPATRO EL, PARTPREV' +
        'PLAN PP'
      'WHERE  EL.IDPESSOA = :IDPESSOA'
      'AND    EL.IDPESSJUR = :IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV'
      'AND    EL.IDPESSOA  = P.IDPESSOA'
      'AND    EL.IDPESSJUR = PAT.IDPESSOA'
      'AND    PP.IDPESSOA  = EL.IDPESSOA'
      'AND    PP.IDPESSJUR = EL.IDPESSJUR'
      'AND    PP.IDPLANOPREV = PL.IDPLANOPREV'
      ' ')
    Left = 352
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H.IDPATRO, H.IDPLANOPREV,'
      
        '       H.IDPESSOA, H.IDPESSJUR, H.IDMOTIVO, H.MES, H.MESCOBRANCA' +
        ', H.REFERENCIA,'
      '       H.IDRUBRICA, H.CODPROVDESC,'
      
        '       H.VALORPROVENTO,  H.VALORINTEGRAL, H.FLGCOMPOESALPART, H.' +
        'FLGCOMPOESALBENEF, H.FLGIRRF,'
      '       H.SEQRUBRICA, C.DESCRICAO, H.FLGSRB,'
      
        '       DECODE(H.FLGSRB,1,'#39'Ativo ou Mantido Total'#39',2,'#39'Aux. Doença' +
        #39',3,'#39'INSS'#39',4,'#39'Sal. Virtual'#39',5,'#39'Mantido Parcial'#39',0,'#39'Outros'#39') AS D' +
        'escFLGSRB,'
      'H.IDMODULO'
      ''
      ''
      'FROM   HISTRUBSAL H, PROVDESC C'
      'WHERE  (H.IDPESSOA = :IDPESSOA)'
      'AND    (H.IDPESSJUR = :IDPESSJUR)'
      'AND    (H.MES =  :MES)'
      'AND    (H.IDRUBRICA = C.IDPROVENTO)'
      'ORDER BY MES DESC , CODPROVDESC, H.VALORPROVENTO DESC '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 371
    Top = 230
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1215012'
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end>
    object qryDetMES: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 9
      FieldName = 'MES'
      Origin = 'HISTRUBSAL.MES'
      Size = 7
    end
    object qryDetMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de ~Cob./Pag.'
      DisplayWidth = 9
      FieldName = 'MESCOBRANCA'
      Origin = 'HISTRUBSAL.MESCOBRANCA'
      Size = 7
    end
    object qryDetIDRUBRICA: TFloatField
      DisplayLabel = 'Código da Rubrica'
      DisplayWidth = 12
      FieldName = 'IDRUBRICA'
      Origin = 'HISTRUBSAL.IDRUBRICA'
    end
    object qryDetVALORPROVENTO: TFloatField
      DisplayLabel = 'Valor (R$)'
      DisplayWidth = 12
      FieldName = 'VALORPROVENTO'
      Origin = 'HISTRUBSAL.VALORPROVENTO'
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS."CM.PROVDESC".DESCRICAO'
      Size = 130
    end
    object qryDetDESCFLGSRB: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 30
      FieldName = 'DESCFLGSRB'
      Size = 22
    end
    object qryDetCODPROVDESC: TStringField
      DisplayLabel = 'Código da Rubrica'
      DisplayWidth = 12
      FieldName = 'CODPROVDESC'
      Origin = 'HISTRUBSAL.CODPROVDESC'
      Visible = False
      Size = 15
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'HISTRUBSAL.IDPESSOA'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Origin = 'HISTRUBSAL.IDPESSJUR'
      Visible = False
    end
    object qryDetIDMOTIVO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVO'
      Origin = 'HISTRUBSAL.IDMOTIVO'
      Visible = False
    end
    object qryDetREFERENCIA: TStringField
      DisplayWidth = 10
      FieldName = 'REFERENCIA'
      Origin = 'HISTRUBSAL.REFERENCIA'
      Visible = False
      Size = 10
    end
    object qryDetFLGCOMPOESALPART: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCOMPOESALPART'
      Origin = 'HISTRUBSAL.FLGCOMPOESALPART'
      Visible = False
    end
    object qryDetFLGCOMPOESALBENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCOMPOESALBENEF'
      Origin = 'HISTRUBSAL.FLGCOMPOESALBENEF'
      Visible = False
    end
    object qryDetFLGIRRF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGIRRF'
      Origin = 'HISTRUBSAL.FLGIRRF'
      Visible = False
    end
    object qryDetSEQRUBRICA: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQRUBRICA'
      Origin = 'HISTRUBSAL.SEQRUBRICA'
      Visible = False
    end
    object qryDetFLGSRB: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGSRB'
      Origin = 'HISTRUBSAL.FLGSRB'
      Visible = False
    end
    object qryDetVALORINTEGRAL: TFloatField
      FieldName = 'VALORINTEGRAL'
      Visible = False
    end
    object qryDetIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryDetIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryDetIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTRUBSAL'
      'set'
      '  IDPATRO = :IDPATRO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  MES = :MES,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  REFERENCIA = :REFERENCIA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  VALORPROVENTO = :VALORPROVENTO,'
      '  VALORINTEGRAL = :VALORINTEGRAL,'
      '  FLGCOMPOESALPART = :FLGCOMPOESALPART,'
      '  FLGCOMPOESALBENEF = :FLGCOMPOESALBENEF,'
      '  FLGIRRF = :FLGIRRF,'
      '  SEQRUBRICA = :SEQRUBRICA,'
      '  FLGSRB = :FLGSRB,'
      '  IDMODULO = :IDMODULO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  SEQRUBRICA = :OLD_SEQRUBRICA '
      ''
      ' ')
    InsertSQL.Strings = (
      'insert into HISTRUBSAL'
      ''
      
        '  (IDPATRO, IDPLANOPREV, IDPESSOA, IDPESSJUR, IDMOTIVO, MES, MES' +
        'COBRANCA, REFERENCIA, IDRUBRICA,'
      
        '   CODPROVDESC, VALORPROVENTO, VALORINTEGRAL, FLGCOMPOESALPART, ' +
        'FLGCOMPOESALBENEF,'
      '   FLGIRRF, SEQRUBRICA, FLGSRB, IDMODULO )'
      'values'
      
        '  (:IDPATRO, :IDPLANOPREV, :IDPESSOA, :IDPESSJUR, :IDMOTIVO, :ME' +
        'S, :MESCOBRANCA, :REFERENCIA, :IDRUBRICA, '
      
        '   :CODPROVDESC, :VALORPROVENTO, :VALORINTEGRAL, :FLGCOMPOESALPA' +
        'RT, :FLGCOMPOESALBENEF, '
      '   :FLGIRRF, :SEQRUBRICA, :FLGSRB, :IDMODULO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from HISTRUBSAL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  SEQRUBRICA = :OLD_SEQRUBRICA')
    Left = 372
    Top = 278
  end
  object qryProvDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RP.IDRUBRICA,RP.CODPROVDESC,RP.DESCRPROVDESC,'
      '              P.FLGCOMPOESALPART, P.FLGCOMPOESALBENEF, P.FLGIRRF'
      'FROM   RUBRICAXPESS RP, PROVDESC P'
      'WHERE  RP.IDPESSOA = :IDPESSOA'
      'AND    RP.IDRUBRICA = P.IDPROVENTO'
      'ORDER  BY RP.DESCRPROVDESC')
    ValidateWithMask = True
    Left = 262
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryauxrubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRUBSALPARTICIP FROM PATRO'
      'WHERE IDPESSOA = :idpessjur')
    ValidateWithMask = True
    Left = 603
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
      end>
    object qryauxrubricaIDRUBSALPARTICIP: TFloatField
      FieldName = 'IDRUBSALPARTICIP'
      Origin = 'BASEDADOS.PATRO.IDRUBSALPARTICIP'
    end
  end
end
