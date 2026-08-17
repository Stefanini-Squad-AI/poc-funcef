inherited frmCadSetorEmissor: TfrmCadSetorEmissor
  Left = 163
  Top = 177
  Caption = 'Cadastro de Setores de Emissores'
  ClientHeight = 349
  ClientWidth = 643
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 318
    Height = 263
    object treeSetorEmissor: TCMTreeView
      Left = 1
      Top = 35
      Width = 316
      Height = 227
      PodeNavegar = False
      DataSource = ds
      CampoChave = qrySetorEmissorCODSETOREMISSOR
      CampoDescricao = qrySetorEmissorDESCSETOREMISSOR
      CampoTipo = qrySetorEmissorSETORANALIT
      OnClick = treeSetorEmissorDblClick
      OnDblClick = treeSetorEmissorDblClick
      OnChange = treeSetorEmissorChange
      Align = alClient
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 316
      Height = 34
      Align = alTop
      BevelInner = bvLowered
      Color = clGray
      TabOrder = 0
      object Label1: TLabel
        Left = 41
        Top = 4
        Width = 176
        Height = 22
        Caption = 'Setor do Emissor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnlEdicao: TPanel [1]
    Left = 318
    Top = 47
    Width = 325
    Height = 263
    Align = alRight
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 3
    object pnAnaSint: TPanel
      Left = 15
      Top = 164
      Width = 295
      Height = 52
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      object sbtnAnalitico: TSpeedButton
        Left = 9
        Top = 9
        Width = 130
        Height = 34
        GroupIndex = 1
        Caption = '&Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
          0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
          0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
          0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
          0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
          0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
          5555557FFFFF7755555555500000005555555577777775555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbtnAnaliticoClick
      end
      object sbtnSintetico: TSpeedButton
        Left = 150
        Top = 9
        Width = 130
        Height = 34
        GroupIndex = 1
        Caption = '&Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbtnSinteticoClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 8
      Width = 295
      Height = 137
      TabOrder = 1
      object Label2: TLabel
        Left = 7
        Top = 26
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 7
        Top = 78
        Width = 114
        Height = 13
        Caption = 'Descrição do Setor '
        FocusControl = dbedDescricao
      end
      object dbedCod: TwwDBEdit
        Left = 7
        Top = 40
        Width = 102
        Height = 21
        DataField = 'CODSETOREMISSOR'
        DataSource = ds
        MaxLength = 8
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbedCodExit
        OnKeyPress = dbedCodKeyPress
      end
      object dbedDescricao: TDBEdit
        Left = 7
        Top = 92
        Width = 282
        Height = 21
        DataField = 'DESCSETOREMISSOR'
        DataSource = ds
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 643
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 310
    Width = 643
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = qrySetorEmissor
    Left = 311
    Top = 8
  end
  inherited srchdlgProcura: TwwSearchDialog
    Selected.Strings = (
      'DESCSETOREMISSOR'#9'60'#9'Setor'#9'F'
      'SETORANALIT'#9'1'#9'Analitico'#9'F')
    SearchTable = qrySetorEmissor
    ShadowSearchTable = qrySetorEmissor
    Left = 374
    Top = 8
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    SearchControls = True
    Caption = 'Procura de Setor Emissor'
    DataSet = qrySetorEmissor
    FieldNames.Strings = (
      'CODSETOREMISSOR'
      'DESCSETOREMISSOR')
    DisplayLabels.Strings = (
      'Código'
      'Descrição')
    AlwaysShow = True
    Left = 405
    Top = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 382
    Top = 58
  end
  object qrySetorEmissor: TwwQuery
    AfterDelete = qrySetorEmissorAfterDelete
    AfterScroll = qrySetorEmissorAfterScroll
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODSETOREMISSOR, DESCSETOREMISSOR, SETORANALIT'
      ''
      'FROM SETOREMISSOR'
      ''
      'ORDER BY DESCSETOREMISSOR ')
    ValidateWithMask = True
    Left = 280
    Top = 8
    object qrySetorEmissorDESCSETOREMISSOR: TStringField
      DisplayLabel = 'Setor'
      DisplayWidth = 60
      FieldName = 'DESCSETOREMISSOR'
      Origin = 'SETOREMISSOR.DESCSETOREMISSOR'
      Size = 60
    end
    object qrySetorEmissorSETORANALIT: TStringField
      DisplayLabel = 'Analitico'
      DisplayWidth = 1
      FieldName = 'SETORANALIT'
      Origin = 'SETOREMISSOR.SETORANALIT'
      Size = 1
    end
    object qrySetorEmissorCODSETOREMISSOR: TStringField
      FieldName = 'CODSETOREMISSOR'
      Origin = 'SETOREMISSOR.CODSETOREMISSOR'
      Visible = False
      Size = 10
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 343
    Top = 8
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SETOREMISSOR.CODSETOREMISSOR'
      'SETOREMISSOR.DESCSETOREMISSOR'
      'SETOREMISSOR.SETORANALIT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código '
      'Descrição '
      '(A/C)')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SETOREMISSOR')
    CamposChave.Strings = (
      'SETOREMISSOR.CODSETOREMISSOR')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 440
    Top = 9
  end
end
