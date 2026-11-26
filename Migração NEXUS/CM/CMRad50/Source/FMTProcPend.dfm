inherited FrmMTProcPend: TFrmMTProcPend
  Left = 169
  Top = 258
  HelpContext = 230050
  Caption = 'Processos Pendentes'
  ClientHeight = 401
  ClientWidth = 750
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 750
    Height = 362
    object Splitter1: TSplitter
      Left = 501
      Top = 1
      Width = 8
      Height = 360
      Cursor = crHSplit
    end
    object dbgrdDet: TwwDBGrid
      Left = 1
      Top = 1
      Width = 500
      Height = 360
      Selected.Strings = (
        'IDPROCESSO'#9'10'#9'Nº Processo'#9'F'
        'NOMEPROC'#9'45'#9'Tipo de Processo'#9'F'
        'RAZAOSOCIAL'#9'45'#9'Pessoa'#9'F'
        'NUMDOCUMENTO'#9'18'#9'Documento'#9'F'
        'DATAINIPROCESSO'#9'10'#9'Data~Início Processo'#9'F'
        'DATAFIMPROC'#9'10'#9'Final~Previsto Processo'#9'F'
        'VLRPROC'#9'10'#9'Valor do Processo'#9'F'
        'CODCENTROCUSTO'#9'10'#9'Centro de Custo'#9'F'
        'CODGRUPOPROD'#9'10'#9'Grupo de Produto'#9'F'
        'UNIDNEGOC'#9'10'#9'Atividade/Projeto'#9'F'
        'CODCENTRORESPON'#9'10'#9'Centro de Responsabilidade'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alLeft
      DataSource = ds
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
      Left = 509
      Top = 1
      Width = 240
      Height = 360
      Align = alClient
      BevelInner = bvLowered
      Caption = 'plnBem'
      TabOrder = 1
      object memOBS: TDBMemo
        Left = 2
        Top = 31
        Width = 236
        Height = 327
        Align = alClient
        DataField = 'OBS'
        DataSource = ds
        MaxLength = 200
        ReadOnly = True
        TabOrder = 0
      end
      object plnCapBem: TPanel
        Left = 2
        Top = 2
        Width = 236
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
  inherited Dock971: TDock97
    Top = 362
    Width = 750
    inherited tb97Fundo: TToolbar97
      Left = 315
      DockPos = 428
      inherited sep1: TToolbarSep97
        Left = 348
      end
      inherited bbtnSair: TBitBtn
        Left = 267
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 350
        HelpContext = 230050
        ClickHelpContext = 230050
      end
      object BtnView: TBitBtn
        Left = 89
        Top = 0
        Width = 89
        Height = 33
        Caption = '&Visualizar'
        Enabled = False
        TabOrder = 2
        OnClick = BtnViewClick
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
      object BtnProcurar: TBitBtn
        Left = 0
        Top = 0
        Width = 89
        Height = 33
        Caption = '&Procurar...'
        TabOrder = 3
        OnClick = BtnProcurarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE619E6EA30
          EAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFC000C0633A63A4D2A46D006DFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFEA27EA633A63AAC8AAD3DAD3FAFEFE295B
          29FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6
          4AC6AAC1AA676F6FD0DBDB35000067876FF725F7FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFEA27EA5B2963C0DDD5FFCBCBFFD6D6485858FEDC
          D4340C38FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB14AB8FF
          E6D0FF7070FFDADAFF6F6F658181CEA7A7598161F91EF9FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFE112E1CDF9E3FF7575FF7777FFD3D3FFE3E32000
          00FED4D4164E1CF329F3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1
          D5A8FFCECEFF7878FFDADAFF6F6F637F7FEFF4F4B9E6B9B900B9FF00FFFF00FF
          FF00FFFF00FF0B0038DA00CBFF00FFB435B4FBFFFFFF7171FF7777FFD3D3FFD1
          D12A4C33F712F7FF00FFFF00FFFF00FFFF00FFFF00FF00001F006B50E100C0FF
          00FF9AD6A1FFD0D0FF6A6AFFC6C6FBFFFFB1E5B1B300B3FF00FFFF00FFFF00FF
          FF00FF73006B3D80850000A50000CFE100C4E800E8DDFFE4FEFFFF9ED2A5B335
          B3FF00FFFF00FFFF00FFFF00FFFF00FFCA00CA3B643BFFFFFCF4FFFF00006300
          3830FF00FFDF11DFAE48AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE00CE
          336433FFFFFFD3E9C457004FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF004E00FFFFFFCBE9BC0000B5FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCB00CB
          5BA95BBC00BCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BtnExcluir: TBitBtn
        Left = 178
        Top = 0
        Width = 89
        Height = 33
        Caption = '&Excluir'
        Enabled = False
        TabOrder = 4
        OnClick = BtnExcluirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 463
    Top = 19
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = Cds
    Left = 693
    Top = 74
  end
  object Sql: TCMSqlParams
    SQL.Strings = (
      ' SELECT DISTINCT'
      '       IP.IDPROCESSO,'
      '       IP.DATAINIPROCESSO,'
      '       IP.DATAFIMPREV AS DATAFIMPROC,'
      '       IP.IDTIPOPROCESSO,'
      '       TP.NOME AS NOMEPROC,'
      '       IP.OBS,'
      '       IP.CODCENTROCUSTO,'
      '       IP.IDEMPRESA,'
      '       IP.UNIDNEGOC,'
      '       IP.IDPESSOA,'
      '       IP.CODGRUPOPROD,'
      '       IP.CODCENTRORESPON,'
      '       IP.VLRPROC,'
      '       IP.FLGOK,'
      '       P.RAZAOSOCIAL,'
      '       P.NUMDOCUMENTO,'
      '       U.NOMEUSUARIO'
      '  FROM'
      '       PESSOA P,'
      '       RADINSTPROCESSO IP,'
      '       RADTIPOPROCESSO TP,'
      '       RADRESPONXGRP GRP,'
      '       RADGRAUTXGRRESPON AUT,'
      '       RADRESPONXGRP GRPAUT,'
      '       USUARIOSISTEMA U'
      ' WHERE '
      '            ( IP.IDPROCESSO IN ( :IDPROCS ) )'
      '   AND ( IP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO )'
      '   AND ( IP.IDPESSRESP = P.IDPESSOA(+) )'
      '   AND ( TP.IDGRPGESTOR = GRP.IDGRPRESPON )'
      '   AND ( TP.IDGRPCONSULTA = AUT.IDGRUPOAUTORIZA )'
      '   AND ( AUT.IDGRPRESPON = GRPAUT.IDGRPRESPON )'
      '   AND ( IP.IDUSUARIO = U.IDUSUARIO )'
      ' ORDER BY DATAFIMPROC')
    OnFormartParam = SqlFormartParam
    ClientDataSet = Cds
    Left = 597
    Top = 73
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 645
    Top = 73
  end
  object MsPp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 
      'Selecione os processos clicando no mesmo com a tecla CTRL pressi' +
      'onada'
    Colunas.Strings = (
      'RADINSTPROCESSO.IDPROCESSO'
      'RADINSTPROCESSO.DATAINIPROCESSO'
      'RADINSTPROCESSO.DATAFIMPREV'
      'RADTIPOPROCESSO.NOME')
    TipodeDado.Strings = (
      'N'
      'D'
      'D'
      'C')
    Descricao.Strings = (
      'Processo'
      'Início'
      'Final Previsto'
      'Tipo Processo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RADINSTPROCESSO'
      'RADTIPOPROCESSO')
    CamposChave.Strings = (
      'RADINSTPROCESSO.IDPROCESSO')
    Filtro.Strings = (
      'RADINSTPROCESSO.FLGOK = '#39'N'#39
      'RADINSTPROCESSO.IDTIPOPROCESSO = RADTIPOPROCESSO.IDTIPOPROCESSO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '18'
      '18'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = True
    Left = 541
    Top = 73
  end
  object CdsEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 645
    Top = 133
  end
  object SqlEtapa: TCMSqlParams
    SQL.Strings = (
      'SELECT COUNT(*) AS QTDETAPAS'
      'FROM RADINSTETAPA'
      'WHERE ( IDPROCESSO = :pIDPROCESSO )'
      '  AND ( ( IDANDAMENTO IS NOT NULL )'
      '        OR ( DATAFIMETAPA IS NOT NULL ) )')
    OnFormartParam = SqlFormartParam
    ClientDataSet = CdsEtapa
    Left = 597
    Top = 133
  end
end
