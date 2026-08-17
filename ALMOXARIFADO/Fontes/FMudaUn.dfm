inherited FrmMudaUn: TFrmMudaUn
  Left = 179
  Top = 142
  Caption = 'Mudança de Unidade do Custo Médio'
  ClientHeight = 288
  ClientWidth = 430
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 430
    Height = 249
    object LbArtigo: TLabel
      Left = 24
      Top = 72
      Width = 34
      Height = 13
      Caption = 'Artigo'
    end
    object LbTabela: TLabel
      Left = 24
      Top = 176
      Width = 40
      Height = 13
      Caption = 'Inativo'
    end
    object Label1: TLabel
      Left = 24
      Top = 123
      Width = 122
      Height = 13
      Caption = 'Unidade Custo Médio'
    end
    object Label15: TLabel
      Left = 168
      Top = 123
      Width = 122
      Height = 13
      Caption = 'Unidades Disponíves'
    end
    object LbInicio: TLabel
      Left = 24
      Top = 221
      Width = 5
      Height = 11
      Caption = '1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbProgresso: TLabel
      Left = 204
      Top = 221
      Width = 5
      Height = 11
      Alignment = taRightJustify
      Caption = '1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbFinal: TLabel
      Left = 400
      Top = 221
      Width = 5
      Height = 11
      Alignment = taRightJustify
      Caption = '1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 420
      Height = 60
      Align = alTop
      BevelInner = bvRaised
      BevelWidth = 2
      Caption = 'Panel1'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Memo1: TMemo
        Left = 4
        Top = 4
        Width = 412
        Height = 52
        Align = alClient
        Alignment = taCenter
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Esta Rotina irá atualizar  TODOS os movimentos do '
          'produto escolhido.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object dblcArt: TCMDBLookupCombo
      Tag = 5
      Left = 24
      Top = 88
      Width = 381
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCPROD'#9'40'#9'Descrição'
        'CODARTIGO'#9'14'#9'Código')
      LookupTable = qryArt
      LookupField = 'CODARTIGO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcArtCloseUp
    end
    object barMov: TProgressBar
      Left = 24
      Top = 192
      Width = 381
      Height = 24
      Min = 0
      Max = 100
      TabOrder = 2
    end
    object edUnCusto: TDBEdit
      Left = 24
      Top = 139
      Width = 121
      Height = 21
      Color = clSilver
      Ctl3D = True
      DataField = 'CODMEDCUSTO'
      DataSource = ds
      ParentCtl3D = False
      TabOrder = 3
    end
    object dblcUnidMedida: TwwDBLookupCombo
      Left = 168
      Top = 139
      Width = 141
      Height = 21
      Hint = 'Unidades de Conversão deste Produto'
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODMEDIDA'#9'4'#9'Código'
        'FATOR'#9'10'#9'Fator'
        'DESCMEDIDA'#9'25'#9'Decrição')
      LookupTable = qryUnidMed
      LookupField = 'CODMEDIDA'
      Options = [loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 249
    Width = 430
    inherited tb97Fundo: TToolbar97
      Left = 184
      DockPos = 184
      inherited sep1: TToolbarSep97
        Left = 160
      end
      inherited bbtnSair: TBitBtn
        Left = 80
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 162
      end
      object BtnAtualiza: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Atualizar'
        TabOrder = 2
        OnClick = BtnAtualizaClick
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
    Left = 763
  end
  object qryArt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        DISTINCT '
      '         A.CODARTIGO,'
      '         P.DESCPROD,'
      '         P.CODMEDCUSTO'
      'FROM'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     SALDO S,'
      '    CUSTOMED C'
      'WHERE'
      '          (A.CODPRODUTO = P.CODPRODUTO)'
      ' AND (A.CODPRODUTO = S.CODARTIGO)'
      ' AND (A.CODPRODUTO = C.CODARTIGO)'
      'ORDER BY   P.DESCPROD')
    ValidateWithMask = True
    Left = 21
    Top = 240
    object qryArtDESCPROD: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCPROD'
      Origin = '"CM.PRODUTO".DESCPROD'
      Size = 40
    end
    object qryArtCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Origin = '"CM.ARTIGO".CODARTIGO'
      Size = 14
    end
    object qryArtCODMEDCUSTO: TStringField
      FieldName = 'CODMEDCUSTO'
      Origin = 'PRODUTO.CODMEDCUSTO'
      Size = 4
    end
  end
  object ds: TwwDataSource
    DataSet = qryArt
    Left = 64
    Top = 240
  end
  object qryUnidMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT U.CODMEDIDA,U.DescMedida,C.FATOR '
      'FROM '
      '   CONVER C, '
      '   UnMedida U '
      'WHERE '
      '   rtrim(C.CodProduto) = rtrim(:pCodProd)'
      '   and( u.CodMedida = c.CodMedida )')
    ValidateWithMask = True
    Left = 123
    Top = 239
    ParamData = <
      item
        DataType = ftString
        Name = 'pCodProd'
        ParamType = ptUnknown
      end>
  end
  object qryMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '          IDMOV,'
      '          QTDEMOV,'
      '          SALDOQTDEMOV,'
      '          CUSTOMEDIOMOV'
      'FROM'
      '        MOVIMENT'
      'WHERE'
      '        (RTRIM(CODARTIGO) = :pCODARTIGO)'
      'ORDER BY DATAMOV')
    UpdateObject = updMov
    ValidateWithMask = True
    Left = 320
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end>
    object qryMovQTDEMOV: TFloatField
      FieldName = 'QTDEMOV'
      Origin = 'MOVIMENT.QTDEMOV'
    end
    object qryMovSALDOQTDEMOV: TFloatField
      FieldName = 'SALDOQTDEMOV'
      Origin = 'MOVIMENT.SALDOQTDEMOV'
    end
    object qryMovCUSTOMEDIOMOV: TFloatField
      FieldName = 'CUSTOMEDIOMOV'
      Origin = 'MOVIMENT.CUSTOMEDIOMOV'
    end
    object qryMovIDMOV: TFloatField
      FieldName = 'IDMOV'
      Origin = 'MOVIMENT.IDMOV'
    end
  end
  object updMov: TUpdateSQL
    ModifySQL.Strings = (
      'update MOVIMENT'
      'set'
      '  IDMOV = :IDMOV,'
      '  QTDEMOV = :QTDEMOV,'
      '  SALDOQTDEMOV = :SALDOQTDEMOV,'
      '  CUSTOMEDIOMOV = :CUSTOMEDIOMOV'
      'where'
      '  IDMOV = :OLD_IDMOV')
    InsertSQL.Strings = (
      'insert into MOVIMENT'
      '  (IDMOV, QTDEMOV, SALDOQTDEMOV, CUSTOMEDIOMOV)'
      'values'
      '  (:IDMOV, :QTDEMOV, :SALDOQTDEMOV, :CUSTOMEDIOMOV)')
    DeleteSQL.Strings = (
      'delete from MOVIMENT'
      'where'
      '  IDMOV = :OLD_IDMOV')
    Left = 360
    Top = 24
  end
  object qryConver: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    UNVELHA.FATOR/UNNOVA.FATOR AS FATOR'
      'FROM'
      '    PRODUTO P,'
      '    CONVER UNVELHA,'
      '    CONVER UNNOVA'
      'WHERE'
      '          (RTRIM(P.CODPRODUTO) =:pCODART )'
      ' AND (P.CODPRODUTO = UNVELHA.CODPRODUTO)'
      ' AND (P.CODPRODUTO = UNNOVA.CODPRODUTO)'
      ' AND (RTRIM(UNVELHA.CODMEDIDA) = :pCODUNVELHA )'
      ' AND (RTRIM(UNNOVA.CODMEDIDA)  = :pCODUNNOVA )')
    ValidateWithMask = True
    Left = 376
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODART'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODUNVELHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODUNNOVA'
        ParamType = ptUnknown
      end>
    object qryConverFATOR: TFloatField
      FieldName = 'FATOR'
    end
  end
  object qrySaldo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT         '
      '          CODARTIGO, '
      '          CODALMOXARIFADO, '
      '          SALDOQTDE'
      'FROM'
      '        SALDO '
      'WHERE'
      '        (RTRIM(CODARTIGO) = :pCODARTIGO)')
    UpdateObject = updSaldo
    ValidateWithMask = True
    Left = 48
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end>
    object qrySaldoSALDOQTDE: TFloatField
      FieldName = 'SALDOQTDE'
    end
    object qrySaldoCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qrySaldoCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
    end
  end
  object updSaldo: TUpdateSQL
    ModifySQL.Strings = (
      'update SALDO'
      'set'
      '  CODARTIGO = :CODARTIGO,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  SALDOQTDE = :SALDOQTDE'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO and'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO')
    InsertSQL.Strings = (
      'insert into SALDO'
      '  (CODARTIGO, CODALMOXARIFADO, SALDOQTDE)'
      'values'
      '  (:CODARTIGO, :CODALMOXARIFADO, :SALDOQTDE)')
    DeleteSQL.Strings = (
      'delete from SALDO'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO and'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO')
    Left = 104
    Top = 16
  end
  object qryCustoMed: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '          CODCUSTEIO, '
      '          CODARTIGO,'
      '          SALDOQTDEUC,'
      '          CUSTOMEDIO'
      'FROM'
      '        CUSTOMED'
      'WHERE'
      '        (RTRIM(CODARTIGO) = :pCODARTIGO)'
      '')
    UpdateObject = udpCustoMed
    ValidateWithMask = True
    Left = 176
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end>
    object qryCustoMedCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'CUSTOMED.CODARTIGO'
      Size = 14
    end
    object qryCustoMedSALDOQTDEUC: TFloatField
      FieldName = 'SALDOQTDEUC'
      Origin = 'CUSTOMED.SALDOQTDEUC'
    end
    object qryCustoMedCUSTOMEDIO: TFloatField
      FieldName = 'CUSTOMEDIO'
      Origin = 'CUSTOMED.CUSTOMEDIO'
    end
    object qryCustoMedCODCUSTEIO: TFloatField
      FieldName = 'CODCUSTEIO'
    end
  end
  object udpCustoMed: TUpdateSQL
    ModifySQL.Strings = (
      'update CUSTOMED'
      'set'
      '  CODCUSTEIO = :CODCUSTEIO,'
      '  CODARTIGO = :CODARTIGO,'
      '  SALDOQTDEUC = :SALDOQTDEUC,'
      '  CUSTOMEDIO = :CUSTOMEDIO'
      'where'
      '  CODCUSTEIO = :OLD_CODCUSTEIO and'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO')
    InsertSQL.Strings = (
      'insert into CUSTOMED'
      '  (CODCUSTEIO, CODARTIGO, SALDOQTDEUC, CUSTOMEDIO)'
      'values'
      '  (:CODCUSTEIO, :CODARTIGO, :SALDOQTDEUC, :CUSTOMEDIO)')
    DeleteSQL.Strings = (
      'delete from CUSTOMED'
      'where'
      '  CODCUSTEIO = :OLD_CODCUSTEIO and'
      '  CODARTIGO = :OLD_CODARTIGO')
    Left = 256
    Top = 24
  end
  object qryProd: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT         '
      '          CODPRODUTO, '
      '          CODMEDCUSTO'
      'FROM'
      '        PRODUTO '
      'WHERE'
      '        (RTRIM(CODPRODUTO) = :pCODPRODUTO)')
    UpdateObject = updProd
    ValidateWithMask = True
    Left = 256
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODPRODUTO'
        ParamType = ptUnknown
      end>
    object qryProdCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Origin = '"CM.PRODUTO".CODPRODUTO'
      Size = 6
    end
    object qryProdCODMEDCUSTO: TStringField
      FieldName = 'CODMEDCUSTO'
      Origin = '"CM.PRODUTO".CODMEDCUSTO'
      Size = 4
    end
  end
  object updProd: TUpdateSQL
    ModifySQL.Strings = (
      'update PRODUTO'
      'set'
      '  CODPRODUTO = :CODPRODUTO,'
      '  CODMEDCUSTO = :CODMEDCUSTO'
      'where'
      '  RTRIM(CODPRODUTO) = :OLD_CODPRODUTO')
    InsertSQL.Strings = (
      'insert into PRODUTO'
      '  (CODPRODUTO, CODMEDCUSTO)'
      'values'
      '  (:CODPRODUTO, :CODMEDCUSTO)')
    DeleteSQL.Strings = (
      'delete from PRODUTO'
      'where'
      '  CODPRODUTO = :OLD_CODPRODUTO')
    Left = 312
    Top = 240
  end
end
