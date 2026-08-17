inherited frmDistrFaixa: TfrmDistrFaixa
  Left = 30
  Top = 162
  HelpContext = 740026
  Caption = 'Distribuição de Cargos por Faixa Salarial e por Grupo Funcional'
  ClientHeight = 354
  ClientWidth = 732
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 732
    Height = 315
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderWidth = 2
    object drgrdPontos: TStringGrid
      Left = 4
      Top = 4
      Width = 724
      Height = 307
      Align = alClient
      DefaultRowHeight = 21
      FixedColor = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssNone
      TabOrder = 0
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 315
    Width = 732
    inherited tb97Fundo: TToolbar97
      Left = 426
      DockPos = 562
      inherited sep1: TToolbarSep97
        Left = 220
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 110
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 140
        ModalResult = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 222
      end
      object bbtnAtualizar: TBitBtn
        Left = 0
        Top = 0
        Width = 110
        Height = 33
        Caption = '  &Atualizar'
        Default = True
        TabOrder = 2
        OnClick = bbtnAtualizarClick
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        NumGlyphs = 3
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 309
  end
  object dsGrupo: TwwDataSource
    AutoEdit = False
    DataSet = CdsGrupo
    Left = 138
    Top = 147
  end
  object CdsGrupo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 138
    Top = 134
  end
  object dsCargo: TwwDataSource
    AutoEdit = False
    DataSet = CdsCargo
    Left = 186
    Top = 147
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'CODGRPFUNC'
    MasterFields = 'CODGRPFUNC'
    MasterSource = dsGrupo
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 186
    Top = 134
  end
  object CdsFaixa: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 273
    Top = 171
  end
end
