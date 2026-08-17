inherited frmCadClassRiscoRenFix: TfrmCadClassRiscoRenFix
  Left = 288
  Top = 171
  ClientHeight = 211
  ClientWidth = 368
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 368
    Height = 125
    inherited Bevel2: TBevel
      Width = 358
    end
    object Label1: TLabel [1]
      Left = 22
      Top = 62
      Width = 146
      Height = 13
      Caption = 'Nome da Classe de Risco'
    end
    object Label2: TLabel [2]
      Left = 264
      Top = 62
      Width = 32
      Height = 13
      Caption = 'Nível'
    end
    object Label3: TLabel [3]
      Left = 308
      Top = 62
      Width = 20
      Height = 13
      Caption = 'Cor'
    end
    inherited pnlTitulo: TPanel
      Width = 358
      TabOrder = 3
      inherited lbNomItem: TfcLabel
        Width = 228
        Caption = 'Classificação de Risco'
      end
    end
    object dbeNome: TwwDBEdit
      Left = 22
      Top = 78
      Width = 235
      Height = 21
      DataField = 'NOMECLASSRISCO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbsNivel: TwwDBSpinEdit
      Left = 264
      Top = 78
      Width = 37
      Height = 21
      Increment = 1
      MaxValue = 100
      MinValue = 1
      DataField = 'NIVELCLASSRISCO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object dbcCor: TfcColorCombo
      Left = 308
      Top = 78
      Width = 36
      Height = 21
      ButtonStyle = cbsEllipsis
      Color = clWhite
      ColorDialog = dlgCor
      ColorDialogOptions = [cdoPreventFullOpen, cdoAnyColor]
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      ColorListOptions.Options = [ccoShowSystemColors, ccoShowColorNone, ccoShowCustomColors, ccoShowStandardColors, ccoShowColorNames, ccoGroupSystemColors]
      DropDownCount = 8
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 368
    inherited Toolbar971: TToolbar97
      object sbtnImprime: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Imprime'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnImprimeClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 172
    Width = 368
    inherited tb97Fundo: TToolbar97
      Left = 198
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 31
    end
  end
  inherited qry: TwwQuery
    RequestLive = True
    SQL.Strings = (
      
        'SELECT IDCLASSRISCORENFIX, NOMECLASSRISCO, NIVELCLASSRISCO, CORC' +
        'LASSRISCO'
      'FROM CLASSRISCORENFIX'
      'WHERE IDCLASSRISCORENFIX = :IDCLASSRISCORENFIX'
      'ORDER BY NOMECLASSRISCO')
    Left = 258
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCLASSRISCORENFIX'
        ParamType = ptResult
      end>
    object qryIDCLASSRISCORENFIX: TFloatField
      FieldName = 'IDCLASSRISCORENFIX'
      Origin = 'BASEDADOS.CLASSRISCORENFIX.IDCLASSRISCORENFIX'
    end
    object qryNOMECLASSRISCO: TStringField
      FieldName = 'NOMECLASSRISCO'
      Origin = 'BASEDADOS.CLASSRISCORENFIX.NOMECLASSRISCO'
      Size = 60
    end
    object qryNIVELCLASSRISCO: TFloatField
      FieldName = 'NIVELCLASSRISCO'
      Origin = 'BASEDADOS.CLASSRISCORENFIX.NIVELCLASSRISCO'
    end
    object qryCORCLASSRISCO: TFloatField
      FieldName = 'CORCLASSRISCO'
      Origin = 'BASEDADOS.CLASSRISCORENFIX.CORCLASSRISCO'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 328
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CLASSRISCORENFIX'
      'set'
      '  NOMECLASSRISCO = :NOMECLASSRISCO,'
      '  NIVELCLASSRISCO = :NIVELCLASSRISCO,'
      '  CORCLASSRISCO = :CORCLASSRISCO'
      'where'
      '  IDCLASSRISCORENFIX = :OLD_IDCLASSRISCORENFIX')
    InsertSQL.Strings = (
      'insert into CLASSRISCORENFIX'
      '  (IDCLASSRISCORENFIX,NOMECLASSRISCO, NIVELCLASSRISCO, '
      'CORCLASSRISCO)'
      'values'
      '  (:IDCLASSRISCORENFIX,:NOMECLASSRISCO, :NIVELCLASSRISCO, '
      ':CORCLASSRISCO)')
    DeleteSQL.Strings = (
      'delete from CLASSRISCORENFIX'
      'where'
      '  IDCLASSRISCORENFIX = :OLD_IDCLASSRISCORENFIX')
    Left = 275
    Top = 53
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CLASSRISCORENFIX.NOMECLASSRISCO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome da Classe de Risco')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CLASSRISCORENFIX')
    CamposChave.Strings = (
      'CLASSRISCORENFIX.IDCLASSRISCORENFIX')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 312
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 291
    Top = 53
  end
  inherited ImlPadrao: TImageList
    Left = 321
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 322
    Top = 6
  end
  object dlgCor: TColorDialog
    Ctl3D = True
    Left = 336
    Top = 6
  end
end
