inherited FrmCadHistoricos: TFrmCadHistoricos
  Left = 203
  Top = 239
  Caption = 'Históricos SAF'
  ClientHeight = 236
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 150
    object Label1: TLabel
      Left = 34
      Top = 31
      Width = 67
      Height = 13
      Caption = 'Código SAF'
    end
    object Label2: TLabel
      Left = 34
      Top = 79
      Width = 51
      Height = 13
      Caption = 'Histórico'
    end
    object Bevel1: TBevel
      Left = 429
      Top = 28
      Width = 93
      Height = 51
      Shape = bsFrame
    end
    object EdtSaf: TwwDBEdit
      Left = 34
      Top = 47
      Width = 121
      Height = 21
      DataField = 'IDHISTORICOSAF'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object EdtHistorico: TwwDBEdit
      Left = 34
      Top = 96
      Width = 486
      Height = 21
      DataField = 'DESCHISTORICOSAF'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object GpbSistema: TDBRadioGroup
      Left = 161
      Top = 23
      Width = 263
      Height = 57
      Caption = ' Sistema '
      Columns = 2
      DataField = 'RECPAG'
      DataSource = ds
      Items.Strings = (
        'Contas a &Pagar'
        'Contas a &Receber')
      TabOrder = 1
      Values.Strings = (
        'P'
        'R')
    end
    object CkbBloqueado: TDBCheckBox
      Left = 434
      Top = 45
      Width = 82
      Height = 17
      Caption = 'Bloqueado'
      DataField = 'FLGBLOQUEADO'
      DataSource = ds
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      object BtnImporta: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        Caption = '&Importar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
          3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
          700077337F3333373777887007333337007733F773F333337733700070333333
          077037773733333F7F37703707333300080737F373333377737F003333333307
          78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
          078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
          70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
          3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
          33337F73FF737773333307800077033333337337773373333333}
        ImageIndex = 0
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = BtnImportaClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 197
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      
        'SELECT * FROM HISTORICOSAF WHERE IDHISTORICOSAF = :IDHISTORICOSA' +
        'F')
    Left = 392
    Top = 3
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHISTORICOSAF'
        ParamType = ptUnknown
      end>
    object qryIDHISTORICOSAF: TFloatField
      DisplayLabel = 'Código'
      FieldName = 'IDHISTORICOSAF'
      Origin = 'HISTORICOSAF.IDHISTORICOSAF'
      Required = True
    end
    object qryDESCHISTORICOSAF: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'DESCHISTORICOSAF'
      Origin = 'HISTORICOSAF.DESCHISTORICOSAF'
      Required = True
      Size = 60
    end
    object qryRECPAG: TStringField
      DisplayLabel = 'Rec\Pag'
      FieldName = 'RECPAG'
      Origin = 'HISTORICOSAF.RECPAG'
      Required = True
      Size = 1
    end
    object qryFLGBLOQUEADO: TStringField
      FieldName = 'FLGBLOQUEADO'
      Origin = 'BASEDADOS.HISTORICOSAF.FLGBLOQUEADO'
      FixedChar = True
      Size = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTORICOSAF'
      'set'
      '  IDHISTORICOSAF = :IDHISTORICOSAF,'
      '  DESCHISTORICOSAF = :DESCHISTORICOSAF,'
      '  RECPAG = :RECPAG,'
      '  FLGBLOQUEADO = :FLGBLOQUEADO'
      'where'
      '  IDHISTORICOSAF = :OLD_IDHISTORICOSAF')
    InsertSQL.Strings = (
      'insert into HISTORICOSAF'
      '  (IDHISTORICOSAF, DESCHISTORICOSAF, RECPAG, FLGBLOQUEADO)'
      'values'
      '  (:IDHISTORICOSAF, :DESCHISTORICOSAF, :RECPAG, :FLGBLOQUEADO)')
    DeleteSQL.Strings = (
      'delete from HISTORICOSAF'
      'where'
      '  IDHISTORICOSAF = :OLD_IDHISTORICOSAF')
    Left = 361
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Histórico SAF'
    Colunas.Strings = (
      'HISTORICOSAF.DESCHISTORICOSAF'
      'HISTORICOSAF.RECPAG')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Rec\Pag')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'HISTORICOSAF')
    CamposChave.Strings = (
      'HISTORICOSAF.IDHISTORICOSAF')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '1')
    Left = 453
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 422
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 318
    Top = 10
  end
  object OpFile: TOpenDialog
    Title = 'Importação de Históricos SAF'
    Left = 494
    Top = 8
  end
end
