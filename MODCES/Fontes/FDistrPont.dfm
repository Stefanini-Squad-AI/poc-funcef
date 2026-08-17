inherited frmDistrPont: TfrmDistrPont
  Left = 42
  Top = 142
  Caption = 'Distribuição da Pontuação de Cargos por Grupo Funcional'
  ClientHeight = 354
  ClientWidth = 732
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
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
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goTabs]
      ParentFont = False
      ScrollBars = ssNone
      TabOrder = 0
      Visible = False
      OnDrawCell = drgrdPontosDrawCell
    end
  end
  inherited Dock971: TDock97
    Top = 315
    Width = 732
    object Label3: TLabel [0]
      Left = 3
      Top = 10
      Width = 91
      Height = 13
      Caption = 'Pontuação Máxima'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel [1]
      Left = 156
      Top = 10
      Width = 32
      Height = 13
      Caption = 'Escala'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel [2]
      Left = 233
      Top = 10
      Width = 8
      Height = 13
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 562
      DockPos = 562
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 364
      DockPos = 364
      inherited ToolbarSep971: TToolbarSep97
        Left = 110
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 110
        Caption = '  &Atualizar'
        OnClick = bbtnConfirmarClick
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
      inherited bbtnCancelar: TBitBtn
        Left = 113
        Enabled = False
        Visible = False
        OnClick = bbtnSairClick
      end
    end
    object spedMax: TSpinEdit
      Left = 99
      Top = 8
      Width = 46
      Height = 22
      Increment = 100
      MaxValue = 2000
      MinValue = 100
      TabOrder = 2
      Value = 500
    end
    object spedEscala: TSpinEdit
      Left = 192
      Top = 8
      Width = 40
      Height = 22
      Increment = 5
      MaxValue = 50
      MinValue = 5
      TabOrder = 3
      Value = 10
    end
  end
  object tblGrupo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODGRPFUNC'
    TableName = 'CM.GRUPFUNC'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 639
    Top = 18
  end
  object tblCargo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODGRPFUNC'
    MasterFields = 'CODGRPFUNC'
    MasterSource = ds
    TableName = 'CM.CARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 638
    Top = 67
  end
  object ds: TwwDataSource
    DataSet = tblGrupo
    Left = 667
    Top = 18
  end
  object tblGraca: TwwTable
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    MasterFields = 'IDCARGO'
    MasterSource = ds3
    TableName = 'CM.GRAUCARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 666
    Top = 161
  end
  object tblRelav: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODGRPFUNC;IDFATORAVAL'
    TableName = 'CM.PESOFATGRP'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 666
    Top = 114
  end
  object ds3: TwwDataSource
    DataSet = tblCargo
    Left = 666
    Top = 67
  end
end
