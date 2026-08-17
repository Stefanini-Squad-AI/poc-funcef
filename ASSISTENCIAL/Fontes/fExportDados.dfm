inherited frmExportDados: TfrmExportDados
  Left = 142
  Top = 57
  BorderStyle = bsSingle
  Caption = 'Exportação de Informações para Arquivo'
  ClientHeight = 462
  ClientWidth = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 484
    Height = 423
    TabOrder = 1
    object gbPatro: TGroupBox
      Left = 5
      Top = 198
      Width = 474
      Height = 220
      Align = alBottom
      Caption = 'Patrocinadoras'
      TabOrder = 0
      object Memo: TMemo
        Left = 2
        Top = 38
        Width = 470
        Height = 181
        Lines.Strings = (
          'Memo')
        ScrollBars = ssBoth
        TabOrder = 1
      end
      object chkPatro: TCheckListBox
        Left = 2
        Top = 38
        Width = 470
        Height = 181
        Columns = 2
        ItemHeight = 13
        TabOrder = 0
      end
      object Marca: TBitBtn
        Left = 3
        Top = 17
        Width = 21
        Height = 20
        Hint = 'Inverter Seleção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = MarcaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 5
      Width = 474
      Height = 62
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 13
        Top = 10
        Width = 124
        Height = 13
        Caption = 'Descrição do Lay-Out'
      end
      object dblkTipoLayout: TwwDBLookupCombo
        Left = 11
        Top = 24
        Width = 284
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'#9'F')
        LookupTable = qryTpLayout
        LookupField = 'IDLAYOUT'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkTipoLayoutCloseUp
      end
      object btnArquivo: TBitBtn
        Left = 315
        Top = 21
        Width = 86
        Height = 27
        Caption = '&Arquivo'
        TabOrder = 1
        OnClick = btnArquivoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 67
      Width = 474
      Height = 117
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object gbFiltros: TGroupBox
        Left = 0
        Top = 18
        Width = 474
        Height = 99
        Align = alTop
        Caption = 'Filtros'
        TabOrder = 0
        object LabelProduto: TLabel
          Left = 223
          Top = 17
          Width = 116
          Height = 13
          Caption = 'Produto Assistencial'
        end
        object LabelPlano: TLabel
          Left = 222
          Top = 56
          Width = 104
          Height = 13
          Caption = 'Plano Assistencial'
        end
        object LabelMesCob: TLabel
          Left = 11
          Top = 16
          Width = 100
          Height = 13
          Caption = 'Mês de Cobrança'
        end
        object dblkProduto: TwwDBLookupCombo
          Left = 222
          Top = 32
          Width = 200
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'35'#9'Produto'#9'F')
          LookupTable = qryProduto
          LookupField = 'IDPRODASS'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = dblkProdutoCloseUp
        end
        object dblkPlano: TwwDBLookupCombo
          Left = 221
          Top = 70
          Width = 200
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'40'#9'Plano'#9'F')
          LookupTable = qryPlano
          LookupField = 'IDPLANASS'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object dblkMesCob: TwwDBLookupCombo
          Left = 9
          Top = 31
          Width = 200
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MESCOBRANCA'#9'7'#9'Mês de Cobrança'#9'F')
          LookupTable = qryMesCob
          LookupField = 'MESCOBRANCA'
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
      object pnlInfArquivo: TPanel
        Left = 0
        Top = 0
        Width = 474
        Height = 18
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvNone
        Caption = '  Arquivo Destino:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 423
    Width = 484
    inherited tb97Fundo: TToolbar97
      Left = 191
      DockPos = 191
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 23
      DockPos = 23
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Exportar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  object btnSalvar: TBitBtn [2]
    Left = 27
    Top = 149
    Width = 141
    Height = 27
    Caption = '&Salvar Mensagens'
    Enabled = False
    TabOrder = 2
    OnClick = btnSalvarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    NumGlyphs = 2
  end
  object pnlProgresso: TPanel [3]
    Left = 85
    Top = 255
    Width = 313
    Height = 139
    BevelWidth = 2
    Caption = 'pnlProgresso'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    object lblPainel: TLabel
      Left = 15
      Top = 26
      Width = 187
      Height = 13
      Caption = 'Exportando Informações para o Aquivo '
    end
    object lContador: TLabel
      Left = 5
      Top = 117
      Width = 99
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LabelInf: TLabel
      Left = 15
      Top = 7
      Width = 187
      Height = 13
      Caption = 'Exportando Informações para o Aquivo '
    end
    object Animacao: TAnimate
      Left = 15
      Top = 45
      Width = 272
      Height = 60
      Active = False
      CommonAVI = aviCopyFiles
      StopFrame = 34
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 22
    Top = 283
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryCpLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'IDLAYOUT,IDCPLAYOUT,DATA,NOMECPO,'
      'POSINICIAL,POSFINAL,IDMODULO,TIPOREG,'
      
        'DECODE (FLGVALOR,'#39'0'#39','#39'Campo comum'#39','#39'1'#39','#39'Data'#39','#39'2'#39','#39'Número inteir' +
        'o'#39','
      
        '         '#39'3'#39','#39'Número com 2 casas Decimais'#39','#39'4'#39','#39'Número com 3 cas' +
        'as Decimais'#39','
      '         '#39'5'#39','#39'Número com 4 casas Decimais'#39','#39#39')  AS FLGVALOR'
      'FROM CPLAYOUT'
      'WHERE IDLAYOUT = :PIDLAYOUT'
      'ORDER BY IDLAYOUT,IDCPLAYOUT'
      ' ')
    ValidateWithMask = True
    Left = 226
    Top = 339
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLAYOUT'
        ParamType = ptUnknown
      end>
    object qryCpLayoutNOMECPO: TStringField
      DisplayLabel = 'Descrição do Campo'
      DisplayWidth = 20
      FieldName = 'NOMECPO'
    end
    object qryCpLayoutPOSINICIAL: TFloatField
      DisplayLabel = 'P. Inicial'
      DisplayWidth = 10
      FieldName = 'POSINICIAL'
    end
    object qryCpLayoutPOSFINAL: TFloatField
      DisplayLabel = 'P.Final'
      DisplayWidth = 10
      FieldName = 'POSFINAL'
    end
    object qryCpLayoutFLGVALOR: TStringField
      DisplayLabel = 'Tipo do Campo'
      DisplayWidth = 27
      FieldName = 'FLGVALOR'
      Size = 27
    end
    object qryCpLayoutIDLAYOUT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLAYOUT'
      Visible = False
    end
    object qryCpLayoutIDCPLAYOUT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCPLAYOUT'
      Visible = False
    end
    object qryCpLayoutDATA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATA'
      Visible = False
    end
    object qryCpLayoutIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryCpLayoutTIPOREG: TStringField
      DisplayWidth = 10
      FieldName = 'TIPOREG'
      Visible = False
      Size = 10
    end
  end
  object dsCpLayout: TwwDataSource
    DataSet = qryCpLayout
    Left = 297
    Top = 323
  end
  object dsTpLayout: TwwDataSource
    DataSet = qryTpLayout
    Left = 211
    Top = 283
  end
  object qryTpLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TPLAYOUT'
      'ORDER BY IDLAYOUT')
    ValidateWithMask = True
    Left = 140
    Top = 283
    object qryTpLayoutDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TPLAYOUT.DESCRICAO'
      Size = 30
    end
    object qryTpLayoutIDLAYOUT: TFloatField
      FieldName = 'IDLAYOUT'
      Origin = 'BASEDADOS.TPLAYOUT.IDLAYOUT'
      Visible = False
    end
    object qryTpLayoutTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.TPLAYOUT.TRGDTINCLUSAO'
      Visible = False
    end
    object qryTpLayoutTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.TPLAYOUT.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
  end
  object qryIns: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 216
    Top = 235
  end
  object qryLgLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      'LG.IDLGLAYOUT, LG.IDLAYOUT, LG.IDCPLAYOUT,'
      'LG.DESCASSOC'
      'FROM CPLAYOUT CP, LGLAYOUT LG'
      'WHERE '
      '(LG.IDLAYOUT=:PPIDLAYOUT)  AND'
      '(LG.IDCPLAYOUT = CP.IDCPLAYOUT)'
      'ORDER BY  LG.IDLGLAYOUT')
    ValidateWithMask = True
    Left = 86
    Top = 251
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPIDLAYOUT'
        ParamType = ptUnknown
      end>
    object qryLgLayoutDESCASSOC: TStringField
      DisplayLabel = 'Campos Associados ao Layout'
      DisplayWidth = 64
      FieldName = 'DESCASSOC'
      Size = 60
    end
    object qryLgLayoutIDLGLAYOUT: TFloatField
      FieldName = 'IDLGLAYOUT'
      Visible = False
    end
    object qryLgLayoutIDLAYOUT: TFloatField
      FieldName = 'IDLAYOUT'
      Visible = False
    end
    object qryLgLayoutIDCPLAYOUT: TFloatField
      FieldName = 'IDCPLAYOUT'
      Visible = False
    end
  end
  object dsLgLayout: TwwDataSource
    DataSet = qryLgLayout
    Left = 173
    Top = 235
  end
  object qryAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '             LG.IDLGLAYOUT,'
      '             LG.IDLAYOUT,'
      '             LG.IDCPLAYOUT,'
      '             LG.NOMEARQ,'
      '             LG.CAMPOARQ,'
      '             LG.TIPOARQ,'
      '             CP.TIPOREG,'
      '             CP.POSINICIAL,'
      '             CP.POSFINAL,'
      '             CP.FLGVALOR'
      ''
      '             FROM CPLAYOUT CP, LGLAYOUT LG'
      ''
      '             WHERE'
      '             (LG.IDLAYOUT=CP.IDLAYOUT) AND'
      '             (LG.IDCPLAYOUT=CP.IDCPLAYOUT)'
      ''
      '             ORDER BY CP.TIPOREG,CP.NOMECAMPO'
      ' ')
    ValidateWithMask = True
    Left = 269
    Top = 235
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PATRO.IDPESSOA AS IDPESSJUR,  PESSOA.NOME'
      'FROM PESSOA, PATRO'
      'WHERE PATRO.IDPESSOA = PESSOA.IDPESSOA'
      'ORDER BY PESSOA.NOME')
    ValidateWithMask = True
    Left = 293
    Top = 201
  end
  object qryMesCob: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT MESCOBRANCA '
      'FROM HSTCONTRIBASS'
      'ORDER BY MESCOBRANCA')
    ValidateWithMask = True
    Left = 349
    Top = 201
  end
  object qryProduto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPRODASS, NOME FROM PRODASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 405
    Top = 201
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS, NOME'
      'FROM PLANASS'
      'WHERE IDPRODASS = :PIDPRODASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 349
    Top = 284
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPRODASS'
        ParamType = ptInput
      end>
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'txt'
    Filter = '*.txt'
    InitialDir = 'C:\'
    Title = 'Criar arquivo destino como:'
    Left = 69
    Top = 308
  end
  object SaveDialogMens: TSaveDialog
    DefaultExt = 'txt'
    Filter = '*.txt'
    InitialDir = 'c:\'
    Left = 45
    Top = 229
  end
end
