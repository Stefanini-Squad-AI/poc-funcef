inherited frmDistrFaixa: TfrmDistrFaixa
  Left = 37
  Caption = 'Distribuição da Pontuação de Cargos por Faixa Salarial'
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
        Visible = False
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 11
  end
  object tblGrupo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODGRPFUNC'
    TableName = 'CM.GRUPFUNC'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 663
    Top = 10
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
    Left = 662
    Top = 59
  end
  object ds: TwwDataSource
    DataSet = tblGrupo
    Left = 691
    Top = 10
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
    Left = 688
    Top = 107
  end
  object tblRelav: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODGRPFUNC;IDFATORAVAL'
    TableName = 'CM.PESOFATGRP'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 690
    Top = 210
  end
  object ds3: TwwDataSource
    DataSet = tblCargo
    Left = 690
    Top = 59
  end
  object tblFaixa: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDFAIXASALARIAL'
    TableName = 'CM.FAIXASAL'
    wwFilter.Strings = (
      'COD_GRUPO = '#39'A'#39)
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 686
    Top = 160
    object tblFaixaIDFAIXASALARIAL: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDFAIXASALARIAL'
      Required = True
    end
    object tblFaixaSTEP1: TFloatField
      DisplayLabel = 'STEP 1'
      DisplayWidth = 10
      FieldName = 'STEP1'
    end
    object tblFaixaSTEP2: TFloatField
      DisplayLabel = 'STEP 2'
      DisplayWidth = 10
      FieldName = 'STEP2'
    end
    object tblFaixaSTEP3: TFloatField
      DisplayLabel = 'STEP 3'
      DisplayWidth = 10
      FieldName = 'STEP3'
    end
    object tblFaixaSTEP4: TFloatField
      DisplayLabel = 'STEP 4'
      DisplayWidth = 10
      FieldName = 'STEP4'
    end
    object tblFaixaSTEP5: TFloatField
      DisplayLabel = 'STEP 5'
      DisplayWidth = 10
      FieldName = 'STEP5'
    end
    object tblFaixaSTEP6: TFloatField
      DisplayLabel = 'STEP 6'
      DisplayWidth = 10
      FieldName = 'STEP6'
    end
    object tblFaixaSTEP7: TFloatField
      DisplayLabel = 'STEP 7'
      DisplayWidth = 10
      FieldName = 'STEP7'
    end
    object tblFaixaSTEP8: TFloatField
      DisplayLabel = 'STEP 8'
      DisplayWidth = 10
      FieldName = 'STEP8'
    end
    object tblFaixaSTEP9: TFloatField
      DisplayLabel = 'STEP 9'
      DisplayWidth = 10
      FieldName = 'STEP9'
    end
    object tblFaixaDATAEFETIV: TDateTimeField
      DisplayLabel = 'Data Efetiv.'
      DisplayWidth = 10
      FieldName = 'DATAEFETIV'
    end
  end
  object tblClasse2: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODGRPFUNC'
    MasterFields = 'CODGRPFUNC'
    MasterSource = ds
    TableName = 'CM.CLASSESAL'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 680
    Top = 261
  end
end
