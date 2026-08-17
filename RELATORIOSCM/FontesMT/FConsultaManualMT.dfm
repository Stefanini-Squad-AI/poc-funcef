inherited FrmConsultaManual: TFrmConsultaManual
  Left = 107
  Top = 96
  Caption = 'Consulta Manual'
  ClientHeight = 448
  ClientWidth = 618
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 618
    Height = 362
    object Nome: TLabel
      Left = 16
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label1: TLabel
      Left = 16
      Top = 52
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label2: TLabel
      Left = 16
      Top = 132
      Width = 50
      Height = 13
      Caption = 'Consulta'
    end
    object Label6: TLabel
      Left = 484
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label7: TLabel
      Left = 572
      Top = 28
      Width = 7
      Height = 13
      Caption = '/'
    end
    object DbEdNome: TwwDBEdit
      Left = 16
      Top = 24
      Width = 457
      Height = 21
      DataField = 'NAME'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbMemDesc: TDBMemo
      Left = 16
      Top = 65
      Width = 585
      Height = 63
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DESCRIPTION'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object DbEdCodigo: TwwDBEdit
      Left = 484
      Top = 24
      Width = 85
      Height = 21
      DataField = 'IDDATAVIEW'
      DataSource = ds
      Enabled = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbEdOrigem: TwwDBEdit
      Left = 582
      Top = 25
      Width = 19
      Height = 21
      DataField = 'ORIGEMCMDV'
      DataSource = ds
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object ReSql: TMemo
      Left = 16
      Top = 146
      Width = 584
      Height = 201
      Anchors = [akLeft, akTop, akRight, akBottom]
      ScrollBars = ssBoth
      TabOrder = 4
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 618
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
    Top = 409
    Width = 618
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 464
    Top = 324
    TargetsData = (
      1
      3
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 508
    Top = 276
  end
  inherited ImlPadrao: TImageList
    Left = 460
    Top = 276
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 552
    Top = 276
  end
  inherited Cds: TCMClientDataSet
    Left = 504
    Top = 324
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
      '40'
      '200')
    Left = 552
    Top = 324
  end
  object CdsDataViewAcesso: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 324
  end
  object SQLDataViewAcesso: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDESPACESSO,'
      '   IDDATAVIEW,'
      '   ORIGEMCMDV'
      'FROM'
      '   DATAVIEWACESSO'
      'WHERE'
      '   IDDATAVIEW = :PIDDATAVIEW'
      '   AND ORIGEMCMDV = :PORIGEMCMDV')
    ClientDataSet = CdsDataViewAcesso
    Left = 384
    Top = 276
  end
end
