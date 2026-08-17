inherited frmCadCRxTipoRecDes: TfrmCadCRxTipoRecDes
  Left = 215
  Top = 165
  Caption = 'Centro de Responsabilidade x Tipo de Recebimento/Desembolso'
  ClientHeight = 414
  ClientWidth = 672
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 672
    Height = 328
    object PnlCadastro: TPanel
      Left = 5
      Top = 5
      Width = 297
      Height = 318
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'PnlCadastro'
      TabOrder = 0
      object GrdTipoDesembAssoc: TwwDBGrid
        Left = 0
        Top = 67
        Width = 297
        Height = 251
        Selected.Strings = (
          'DESCRICAO'#9'36'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnDblClick = BtnExcluiDesembAssocClick
        IndicatorColor = icBlack
      end
      object PnlTitTipoAgreAssoc: TPanel
        Left = 0
        Top = 41
        Width = 297
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tipos de Recebimentos/Desembolsos Associados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object PblRamoForn: TPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 0
          Width = 164
          Height = 13
          Caption = 'Centro de Responsabilidade:'
        end
        object edCentroRespon: TEdit
          Left = 8
          Top = 16
          Width = 281
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object PnlCtrls: TPanel
      Left = 302
      Top = 5
      Width = 31
      Height = 318
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object BtnIncluiDesemb: TSpeedButton
        Left = 4
        Top = 156
        Width = 25
        Height = 25
        Hint = 'Selciona'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E666666666
          608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
          66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
          66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
          660878F888877F88887887E66666F666608887F88888788887F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnIncluiDesembClick
        OnDblClick = BtnIncluiDesembClick
      end
      object BtnIncluiTodosDesemb: TSpeedButton
        Left = 4
        Top = 188
        Width = 25
        Height = 25
        Hint = 'Selciona Todos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E666666666
          608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
          66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
          66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
          660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnIncluiTodosDesembClick
      end
      object BtnExcluiDesembAssoc: TSpeedButton
        Left = 4
        Top = 252
        Width = 25
        Height = 25
        Hint = 'Exclui Todos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E666666666
          608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
          66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
          66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
          660878F888778888887887E666F66666608887F88878888887F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnExcluiDesembAssocClick
      end
      object BtnExcluiTodosDesembAssoc: TSpeedButton
        Left = 4
        Top = 220
        Width = 25
        Height = 25
        Hint = 'Exclui'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E666666666
          608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
          66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
          66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
          660878F877887788887887E6F666F666608887F87888788887F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnExcluiTodosDesembAssocClick
      end
    end
    object PnlDesemb: TPanel
      Left = 333
      Top = 5
      Width = 334
      Height = 318
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 2
      object PnlTitDesemb: TPanel
        Left = 0
        Top = 41
        Width = 334
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tipos de Recebimentos/Desembolsos Disponíveis'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GrdTipDesemb: TwwDBGrid
        Left = 0
        Top = 67
        Width = 334
        Height = 251
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsTiposRecDesemb
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object rdgTiposRD: TRadioGroup
        Left = 0
        Top = 0
        Width = 334
        Height = 41
        Align = alTop
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Pagamentos'
          'Recebimentos    '
          'Todos')
        TabOrder = 2
        OnClick = rdgTiposRDClick
      end
    end
  end
  inherited Dock972: TDock97
    Width = 672
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Width = 84
        Caption = '&Relacionar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888FFFFF8888888888800000888888888FF877777F8888888776666600
          888888F877888887788888766666666608888F878F888888878887666F666666
          60888F78F87888888F788766FF8888666088F87F877FFF8888787E6FFFFFFF66
          6608F7887777777888F77E66FF6666666608F7888778F88888F77E666F66F666
          6608F7888878F78888F77E666666FF666608F788FFFFF77888F77E66FFFFFFF6
          66088788877777778F8787E68888FF6660888F788888F7788F7887E66666F666
          6088887888888788F878887EE666666608888887F88888FF878888877EEEEE00
          8888888877FFFF87788888888777778888888888887777788888}
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 204
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 144
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 672
    inherited tb97Fundo: TToolbar97
      Left = 419
      DockPos = 419
      inherited bbtnSair: TBitBtn
        ModalResult = 5
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 137
      DockPos = 137
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      '  T.*,'
      '  TRD.DESCRICAO'
      'FROM'
      '  TRDXCRESPON T,'
      '  TIPORECEBDESEMB TRD'
      'WHERE'
      '  (T.CODTIPRECDES=TRD.CODTIPRECDES) AND'
      '  (T.IDPESSOA=TRD.IDPESSOA) AND'
      '  (T.RECPAG=TRD.RECPAG) AND'
      '  (T.IDPESSOA= :IDPessoa) AND'
      '  (RTrim(T.CODCENTRORESPON) = :CentroRespon)'
      'ORDER BY'
      '  TRD.DESCRICAO'
      ''
      ''
      ' '
      ' ')
    Left = 248
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CentroRespon'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 600
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TRDXCRESPON'
      'set'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  CODCENTRORESPON = :OLD_CODCENTRORESPON and'
      '  CODTIPRECDES = :OLD_CODTIPRECDES and'
      '  RECPAG = :OLD_RECPAG and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into TRDXCRESPON'
      '  (CODCENTRORESPON, CODTIPRECDES, RECPAG, IDPESSOA)'
      'values'
      '  (:CODCENTRORESPON, :CODTIPRECDES, :RECPAG, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from TRDXCRESPON'
      'where'
      '  CODCENTRORESPON = :OLD_CODCENTRORESPON and'
      '  CODTIPRECDES = :OLD_CODTIPRECDES and'
      '  RECPAG = :OLD_RECPAG and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 248
    Top = 280
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleção de Centro de Responsabilidade'
    Colunas.Strings = (
      'CENTRESPON.CODCENTRORESPON'
      'CENTRESPON.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Centro de Responsabilidade')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CENTRESPON')
    CamposChave.Strings = (
      'CENTRESPON.CODCENTRORESPON'
      'CENTRESPON.NOME')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    Left = 448
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 248
    Top = 232
  end
  inherited ImlPadrao: TImageList
    Left = 304
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 366
    Top = 2
  end
  object qryTiposRecDesemb: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TRD.*'
      'FROM TipoRecebDesemb TRD'
      'WHERE (TRD.IDPessoa = :IDPessoa) AND'
      '      ((TRD.RecPag = :RecPag) OR ('#39'T'#39' = :RecPag)) AND NOT'
      '      Exists(SELECT *'
      '             FROM'
      '               TRDXCRESPON T'
      '             WHERE'
      '               (T.CODTIPRECDES=TRD.CODTIPRECDES) AND'
      '               (T.RECPAG=TRD.RECPAG) AND'
      '               (T.IDPESSOA= :IDPessoa) AND'
      '               (RTrim(T.CODCENTRORESPON)= :CentroRespon))'
      'ORDER BY DESCRICAO'
      ' '
      ' '
      ' ')
    UpdateObject = updTiposRecDesemb
    ValidateWithMask = True
    Left = 568
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RecPag'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RecPag'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CentroRespon'
        ParamType = ptUnknown
      end>
  end
  object dsTiposRecDesemb: TwwDataSource
    DataSet = qryTiposRecDesemb
    Left = 568
    Top = 232
  end
  object updTiposRecDesemb: TUpdateSQL
    ModifySQL.Strings = (
      'update TipoRecebDesemb'
      'set'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLANO = :PLANO,'
      '  IDTIPOAVALIACAO = :IDTIPOAVALIACAO,'
      '  PLACONTACREDITO = :PLACONTACREDITO,'
      '  PLACONTA = :PLACONTA,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  DESCRICAO = :DESCRICAO,'
      '  ANASINT = :ANASINT,'
      '  FLGOBRIGARESERVA = :FLGOBRIGARESERVA,'
      '  FLGCALCULAIMPOSTO = :FLGCALCULAIMPOSTO,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  FLGINDICARECDES = :FLGINDICARECDES,'
      '  HITCODHIST = :HITCODHIST,'
      '  CODCORRESP = :CODCORRESP,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  CODSUBCONTACRE = :CODSUBCONTACRE'
      'where'
      '  CODTIPRECDES = :OLD_CODTIPRECDES and'
      '  RECPAG = :OLD_RECPAG and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into TipoRecebDesemb'
      
        '  (CODTIPRECDES, RECPAG, IDPESSOA, PLANO, IDTIPOAVALIACAO, PLACO' +
        'NTACREDITO, '
      
        '   PLACONTA, IDUSUARIOINCLUSAO, DESCRICAO, ANASINT, FLGOBRIGARES' +
        'ERVA, FLGCALCULAIMPOSTO, '
      
        '   TRGDTINCLUSAO, TRGUSERINCLUSAO, FLGINDICARECDES, HITCODHIST, ' +
        'CODCORRESP, '
      '   CODSUBCONTA, CODSUBCONTACRE)'
      'values'
      
        '  (:CODTIPRECDES, :RECPAG, :IDPESSOA, :PLANO, :IDTIPOAVALIACAO, ' +
        ':PLACONTACREDITO, '
      
        '   :PLACONTA, :IDUSUARIOINCLUSAO, :DESCRICAO, :ANASINT, :FLGOBRI' +
        'GARESERVA, '
      
        '   :FLGCALCULAIMPOSTO, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, :FLGIND' +
        'ICARECDES, '
      '   :HITCODHIST, :CODCORRESP, :CODSUBCONTA, :CODSUBCONTACRE)')
    DeleteSQL.Strings = (
      'delete from TipoRecebDesemb'
      'where'
      '  CODTIPRECDES = :OLD_CODTIPRECDES and'
      '  RECPAG = :OLD_RECPAG and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 568
    Top = 280
  end
end
