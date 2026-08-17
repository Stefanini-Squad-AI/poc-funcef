inherited FrmMTAcompProc: TFrmMTAcompProc
  Left = 148
  Top = 156
  HelpContext = 230052
  Caption = 'Acompanhamento de Processo'
  ClientHeight = 431
  ClientWidth = 770
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 16
    Top = 16
    Width = 71
    Height = 16
    Caption = 'Processo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [1]
    Left = 90
    Top = 16
    Width = 50
    Height = 16
    Caption = 'LbProc'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 770
    Height = 392
    object Label1: TLabel
      Left = 20
      Top = 30
      Width = 57
      Height = 13
      Caption = 'Processo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbProc: TLabel
      Left = 80
      Top = 30
      Width = 41
      Height = 13
      Caption = 'LbProc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 360
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Obs:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 19
      Top = 11
      Width = 93
      Height = 13
      Caption = 'Nº do Processo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNProc: TLabel
      Left = 114
      Top = 11
      Width = 41
      Height = 13
      Caption = 'LbProc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 31
      Top = 49
      Width = 46
      Height = 13
      Caption = 'Pessoa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbPessoa: TLabel
      Left = 80
      Top = 49
      Width = 56
      Height = 13
      Caption = 'LbPessoa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 88
      Width = 69
      Height = 13
      Caption = 'Documento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbDoc: TLabel
      Left = 80
      Top = 88
      Width = 38
      Height = 13
      Caption = 'LbDoc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 360
      Top = 88
      Width = 182
      Height = 13
      Caption = 'Usuário que Iniciou o Processo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbUsuario: TLabel
      Left = 549
      Top = 88
      Width = 54
      Height = 13
      Caption = 'lbUsuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbSituacao: TLabel
      Left = 80
      Top = 69
      Width = 65
      Height = 13
      Caption = 'LbSituacao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 21
      Top = 69
      Width = 55
      Height = 13
      Caption = 'Situação:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 1
      Top = 111
      Width = 768
      Height = 280
      Align = alBottom
      TabOrder = 0
      object Splitter2: TSplitter
        Left = 1
        Top = 161
        Width = 766
        Height = 8
        Cursor = crVSplit
        Align = alTop
      end
      object GrdEtapa: TwwDBGrid
        Left = 1
        Top = 34
        Width = 766
        Height = 127
        Selected.Strings = (
          'NOMETAPA'#9'51'#9'Etapa'
          'DATAINIETAPA'#9'11'#9'Data Inicial'
          'DATAFIMPREV'#9'22'#9'Data Prevista~para Término'
          'DATAFIMETAPA'#9'19'#9'Data Efetiva~de Término'
          'IDETAPA'#9'10'#9'Id. Etapa')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = dsEtapa
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 2
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 766
        Height = 33
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Situação do Processo'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 1
        Top = 169
        Width = 766
        Height = 110
        Align = alClient
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 372
          Top = 1
          Width = 8
          Height = 108
          Cursor = crHSplit
        end
        object GrdAut: TwwDBGrid
          Left = 1
          Top = 1
          Width = 371
          Height = 108
          Selected.Strings = (
            'DATAAUTORIZACAO'#9'10'#9'Data~Autorização'#9'F'
            'NOMEUSUARIO'#9'25'#9'Usuário'#9'F'
            'STATUS'#9'12'#9'Status'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alLeft
          DataSource = dsAut
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object plnBem: TPanel
          Left = 380
          Top = 1
          Width = 385
          Height = 108
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 1
          object memOBS: TDBMemo
            Left = 2
            Top = 31
            Width = 381
            Height = 75
            Align = alClient
            DataField = 'OBSAUTORIZA'
            DataSource = dsAut
            MaxLength = 200
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object plnCapBem: TPanel
            Left = 2
            Top = 2
            Width = 381
            Height = 29
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Observação'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
    object MemObsProc: TMemo
      Left = 400
      Top = 16
      Width = 343
      Height = 65
      BorderStyle = bsNone
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 770
    inherited tb97Fundo: TToolbar97
      Left = 440
      DockPos = 536
      inherited sep1: TToolbarSep97
        Left = 243
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 160
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 162
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 245
        ClickHelpContext = 230052
      end
      object btnSeleciona: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Seleciona processo a ser consultado'
        Cancel = True
        Caption = '&Processo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnSelecionaClick
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
        Spacing = 2
      end
      object BtnAnexo: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Seleciona processo a ser consultado'
        Cancel = True
        Caption = '&Anexo...'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BtnAnexoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 207
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object dsEtapa: TwwDataSource
    AutoEdit = False
    DataSet = CdsEtapa
    OnDataChange = dsEtapaDataChange
    Left = 193
    Top = 210
  end
  object dsAut: TwwDataSource
    AutoEdit = False
    DataSet = CdsAut
    Left = 193
    Top = 154
  end
  object msSeleciona: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RADINSTPROCESSO.IDPROCESSO'
      'RADINSTPROCESSO.DATAINIPROCESSO'
      'RADINSTPROCESSO.DATAFIMPREV'
      'RADINSTPROCESSO.DATAFIMPROCESSO'
      'RADINSTPROCESSO.FLGOK'
      'RADINSTPROCESSO.OBS'
      'RADTIPOPROCESSO.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'N'
      'D'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número'
      'Data Inicial'
      'Data Final Prev.'
      'Data Final'
      'Status'
      'Obs'
      'Processo'
      'Pessoa'
      'Nº Documento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RADINSTPROCESSO'
      'RADTIPOPROCESSO'
      'PESSOA'
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'RADTIPOPROCESSO.NOME'
      'RADINSTPROCESSO.IDPROCESSO'
      'RADINSTPROCESSO.OBS'
      'PESSOA.RAZAOSOCIAL'
      'RADINSTPROCESSO.IDTIPOPROCESSO'
      'PESSOA.NUMDOCUMENTO'
      'USUARIOSISTEMA.NOMEUSUARIO')
    Filtro.Strings = (
      'RADINSTPROCESSO.FLGOK <> '#39'E'#39
      'RADINSTPROCESSO.IDTIPOPROCESSO = RADTIPOPROCESSO.IDTIPOPROCESSO'
      'RADINSTPROCESSO.IDPESSRESP     = PESSOA.IDPESSOA(+)'
      'RADINSTPROCESSO.IDUSUARIO = USUARIOSISTEMA.IDUSUARIO(+)')
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
      '10'
      '10'
      '10'
      '1'
      '90'
      '30'
      '60'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 44
    Top = 152
  end
  object SqlAut: TCMSqlParams
    SQL.Strings = (
      'SELECT AUT.DATAAUTORIZACAO,'
      '       USU.NOMEUSUARIO,'
      
        '       DECODE( AUT.FLGSTATUS, '#39'R'#39', '#39'RECUSADO'#39', DECODE( AUT.FLGST' +
        'ATUS, '#39'S'#39', '#39'AUTORIZADO'#39', '#39'EXECUTADO'#39' ) ) AS STATUS,'
      '       AUT.OBSAUTORIZA'
      '  FROM RADAUTORIZACAO AUT,'
      '       RADINSTETAPA IE,'
      '       USUARIOSISTEMA USU'
      ' WHERE'
      '           ( AUT.IDPROCESSO = :pIDPROC )'
      '   AND ( AUT.IDETAPA = :pIDETAPA )'
      '   AND ( AUT.IDUSUARIO    =  USU.IDUSUARIO )'
      '   AND ( AUT.IDPROCESSO = IE.IDPROCESSO )'
      '   AND ( AUT.IDETAPA = IE.IDETAPA )')
    ClientDataSet = CdsAut
    Left = 97
    Top = 154
  end
  object CdsAut: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 154
  end
  object CdsEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 210
    object CdsEtapaNOMETAPA: TStringField
      DisplayLabel = 'Etapa'
      DisplayWidth = 51
      FieldName = 'NOMETAPA'
      Origin = 'BASEDADOS.RADTIPOETAPA.NOME'
      Size = 60
    end
    object CdsEtapaDATAINIETAPA: TDateTimeField
      DisplayLabel = 'Data Inicial'
      DisplayWidth = 11
      FieldName = 'DATAINIETAPA'
      Origin = 'BASEDADOS.RADINSTETAPA.DATAINIETAPA'
    end
    object CdsEtapaDATAFIMPREV: TDateTimeField
      DisplayLabel = 'Data Prevista~para Término'
      DisplayWidth = 22
      FieldName = 'DATAFIMPREV'
      Origin = 'BASEDADOS.RADINSTETAPA.DATAFIMPREV'
    end
    object CdsEtapaDATAFIMETAPA: TDateTimeField
      DisplayLabel = 'Data Efetiva~de Término'
      DisplayWidth = 19
      FieldName = 'DATAFIMETAPA'
      Origin = 'BASEDADOS.RADINSTETAPA.DATAFIMETAPA'
    end
    object CdsEtapaIDETAPA: TFloatField
      DisplayLabel = 'Id. Etapa'
      DisplayWidth = 10
      FieldName = 'IDETAPA'
      Origin = 'BASEDADOS.RADINSTETAPA.IDETAPA'
    end
  end
  object SqlEtapa: TCMSqlParams
    SQL.Strings = (
      'SELECT IE.IDETAPA,'
      '       IE.DATAFIMETAPA,'
      '       IE.DATAINIETAPA,'
      '       IE.DATAFIMPREV,'
      '       TE.NOME AS NOMETAPA'
      '  FROM RADTIPOETAPA TE,'
      '       RADINSTETAPA IE'
      ' WHERE ( IE.IDPROCESSO = :pIDPROC )'
      '   AND ( IE.IDTIPOETAPA = TE.IDTIPOETAPA )'
      ' ORDER BY IE.DATAINIETAPA, IE.IDETAPA')
    ClientDataSet = CdsEtapa
    Left = 97
    Top = 210
  end
  object CdsVerifUsr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 409
    Top = 154
  end
  object SqlVerifUsr: TCMSqlParams
    SQL.Strings = (
      'SELECT TP.IDTIPOPROCESSO'
      '  FROM RADTIPOPROCESSO TP,'
      '       RADRESPONXGRP GRP,'
      '       RADGRAUTXGRRESPON AUT,'
      '       RADRESPONXGRP GRPAUT'
      ' WHERE ( TP.IDTIPOPROCESSO = :pIDTIPOPROCESSO )'
      
        '   AND ( ( GRP.IDUSUARIO = :pIDUSUARIO ) OR ( GRPAUT.IDUSUARIO =' +
        ' :pIDUSUARIO ) )'
      '   AND ( TP.IDGRPGESTOR = GRP.IDGRPRESPON )'
      '   AND ( TP.IDGRPCONSULTA = AUT.IDGRUPOAUTORIZA )'
      '   AND ( AUT.IDGRPRESPON = GRPAUT.IDGRPRESPON )'
      '')
    ClientDataSet = CdsVerifUsr
    Left = 237
    Top = 154
  end
  object CdsImagem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 210
  end
  object SqlImagem: TCMSqlParams
    SQL.Strings = (
      'SELECT I.IDIMAGEM, I.IMAGEM, I. DESCRIMAGEM'
      '  FROM RADINSTPROCESSO R, IMAGENS I'
      ' WHERE R.IDPROCESSO = :pIDPROCESSO'
      '   AND I.IDIMAGEM = R.IDIMAGEM')
    ClientDataSet = CdsImagem
    Left = 429
    Top = 210
  end
  object DsImagem: TwwDataSource
    AutoEdit = False
    DataSet = CdsImagem
    OnDataChange = dsEtapaDataChange
    Left = 525
    Top = 210
  end
  object CdsProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 401
    Top = 210
  end
  object SqlProc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDPROCESSO, IDTIPOPROCESSO, UNIDNEGOC, IDPESSOA, IDEMPRES' +
        'A, VLRPROC,'
      
        '       CODCENTROCUSTO, IDUSUARIO, CODGRUPOPROD, CODCENTRORESPON,' +
        ' FLGOK,'
      
        '       DATAINIPROCESSO, DATAFIMPROCESSO, OBS, DATAFIMPREV, IDPES' +
        'SRESP, IDIMAGEM'
      '  FROM RADINSTPROCESSO'
      ' WHERE IDPROCESSO = :pIDPROCESSO')
    ClientDataSet = CdsProc
    Left = 237
    Top = 210
  end
end
