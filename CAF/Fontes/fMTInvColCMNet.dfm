inherited frmMTInvColCMNet: TfrmMTInvColCMNet
  Left = 782
  Top = 451
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Coletor de Dados CMNet - Pocket PC'
  ClientHeight = 332
  ClientWidth = 465
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 465
    Height = 293
    object pnlStatus: TPanel
      Left = 5
      Top = 243
      Width = 452
      Height = 47
      TabOrder = 0
      object lblStatus: TLabel
        Left = 8
        Top = 4
        Width = 44
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pnlprgBar: TPanel
        Left = 8
        Top = 18
        Width = 433
        Height = 17
        BevelOuter = bvLowered
        Caption = 'pnlprgBar'
        TabOrder = 0
        object prgBar: TGauge
          Left = 1
          Top = 1
          Width = 431
          Height = 15
          Align = alClient
          BackColor = clSilver
          BorderStyle = bsNone
          Color = clGray
          ForeColor = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Progress = 0
        end
      end
    end
    object pnlOperacao: TPanel
      Left = 5
      Top = 3
      Width = 670
      Height = 47
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object rdgpOper: TRadioGroup
        Left = 62
        Top = 9
        Width = 337
        Height = 39
        Caption = 'Operação'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Geração'
          'Recepção'
          'RFID')
        TabOrder = 0
        OnExit = rdgpOperExit
      end
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 296
      Width = 1001
      Height = 201
      DataSource = ds
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
    end
    object grbArquivos: TGroupBox
      Left = 6
      Top = 51
      Width = 451
      Height = 191
      Caption = 'Arquivos'
      TabOrder = 3
      object lblBem: TLabel
        Left = 472
        Top = 17
        Width = 29
        Height = 13
        Caption = 'Bens'
        Enabled = False
        Visible = False
      end
      object lblLocal: TLabel
        Left = 558
        Top = 18
        Width = 32
        Height = 13
        Caption = 'Local'
        Enabled = False
        Visible = False
      end
      object sbtnBem: TSpeedButton
        Left = 524
        Top = 13
        Width = 24
        Height = 21
        Hint = 'Botão para selecionar o arquivo de bens'
        Enabled = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = sbtnBemClick
      end
      object sbtnLocal: TSpeedButton
        Left = 613
        Top = 14
        Width = 24
        Height = 21
        Hint = 'Botão para selecionar o arquivo de locais'
        Enabled = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = sbtnLocalClick
      end
      object Label1: TLabel
        Left = 10
        Top = 22
        Width = 30
        Height = 13
        Caption = 'RFID'
      end
      object sbtnLocalRFID: TSpeedButton
        Left = 415
        Top = 18
        Width = 24
        Height = 21
        Hint = 'Botão para selecionar o arquivo de locais'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnLocalRFIDClick
      end
      object edtArqBem: TEdit
        Left = 493
        Top = 13
        Width = 30
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        Visible = False
      end
      object edtLocal: TEdit
        Left = 580
        Top = 14
        Width = 30
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 1
        Visible = False
      end
      object btnIncluir: TBitBtn
        Left = 480
        Top = 37
        Width = 32
        Height = 24
        Hint = 'Incluir Arquivo'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Visible = False
        OnClick = btnIncluirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        NumGlyphs = 2
      end
      object btnxcluiArquivo: TBitBtn
        Left = 515
        Top = 37
        Width = 32
        Height = 24
        Hint = 'Exluir Arquivo'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
        OnClick = btnxcluiArquivoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
          3333333333777F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
          3333333777737777F333333099999990333333373F3333373333333309999903
          333333337F33337F33333333099999033333333373F333733333333330999033
          3333333337F337F3333333333099903333333333373F37333333333333090333
          33333333337F7F33333333333309033333333333337373333333333333303333
          333333333337F333333333333330333333333333333733333333}
        NumGlyphs = 2
      end
      object chbArqBens: TListBox
        Left = 480
        Top = 62
        Width = 67
        Height = 30
        Hint = 'Arquivos de bens selecionados para o inventário'
        Enabled = False
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Visible = False
      end
      object chbArqLocais: TListBox
        Left = 569
        Top = 62
        Width = 67
        Height = 30
        Hint = 'Arquivos de locais selecionados para o inventário'
        Enabled = False
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Visible = False
      end
      object btnExcluirArqLocais: TBitBtn
        Left = 605
        Top = 36
        Width = 32
        Height = 24
        Hint = 'Exluir Arquivo'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        Visible = False
        OnClick = btnExcluirArqLocaisClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
          3333333333777F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
          3333333777737777F333333099999990333333373F3333373333333309999903
          333333337F33337F33333333099999033333333373F333733333333330999033
          3333333337F337F3333333333099903333333333373F37333333333333090333
          33333333337F7F33333333333309033333333333337373333333333333303333
          333333333337F333333333333330333333333333333733333333}
        NumGlyphs = 2
      end
      object btnIncluirArqLocais: TBitBtn
        Left = 571
        Top = 36
        Width = 32
        Height = 24
        Hint = 'Incluir Arquivo'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Visible = False
        OnClick = btnIncluirArqLocaisClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        NumGlyphs = 2
      end
      object chbArqLocaisRFID: TListBox
        Left = 10
        Top = 67
        Width = 431
        Height = 119
        Hint = 'Arquivos de locais selecionados para o inventário'
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
      end
      object EdtLocalRFID: TEdit
        Left = 42
        Top = 18
        Width = 368
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object btnIncluirArqLocaisRFID: TBitBtn
        Left = 193
        Top = 42
        Width = 32
        Height = 24
        Hint = 'Incluir Arquivo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = btnIncluirArqLocaisRFIDClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        NumGlyphs = 2
      end
      object btnExcluirArqLocaisRFID: TBitBtn
        Left = 227
        Top = 42
        Width = 32
        Height = 24
        Hint = 'Exluir Arquivo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = btnExcluirArqLocaisRFIDClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
          3333333333777F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
          3333333777737777F333333099999990333333373F3333373333333309999903
          333333337F33337F33333333099999033333333373F333733333333330999033
          3333333337F337F3333333333099903333333333373F37333333333333090333
          33333333337F7F33333333333309033333333333337373333333333333303333
          333333333337F333333333333330333333333333333733333333}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 293
    Width = 465
    inherited tb97Fundo: TToolbar97
      Left = 224
      DockPos = 224
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 55
      DockPos = 55
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Executar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 160
      Top = 40
      Width = 185
      Height = 105
      Caption = 'GroupBox1'
      TabOrder = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 674
    Top = 423
    TargetsData = (
      1
      3
      (
        '*'
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object tblBens: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FileName = 'C:\ProjetosCM7\CAF\Extras\Coletor CMNET\Bens.csv'
    Schema.Strings = (
      'IDBEM             '
      'PLACA             '
      'NOME              '
      'IDLOCALIZACAOATUAL'
      'STATUS            '
      'SITFISICA         '
      'IDLOCALIZACAOLIDA '
      'DTALEITURA        ')
    Delimiter = ','
    FirstLineAsSchema = False
    Left = 128
    Top = 16
    object tblBensIDBEM: TStringField
      DisplayWidth = 16
      FieldName = 'IDBEM'
      Size = 16
    end
    object tblBensPLACA: TStringField
      DisplayWidth = 16
      FieldName = 'PLACA'
      Size = 16
    end
    object tblBensNOME: TStringField
      DisplayWidth = 80
      FieldName = 'NOME'
      Size = 80
    end
    object tblBensIDLOCALIZACAOATUAL: TStringField
      DisplayWidth = 16
      FieldName = 'IDLOCALIZACAOATUAL'
      Size = 16
    end
    object tblBensSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'STATUS'
      Size = 1
    end
    object tblBensSITFISICA: TStringField
      DisplayWidth = 1
      FieldName = 'SITFISICA'
      Size = 1
    end
    object tblBensIDLOCALIZACAOLIDA: TStringField
      FieldName = 'IDLOCALIZACAOLIDA'
      Size = 16
    end
    object tblBensDTALEITURA: TStringField
      DisplayWidth = 10
      FieldName = 'DTALEITURA'
      Size = 10
    end
  end
  object tblLocais: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FileName = 'C:\ProjetosCM7\CAF\Extras\Coletor CMNET\Enviados\LOCAIS.csv'
    Schema.Strings = (
      'IDLOCALIZACAO'
      'NOME         '
      'IDINVENTARIOBENS '
      'DTAINICIOINV '
      'DTAFIMINV')
    Delimiter = ','
    FirstLineAsSchema = False
    Left = 64
    Top = 16
    object tblLocaisIDLOCALIZACAO: TStringField
      DisplayWidth = 16
      FieldName = 'IDLOCALIZACAO'
      Size = 16
    end
    object tblLocaisNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object tblLocaisIDINVENTARIOBENS: TStringField
      DisplayWidth = 16
      FieldName = 'IDINVENTARIOBENS'
      Size = 16
    end
    object tblLocaisDTAINICIOINV: TStringField
      DisplayWidth = 10
      FieldName = 'DTAINICIOINV'
      Size = 10
    end
    object tblLocaisDTAFIMINV: TStringField
      DisplayWidth = 10
      FieldName = 'DTAFIMINV'
      Size = 10
    end
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 8
  end
  object cdsLocais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 99
    Top = 202
  end
  object sqlLocais: TCMSqlParams
    SQL.Strings = (
      'SELECT IDLOCALIZACAO, NOME'
      'FROM LOCALIZACAO'
      'WHERE IDPESSOA = :IDPESSOA'
      '  AND INATIVO = 0  '
      '  and exists (select 1 '
      '                from itensinvbens ii '
      '               where ii.idinventariobens = :IDINVBENS'
      '                 and ii.iiblocalatual = idlocalizacao)'
      'ORDER BY IDLOCALIZACAO')
    ClientDataSet = cdsLocais
    Left = 101
    Top = 154
  end
  object cdsBens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 51
    Top = 196
  end
  object sqlBens: TCMSqlParams
    SQL.Strings = (
      'SELECT B.IDPESSOA,'
      '       B.IDBEM,'
      '       B.PLACA,'
      '       SUBSTR(B.DESBEM, 1, 100) AS DESCBEM,'
      '       C.IDLOCALIZACAO AS IDLOCALATUAL,'
      '       (0) AS STATUS,'
      '       (0) AS SITFISICA,'
      '       (0) AS IDLOCALLEITURA,'
      '       TO_DATE('#39'01/01/1980'#39','#39'DD/MM/YYYY'#39') AS DTALEITURA'
      'FROM BEM B,'
      '     CONJUNTO C'
      'WHERE B.IDPESSOA    = :IDPESSOA'
      '  AND B.BAIXATOTAL <> '#39'S'#39
      '  AND B.IDMODULO    = 7'
      '  AND B.IDCONJUNTO  = C.IDCONJUNTO'
      '  AND B.IDPESSOA    = C.IDPESSOA'
      'ORDER BY PLACA'
      ''
      ' ')
    ClientDataSet = cdsBens
    Left = 51
    Top = 152
  end
  object cdsBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 228
    Top = 24
  end
  object sqlBem: TCMSqlParams
    SQL.Strings = (
      'SELECT B.PLACA, B.IDCONJUNTO, C.IDLOCALIZACAO'
      'FROM BEM B, CONJUNTO C'
      'WHERE (B.IDBEM      = :IDBEM)'
      '  AND (B.IDPESSOA   = :IDPESSOA)'
      '  AND (B.IDMODULO   = 7)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      ' ')
    ClientDataSet = cdsBem
    Left = 196
    Top = 10
  end
  object tblUsuarios: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FileName = 'C:\ProjetosCM7\CAF\Extras\Coletor CMNET\Enviados\Usuarios.csv'
    Schema.Strings = (
      'IDUSUARIO'
      'NOMEUSUARIO'
      'SENHA')
    Delimiter = ','
    FirstLineAsSchema = False
    Left = 96
    Top = 16
    object tblUsuariosIDUSUARIO: TStringField
      FieldName = 'IDUSUARIO'
      Size = 16
    end
    object tblUsuariosNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
    end
    object tblUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
  end
  object cdsUsuarios: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 163
    Top = 198
  end
  object sqlUsuarios: TCMSqlParams
    SQL.Strings = (
      'SELECT U2.IDUSUARIO, U2.NOMEUSUARIO, U2.SENHA'
      'FROM USUXMODXEMP U1, USUARIOSISTEMA U2'
      'WHERE U1.IDEMPRESA = :IDPESSOA'
      '  AND U1.IDMODULO  = 7'
      '  AND U1.IDUSUARIO = U2.IDESPACESSO')
    ClientDataSet = cdsUsuarios
    Left = 160
    Top = 154
  end
  object ds: TDataSource
    AutoEdit = False
    Left = 464
    Top = 408
  end
  object cdsResInv: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 359
    Top = 200
  end
  object sqlResInv: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDINVENTARIOBENS, IDEMPRESA, IIBIDBEM, IIBPLACA, IIBFLGPL' +
        'ACA,'
      '       IIBLOCALNOVO, IIBCONJUNTONOVO, IIBFLGSITFISICA'
      'FROM ITENSINVBENS'
      'WHERE IDEMPRESA = -9'
      '  AND IDINVENTARIOBENS = -9'
      '')
    ClientDataSet = cdsResInv
    Left = 359
    Top = 146
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 200
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT C.IDCONJUNTO'
      'FROM CONJUNTO C'
      'WHERE (C.IDLOCALIZACAO      = :IDLOCALIZACAO)'
      '  ')
    ClientDataSet = cdsAux
    Left = 216
    Top = 154
  end
  object OpenDialog1: TOpenDialog
    Left = 392
    Top = 24
  end
  object tblLocaisRFID: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FileName = 'C:\ProjetosCM7\CAF\Extras\Coletor CMNET\Enviados\LOCAIS.csv'
    Schema.Strings = (
      'IDBEM'
      'PLACA'
      'IDRFID'
      'NOMEBEM        '
      'IDLOCALIZACAOLIDA '
      'IDLOCALIZACAO'
      'NOME              '
      'DTALEITURA    '
      'IDINVENTARIOBENS '
      'IDLOCALIZACAOATUAL')
    Delimiter = ';'
    FirstLineAsSchema = False
    Left = 32
    Top = 16
    object tblLocaisRFIDIDBEM: TStringField
      DisplayWidth = 16
      FieldName = 'IDBEM'
      Size = 16
    end
    object tblLocaisRFIDPLACA: TStringField
      DisplayWidth = 30
      FieldName = 'PLACA'
      Size = 30
    end
    object tblLocaisRFIDIDRFID: TStringField
      FieldName = 'IDRFID'
      Size = 16
    end
    object tblLocaisRFIDNOMEBEM: TStringField
      DisplayWidth = 80
      FieldName = 'NOMEBEM'
      Size = 80
    end
    object tblLocaisRFIDIDLOCALIZACAOLIDA: TStringField
      FieldName = 'IDLOCALIZACAOLIDA'
      Size = 16
    end
    object StringField1: TStringField
      DisplayWidth = 16
      FieldName = 'IDLOCALIZACAO'
      Size = 16
    end
    object StringField2: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object tblLocaisRFIDDTALEITURA: TStringField
      DisplayWidth = 10
      FieldName = 'DTALEITURA'
      Size = 10
    end
    object StringField3: TStringField
      DisplayWidth = 16
      FieldName = 'IDINVENTARIOBENS'
      Size = 16
    end
    object tblLocaisRFIDIDLOCALIZACAOATUAL: TStringField
      DisplayWidth = 16
      FieldName = 'IDLOCALIZACAOATUAL'
      Size = 16
    end
  end
  object ADOTblPlanilha: TADOTable
    TableDirect = True
    TableName = 'teste'
    Left = 589
    Top = 11
  end
end
