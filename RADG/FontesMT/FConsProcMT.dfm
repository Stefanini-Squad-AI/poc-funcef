inherited FrmConsProcMT: TFrmConsProcMT
  Left = 182
  Top = 128
  Caption = 'Consulta de Processos'
  ClientHeight = 380
  ClientWidth = 756
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 756
    Height = 341
    object Grd: TwwDBGrid
      Left = 5
      Top = 33
      Width = 746
      Height = 303
      Selected.Strings = (
        'IDPROCESSO'#9'10'#9'Num. Processo'#9'F'
        'DATAINIPROCESSO'#9'18'#9'Início Processo'#9'F'
        'FIMPREVPROC'#9'18'#9'Fim Prev. Processo'#9'F'
        'NOMETIPOPROC'#9'60'#9'Tipo Processo'#9'F'
        'NOMEUSER'#9'60'#9'Usuário'#9'F'
        'NOMEGRUPO'#9'30'#9'Grupo'#9'F'
        'IDETAPA'#9'10'#9'Num. Etapa'#9'F'
        'NOMETIPOETAPA'#9'60'#9'Tipo Etapa'#9'F'
        'DATAINIETAPA'#9'18'#9'Início Etapa'#9'F'
        'FIMPREVETAPA'#9'18'#9'Fim Prev. Etapa'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsConsulta
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
    object Panel3: TPanel
      Left = 5
      Top = 5
      Width = 746
      Height = 28
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Processos Pendentes'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 756
    inherited tb97Fundo: TToolbar97
      Left = 369
      DockPos = 369
      inherited sep1: TToolbarSep97
        Left = 89
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 182
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 91
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 93
        Width = 89
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 184
        Width = 89
      end
      object BtnSel: TBitBtn
        Left = 0
        Top = 0
        Width = 89
        Height = 33
        Caption = '&Consultar'
        TabOrder = 2
        OnClick = BtnSelClick
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65531
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object sqlConsulta: TCMSqlParams
    SQL.Strings = (
      'SELECT IP.IDPROCESSO,'
      '       IP.DATAINIPROCESSO,'
      '       IP.DATAFIMPREV AS FIMPREVPROC,'
      '       TP.NOME AS NOMETIPOPROC,'
      '       P.NOME AS NOMEUSER,'
      '       G.NOME AS NOMEGRUPO,'
      '       IE.IDETAPA,'
      '       TE.NOME AS NOMETIPOETAPA,'
      '       IE.DATAINIETAPA,'
      '       IE.DATAFIMPREV AS FIMPREVETAPA'
      'FROM RADINSTPROCESSO IP,'
      '     RADTIPOPROCESSO TP,'
      '     USUARIOSISTEMA U,'
      '     PESSOA P,'
      '     RADRESPONXGRP X,'
      '     RADGRPRESPON G,'
      '     RADINSTETAPA IE,'
      '     RADTIPOETAPA TE'
      
        'WHERE ( ( IP.DATAFIMPROCESSO IS NULL ) OR ( ( IP.FLGOK <> '#39'S'#39' ) ' +
        'AND ( IP.FLGOK <> '#39'E'#39' ) ) )'
      '  AND ( IP.IDUSUARIO IN ( SELECT DISTINCT Y.IDUSUARIO'
      '                            FROM RADRESPONXGRP Z,'
      '                                 RADRESPONXGRP Y'
      '                           WHERE ( Z.IDUSUARIO = :idusuario )'
      
        '                             AND ( Y.IDGRPRESPON = Z.IDGRPRESPON' +
        ' ) ) )'
      '  AND ( U.IDUSUARIO = IP.IDUSUARIO )'
      '  AND ( P.IDPESSOA = U.IDESPACESSO )'
      '  AND ( X.IDUSUARIO = IP.IDUSUARIO )'
      '  AND ( G.IDGRPRESPON = X.IDGRPRESPON )'
      '  AND ( IP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO(+) )'
      '  AND ( IP.IDPROCESSO = IE.IDPROCESSO(+) )'
      '  AND ( IE.IDTIPOETAPA = TE.IDTIPOETAPA(+) )'
      
        'ORDER BY IP.DATAINIPROCESSO, IE.DATAINIETAPA, IP.IDPROCESSO, IE.' +
        'IDETAPA')
    ClientDataSet = cdsConsulta
    Left = 181
    Top = 200
  end
  object cdsConsulta: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 247
    Top = 201
    Data = {
      3C0100009619E0BD01000000180000000A0000000000030000003C010A494450
      524F434553534F08000400000000000F44415441494E4950524F434553534F08
      000800000000000B46494D5052455650524F4308000800000000000C4E4F4D45
      5449504F50524F430100490000000100055749445448020002003C00084E4F4D
      45555345520100490000000100055749445448020002003C00094E4F4D454752
      55504F0100490000000100055749445448020002001E00074944455441504108
      000400000000000D4E4F4D455449504F45544150410100490000000100055749
      445448020002003C000C44415441494E49455441504108000800000000000C46
      494D505245564554415041080008000000000002000D44454641554C545F4F52
      44455202008200040000000200090001000700044C4349440400010009080000}
  end
  object dsConsulta: TwwDataSource
    DataSet = cdsConsulta
    Left = 312
    Top = 201
  end
end
