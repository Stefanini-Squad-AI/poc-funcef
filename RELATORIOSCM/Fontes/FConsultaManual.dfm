inherited FrmConsultaManual: TFrmConsultaManual
  Left = 282
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Consulta Manual'
  ClientHeight = 478
  ClientWidth = 656
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 656
    Height = 392
    object Nome: TLabel
      Left = 12
      Top = 13
      Width = 37
      Height = 13
      Caption = 'Nome:'
    end
    object Label1: TLabel
      Left = 12
      Top = 63
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label2: TLabel
      Left = 12
      Top = 159
      Width = 50
      Height = 13
      Caption = 'Consulta'
    end
    object EditNome: TwwDBEdit
      Left = 12
      Top = 28
      Width = 624
      Height = 21
      DataField = 'NAME'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object MemDesc: TDBMemo
      Left = 12
      Top = 82
      Width = 624
      Height = 63
      DataField = 'DESCRIPTION'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object ReSql: TRichEdit
      Left = 12
      Top = 176
      Width = 624
      Height = 201
      ScrollBars = ssBoth
      TabOrder = 2
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 656
    inherited Toolbar971: TToolbar97
      object BtnDDic: TToolbarButton97
        Left = 240
        Top = 0
        Width = 71
        Height = 41
        Hint = 'Dicionário de Dados'
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Dic. Dados'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500055555
          5555500000005550222000000000500000005550200222222220500000005550
          2F000788FF205000000055022F08F7000F20500000005022FF08FFFB0F205000
          0000502FFF08FBFF0F2050000000502FFF08FFFB0F2050000000502FFF08FBFF
          0F2050000000502FFF08FFFB0F2050000000502FFF08FBFF0F2050000000502F
          F800FFFB000550000000502FF05500FF055550000000502F8055550005555000
          0000550805555555555550000000555055555555555550000000}
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = BtnDDicClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 439
    Width = 656
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '    IDDATAVIEW, NAME, CLASSNAME, TEMPLATE, DESCRIPTION, ORIGEMCM' +
        'DV'
      'FROM'
      '    CM.DATAVIEW'
      'WHERE'
      '     IDDATAVIEW = :IDDATAVIEW AND'
      '     ORIGEMCMDV = :ORIGEMCMDV')
    Left = 490
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDATAVIEW'
        ParamType = ptUnknown
        Value = 255
      end
      item
        DataType = ftInteger
        Name = 'ORIGEMCMDV'
        ParamType = ptUnknown
        Value = 255
      end>
    object qryIDDATAVIEW: TFloatField
      FieldName = 'IDDATAVIEW'
      Origin = 'DATAVIEW.IDDATAVIEW'
    end
    object qryNAME: TStringField
      FieldName = 'NAME'
      Origin = 'DATAVIEW.NAME'
      Size = 40
    end
    object qryCLASSNAME: TStringField
      FieldName = 'CLASSNAME'
      Origin = 'DATAVIEW.CLASSNAME'
      Size = 40
    end
    object qryTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'DATAVIEW.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
    object qryDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      Origin = 'DATAVIEW.DESCRIPTION'
      BlobType = ftMemo
      Size = 500
    end
    object qryORIGEMCMDV: TFloatField
      FieldName = 'ORIGEMCMDV'
      Origin = 'DATAVIEW.ORIGEMCMDV'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 432
    Top = 58
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.DATAVIEW'
      'set'
      '  IDDATAVIEW = :IDDATAVIEW,'
      '  NAME = :NAME,'
      '  CLASSNAME = :CLASSNAME,'
      '  ORIGEMCMDV = :ORIGEMCMDV'
      'where'
      '  IDDATAVIEW = :OLD_IDDATAVIEW and'
      '  ORIGEMCMDV = :OLD_ORIGEMCMDV')
    InsertSQL.Strings = (
      'insert into CM.DATAVIEW'
      '  (IDDATAVIEW, NAME, CLASSNAME, ORIGEMCMDV)'
      'values'
      '  (:IDDATAVIEW, :NAME, :CLASSNAME, :ORIGEMCMDV)')
    DeleteSQL.Strings = (
      'delete from CM.DATAVIEW'
      'where'
      '  IDDATAVIEW = :OLD_IDDATAVIEW and'
      '  ORIGEMCMDV = :OLD_ORIGEMCMDV')
    Left = 491
    Top = 106
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DATAVIEW.NAME'
      'SUBSTR(DATAVIEW.DESCRIPTION,1,200)')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'DATAVIEW')
    CamposChave.Strings = (
      'DATAVIEW.IDDATAVIEW'
      'DATAVIEW.ORIGEMCMDV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '200')
    Left = 433
    Top = 106
  end
  inherited ds: TwwDataSource
    Left = 493
    Top = 157
  end
  inherited ImlPadrao: TImageList
    Left = 429
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 434
    Top = 158
  end
  object qryDataView: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '   DATAVIEW.DESCRIPTION,'
      '   DATAVIEW.TEMPLATE'
      'FROM '
      '     CM.DATAVIEW'
      'WHERE'
      '     DATAVIEW.IDDATAVIEW = :IDDATAVIEW AND'
      '     DATAVIEW.ORIGEMCMDV = :ORIGEMCMDV')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 490
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDATAVIEW'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ORIGEMCMDV'
        ParamType = ptUnknown
      end>
  end
end
