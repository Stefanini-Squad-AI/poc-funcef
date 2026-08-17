inherited frmCadRubricaManualAssist: TfrmCadRubricaManualAssist
  Left = 4
  Top = 45
  Caption = 'Cadastro Manual de Rubricas'
  ClientHeight = 455
  ClientWidth = 768
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 768
    Height = 369
    object pnlDados: TPanel
      Left = 5
      Top = 5
      Width = 350
      Height = 359
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 0
      object pnlTitular: TPanel
        Left = 7
        Top = 4
        Width = 335
        Height = 197
        TabOrder = 0
        object Label2: TLabel
          Left = 7
          Top = 8
          Width = 69
          Height = 13
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 7
          Top = 139
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object lblPatro: TLabel
          Left = 7
          Top = 51
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 7
          Top = 95
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edTitular: TEdit
          Left = 7
          Top = 21
          Width = 280
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edPatro: TEdit
          Left = 7
          Top = 64
          Width = 280
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edPlano: TEdit
          Left = 7
          Top = 108
          Width = 280
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object bbtnProcurar: TBitBtn
          Left = 231
          Top = 156
          Width = 88
          Height = 33
          Hint = 'Procurar participante'
          Caption = '&Procurar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bbtnProcurarClick
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000012000000120000000100
            040000000000D800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
            FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
            0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
            870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
            FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
            0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
            DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        end
        object edMatricula: TEdit
          Left = 7
          Top = 152
          Width = 124
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object pnlEdicao: TPanel
        Left = 7
        Top = 209
        Width = 336
        Height = 146
        TabOrder = 1
        object Label1: TLabel
          Left = 6
          Top = 64
          Width = 45
          Height = 13
          Caption = 'Rubrica'
        end
        object Label4: TLabel
          Left = 6
          Top = 105
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object grpMesAnoRef: TGroupBox
          Left = 6
          Top = 6
          Width = 160
          Height = 52
          Caption = 'Mês e Ano de Referência'
          TabOrder = 0
          object cmbMesRef: TComboBox
            Left = 6
            Top = 21
            Width = 79
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              'janeiro'
              'fevereiro'
              'março'
              'abril'
              'maio'
              'junho'
              'julho'
              'agosto'
              'setembro '
              'outubro'
              'novembro'
              'dezembro')
            ParentFont = False
            TabOrder = 0
            Text = 'dezembro'
          end
          object spedAnoRef: TSpinEdit
            Left = 87
            Top = 21
            Width = 55
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 4
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 1998
          end
        end
        object GroupBox1: TGroupBox
          Left = 171
          Top = 6
          Width = 160
          Height = 52
          Caption = 'Mês e Ano de Cobrança'
          TabOrder = 1
          object cmbMesCob: TComboBox
            Left = 6
            Top = 21
            Width = 79
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              'janeiro'
              'fevereiro'
              'março'
              'abril'
              'maio'
              'junho'
              'julho'
              'agosto'
              'setembro '
              'outubro'
              'novembro'
              'dezembro')
            ParentFont = False
            TabOrder = 0
            Text = 'dezembro'
          end
          object spedAnoCob: TSpinEdit
            Left = 87
            Top = 21
            Width = 55
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 4
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 1998
          end
        end
        object dblkpcmbRubrica: TwwDBLookupCombo
          Left = 6
          Top = 79
          Width = 310
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRPROVDESC'#9'130'#9'Rubrica'
            'CODPROVDESC'#9'7'#9'Código')
          DataField = 'IDRUBRICA'
          DataSource = ds
          LookupTable = qryProvDesc
          LookupField = 'IDRUBRICA'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dbedValor: TwwDBEdit
          Left = 6
          Top = 120
          Width = 121
          Height = 21
          DataField = 'VALORPROVENTO'
          DataSource = ds
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    object Panel1: TPanel
      Left = 355
      Top = 5
      Width = 408
      Height = 359
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 1
      object pnlTitulo: TPanel
        Left = 1
        Top = 1
        Width = 406
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblTitulo: TLabel
          Left = 7
          Top = 5
          Width = 181
          Height = 22
          Caption = 'Histórico de Rubricas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object sbtnFiltra: TSpeedButton
          Left = 324
          Top = 6
          Width = 25
          Height = 25
          Hint = 'Filtrar rubricas'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Visible = False
        end
        object SpeedButton1: TSpeedButton
          Left = 350
          Top = 6
          Width = 25
          Height = 25
          Hint = 'Atualizar Consulta do Histórico'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777744447777777777444444447777777444777744
            4777777447777774477777447777777744777744777777774477774477777777
            4477774477777777447777744777747447777774477774444777777777777444
            7777777777777444477777777777777777777777777777777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
      end
      object dbgrdHistorico: TwwDBGrid
        Left = 1
        Top = 42
        Width = 406
        Height = 316
        Selected.Strings = (
          'MES'#9'12'#9'Mês de ~Referência'
          'MESCOBRANCA'#9'12'#9'Mês de ~Cobrança'
          'CODPROVDESC'#9'12'#9'Código'
          'VALORPROVENTO'#9'22'#9'Valor')
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 416
    Width = 768
    inherited tb97Fundo: TToolbar97
      Left = 598
      DockPos = 598
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 430
      DockPos = 430
    end
  end
  inherited Dock972: TDock97
    Width = 768
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterPost = qryAfterPost
    SQL.Strings = (
      
        'SELECT IDPESSOA, IDPESSJUR, IDMOTIVO, MES, MESCOBRANCA, REFERENC' +
        'IA,'
      '       IDRUBRICA, CODPROVDESC,'
      
        '       VALORPROVENTO,  FLGCOMPOESALPART, FLGCOMPOESALBENEF, FLGI' +
        'RRF,'
      '       SEQRUBRICA'
      'FROM   HISTRUBSAL'
      'WHERE  (IDPESSOA = :IDPESSOA)'
      'AND    (IDPESSJUR = :IDPESSJUR)'
      'AND    (MES = :MES)'
      'AND    (MESCOBRANCA = :MESCOBRANCA)'
      'AND    (IDRUBRICA = :IDRUBRICA)'
      'AND    (REFERENCIA = '#39'***'#39')    '
      '')
    Params.Data = {
      01000500084944504553534F4100030400000000000000094944504553534A55
      5200030400000000000000034D455300010200300000000B4D4553434F425241
      4E434100010200300000000949445255425249434100030400000000000000}
    Left = 297
    Top = 2
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 345
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTRUBSAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  MES = :MES,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  REFERENCIA = :REFERENCIA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  VALORPROVENTO = :VALORPROVENTO,'
      '  FLGCOMPOESALPART = :FLGCOMPOESALPART,'
      '  FLGCOMPOESALBENEF = :FLGCOMPOESALBENEF,'
      '  FLGIRRF = :FLGIRRF,'
      '  SEQRUBRICA = :SEQRUBRICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    InsertSQL.Strings = (
      'insert into HISTRUBSAL'
      
        '  (IDPESSOA, IDPESSJUR, IDMOTIVO, MES, MESCOBRANCA, REFERENCIA, ' +
        'IDRUBRICA, '
      
        '   CODPROVDESC, VALORPROVENTO, FLGCOMPOESALPART, FLGCOMPOESALBEN' +
        'EF, FLGIRRF, '
      '   SEQRUBRICA)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :IDMOTIVO, :MES, :MESCOBRANCA, :REFERE' +
        'NCIA, :IDRUBRICA, '
      
        '   :CODPROVDESC, :VALORPROVENTO, :FLGCOMPOESALPART, :FLGCOMPOESA' +
        'LBENEF, '
      '   :FLGIRRF, :SEQRUBRICA)')
    DeleteSQL.Strings = (
      'delete from HISTRUBSAL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    Left = 255
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DISTINCT ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTASS.INSCRICAONUMERO'
      'PLANASS.NOME'
      'PLANPREV.NOME'
      'PATRO.NOME'
      'PROVDESC.DESCRICAO'
      'HISTRUBSAL.MES'
      'HISTRUBSAL.MESCOBRANCA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'Inscrição  Previdenciária'
      'Inscrição Assistencial'
      'Plano Assistencial'
      'Plano Previdenciário'
      'Patrocinadora'
      'Rubrica'
      'Mês de Referência'
      'Mês de Cobrança')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA'
      'HISTRUBSAL'
      'PARTASS'
      'PLANASS'
      'PROVDESC')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA'
      'ELEGPATRO.MATRICULA'
      'HISTRUBSAL.MES'
      'HISTRUBSAL.MESCOBRANCA'
      'HISTRUBSAL.IDRUBRICA'
      'PARTASS.IDPLANASS')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PLANPREV.TPPLANOPREV = '#39'F'#39' '
      'PARTASS.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'PARTASS.IDPLANOPREV =  PARTPREVPLAN.IDPLANOPREV'
      'PARTASS.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PLANASS.IDPLANASS = PARTASS.IDPLANASS'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA(+)'
      'PARTPREVPLAN.FLGDESATIVADO = 0'
      'HISTRUBSAL.REFERENCIA = '#39'***'#39
      'HISTRUBSAL.IDPESSOA = ELEGPATRO.IDPESSOA'
      'HISTRUBSAL.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PROVDESC.IDPROVENTO = HISTRUBSAL.IDRUBRICA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '40'
      '40'
      '10'
      '10'
      '10'
      '10')
    Left = 396
    Top = 2
  end
  object MontaSelectPart: TMontaSelect
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTASS.INSCRICAONUMERO'
      'PLANASS.NOME'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'Inscrição Previdenciária'
      'Inscrição Assistencial'
      'Plano Assistencial'
      'Plano Previdenciário'
      'Patrocinadora')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA'
      'PARTASS'
      'PLANASS')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA'
      'ELEGPATRO.MATRICULA'
      'PARTASS.IDPLANASS')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PLANPREV.TPPLANOPREV = '#39'F'#39' '
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
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    Left = 487
    Top = 3
  end
  object qryProvDesc: TwwQuery
    AfterOpen = qryProvDescAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RP.IDRUBRICA,RP.CODPROVDESC,RP.DESCRPROVDESC,'
      '       P.FLGCOMPOESALPART, P.FLGCOMPOESALBENEF, P.FLGIRRF'
      'FROM   RUBRICAXPESS RP, PROVDESC P, CONTRIBASS CT'
      'WHERE  RP.IDPESSOA = :IDPESSOA'
      'AND    RP.IDRUBRICA = P.IDPROVENTO'
      'AND    '
      '(CT.IDPROVENTO = P.IDPROVENTO'
      'OR    CT.IDPROVENTOATRASO = P.IDPROVENTO'
      'OR    CT.IDPROVENTODEVOL = P.IDPROVENTO)'
      'ORDER  BY RP.DESCRPROVDESC'
      '')
    Params.Data = {01000100084944504553534F4100030400000000000000}
    ValidateWithMask = True
    Left = 555
    Top = 5
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HISTRUBSAL.IDPESSOA, HISTRUBSAL.MESCOBRANCA, HISTRUBSAL.I' +
        'DMOTIVO,'
      
        '       HISTRUBSAL.MES, HISTRUBSAL.IDPESSJUR, HISTRUBSAL.REFERENC' +
        'IA, HISTRUBSAL.IDRUBRICA, HISTRUBSAL.CODPROVDESC,'
      
        '       HISTRUBSAL.IDRETROATIVO, HISTRUBSAL.CODMOEDA, HISTRUBSAL.' +
        'VALORPROVENTO, HISTRUBSAL.IDREGRACALCULO,'
      
        '       HISTRUBSAL.FLGCOMPOESALPART, HISTRUBSAL.FLGCOMPOESALBENEF' +
        ', HISTRUBSAL.FLGIRRF, HISTRUBSAL.VALORCOTAS,'
      '       HISTRUBSAL.SEQRUBRICA'
      'FROM   HISTRUBSAL , CONTRIBASS CT'
      'WHERE  (HISTRUBSAL.IDPESSOA = :IDPESSOA)'
      'AND    (HISTRUBSAL.IDPESSJUR = :IDPESSJUR)'
      'AND    (HISTRUBSAL.REFERENCIA = '#39'***'#39')    '
      'AND '
      '(CT.IDPROVENTO = HISTRUBSAL.IDRUBRICA'
      'OR    CT.IDPROVENTOATRASO = HISTRUBSAL.IDRUBRICA'
      'OR    CT.IDPROVENTODEVOL = HISTRUBSAL.IDRUBRICA)'
      'AND ROWNUM <= 48'
      'ORDER BY HISTRUBSAL.MES DESC')
    Params.Data = {
      01000200084944504553534F4100030400000000000000094944504553534A55
      5200030400000000000000}
    ValidateWithMask = True
    Left = 451
    Top = 115
  end
  object dsHistorico: TwwDataSource
    DataSet = qryHistorico
    Left = 373
    Top = 115
  end
  object qryauxrubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRUBSALPARTICIP FROM PATRO'
      'WHERE IDPESSOA = :idpessjur')
    Params.Data = {01000100096964706573736A75720001020030000000}
    ValidateWithMask = True
    Left = 395
    Top = 188
  end
inherited CmeCadastro: TCmEventosCadastro
     OnInsert = CmeCadastroInsert
     OnEdit = CmeCadastroEdit
     OnFind = CmeCadastroFind
  Left = 358
  Top = 58
end
end
O
