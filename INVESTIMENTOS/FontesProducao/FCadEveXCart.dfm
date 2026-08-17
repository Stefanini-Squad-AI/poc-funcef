inherited frmCadEveXCart: TfrmCadEveXCart
  Left = 89
  Top = 91
  HelpContext = 790048
  Caption = 'frmCadEveXCart'
  ClientHeight = 372
  ClientWidth = 635
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 635
    Height = 286
    inherited Bevel2: TBevel
      Width = 633
    end
    inherited pnlControles: TPanel
      Width = 633
      Height = 240
      BevelInner = bvRaised
      BevelOuter = bvLowered
      object Label1: TLabel
        Left = 18
        Top = 22
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object Label3: TLabel
        Left = 18
        Top = 88
        Width = 134
        Height = 13
        Caption = 'Evento de Caixa / Cota'
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 18
        Top = 38
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Descrição'#9'F')
        DataField = 'IDCARTEIRA'
        DataSource = ds
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRA'
        Options = [loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblEveCxCota: TwwDBLookupCombo
        Left = 18
        Top = 104
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCAIXACOTA'#9'40'#9'Descrição'#9'F')
        DataField = 'IDEVENTOCAIXACOTA'
        DataSource = ds
        LookupTable = qryEveCXCota
        LookupField = 'IDEVENTOCAIXACOTA'
        Options = [loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 633
      Height = 240
      Selected.Strings = (
        'DESCCARTINVEST'#9'41'#9'Carteira'
        'DESCCAIXACOTA'#9'43'#9'Evento')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
    end
    inherited pnlTitulo: TPanel
      Width = 633
      inherited lbNomItem: TfcLabel
        Width = 326
        Caption = 'Cadastro de Evento por Carteira'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 635
    inherited Toolbar971: TToolbar97
      object sbtnFiltrar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Filtrar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnFiltrarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 333
    Width = 635
    inherited tb97Fundo: TToolbar97
      Left = 463
      DockPos = 490
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 294
      DockPos = 321
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 304
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CARTEIRAXEVENTO'
      'set'
      '  IDEVENTOCAIXACOTA = :IDEVENTOCAIXACOTA,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST'
      'where'
      '  IDCARTEIRAXEVENTO = :OLD_IDCARTEIRAXEVENTO')
    InsertSQL.Strings = (
      'insert into CARTEIRAXEVENTO'
      '  (IDCARTEIRAXEVENTO, IDEVENTOCAIXACOTA, IDCARTEIRAGERENC, '
      'IDCARTEIRAINVEST)'
      'values'
      '  (:IDCARTEIRAXEVENTO, :IDEVENTOCAIXACOTA, :IDCARTEIRAGERENC, '
      ':IDCARTEIRAINVEST)')
    DeleteSQL.Strings = (
      'delete from CARTEIRAXEVENTO'
      'where'
      '  IDCARTEIRAXEVENTO = :OLD_IDCARTEIRAXEVENTO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'C.DESCCARTINVEST'
      'EVENTOCAIXACOTA.DESCCAIXACOTA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Carteira'
      'Evento')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CARTEIRAXEVENTO'
      
        '(SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA, IDCA' +
        'RTEIRAINVEST, NULL AS IDCARTEIRAGERENC, DESCCARTINVEST FROM CART' +
        'EIRAINVEST WHERE IDTIPOINVEST = 2 UNION SELECT LPAD(IDCARTEIRAIN' +
        'VEST,2,'#39'0'#39') || LPAD(IDCARTEIRAGERENC,2,'#39'0'#39') AS IDCARTEIRA, IDCAR' +
        'TEIRAINVEST, IDCARTEIRAGERENC, DESCCARTGERENC AS DESCCARTINVEST ' +
        'FROM CARTEIRAGERENC) C'
      'EVENTOCAIXACOTA')
    CamposChave.Strings = (
      'CARTEIRAXEVENTO.IDCARTEIRAXEVENTO')
    Filtro.Strings = (
      
        '(LPAD(CARTEIRAXEVENTO.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CARTEIRAXE' +
        'VENTO.IDCARTEIRAGERENC,2,'#39'0'#39')) = C.IDCARTEIRA'
      
        'CARTEIRAXEVENTO.IDEVENTOCAIXACOTA = EVENTOCAIXACOTA.IDEVENTOCAIX' +
        'ACOTA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '40')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT CI.DESCCARTINVEST,'
      '       EC.DESCCAIXACOTA, '
      '       CX.IDCARTEIRAXEVENTO,'
      '       CX.IDCARTEIRAINVEST,'
      '       CX.IDCARTEIRAGERENC,'
      '       CX.IDEVENTOCAIXACOTA,'
      '       CI.IDCARTEIRA'
      ''
      'FROM  CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC,'
      
        '      (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA' +
        ', IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, DESCCARTINVEST'
      '       FROM  CARTEIRAINVEST'
      '       WHERE IDTIPOINVEST = 2'
      '       UNION'
      
        '       SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39') AS IDCARTEIRA, IDCARTEIRAINVEST, IDCARTEIRAGERENC, DE' +
        'SCCARTGERENC AS DESCCARTINVEST'
      '       FROM CARTEIRAGERENC) CI'
      ''
      
        'WHERE ((LPAD(CX.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CX.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND EC.IDEVENTOCAIXACOTA = CX.IDEVENTOCAIXACOTA'
      '  AND ((:IDCARTEIRA IS NULL) OR (CI.IDCARTEIRA = :IDCARTEIRA))'
      ''
      'ORDER BY DESCCARTINVEST, DESCCAIXACOTA'
      ' '
      ' '
      ' '
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
        ParamType = ptResult
      end>
    object qryDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 41
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryDESCCAIXACOTA: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 43
      FieldName = 'DESCCAIXACOTA'
      Size = 40
    end
    object qryIDCARTEIRAXEVENTO: TFloatField
      DisplayWidth = 19
      FieldName = 'IDCARTEIRAXEVENTO'
      Visible = False
    end
    object qryIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 17
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 18
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryIDEVENTOCAIXACOTA: TFloatField
      DisplayWidth = 18
      FieldName = 'IDEVENTOCAIXACOTA'
      Visible = False
    end
    object qryIDCARTEIRA: TStringField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
  end
  object qryCarteira: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(IDCARTEIRAGERENC,2,'#39 +
        '0'#39') AS IDCARTEIRA, IDCARTEIRAINVEST, IDCARTEIRAGERENC, DESCCARTG' +
        'ERENC AS DESCCARTINVEST'
      'FROM CARTEIRAGERENC'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 453
    Top = 56
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
  end
  object qryEveCXCota: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOCAIXACOTA,'
      '       DESCCAIXACOTA'
      'FROM   EVENTOCAIXACOTA'
      'ORDER BY DESCCAIXACOTA'
      ' ')
    ValidateWithMask = True
    Left = 513
    Top = 56
    object qryEveCXCotaDESCCAIXACOTA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCCAIXACOTA'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.DESCCAIXACOTA'
      Size = 60
    end
    object qryEveCXCotaIDEVENTOCAIXACOTA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEVENTOCAIXACOTA'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.IDEVENTOCAIXACOTA'
      Visible = False
    end
  end
  object MontaSelectFiltrar: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.DESCCARTINVEST')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Carteira')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      
        '(SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(IDCARTEIRAGERENC,2,' +
        #39'0'#39') AS IDCARTEIRA, IDCARTEIRAINVEST, IDCARTEIRAGERENC, DESCCART' +
        'GERENC AS DESCCARTINVEST FROM CARTEIRAGERENC) C')
    CamposChave.Strings = (
      'C.IDCARTEIRA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 565
    Top = 6
  end
end
