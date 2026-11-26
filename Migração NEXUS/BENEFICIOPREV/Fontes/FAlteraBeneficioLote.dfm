inherited frmAlteraBeneficioLote: TfrmAlteraBeneficioLote
  Caption = 'Alteração de Valor do Benefício em Lote'
  ClientHeight = 342
  ClientWidth = 875
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 875
    Height = 303
    object gbxAcaoLote: TGroupBox
      Left = 1
      Top = 1
      Width = 873
      Height = 44
      Align = alTop
      Caption = 'Selecione o Arquivo'
      TabOrder = 0
      object edtArquivo: TEdit
        Left = 6
        Top = 13
        Width = 387
        Height = 21
        TabOrder = 0
      end
      object bbtnBuscaArquivo: TBitBtn
        Left = 396
        Top = 11
        Width = 25
        Height = 23
        TabOrder = 1
        OnClick = bbtnBuscaArquivoClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object btnValida: TBitBtn
        Left = 429
        Top = 13
        Width = 22
        Height = 21
        Hint = 'Valida arquivo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnValidaClick
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
    object pcGrid: TPageControl
      Left = 1
      Top = 45
      Width = 873
      Height = 257
      ActivePage = tbImportados
      Align = alClient
      TabOrder = 1
      object tbImportados: TTabSheet
        Caption = 'Arquivos Importados'
        object dbGridValorBenefImport: TwwDBGrid
          Left = 0
          Top = 37
          Width = 865
          Height = 192
          ControlType.Strings = (
            'Selecionar;CheckBox;S;N')
          Selected.Strings = (
            'Selecionar'#9'2'#9'Sel'
            'IDLOTEIMPORTA'#9'7'#9'N° do Lote'#9'F'
            'NOMEARQUIVO'#9'65'#9'Arquivo'#9'F'
            'DATAIMPORTA'#9'5'#9'Data Importação'#9'F'
            'QTDEITENS'#9'5'#9'Total Registos'#9'F'
            'QTDEIMPORTA'#9'8'#9'Total Importado'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsImportado
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDrawDataCell = dbGridValorBenefImportDrawDataCell
          OnDblClick = dbGridValorBenefImportDblClick
          IndicatorColor = icBlack
        end
        object Dock973: TDock97
          Left = 0
          Top = 0
          Width = 865
          Height = 37
          BoundLines = [blTop, blBottom, blLeft, blRight]
          LimitToOneRow = True
          object Toolbar972: TToolbar97
            Left = 0
            Top = 0
            Caption = 'Atalhos'
            CloseButton = False
            DefaultDock = Dock973
            DockableTo = [dpTop, dpBottom]
            DockPos = 0
            TabOrder = 0
            object ToolbarSep9711: TToolbarSep97
              Left = 0
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object ToolbarSep973: TToolbarSep97
              Left = 16
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object ToolbarSep974: TToolbarSep97
              Left = 8
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object btnSelTudo: TBitBtn
              Left = 24
              Top = 0
              Width = 148
              Height = 30
              Hint = 'Seleciona Todas as Rubricas'
              Caption = '   Selecionar Tudo'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnSelTudoClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object btnInverte: TBitBtn
              Left = 172
              Top = 0
              Width = 148
              Height = 31
              Hint = 'Inverte a Seleção das Rubricas'
              Caption = 'Desmarcar Tudo'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btnInverteClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
          end
        end
      end
      object tbResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object memResultado: TMemo
          Left = 0
          Top = 0
          Width = 865
          Height = 229
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 303
    Width = 875
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Importa'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Caption = '&Desfazer'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 459
    Top = 79
    TargetsData = (
      1
      4
      (
        'TMemo'
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
  object odAbreArq: TOpenDialog
    Left = 503
    Top = 8
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTEIMPORTA,'
      '        MATRICULA,'
      '        NUMEROPROCESSO,'
      '        VALORATUAL,'
      '        VALORTOTAL,'
      '        VALORSRB,'
      '        VLRBSTOTAL,'
      '        VLRFABTOTAL,'
      '        VLRBSATUAL,'
      '        VLRFABATUAL,'
      '        IDPESSOA,'
      '        IDTITULAR,'
      '        IDPLANOPREV,'
      '        IDPESSJUR,'
      '        SEQPROPOSTA,'
      '        VALORATUALANT,'
      '        VALORTOTALANT,'
      '        VALORSRBANT,'
      '        VLRBSTOTALANT,'
      '        VLRFABTOTALANT,'
      '        VLRBSATUALANT,'
      '        VLRFABATUALANT'
      '   FROM CM.HSTARQUIVOALTBENEFDET'
      '  WHERE 1 = 2')
    ControlType.Strings = (
      'FLGCOBRA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 454
    Top = 132
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 545
    Top = 133
  end
  object dsImportado: TwwDataSource
    AutoEdit = False
    DataSet = qryImportado
    Left = 340
    Top = 183
  end
  object qryImportado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '#39'N'#39' "SELECIONAR",IDLOTEIMPORTA,'
      '       NOMEARQUIVO,'
      '       DATAIMPORTA,'
      '       QTDEITENS,'
      '       QTDEIMPORTA,'
      '       HASHARQUIVO'
      ' FROM CM.HSTARQUIVOALTBENEF  '
      ' ORDER BY DATAIMPORTA DESC')
    UpdateObject = updImportado
    ControlType.Strings = (
      'SELECIONAR;CheckBox;S;N')
    ValidateWithMask = True
    Left = 402
    Top = 184
  end
  object qryMaster: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ControlType.Strings = (
      'FLGCOBRA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 318
    Top = 132
  end
  object updImportado: TUpdateSQL
    Left = 448
    Top = 184
  end
  object qryBenefBfciario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 545
    Top = 181
  end
  object qryImportadoDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ControlType.Strings = (
      'FLGCOBRA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 406
    Top = 236
  end
end
