inherited frmTransferenciaSaldoCota: TfrmTransferenciaSaldoCota
  Left = 5
  Top = 126
  HelpContext = 160048
  Caption = 'Transferência de Saldo de Cota'
  ClientHeight = 574
  ClientWidth = 1514
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1514
    Height = 535
    object pmlParticipante: TPanel
      Left = 1
      Top = 1
      Width = 1512
      Height = 122
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label15: TLabel
        Left = 17
        Top = 25
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
      object Label16: TLabel
        Left = 17
        Top = 57
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
      object Label17: TLabel
        Left = 392
        Top = 57
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 17
        Top = 89
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
      object Label19: TLabel
        Left = 392
        Top = 89
        Width = 118
        Height = 13
        Caption = 'Número de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 392
        Top = 25
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblParticipante: TLabel
        Left = 17
        Top = 40
        Width = 66
        Height = 13
        Caption = 'lblParticipante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPatrocinadora: TLabel
        Left = 17
        Top = 72
        Width = 76
        Height = 13
        Caption = 'lblPatrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblMatricula: TLabel
        Left = 392
        Top = 72
        Width = 53
        Height = 13
        Caption = 'lblMatricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPlano: TLabel
        Left = 17
        Top = 103
        Width = 37
        Height = 13
        Caption = 'lblPlano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblSituacao: TLabel
        Left = 392
        Top = 40
        Width = 52
        Height = 13
        Caption = 'lblSituacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblInscricao: TLabel
        Left = 392
        Top = 103
        Width = 53
        Height = 13
        Caption = 'lblInscricao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object stxtProcesso: TStaticText
        Left = 1
        Top = 1
        Width = 1510
        Height = 26
        Align = alTop
        Caption = '   Informações do Participante'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel7: TPanel
        Left = 1406
        Top = 27
        Width = 105
        Height = 94
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object bbtnProcurar: TBitBtn
          Left = 0
          Top = 8
          Width = 97
          Height = 37
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
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
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
      end
    end
    object pnlContribuicoes: TPanel
      Left = 1
      Top = 123
      Width = 1512
      Height = 411
      Align = alClient
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label11: TLabel
        Left = 336
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Label11'
      end
      object pcTransf: TPageControl
        Left = 1
        Top = 1
        Width = 1510
        Height = 409
        ActivePage = tbsDesfazerTransferencia
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object tbsTransferencia: TTabSheet
          Caption = 'Transferência'
          object btnMatric2ParaMatric1: TSpeedButton
            Left = 741
            Top = 166
            Width = 30
            Height = 26
            Hint = 'Associar todas as contribuições'
            Caption = '<<'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnMatric2ParaMatric1Click
          end
          object btnMatric1ParaMatric2: TSpeedButton
            Left = 741
            Top = 202
            Width = 30
            Height = 25
            Hint = 'Desativar todas as contribuições'
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnMatric1ParaMatric2Click
          end
          object lblMatricula1: TLabel
            Left = 21
            Top = 51
            Width = 66
            Height = 13
            Caption = 'Matrícula 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSaldosReserva1: TLabel
            Left = 18
            Top = 335
            Width = 277
            Height = 13
            Caption = 'Saldo Total R$ 0.000,00 / 0.000,00 Cotas (0,00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblSaldoResControle1: TLabel
            Left = 18
            Top = 356
            Width = 376
            Height = 13
            Caption = 'Saldo Total de Res. Controle R$ 0.000,00 / 0.000,00 Cotas (0,00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblMatricula2: TLabel
            Left = 787
            Top = 51
            Width = 66
            Height = 13
            Caption = 'Matrícula 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSaldosReserva2: TLabel
            Left = 786
            Top = 335
            Width = 277
            Height = 13
            Caption = 'Saldo Total R$ 0.000,00 / 0.000,00 Cotas (0,00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblSaldoResControle2: TLabel
            Left = 786
            Top = 356
            Width = 376
            Height = 13
            Caption = 'Saldo Total de Res. Controle R$ 0.000,00 / 0.000,00 Cotas (0,00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object gridMatricula1: TwwDBGrid
            Left = 19
            Top = 69
            Width = 710
            Height = 257
            Selected.Strings = (
              'CODIGO'#9'9'#9'Código'#9'F'
              'REFERENCIA'#9'1'#9'Referência'#9'F'
              'ES'#9'1'#9'E/S'#9'F'
              'VALORREAL'#9'1'#9'Valor Real'#9'F'
              'VALORCOTAS'#9'16'#9'Valor Cotas'#9'F'
              'VALORINDICE'#9'14'#9'Valor Índice'#9'F'
              'SALDOREAL'#9'1'#9'Saldo Real'#9'F'
              'SALDOCOTAS'#9'16'#9'Saldo Cotas'#9'F'
              'NOME'#9'30'#9'Reserva'#9'F'
              'ALIMENTACAO'#9'11'#9'Alimentação'#9'F'
              'MOVIMENTO'#9'11'#9'Data Mov.'#9'F'
              'CONTRIBUICAO'#9'30'#9'Contribuição'#9'F'
              'PATROCINADORA'#9'1'#9'Patrocinadora'#9'F'
              'IDPESSOAORIGEM'#9'1'#9'Pessoa Origem'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            DataSource = dsMatricula1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = True
            IndicatorColor = icBlack
          end
          object gridMatricula2: TwwDBGrid
            Left = 786
            Top = 69
            Width = 710
            Height = 257
            Selected.Strings = (
              'CODIGO'#9'9'#9'Código'#9'F'
              'REFERENCIA'#9'1'#9'Referência'#9'F'
              'ES'#9'1'#9'E/S'#9'F'
              'VALORREAL'#9'1'#9'Valor Real'#9'F'
              'VALORCOTAS'#9'16'#9'Valor Cotas'#9'F'
              'VALORINDICE'#9'14'#9'Valor Índice'#9'F'
              'SALDOREAL'#9'1'#9'Saldo Real'#9'F'
              'SALDOCOTAS'#9'16'#9'Saldo Cotas'#9'F'
              'NOME'#9'30'#9'Reserva'#9'F'
              'ALIMENTACAO'#9'11'#9'Alimentação'#9'F'
              'MOVIMENTO'#9'11'#9'Data Mov.'#9'F'
              'CONTRIBUICAO'#9'30'#9'Contribuição'#9'F'
              'PATROCINADORA'#9'1'#9'Patrocinadora'#9'F'
              'IDPESSOAORIGEM'#9'1'#9'Pessoa Origem'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            DataSource = dsMatricula2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = True
            IndicatorColor = icBlack
          end
        end
        object tbsDesfazerTransferencia: TTabSheet
          Caption = 'Desfazer Transferência'
          object wwDBGrid1: TwwDBGrid
            Left = 40
            Top = 45
            Width = 710
            Height = 220
            Selected.Strings = (
              'DATAMOV'#9'20'#9'Data Transferência'
              'ORIGEM'#9'1'#9'Matricula Origem'
              'MATRICULA'#9'1'#9'Matricula Destino'
              'IDTIPORESERVA'#9'1'#9'Tipo da Reserva'
              'ES'#9'5'#9'ES'
              'SALDO'#9'17'#9'Saldo'
              'NOME'#9'20'#9'Usuário')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            DataSource = dsDesfazer
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = True
            IndicatorColor = icBlack
          end
          object BitBtn1: TBitBtn
            Left = 776
            Top = 43
            Width = 107
            Height = 33
            Cancel = True
            Caption = '&Desfazer'
            ModalResult = 2
            TabOrder = 1
            OnClick = BitBtn1Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
              19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
              19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
              190878F877787778887887917F919F71908887F88788878887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 535
    Width = 1514
    inherited tb97Fundo: TToolbar97
      Left = 644
      DockPos = 644
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 459
      DockPos = 459
      inherited ToolbarSep971: TToolbarSep97
        Left = 178
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 81
        Width = 97
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 0
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 587
    Top = 43
    TargetsData = (
      1
      3
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
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
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'SITFUNC.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITPLANOPREV.DESCRICAO'
      'PESSOA.NUMDOCUMENTO'
      'PESSOAFISICA.DATANASC'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'ELEGPATRO.DATAINICIOAFAST'
      'ELEGPATRO.DATAFIMAFAST'
      'PARTPREVPLAN.SEQPROPOSTA'
      'PARTPREVPLAN.DTINICIOINSC')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '50'
      '10'
      '20'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 514
    Top = 36
  end
  object dsMatricula1: TDataSource
    DataSet = qryMatricula1
    Left = 193
    Top = 25
  end
  object qryMatricula1: TQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '#39' '#39' AS CODIGO,'
      '       '#39' '#39' AS REFERENCIA,'
      '       '#39' '#39' AS ES,'
      '       '#39' '#39' AS SALDOCOTAS,'
      '       '#39' '#39' AS VALORINDICE,'
      '       '#39' '#39' AS SALDOREAL,'
      '       '#39' '#39' AS VALORCOTAS,'
      '       '#39' '#39' AS VALORREAL,'
      '       '#39' '#39' AS NOME,'
      '       '#39' '#39' AS ALIMENTACAO,'
      '       '#39' '#39' AS MOVIMENTO,'
      '       '#39' '#39' AS CONTRIBUICAO,'
      '       '#39' '#39' AS PATROCINADORA,'
      '       '#39' '#39' AS IDPESSOAORIGEM,'
      '       '#39' '#39' AS IDPESSOA'
      '  FROM DUAL')
    UpdateObject = updMatricula1
    Left = 193
    Top = 73
  end
  object qryMatricula2: TQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '#39' '#39' AS CODIGO,'
      '       '#39' '#39' AS REFERENCIA,'
      '       '#39' '#39' AS ES,'
      '       '#39' '#39' AS SALDOCOTAS,'
      '       '#39' '#39' AS VALORINDICE,'
      '       '#39' '#39' AS SALDOREAL,'
      '       '#39' '#39' AS VALORCOTAS,'
      '       '#39' '#39' AS VALORREAL,'
      '       '#39' '#39' AS NOME,'
      '       '#39' '#39' AS ALIMENTACAO,'
      '       '#39' '#39' AS MOVIMENTO,'
      '       '#39' '#39' AS CONTRIBUICAO,'
      '       '#39' '#39' AS PATROCINADORA,'
      '       '#39' '#39' AS IDPESSOAORIGEM,'
      '       '#39' '#39' AS IDPESSOA'
      '  FROM DUAL')
    UpdateObject = updMatricula2
    Left = 273
    Top = 73
  end
  object dsMatricula2: TDataSource
    DataSet = qryMatricula2
    Left = 273
    Top = 25
  end
  object qryChecaMatriculas: TQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '#39'   '#39' AS CODIGO,'
      '       '#39'          '#39' AS REFERENCIA,'
      '       '#39'  '#39' AS ES,'
      '       '#39'          '#39' AS SALDOCOTAS,'
      '       '#39'             '#39' AS VALORINDICE'
      '  FROM DUAL')
    Left = 431
    Top = 211
  end
  object updMatricula1: TUpdateSQL
    Left = 198
    Top = 132
  end
  object updMatricula2: TUpdateSQL
    Left = 270
    Top = 132
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 540
    Top = 128
  end
  object qryIndice: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 612
    Top = 144
  end
  object qryDesfazer: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39' '#39' AS DATAMOV,'
      '  '#39' '#39' AS MATRICULA,'
      '  '#39' '#39' AS IDPESSOAORIGEM,'
      '  '#39' '#39' AS IDPESSOADESTINO,'
      '  '#39' '#39' AS ORIGEM,'
      '  '#39' '#39' AS IDTIPORESERVA,'
      '  '#39' '#39' AS ES,'
      '  '#39' '#39' AS SALDO,'
      '  '#39' '#39' AS NOME'
      ' FROM DUAL')
    ValidateWithMask = True
    Left = 708
    Top = 144
  end
  object dsDesfazer: TDataSource
    DataSet = qryDesfazer
    Left = 670
    Top = 332
  end
  object qryHistMovReserva: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT EP.IDPESSOA, EP.NOMEEMPRESA, PE.RAZAOSOCIAL,'
      '       EN.IDENDERECO, EN.CEP, IM.IMAGEM'
      
        'FROM PESSOA PE, ENDPESS EN, CIDADES CI, ESTADO ES, IMAGENS IM, E' +
        'MPRESAPROP EP'
      'WHERE (EP.IDPESSOA = PE.IDPESSOA) AND'
      '      (PE.IDIMAGEM = IM.IDIMAGEM(+)) AND'
      '      (EN.IDENDERECO(+) = PE.IDENDCOMERCIAL) AND'
      '      (CI.IDCIDADES(+) = EN.IDCIDADES) AND'
      '      (ES.IDESTADO(+) = CI.IDESTADO)')
    PictureMasks.Strings = (
      'VALORDESPESAADM'#9'###,###,#00.00'#9'T'#9'T'
      'VALORDESPESAAPAGAR'#9'###,###,#00.00'#9'T'#9'T')
    ValidateWithMask = False
    Left = 229
    Top = 208
  end
  object qryHistContribPrev: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT EP.IDPESSOA, EP.NOMEEMPRESA, PE.RAZAOSOCIAL,'
      '       EN.IDENDERECO, EN.CEP, IM.IMAGEM'
      
        'FROM PESSOA PE, ENDPESS EN, CIDADES CI, ESTADO ES, IMAGENS IM, E' +
        'MPRESAPROP EP'
      'WHERE (EP.IDPESSOA = PE.IDPESSOA) AND'
      '      (PE.IDIMAGEM = IM.IDIMAGEM(+)) AND'
      '      (EN.IDENDERECO(+) = PE.IDENDCOMERCIAL) AND'
      '      (CI.IDCIDADES(+) = EN.IDCIDADES) AND'
      '      (ES.IDESTADO(+) = CI.IDESTADO)')
    PictureMasks.Strings = (
      'VALORDESPESAADM'#9'###,###,#00.00'#9'T'#9'T'
      'VALORDESPESAAPAGAR'#9'###,###,#00.00'#9'T'#9'T')
    ValidateWithMask = False
    Left = 225
    Top = 334
  end
  object dsHistMovReserva: TDataSource
    DataSet = qryHistMovReserva
    Left = 227
    Top = 261
  end
  object dsHistContribPrev: TDataSource
    DataSet = qryHistContribPrev
    Left = 221
    Top = 391
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 452
    Top = 132
  end
end
