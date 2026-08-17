inherited FrmAlteraCustoMed: TFrmAlteraCustoMed
  Left = 135
  Top = 137
  Caption = 'Alteração de Custo Médio'
  ClientHeight = 307
  ClientWidth = 485
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 485
    Height = 268
    object Label1: TLabel
      Left = 16
      Top = 136
      Width = 112
      Height = 13
      Caption = 'Unidade de Custeio'
    end
    object lbALmox: TLabel
      Left = 16
      Top = 176
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object Label8: TLabel
      Left = 352
      Top = 136
      Width = 100
      Height = 13
      Caption = 'Nº da Requisição'
    end
    object Label9: TLabel
      Left = 352
      Top = 176
      Width = 28
      Height = 13
      Caption = 'Data'
    end
    object Label10: TLabel
      Left = 16
      Top = 216
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object edUnCusteio: TEdit
      Left = 16
      Top = 152
      Width = 321
      Height = 21
      Color = clSilver
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = 'edUnCusteio'
    end
    object edAlmox: TEdit
      Left = 16
      Top = 192
      Width = 321
      Height = 21
      Color = clSilver
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = 'edAlmox'
    end
    object GrpArt: TGroupBox
      Left = 13
      Top = 8
      Width = 459
      Height = 120
      Caption = ' Artigo '
      TabOrder = 1
      TabStop = True
      object Label2: TLabel
        Left = 12
        Top = 20
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 117
        Top = 20
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label4: TLabel
        Left = 12
        Top = 69
        Width = 31
        Height = 13
        Caption = 'Unid.'
      end
      object Label5: TLabel
        Left = 67
        Top = 69
        Width = 71
        Height = 13
        Caption = 'Custo Médio'
      end
      object Label6: TLabel
        Left = 197
        Top = 69
        Width = 103
        Height = 13
        Caption = 'Saldo Un. Custeio'
      end
      object Label7: TLabel
        Left = 325
        Top = 69
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object EdArtigo: TDBEdit
        Left = 12
        Top = 35
        Width = 100
        Height = 21
        Color = clSilver
        DataField = 'CODARTIGO'
        DataSource = ds
        Enabled = False
        TabOrder = 0
      end
      object edDesc: TDBEdit
        Left = 117
        Top = 35
        Width = 304
        Height = 21
        Color = clSilver
        DataField = 'DESCRICAO'
        DataSource = ds
        Enabled = False
        TabOrder = 1
      end
      object edUnid: TDBEdit
        Left = 12
        Top = 84
        Width = 46
        Height = 21
        Color = clSilver
        DataField = 'CODMEDCUSTO'
        DataSource = ds
        Enabled = False
        TabOrder = 2
      end
      object edCustoMed: TDBRealEdit
        Left = 67
        Top = 84
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = clWhite
        Lines.Strings = (
          '    0,0000')
        TabOrder = 3
        WordWrap = False
        OnEnter = edCustoMedEnter
        OnExit = edCustoMedExit
        IntDigits = 10
        DecDigits = 4
        NumberFormat = fNumber
        Signal = False
        DataField = 'CUSTOMEDIO'
        DataSource = ds
      end
      object edSaldoUC: TDBRealEdit
        Left = 197
        Top = 84
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        Enabled = False
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'SALDOQTDEUC'
        DataSource = ds
      end
      object edValor: TDBRealEdit
        Left = 325
        Top = 84
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 14286847
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALOR'
        DataSource = ds
      end
    end
    object btnProcurar: TBitBtn
      Left = 435
      Top = 43
      Width = 26
      Height = 22
      Hint = 'Procurar Produto'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnProcurarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
        333337333333373F333307F8F8F8F70333337F333333337F333307F8F8F8F703
        33337F333333337F333307F8F8F8F703333373F3333333733333778F8F8F8773
        333337F3333337F333333078F8F870333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
    end
    object edNumReq: TRealEdit
      Left = 352
      Top = 152
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
    end
    object edData: TCMDateTimePicker
      Left = 352
      Top = 192
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = clSilver
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
      Enabled = False
      ShowButton = True
      TabOrder = 3
    end
    object dblcAtiv: TwwDBLookupCombo
      Left = 16
      Top = 232
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'Descrição'
        'UNIDNEGOC'#9'10'#9'Código')
      DataField = 'UNIDNEGOC'
      LookupTable = qryUnidNegoc
      LookupField = 'UNIDNEGOC'
      Options = [loTitles]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 268
    Width = 485
    inherited tb97Fundo: TToolbar97
      Left = 239
      DockPos = 239
      inherited sep1: TToolbarSep97
        Left = 160
      end
      inherited bbtnSair: TBitBtn
        Left = 80
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 162
        TabOrder = 2
      end
      object BtnAltCM: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Alterar'
        TabOrder = 0
        OnClick = BtnAltCMClick
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
    Left = 603
    Top = 3
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    C.CODCUSTEIO, '
      '    C.CODARTIGO,  '
      '    C.CUSTOMEDIO,'
      '    C.SALDOQTDEUC,'
      '    P.CODMEDCUSTO,'
      '    (C.CUSTOMEDIO * C.SALDOQTDEUC ) VALOR,'
      
        '    (P.DESCPROD || '#39' '#39' || A.CODCOR || '#39' '#39' || A.CODTAMANHO ) AS D' +
        'ESCRICAO'
      'FROM '
      '    CUSTOMED C,'
      '    ARTIGO A,'
      '    PRODUTO P'
      'WHERE'
      '           ( C.CODCUSTEIO = :pCODCUSTEIO )'
      '  AND ( RTRIM(C.CODARTIGO) = :pCODART)'
      '  AND ( C.CODARTIGO = A.CODARTIGO)'
      '  AND ( A.CODPRODUTO = P.CODPRODUTO)')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 17
    Top = 267
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODCUSTEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODART'
        ParamType = ptUnknown
      end>
    object qryCODCUSTEIO: TFloatField
      FieldName = 'CODCUSTEIO'
      Origin = 'CUSTOMED.CODCUSTEIO'
    end
    object qryCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'CUSTOMED.CODARTIGO'
      Size = 14
    end
    object qryCUSTOMEDIO: TFloatField
      FieldName = 'CUSTOMEDIO'
      Origin = 'CUSTOMED.CUSTOMEDIO'
    end
    object qrySALDOQTDEUC: TFloatField
      FieldName = 'SALDOQTDEUC'
      Origin = 'CUSTOMED.SALDOQTDEUC'
    end
    object qryVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'CUSTOMED.CUSTOMEDIO'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"CM.PRODUTO".DESCPROD'
      Size = 50
    end
    object qryCODMEDCUSTO: TStringField
      FieldName = 'CODMEDCUSTO'
      Origin = '"CM.PRODUTO".CODMEDCUSTO'
      Size = 4
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 51
    Top = 267
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ARTIGO.CODARTIGO'
      'PRODUTO.DESCPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Artigo'
      'Descrição do Artigo'
      'Grupo de Produtos')
    Tabelas.Strings = (
      'ARTIGO'
      'PRODUTO'
      'GRUPPROD'
      'CUSTOMED')
    CamposChave.Strings = (
      'ARTIGO.CODARTIGO')
    Filtro.Strings = (
      'ARTIGO.FLGATIVO = '#39'S'#39
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO'
      'PRODUTO.CODGRUPOPROD = GRUPPROD.CODGRUPOPROD'
      'ARTIGO.CODARTIGO = CUSTOMED.CODARTIGO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '14'
      '40'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 179
    Top = 246
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CUSTOMED'
      'set'
      '  CODCUSTEIO = :CODCUSTEIO,'
      '  CODARTIGO = :CODARTIGO,'
      '  CUSTOMEDIO = :CUSTOMEDIO,'
      '  SALDOQTDEUC = :SALDOQTDEUC'
      'where'
      '  CODCUSTEIO = :OLD_CODCUSTEIO and'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO')
    InsertSQL.Strings = (
      'insert into CUSTOMED'
      '  (CODCUSTEIO, CODARTIGO, CUSTOMEDIO, SALDOQTDEUC)'
      'values'
      '  (:CODCUSTEIO, :CODARTIGO, :CUSTOMEDIO, :SALDOQTDEUC)')
    DeleteSQL.Strings = (
      'delete from CUSTOMED'
      'where'
      '  CODCUSTEIO = :OLD_CODCUSTEIO and'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO')
    Left = 84
    Top = 266
  end
  object qryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     UNIDNEGOC,'
      '     NOME'
      'FROM'
      '     UNIDNEGOCIO'
      'WHERE'
      '     (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 366
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
