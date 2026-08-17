inherited FrmAtualizaMov: TFrmAtualizaMov
  Left = 137
  Top = 96
  Caption = 'Atualização de Movimentos '
  ClientHeight = 318
  ClientWidth = 525
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 525
    Height = 279
    object Label2: TLabel
      Left = 19
      Top = 105
      Width = 66
      Height = 13
      Caption = 'Data Inicial'
    end
    object LbArtigo: TLabel
      Left = 172
      Top = 105
      Width = 34
      Height = 13
      Caption = 'Artigo'
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 515
      Height = 89
      Align = alTop
      BevelInner = bvRaised
      BevelWidth = 2
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
        Width = 507
        Height = 81
        Align = alClient
        Alignment = taCenter
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Esta Rotina irá atualizar os movimentos dos produtos'
          'a partir da data indicada.'
          'Atenção ! Essa rotina só deve ser rodada em ultima instância, '
          'com supervisão da CM SOLUÇÕES.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object edDataI: TCMDateTimePicker
      Left = 19
      Top = 119
      Width = 142
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      ShowButton = True
      TabOrder = 1
      OnExit = edDataIExit
    end
    object dblcArt: TCMDBLookupCombo
      Tag = 5
      Left = 171
      Top = 119
      Width = 334
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCPROD'#9'40'#9'Descrição'
        'CODARTIGO'#9'14'#9'Código')
      LookupTable = qryArt
      LookupField = 'CODARTIGO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object plnAni: TPanel
      Left = 18
      Top = 151
      Width = 488
      Height = 98
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      Visible = False
      object Label1: TLabel
        Left = 144
        Top = 8
        Width = 190
        Height = 16
        Caption = 'Atualizando os Movimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Ani: TAnimate
        Left = 104
        Top = 29
        Width = 272
        Height = 60
        Active = False
        CommonAVI = aviCopyFiles
        StopFrame = 34
      end
    end
  end
  inherited Dock971: TDock97
    Top = 279
    Width = 525
    inherited tb97Fundo: TToolbar97
      Left = 278
      DockPos = 278
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
    Left = 753
    Top = 444
  end
  object qryArt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        DISTINCT '
      '         A.CODARTIGO,'
      '         P.DESCPROD'
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
    Left = 24
    Top = 266
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
  end
  object qryMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDMOV,'
      '      CODTIPOMOV,'
      '      IDEMPRESA,'
      '      CODARTIGO,'
      '      CODCENTROCUSTO,'
      '      CODALMOXARIFADO,'
      '      DATAMOV,'
      '      QTDEMOV,'
      '      VALORMOV,'
      '      DATALANCMOV,'
      '      CUSTOMEDIOMOV,'
      '      SALDOQTDEMOV,'
      '      IDPESSOA,'
      '      NUMDOCUMENTO,'
      '      CODALMOXTRANSF,'
      '      PLNCODIGO,'
      '      IDMOVENTRADA'
      'FROM'
      '    MOVIMENT'
      'WHERE'
      '   ( 1=2)')
    UpdateObject = updMov
    ValidateWithMask = True
    Left = 69
    Top = 266
    object qryMovIDMOV: TFloatField
      FieldName = 'IDMOV'
    end
    object qryMovCODTIPOMOV: TStringField
      FieldName = 'CODTIPOMOV'
      Size = 1
    end
    object qryMovIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryMovCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryMovCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryMovCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
    end
    object qryMovDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
    end
    object qryMovQTDEMOV: TFloatField
      FieldName = 'QTDEMOV'
    end
    object qryMovVALORMOV: TFloatField
      FieldName = 'VALORMOV'
    end
    object qryMovDATALANCMOV: TDateTimeField
      FieldName = 'DATALANCMOV'
    end
    object qryMovCUSTOMEDIOMOV: TFloatField
      FieldName = 'CUSTOMEDIOMOV'
    end
    object qryMovSALDOQTDEMOV: TFloatField
      FieldName = 'SALDOQTDEMOV'
    end
    object qryMovIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMovNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 15
    end
    object qryMovCODALMOXTRANSF: TFloatField
      FieldName = 'CODALMOXTRANSF'
    end
    object qryMovPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryMovIDMOVENTRADA: TFloatField
      FieldName = 'IDMOVENTRADA'
    end
  end
  object updMov: TUpdateSQL
    ModifySQL.Strings = (
      'update MOVIMENT'
      'set'
      '  VALORMOV = :VALORMOV,'
      '  CUSTOMEDIOMOV = :CUSTOMEDIOMOV'
      'where'
      '  IDMOV = :OLD_IDMOV')
    InsertSQL.Strings = (
      'insert into MOVIMENT'
      '  (VALORMOV, CUSTOMEDIOMOV)'
      'values'
      '  (:VALORMOV, :CUSTOMEDIOMOV)')
    DeleteSQL.Strings = (
      'delete from MOVIMENT'
      'where'
      '  IDMOV = :OLD_IDMOV')
    Left = 109
    Top = 267
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 168
    Top = 267
  end
  object qryUnCusteio: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 230
    Top = 267
  end
  object qryAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALMOXARIFADO '
      'FROM ALMOX'
      'WHERE (IDPESSOA = :pIDPESSOA)')
    ValidateWithMask = True
    Left = 40
    Top = 202
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
