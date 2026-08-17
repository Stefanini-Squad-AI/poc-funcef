inherited FRMMOVFIARIO: TFRMMOVFIARIO
  Left = 37
  Top = 123
  HelpContext = 190009
  Caption = 'Movimento no Protocolo'
  ClientHeight = 515
  ClientWidth = 750
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 750
    Height = 288
    object Label1: TLabel
      Left = 13
      Top = 12
      Width = 144
      Height = 13
      Caption = 'Participante/Dependente'
    end
    object Label2: TLabel
      Left = 13
      Top = 58
      Width = 111
      Height = 13
      Caption = 'Grupo de Protocolo'
    end
    object Assunto: TLabel
      Left = 15
      Top = 174
      Width = 124
      Height = 13
      Caption = 'Descrição do assunto'
    end
    object Label3: TLabel
      Left = 488
      Top = 12
      Width = 97
      Height = 13
      Caption = 'Data de inclusão'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 112
      Width = 465
      Height = 50
    end
    object Label4: TLabel
      Left = 360
      Top = 118
      Width = 112
      Height = 13
      Caption = 'Exibição Expira em:'
    end
    object sbtnConsultaParticip: TSpeedButton
      Left = 458
      Top = 27
      Width = 23
      Height = 21
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbtnConsultaParticipClick
    end
    object dbdataInclusao: TCMDateTimePicker
      Left = 489
      Top = 27
      Width = 109
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAINCLUSAO'
      DataSource = ds
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
      TabOrder = 0
    end
    object MemoAssunto: TDBMemo
      Left = 15
      Top = 190
      Width = 585
      Height = 68
      DataField = 'DESCRICAO'
      DataSource = ds
      MaxLength = 2000
      TabOrder = 2
    end
    object edparticipante: TEdit
      Left = 14
      Top = 27
      Width = 445
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object dblkGrupo: TwwDBLookupCombo
      Left = 16
      Top = 74
      Width = 465
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'100'#9'Descrição'#9'F')
      DataField = 'IDGRUPO'
      DataSource = ds
      LookupTable = qryassunto
      LookupField = 'IDFIARASS'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object GrBXBloqueio: TGroupBox
      Left = 489
      Top = 52
      Width = 109
      Height = 79
      Caption = 'Situação'
      Enabled = False
      TabOrder = 4
      object SBtnLiberado: TSpeedButton
        Left = 13
        Top = 18
        Width = 81
        Height = 22
        GroupIndex = 1
        Down = True
        Caption = '&Liberado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SBtnLiberadoClick
      end
      object SBTnBloqueado: TSpeedButton
        Left = 14
        Top = 46
        Width = 81
        Height = 22
        GroupIndex = 1
        Caption = '&Bloqueado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SBTnBloqueadoClick
      end
    end
    object dbcExibeMsg: TDBCheckBox
      Left = 20
      Top = 136
      Width = 282
      Height = 17
      Caption = 'Exibe texto ao acessar dados do participante'
      DataField = 'FLGEXIBEMSG'
      DataSource = ds
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = dbcExibeMsgClick
    end
    object cmdtpDataExpira: TCMDateTimePicker
      Left = 361
      Top = 133
      Width = 109
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAEXPIRAMSG'
      DataSource = ds
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
      TabOrder = 6
    end
  end
  inherited Dock972: TDock97
    Width = 750
  end
  inherited Dock971: TDock97
    Top = 476
    Width = 750
  end
  object plnImporta: TPanel [3]
    Left = 0
    Top = 335
    Width = 750
    Height = 141
    Align = alBottom
    TabOrder = 3
    object GroupBox2: TGroupBox
      Left = 11
      Top = 2
      Width = 362
      Height = 114
      Caption = 'Importar Arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object LblImporta: TLabel
        Left = 14
        Top = 25
        Width = 108
        Height = 13
        Caption = 'Selecionar Arquivo'
      end
      object btnImporta: TToolbarButton97
        Left = 330
        Top = 39
        Width = 24
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = btnImportaClick
      end
      object Label22: TLabel
        Left = 14
        Top = 62
        Width = 127
        Height = 13
        Caption = 'Descrição do Arquivo:'
        Visible = False
      end
      object BBtnImporta: TSpeedButton
        Left = 299
        Top = 69
        Width = 55
        Height = 38
        Caption = 'Importar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BBtnImportaClick
      end
      object edtImporta: TEdit
        Left = 13
        Top = 41
        Width = 313
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object EdtDescricaoImportacao: TEdit
        Left = 13
        Top = 77
        Width = 281
        Height = 21
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 200
        ParentFont = False
        TabOrder = 1
      end
    end
    object GBExcluirImportacao: TGroupBox
      Left = 380
      Top = 2
      Width = 351
      Height = 134
      Caption = 'Excluir Importação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object btnExcluirArquivo: TSpeedButton
        Left = 293
        Top = 91
        Width = 46
        Height = 21
        Caption = 'Excluir'
        Enabled = False
        OnClick = btnExcluirArquivoClick
      end
      object Label5: TLabel
        Left = 14
        Top = 25
        Width = 108
        Height = 13
        Caption = 'Selecionar Arquivo'
      end
      object Btnexclusao: TToolbarButton97
        Left = 320
        Top = 39
        Width = 24
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = BtnexclusaoClick
      end
      object edtExclusao: TEdit
        Left = 13
        Top = 41
        Width = 298
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 304
    Top = 6
    TargetsData = (
      1
      5
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'Title'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 427
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update fiario'
      'set'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDMODULO = :IDMODULO,'
      '  IDRUBS = :IDRUBS,'
      '  DESCRICAO = :DESCRICAO,'
      '  DATAINCLUSAO = :DATAINCLUSAO,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDFIARIOA = :IDFIARIOA,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  DATAEXPIRAMSG = :DATAEXPIRAMSG,'
      '  FLGEXIBEMSG = :FLGEXIBEMSG'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDFIARIOA = :OLD_IDFIARIOA')
    InsertSQL.Strings = (
      'insert into fiario'
      
        '  (IDTITULAR, IDPESSOA, IDMODULO, IDRUBS, DESCRICAO, DATAINCLUSA' +
        'O,   '
      'IDGRUPO, IDFIARIOA, IDUSUARIO,DATAEXPIRAMSG,FLGEXIBEMSG)'
      'values'
      '  (:IDTITULAR, :IDPESSOA, :IDMODULO, :IDRUBS, :DESCRICAO, '
      ':DATAINCLUSAO, :IDGRUPO, :IDFIARIOA, '
      ':IDUSUARIO, :DATAEXPIRAMSG,:FLGEXIBEMSG)')
    DeleteSQL.Strings = (
      'delete from fiario'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDFIARIOA = :OLD_IDFIARIOA')
    Left = 467
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Protocolo'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICSHOW'
      'VWPARTICIPDEPEN.NOME'
      'FIARIO.DATAINCLUSAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Data de Inclusão')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN'
      'FIARIO'
      'FIARIOASSUNTO')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.MATRICSHOW'
      'VWPARTICIPDEPEN.IDTITULAR'
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.IDDEPENDENCIA'
      'VWPARTICIPDEPEN.IDDEPENDENCIA'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'FIARIO.IDTITULAR'
      'FIARIO.IDFIARIOA'
      'FIARIO.IDPESSOA'
      'FIARIO.IDUSUARIO'
      'FIARIO.IDMODULO'
      'FIARIO.IDRUBS'
      'FIARIO.DATAINCLUSAO'
      'FIARIO.IDGRUPO'
      'FIARIOASSUNTO.DESCRICAO'
      'FIARIO.IDFIARIOA')
    Filtro.Strings = (
      'FIARIO.IDGRUPO = FIARIOASSUNTO.IDFIARASS'
      'FIARIO.IDPESSOA = VWPARTICIPDEPEN.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '18')
    OperComparador.Strings = (
      '1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 560
    Top = 16
  end
  inherited ImlPadrao: TImageList
    Left = 345
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 508
    Top = 6
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select'
      'IDTITULAR,'
      'IDPESSOA,'
      'IDMODULO,'
      'IDRUBS,'
      'DESCRICAO,'
      'DATAINCLUSAO,'
      'IDGRUPO,'
      'IDFIARIOA,'
      'IDUSUARIO,'
      'DATAEXPIRAMSG,'
      'FLGEXIBEMSG'
      'from fiario'
      'where IDTITULAR = :IDTITULAR'
      '           and IDPESSOA = :IDPESSOA'
      '           and  IDGRUPO = :IDGRUPO'
      '           and  DATAINCLUSAO = :DATAINCLUSAO'
      '           and IDFIARIOA = :IDFIARIOA'
      ''
      '         '
      ' '
      ' ')
    Left = 386
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAINCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDFIARIOA'
        ParamType = ptInput
      end>
    object qryIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.FIARIO.IDTITULAR'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.FIARIO.IDPESSOA'
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.FIARIO.IDMODULO'
    end
    object qryIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.FIARIO.IDRUBS'
    end
    object qryDATAINCLUSAO: TDateTimeField
      FieldName = 'DATAINCLUSAO'
      Origin = 'BASEDADOS.FIARIO.DATAINCLUSAO'
    end
    object qryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.FIARIO.IDGRUPO'
    end
    object qryIDFIARIOA: TFloatField
      FieldName = 'IDFIARIOA'
      Origin = 'BASEDADOS.FIARIO.IDFIARIOA'
    end
    object qryIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.FIARIO.IDUSUARIO'
    end
    object qryDATAEXPIRAMSG: TDateTimeField
      FieldName = 'DATAEXPIRAMSG'
      Origin = 'BASEDADOS.FIARIO.DATAEXPIRAMSG'
    end
    object qryFLGEXIBEMSG: TFloatField
      FieldName = 'FLGEXIBEMSG'
      Origin = 'BASEDADOS.FIARIO.FLGEXIBEMSG'
    end
    object qryDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIO.DESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object qryassunto: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    DataSource = ds
    SQL.Strings = (
      'select  IDFIARASS, DESCRICAO'
      'from FIARIOASSUNTO'
      '')
    ValidateWithMask = True
    Left = 184
    Top = 127
    object qryassuntoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DESCRICAO'
      Size = 100
    end
    object qryassuntoIDFIARASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFIARASS'
      Origin = 'BASEDADOS.FIARIOASSUNTO.IDFIARASS'
      Visible = False
    end
  end
  object DataSource1: TDataSource
    DataSet = qryassunto
    Left = 224
    Top = 119
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante e/ou Dependente'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICSHOW'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Num. Documento')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.MATRICSHOW'
      'VWPARTICIPDEPEN.IDTITULAR'
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.IDDEPENDENCIA'
      'VWPARTICIPDEPEN.NUMDOCUMENTO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 248
    Top = 24
  end
  object qryParamCentralAp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  FLGCTRLPROTOCOLO '
      'FROM PARAMCENTRALAP')
    ValidateWithMask = True
    Left = 392
    Top = 95
    object qryParamCentralApFLGCTRLPROTOCOLO: TFloatField
      FieldName = 'FLGCTRLPROTOCOLO'
    end
  end
  object qryGrupoUsu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    IDGRUPO,'
      '    IDUSUARIO'
      'FROM GRUPOUSU'
      'WHERE'
      '  IDUSUARIO = :IDUSUARIO'
      '')
    ValidateWithMask = True
    Left = 144
    Top = 71
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end>
    object qryGrupoUsuIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.GRUPOUSU.IDGRUPO'
    end
    object qryGrupoUsuIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.GRUPOUSU.IDUSUARIO'
    end
  end
  object qryBloqueio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA,'
      '  FLGBLOQUEIO'
      'FROM  PESSOAFISICA'
      'WHERE IDPESSOA = :IDPESSOA')
    UpdateObject = UpdBloqueio
    ValidateWithMask = True
    Left = 344
    Top = 151
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryBloqueioFLGBLOQUEIO: TFloatField
      FieldName = 'FLGBLOQUEIO'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGBLOQUEIO'
    end
    object qryBloqueioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOAFISICA.IDPESSOA'
    end
  end
  object UpdBloqueio: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  FLGBLOQUEIO = :FLGBLOQUEIO'
      'where'
      '  IDPESSOA = :IDPESSOA')
    Left = 408
    Top = 159
  end
  object qryGrupoUsuCorr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    IDGRUPO,'
      '    IDUSUARIO'
      'FROM GRUPOUSU'
      'WHERE'
      '  IDUSUARIO = :IDUSUARIO'
      '')
    ValidateWithMask = True
    Left = 272
    Top = 71
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end>
    object qryGrupoUsuCorrIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.GRUPOUSU.IDGRUPO'
    end
    object qryGrupoUsuCorrIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.GRUPOUSU.IDUSUARIO'
    end
  end
  object QryImpAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 613
    Top = 275
  end
  object QryImportacaoArquivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 642
    Top = 275
  end
  object OpenDialog1: TOpenDialog
    Left = 675
    Top = 275
  end
  object QryExcluirArquivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' select fi.trguserinclusao as descarquivo,'
      '        fi.idfiarioa,'
      '        fi.idusuario,'
      
        '        TO_CHAR(TRUNC(fi.datainclusao),'#39'DD/MM/YY'#39') as datainclus' +
        'ao,'
      '        fi.descricao,'
      '        us.nomeusuario'
      
        '   from cm.fiario fi join cm.usuariosistema us on fi.idusuario =' +
        ' us.idusuario'
      '  where fi.datainclusao >= to_date(to_char(sysdate - 10,'
      '        '#39'DD/MM/YYYY'#39'),'
      '        '#39'DD/MM/YYYY'#39')'
      '  order by fi.datainclusao,fi.descricao')
    ValidateWithMask = True
    Left = 612
    Top = 235
    object QryExcluirArquivoidfiarioa: TFloatField
      FieldName = 'idfiarioa'
    end
    object QryExcluirArquivoidusuario: TFloatField
      FieldName = 'idusuario'
    end
    object QryExcluirArquivonomeusuario: TStringField
      FieldName = 'nomeusuario'
    end
    object QryExcluirArquivodescricao: TMemoField
      FieldName = 'descricao'
      BlobType = ftMemo
    end
    object QryExcluirArquivodatainclusao: TStringField
      FieldName = 'datainclusao'
    end
    object QryExcluirArquivodescarquivo: TStringField
      FieldName = 'descarquivo'
    end
  end
  object DscExcluirArquivo: TwwDataSource
    DataSet = QryExcluirArquivo
    Left = 652
    Top = 235
  end
end
