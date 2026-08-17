inherited frmDesdobramentoBenef: TfrmDesdobramentoBenef
  Left = 331
  Top = 103
  HelpContext = 160082
  Caption = 'Desdobramento de Benefícios para Beneficiários'
  ClientHeight = 490
  ClientWidth = 927
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 927
    Height = 451
    object pnlConsulta: TPanel
      Left = 683
      Top = 1
      Width = 243
      Height = 449
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object memBeneficiario: TMemo
        Left = 0
        Top = 66
        Width = 243
        Height = 383
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Beneficiário : Fulano de Tal '
          ''
          'Data de Nascimento : 10/10/1950'
          'Data de Inscrição : '
          'Tempo de Serviço Anterior'
          'Tempo de Serviço Não Creditado'
          ''
          ''
          'Patrocinadora : CBS'
          'Plano : Plano CBS 1'
          ''
          'Situação na Patrocinadora : Ativo'
          '               na Fundação : Ativo'
          '               no Plano : Normal'
          '')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object memTitular: TMemo
        Left = 0
        Top = 66
        Width = 243
        Height = 383
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Antônio Basílio da Silva'
          ''
          'Data de Nascimento : 10/10/1950'
          'Data de Inscrição : '
          'Tempo de Serviço Anterior'
          'Tempo de Serviço Não Creditado'
          ''
          ''
          'Patrocinadora : CBS'
          'Plano : Plano CBS 1'
          ''
          'Situação na Patrocinadora : Ativo'
          '               na Fundação : Ativo'
          '               no Plano : Normal'
          ''
          'Última(s) Contribuição(ões) Paga(s) :')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object stxtTitulo: TStaticText
        Left = 0
        Top = 0
        Width = 243
        Height = 31
        Align = alTop
        Alignment = taCenter
        Caption = 'Beneficiários'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 0
        Top = 31
        Width = 243
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object sbtnTitular: TSpeedButton
          Left = 38
          Top = 2
          Width = 30
          Height = 30
          Hint = 'Exibir informações do Titular'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
            BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
            BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
            BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
            BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
            EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
            EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
            EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
            EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnTitularClick
        end
        object sbtnCadContaCorrente: TSpeedButton
          Left = 70
          Top = 2
          Width = 30
          Height = 30
          Hint = 'Cadastrar Conta Bancária do Recebedor'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
            FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
            FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
            007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
            7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
            99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnCadContaCorrenteClick
        end
        object sbtnDetBeneficiario: TSpeedButton
          Left = 5
          Top = 2
          Width = 30
          Height = 30
          Hint = 'Visualizar Detalhes do Beneficiario Selecionado'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888800008888888888888888888800008888888888888888888800008888
            88888888777777780000888888888880000000780000888888888840FBFBF078
            0000888888888480000000880000888888884888888888880000887777748888
            77777778000080000007777000000078000080FFFF044440FBFBF07800008000
            0008788000000088000088888884878888888888000088888888487877777778
            0000888888888480000000780000888888888840FBFBF0780000888888888880
            0000008800008888888888888888888800008888888888888888888800008888
            88888888888888880000}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnDetBeneficiarioClick
        end
      end
    end
    object pnlRevisao: TPanel
      Left = 1
      Top = 1
      Width = 682
      Height = 449
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pnlBeneficios: TPanel
        Left = 0
        Top = 146
        Width = 682
        Height = 303
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object dbgrdBeneficiarios: TwwDBGrid
          Left = 1
          Top = 42
          Width = 680
          Height = 260
          Selected.Strings = (
            'FLGPROCESSA'#9'7'#9'Processa'#9'F'
            'NOME'#9'30'#9'Beneficiário'#9'T'
            'DATAINICIOFUND'#9'10'#9'Início ~Fund.'#9'T'
            'DATAINICIOINSS'#9'10'#9'Início ~INSS'#9'T'
            'VALORATUAL'#9'10'#9'Valor (R$)'#9'T'
            'VALORTOTAL'#9'10'#9'Valor ~Total'#9'T'
            'VALORCOTAS'#9'11'#9'Valor ~(Cotas)'#9'T'
            'VLRCALCINSS'#9'10'#9'Valor Calc~INSS'#9'T'
            'VLRINFINSS'#9'10'#9'Valor Inf. ~INSS'#9'T'
            'DATAREQUERIMENTO'#9'10'#9'Requerim.'#9'T'
            'NUMPROCINSS'#9'9'#9'Nº Proc. ~INSS'#9'T')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsBeneficiarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 680
          Height = 41
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object sbtnInserir: TSpeedButton
            Left = 492
            Top = 6
            Width = 29
            Height = 30
            Hint = 'Inserir um novo beneficiário no processo'
            Glyph.Data = {
              06020000424D0602000000000000760000002800000028000000140000000100
              0400000000009001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333FFFFF333333333333330000033333333FFFFFFF88888F
              FFF333888888880AAA08883333888888888F3388883F38BFBFBFBF0AAA0FBF83
              38F33333FF8F338FFF8F38FBFBF0000AAA00008338F3333888833388888F38BF
              BFB0AAAAAAAAA08338F33338F3333333388F38FBFBF0AAAAAAAAA08338F33338
              F3333333388F38BFBFB0AAAAAAAAA08338F33338FFFF3333388F38FBFBF0000A
              AA00008338F33338888F3388888F38BFBFBFBF0AAA0FBF8338F33333338F338F
              338F38FBFBFBFB0AAA0BFB8338F33333338FFF8F338F38BFBFBFBF00000FBF83
              38F3333333888883338F38FBFBFBFBFBFBFBFB8338F3333333333333338F38BF
              BFBFBFBFBFBFBF8338F3333333333333338F38FBFBFBFBFBFBFBFB8338FFFFFF
              F3333333338F38888888BFBFBFBFBF83388888883FFFFFFFFF8338FBFBFB8888
              88888833383FFFFF888888888833338888883333333333333388888833333333
              3333333333333333333333333333333333333333333333333333333333333333
              33333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnInserirClick
          end
          object sbtnConcedeUm: TSpeedButton
            Left = 598
            Top = 6
            Width = 30
            Height = 30
            Hint = 'Conceder benefício '
            AllowAllUp = True
            GroupIndex = 1
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
              FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
              990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
              990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
              FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
              00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
              00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
              00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
              03FF33337FFF77777333333300000333333F3333777773333333}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            Visible = False
            OnClick = sbtnConcedeUmClick
          end
          object StaticText1: TStaticText
            Left = 203
            Top = 8
            Width = 131
            Height = 31
            Alignment = taCenter
            Caption = 'Beneficiários'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -24
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
        end
        object DBGrid1: TDBGrid
          Left = 8
          Top = 160
          Width = 1017
          Height = 297
          DataSource = DataSource1
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Visible = False
        end
      end
      object pnlProcesso: TPanel
        Left = 0
        Top = 0
        Width = 682
        Height = 146
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label12: TLabel
          Left = 8
          Top = 31
          Width = 90
          Height = 13
          Caption = 'Evento Gerador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 67
          Width = 90
          Height = 13
          Caption = 'Data do Evento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 140
          Top = 67
          Width = 97
          Height = 13
          Caption = 'Data do Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 9
          Top = 105
          Width = 136
          Height = 13
          Caption = 'Benefícios do Processo'
        end
        object bbtnProcurar: TBitBtn
          Left = 432
          Top = 42
          Width = 92
          Height = 37
          Hint = 'Procurar participante'
          Caption = '&Procurar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bbtnProcurarClick
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
        object stxtProcesso: TStaticText
          Left = 1
          Top = 1
          Width = 680
          Height = 31
          Align = alTop
          Alignment = taCenter
          Caption = 'Processo Nº '
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -24
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
        object dbedEvento: TwwDBEdit
          Left = 8
          Top = 46
          Width = 369
          Height = 21
          DataField = 'NOME'
          DataSource = dsProcesso
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedDtEvento: TwwDBEdit
          Left = 8
          Top = 80
          Width = 121
          Height = 21
          DataField = 'DTEVENTO'
          DataSource = dsProcesso
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedDtRegistro: TwwDBEdit
          Left = 140
          Top = 80
          Width = 121
          Height = 21
          DataField = 'DTREGISTRO'
          DataSource = dsProcesso
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblkpcmbBeneficio: TwwDBLookupCombo
          Left = 9
          Top = 120
          Width = 369
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'71'#9'Benefício')
          LookupTable = qryBeneficio
          LookupField = 'IDBENEFICIO'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblkpcmbBeneficioCloseUp
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 451
    Width = 927
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 14
    Top = 434
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryProcesso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.DTDIREITO,       P.DTEVENTO,        P.DTREGISTRO,'
      '       P.IDEVENTOGERADOR, P.IDSITPROCESSO,   P.NUMEROPROCESSO,'
      '       E.NOME'
      'FROM   PROCESSOBENEF P, EVENTOGERADOR E'
      'WHERE  P.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    P.IDEVENTOGERADOR = E.IDEVENTOGERADOR'
      ' ')
    ValidateWithMask = True
    Left = 664
    Top = 65526
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = 998
      end>
  end
  object dsProcesso: TwwDataSource
    DataSet = qryProcesso
    Left = 595
    Top = 65526
  end
  object qryBeneficio: TwwQuery
    AfterScroll = qryBeneficioAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  B.IDBENEFICIO, B.NOME,  B.NUMORDEMEVENTO, B.FLGPECULIO,'
      '  B.FLGRESGATE,'
      '  BP.IDREGRABENEFICIA, BP.FLGOBRIGANPROC,   BP.IDRGVALORTOTAL,'
      '  BP.IDREGRACALCULO,   BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGTO,'
      '  BP.FLGCALCTODOMES,   BP.IDREGRAFIM,'
      '  BF.CODPORTFORMA,     BF.FLGPROVISORIO,    BP.FLGREFERENCIA'
      'FROM'
      '  BENEFICIO B, BENEFBFCIARIO BF, BENEFPLANPREV BP'
      'WHERE'
      '       BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    BF.IDBENEFICIO    = :IDBENEFICIO'
      'AND    BF.IDBENEFICIO    = B.IDBENEFICIO'
      'AND    BF.IDBENEFICIO    = BP.IDBENEFICIO'
      'AND    BF.IDPLANOPREV    = BP.IDPLANOPREV'
      
        'AND    ((BP.FLGREFERENCIA = 0) OR ((BP.FLGREFERENCIA = 1) AND (B' +
        'P.FLGPAGAINSS = 1)) ) '
      'ORDER BY B.NUMORDEMEVENTO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 453
    Top = 65526
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object dsBeneficio: TwwDataSource
    DataSet = qryBeneficio
    Left = 398
    Top = 46
  end
  object qryBeneficiarios: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DECODE(BF.IDSITBENEFICIO, 1, 1, 0) AS FLGPROCESSA,'
      
        '       BF.IDPESSOA,        BF.IDTITULAR,      BF.IDPLANOPREV, BF' +
        '.IDPLANOORIGEM,'
      
        '       BF.IDPESSJUR,  BF.IDBENEFICIO,     BF.NUMEROPROCESSO, BF.' +
        'NUMPROCINSS,'
      '       BF.VALORATUAL, BF.VALORCALCULADO,  BF.VALORCOTAS,'
      '       BF.VALORTOTAL, BF.VLRCALCINSS,     BF.VLRINFINSS,'
      
        '       BF.DATAFINAL,  BF.DATAINICIO,      BF.DATAINICIOFUND, BF.' +
        'DATAINICIOINSS,'
      
        '       BF.DATAREQUERIMENTO,               BF.IDSITBENEFICIO, BF.' +
        'IDTPPAGTOBENEFIC,'
      '       BF.DATACONCESSAO,                  BF.DIBBENEFANT,'
      '       BF.CODPORTFORMA,   BF.SEQPROPOSTA, BT.IDRESPONSAVEL,'
      
        '       PF.DATANASC,       PF.SEXO,        PF.NUMDEPIRRF,     PF.' +
        'FLGMOLESTIAGRAVE,'
      '       PF.FLGISENTOIRRF,'
      
        '       PRESP.NOME AS NOMERESPONSAVEL,     BT.PRIORIDADE,     BT.' +
        'PERCENTUAL,'
      
        '       DT.NUMSEQUENCIA,     DT.IDDEPENDENCIA,    DT.FLGCONTAIMPO' +
        'STOR,'
      '       DT.FLGCONTASALARIOF, DT.FLGBENEFICIARIO,  D.DESCRICAO,'
      '       P.NOME, TP.FLGFREQUENCIA,'
      '       BF.VALORBASE1, BF.VALORBASE2, BF.VALORBASE3, BF.VALORSRB,'
      '       BF.ULTMESPREPARO,'
      '       0 AS VALORDIVIDA,'
      '       PP.IDSITPART, PP.SALPARTICIPACAO,'
      
        '       BP.IDRUBRICAATRASO , BP.IDRUBDEVOLUCAO, BP.IDRUBRICAREVIS' +
        'AO,'
      '       BP.FLGREFERENCIA, BF.FLGPAGAINSS,'
      
        '       BF.VLRBSTOTAL, BF.VLRBSATUAL, BF.VLRFABTOTAL, BF.VLRFABAT' +
        'UAL, BF.VLRBASEDEFICIT,'
      
        '       BP.FLGAPRESENTABSFAB, BP.FLGAPRESENTADEFICIT, BF.IDPERFIL' +
        'INVEST'
      ''
      
        'FROM   BENEFBFCIARIO BF, PESSOA P, PESSOAFISICA PF, BFCIARIOTITP' +
        'LAN BT,'
      '       BENEFPLANPREV BP,'
      
        '       PESSOA PRESP, DEPEN D, DEPENTIT DT, TPPAGTOBENEFICIO TP, ' +
        'PARTPREVPLAN PP'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    BF.IDBENEFICIO    = :IDBENEFICIO'
      
        'AND   ((PP.FLGDESATIVADO = 0) OR (PP.IDSITPLANOPREV IN (SELECT S' +
        'P.IDSITPLANOPREV FROM SITPLANOPREV SP WHERE SP.FLGINTERNO = '#39'NO'#39 +
        ')) OR BF.Idsitbeneficio IN (1,2))'
      'AND    BF.IDPESSOA       = P.IDPESSOA'
      'AND    PF.IDPESSOA       = P.IDPESSOA'
      'AND    BF.IDPESSOA       = BT.IDPESSOA'
      'AND    BF.IDTITULAR      = BT.IDTITULAR'
      'AND    BF.IDPESSJUR      = BT.IDPESSJUR'
      'AND    BF.IDPLANOPREV    = BT.IDPLANOPREV'
      'AND    BF.IDPLANOORIGEM  = BT.IDPLANOORIGEM'
      'AND    BF.IDBENEFICIO    = BT.IDBENEFICIO'
      'AND    BT.IDPESSOA       = DT.IDPESSOA'
      'AND    BT.IDTITULAR      = DT.IDTITULAR'
      'AND    BT.IDRESPONSAVEL  = PRESP.IDPESSOA(+)'
      'AND    DT.IDDEPENDENCIA  = D.IDDEPENDENCIA'
      'AND    BF.IDTPPAGTOBENEFIC = TP.IDTPPAGTOBENEFIC'
      'AND    BF.IDPLANOORIGEM  = PP.IDPLANOPREV'
      'AND    BF.IDTITULAR      = PP.IDPESSOA'
      'AND    BF.IDPLANOPREV    = BP.IDPLANOPREV'
      'AND    BF.IDBENEFICIO    = BP.IDBENEFICIO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBeneficiarios
    ControlType.Strings = (
      'FLGPROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 77
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object dsBeneficiarios: TwwDataSource
    DataSet = qryBeneficiarios
    Left = 529
    Top = 65526
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NUMEROPROCESSO'
      'PES.NOME'
      'BF.NOME '
      'P.DTEVENTO'
      'PP.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Matrícula'
      'Nº do Processo'
      'Participante Titular'
      'Benefício Requerido'
      'Data do Evento'
      'Inscrição Nº')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSOBENEF P'
      'BENEFBFCIARIO B'
      'BENEFPLANPREV BPL'
      'BENEFICIO BF'
      'PESSOA PES'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP')
    CamposChave.Strings = (
      'P.NUMEROPROCESSO'
      'B.IDTITULAR'
      'B.SEQPROPOSTA'
      'B.IDPESSJUR'
      'B.IDPLANOPREV'
      'B.IDBENEFICIO'
      'P.IDEVENTOGERADOR'
      'B.IDPLANOORIGEM'
      'PP.IDPLANOPREV')
    Filtro.Strings = (
      'P.NUMEROPROCESSO = B.NUMEROPROCESSO'
      'B.IDTITULAR      = PES.IDPESSOA'
      'B.IDTITULAR      <> B.IDPESSOA'
      'BF.IDBENEFICIO   = B.IDBENEFICIO'
      'BPL.IDBENEFICIO  = B.IDBENEFICIO'
      'BPL.IDPLANOPREV  = B.IDPLANOPREV'
      'EL.IDPESSOA      = B.IDTITULAR'
      'EL.IDPESSJUR     = B.IDPESSJUR'
      'BF.FLGDESTBENEF  <> '#39'P'#39
      'PP.IDPESSJUR     = B.IDPESSJUR'
      'PP.IDPLANOPREV   = B.IDPLANOORIGEM'
      'PP.IDPESSOA      = B.IDTITULAR'
      'PP.SEQPROPOSTA   = B.SEQPROPOSTA'
      
        'PP.FLGDESATIVADO = 0 OR PP.IDSITPLANOPREV IN (SELECT SP.IDSITPLA' +
        'NOPREV FROM SITPLANOPREV SP WHERE SP.FLGINTERNO = '#39'NO'#39') OR B.Ids' +
        'itbeneficio IN (1,2) '
      
        '((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND (BPL.FL' +
        'GPAGAINSS=1)))')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '15'
      '30'
      '30'
      '15'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
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
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 504
    Top = 396
  end
  object qryTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P1.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '       PF.DATANASC, PF.DATAMORTE,'
      
        '       EL.MATRICULA, EL.DATAADMISSAO, EL.DATADEMISSAO, EL.TEMPOS' +
        'ERVANTERIOR,'
      
        '       EL.TEMPONAOCREDITADO, EL.TEMPOSITESPECIAL, EL.NIVEL, EL.I' +
        'DSITFUNC,'
      
        '       PP.INSCRICAONUMERO, PP.INSCRICAODATA, PP.FLGDEVEEMPRESTIM' +
        'O, PP.FLGDEVEASSISTENC,'
      
        '       PP.FLGDEVEPREVIDENC, PP.IDSITPART, PP.IDSITPLANOPREV, PP.' +
        'IDPLANOPREV,'
      '       SPART.DESCRICAO   AS NOMESITPART,'
      '       SFUNC.DESCRICAO   AS NOMESITFUNC,'
      '       SPLANO.DESCRICAO  AS NOMESITPLANO,'
      '       SFUNC.TIPOSIT,'
      '       SPART.FLGINTERNO  AS FLGSITPART,'
      '       SFUNC.TIPOSIT     AS FLGSITFUNC,'
      '       SPLANO.FLGINTERNO AS FLGSITPLANO,'
      '       EL.TEMPOSERVTOTAL,'
      '       EL.TEMPOSERVTOTMES,'
      '       EL.TEMPOSERVTOTDIA'
      
        'FROM   PESSOA P, PESSOA P1, PLANPREV PL, PESSOAFISICA PF, ELEGPA' +
        'TRO EL,'
      
        '       PARTPREVPLAN PP, SITPART SPART, SITFUNC SFUNC, SITPLANOPR' +
        'EV SPLANO'
      'WHERE  PP.IDPESSOA    = :IDPESSOA'
      'AND    PP.SEQPROPOSTA = :SEQPROPOSTA'
      'AND    PP.IDPESSJUR   = :IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV'
      'AND    EL.IDPESSOA    = :IDPESSOA'
      'AND    EL.IDPESSJUR   = :IDPESSJUR'
      'AND    P.IDPESSOA     = :IDPESSOA'
      
        'and      ((PP.FLGDESATIVADO = 0) OR (PP.IDSITPLANOPREV IN (SELEC' +
        'T SP.IDSITPLANOPREV'
      
        '                                                   FROM SITPLANO' +
        'PREV SP'
      
        '                                                   WHERE SP.FLGI' +
        'NTERNO = '#39'NO'#39'))'
      'OR (EXISTS (SELECT 1'
      '                    FROM benefbfciario bf'
      '                    WHERE bf.idtitular = pp.idpessoa AND'
      '                          bf.idplanoprev = pp.idplanoprev AND'
      '                          bf.idpessjur = pp.idpessjur AND'
      '                          bf.idsitbeneficio IN (1,2))))'
      ''
      'AND    P1.IDPESSOA = EL.IDPESSJUR'
      'AND    PF.IDPESSOA = EL.IDPESSOA'
      'AND    PP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND    SFUNC.IDSITFUNC = EL.IDSITFUNC'
      'AND    SPART.IDSITPART = PP.IDSITPART'
      'AND    SPLANO.IDSITPLANOPREV = PP.IDSITPLANOPREV'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 740
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 735
    Top = 91
  end
  object qryBeneficiarioEmUso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, DT.IDTITULAR, DT.IDPESSOA, DT.IDDEPENDENCIA,'
      
        '       DT.NUMSEQUENCIA, DT.FLGCONTAIMPOSTOR, DT.FLGCONTASALARIOF' +
        ','
      '       DT.FLGBENEFICIARIO, BT.IDBENEFICIO,   BT.IDDEPENRESPON,'
      
        '       BT.IDRESPONSAVEL, BT.PRIORIDADE, BT.PERCENTUAL, DP.MATRIC' +
        'ULA'
      'FROM   PESSOA P, DEPENTIT DT, BFCIARIOTITPLAN BT'
      'WHERE  BT.IDPESSOA IN (:SIDPESSOA)'
      'AND    P.IDPESSOA     = BT.IDPESSOA'
      'AND    DT.IDTITULAR   = :IDTITULAR'
      'AND    BT.IDBENEFICIO = :IDBENEFICIO'
      'AND    BT.IDPLANOORIGEM = :IDPLANOPREV'
      'AND    BT.IDPESSJUR   = :IDPESSJUR'
      'AND    DT.IDPESSOA    = P.IDPESSOA'
      'AND    BT.IDPESSOA    = DT.IDPESSOA'
      'AND    BT.IDTITULAR   = DT.IDTITULAR'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 710
    Top = 388
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object updHstBenefPagos: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTBENEFBFCIARIO'
      'set'
      '  IDMOTIVO = :IDMOTIVO,'
      '  MES = :MES,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  VALORPREV = :VALORPREV,'
      '  VLBENEFPGTO = :VLBENEFPGTO,'
      '  VALORINTEGRAL = :VALORINTEGRAL,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  FLGPROVISORIO = :FLGPROVISORIO,'
      '  FLGCONCESSAO = :FLGCONCESSAO,'
      '  FLGDEVOLUCAO = :FLGDEVOLUCAO,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  DATAPAGAMENTO = :DATAPAGAMENTO,'
      '  FLGENVIADO = :FLGENVIADO,'
      '  VALOROP1 = :VALOROP1,'
      '  VALOROP2 = :VALOROP2,'
      '  VALOROP3 = :VALOROP3,'
      '  VALORSRB = :VALORSRB,'
      '  SEQBENEFICIO = :SEQBENEFICIO,'
      '  VALORBS = :VALORBS,'
      '  VALORFAB = :VALORFAB,'
      '  VLRBASEDEFICIT = :VLRBASEDEFICIT,'
      '  IDPERFILINVEST = :IDPERFILINVEST'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MES = :OLD_MES and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO'
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into HSTBENEFBFCIARIO'
      
        '  (IDPESSJUR, IDPLANOPREV, IDPLANOORIGEM, IDTITULAR, IDPESSOA, I' +
        'DBENEFICIO, '
      
        '   IDMOTIVO, MES, MESREFERENCIA, NUMEROPROCESSO, VALORCALCULADO,' +
        ' VALORPREV, '
      
        '   VLBENEFPGTO, VALORINTEGRAL, VALORTOTAL, FLGPROVISORIO, FLGCON' +
        'CESSAO, '
      
        '   FLGDEVOLUCAO, SEQPROPOSTA, DATAPAGAMENTO, FLGENVIADO, VALOROP' +
        '1, VALOROP2, '
      
        '   VALOROP3, VALORSRB, SEQBENEFICIO, FLGPROVISORIO, PERCENTUAL, ' +
        'LOTEORIGINAL, FONTEPAGADORA,'
      '   VALORBS, VALORFAB, VLRBASEDEFICIT, IDPERFILINVEST)'
      'values'
      
        '  (:IDPESSJUR, :IDPLANOPREV, :IDPLANOORIGEM, :IDTITULAR, :IDPESS' +
        'OA, :IDBENEFICIO, '
      
        '   :IDMOTIVO, :MES, :MESREFERENCIA, :NUMEROPROCESSO, :VALORCALCU' +
        'LADO, :VALORPREV, '
      
        '   :VLBENEFPGTO, :VALORINTEGRAL, :VALORTOTAL, :FLGPROVISORIO, :F' +
        'LGCONCESSAO, '
      
        '   :FLGDEVOLUCAO, :SEQPROPOSTA, :DATAPAGAMENTO, :FLGENVIADO, :VA' +
        'LOROP1, '
      
        '   :VALOROP2, :VALOROP3, :VALORSRB, :SEQBENEFICIO, :FLGPROVISORI' +
        'O, :PERCENTUAL, :IDLOTE, :FONTEPAGADORA,'
      '   :VALORBS, :VALORFAB, :VLRBASEDEFICIT, :IDPERFILINVEST)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from HSTBENEFBFCIARIO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MES = :OLD_MES and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    Left = 448
    Top = 293
  end
  object qryBenefAUX: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.NUMEROPROCESSO,  BF.IDBENEFICIO,   BF.VALORATUAL,'
      '       BF.IDPESSJUR,       BF.IDPLANOPREV,   BF.IDPESSOA ,'
      '       BF.IDTITULAR ,      BF.SEQPROPOSTA,   BF.FLGFORMAPAGTO,'
      '       BF.IDSITBENEFICIO,  BF.VLRCALCINSS,   BF.VLRINFINSS,'
      '       BF.NUMPROCINSS,     BF.VALORCOTAS,    BPART.VALORBASE1,'
      '       BPART.VALORBASE2,   BPART.VALORBASE3, B.NUMORDEMEVENTO,'
      '       BP.FLGCALCTODOMES'
      
        'FROM   BENEFBFCIARIO BF, BENEFPLANOPART BPART, BENEFICIO B, BENE' +
        'FPLANPREV BP'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    BF.IDPLANOPREV    = BP.IDPLANOPREV'
      'AND    BF.IDBENEFICIO    = BP.IDBENEFICIO'
      'ORDER BY B.NUMORDEMEVENTO DESC')
    ValidateWithMask = True
    Left = 702
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object dsHstBenefPagos: TwwDataSource
    Left = 712
    Top = 221
  end
  object qryBenefBfciario: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAFINAL, DATAINICIO, DATAINICIOFUND, DATAINICIOINSS,'
      '       DATAREQUERIMENTO, FLGBENEFMIN, FLGFORMAPAGTO,'
      
        '       IDBENEFICIO,IDDEPENDENCIA,IDPESSJUR,IDPESSOA,IDPLANOPREV,' +
        'IDPLANOORIGEM,'
      '       IDSITBENEFICIO,IDTITULAR,IDTPPAGTOBENEFIC,NUMEROPROCESSO,'
      '       NUMPROCINSS,SEQPROPOSTA,ULTMESPREPARO,'
      
        '       VALORATUAL,VALORCALCULADO,VALORCOTAS,VALORTOTAL,VLRCALCIN' +
        'SS,'
      
        '       VLRINFINSS, 0 AS VALORATUALANT, '#39'XXXXXXXXXXXXXXX'#39' AS MATR' +
        'ICULA,'
      
        '       DIBBENEFANT, FONTEPAGADORA, VALORNADIB,FLGPAGAINSS, BSDIB' +
        ', FABDIB,'
      
        '       VLRBSTOTAL, VLRBSATUAL, VLRFABTOTAL, VLRFABATUAL, VLRBASE' +
        'DEFICIT,'
      '       IDPERFILINVEST'
      'FROM   BENEFBFCIARIO'
      'WHERE  NUMEROPROCESSO = :NUMEROPROCESSO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBenefBfciario
    ValidateWithMask = True
    Left = 608
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object updBenefBfciario: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  DATAFINAL = :DATAFINAL,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAINICIOFUND = :DATAINICIOFUND,'
      '  DATAINICIOINSS = :DATAINICIOINSS,'
      '  DATAREQUERIMENTO = :DATAREQUERIMENTO,'
      '  FLGBENEFMIN = :FLGBENEFMIN,'
      '  FLGFORMAPAGTO = :FLGFORMAPAGTO,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPLANOORIGEM = :IDPLANOORIGEM,'
      '  IDSITBENEFICIO = :IDSITBENEFICIO,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  NUMPROCINSS = :NUMPROCINSS,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  ULTMESPREPARO = :ULTMESPREPARO,'
      '  VALORATUAL = :VALORATUAL,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  VALORCOTAS = :VALORCOTAS,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  VLRCALCINSS = :VLRCALCINSS,'
      '  VLRINFINSS = :VLRINFINSS,'
      '  FLGPAGAINSS=:FLGPAGAINSS,'
      '  VLRBSTOTAL = :VLRBSTOTAL,'
      '  VLRBSATUAL = :VLRBSATUAL,'
      '  VLRFABTOTAL = :VLRFABTOTAL,'
      '  VLRFABATUAL = :VLRFABATUAL,'
      '  VLRBASEDEFICIT = :VLRBASEDEFICIT,'
      '  IDPERFILINVEST = :IDPERFILINVEST'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO'
      ' ')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      
        '  (DATAFINAL, DATAINICIO, DATAINICIOFUND, DATAINICIOINSS, DATARE' +
        'QUERIMENTO, '
      
        '   FLGBENEFMIN, FLGFORMAPAGTO, IDBENEFICIO, IDDEPENDENCIA, IDPES' +
        'SJUR, IDPESSOA, '
      
        '   IDPLANOPREV, IDPLANOORIGEM, IDSITBENEFICIO, IDTITULAR, IDTPPA' +
        'GTOBENEFIC, '
      
        '   NUMEROPROCESSO, NUMPROCINSS, SEQPROPOSTA, ULTMESPREPARO, VALO' +
        'RATUAL, '
      
        '   VALORCALCULADO, VALORCOTAS, VALORTOTAL, VLRCALCINSS, VLRINFIN' +
        'SS,FONTEPAGADORA, VALORNADIB, FLGPAGAINSS,'
      
        '   VLRBSTOTAL, VLRBSATUAL, VLRFABTOTAL, VLRFABATUAL, VLRBASEDEFI' +
        'CIT, IDPERFILINVEST )'
      'values'
      
        '  (:DATAFINAL, :DATAINICIO, :DATAINICIOFUND, :DATAINICIOINSS, :D' +
        'ATAREQUERIMENTO,'
      
        '   :FLGBENEFMIN, :FLGFORMAPAGTO, :IDBENEFICIO, :IDDEPENDENCIA, :' +
        'IDPESSJUR,'
      
        '   :IDPESSOA, :IDPLANOPREV, :IDPLANOORIGEM, :IDSITBENEFICIO, :ID' +
        'TITULAR,'
      
        '   :IDTPPAGTOBENEFIC, :NUMEROPROCESSO, :NUMPROCINSS, :SEQPROPOST' +
        'A, :ULTMESPREPARO,'
      
        '   :VALORATUAL, :VALORCALCULADO, :VALORCOTAS, :VALORTOTAL, :VLRC' +
        'ALCINSS,'
      '   :VLRINFINSS, :FONTEPAGADORA, :VALORNADIB,:FLGPAGAINSS,'
      
        '   :VLRBSTOTAL, :VLRBSATUAL, :VLRFABTOTAL, :VLRFABATUAL, :VLRBAS' +
        'EDEFICIT, :IDPERFILINVEST )'
      ' ')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    Left = 544
    Top = 333
  end
  object updHstNovoBenef: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTBENEFBFCIARIO'
      'set'
      '  IDMOTIVO = :IDMOTIVO,'
      '  DATAPAGAMENTO = :DATAPAGAMENTO,'
      '  MES = :MES,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  VALORPREV = :VALORPREV,'
      '  VLBENEFPGTO = :VLBENEFPGTO,'
      '  FLGCONCESSAO = :FLGCONCESSAO,'
      '  FLGDEVOLUCAO = :FLGDEVOLUCAO,'
      '  IDLOTE = :IDLOTE,'
      '  VALORINTEGRAL = :VALORINTEGRAL,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  FLGENVIADO = :FLGENVIADO,'
      '  VALOROP1 = :VALOROP1,'
      '  VALOROP2 = :VALOROP2,'
      '  VALOROP3 = :VALOROP3,'
      '  VALORSRB = :VALORSRB,'
      '  FLGPROVISORIO = :FLGPROVISORIO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  VALORBS = :VALORBS,'
      '  VALORFAB = :VALORFAB,'
      '  VLRBASEDEFICIT = :VLRBASEDEFICIT,'
      '  LOTEORIGINAL = :LOTEORIGINAL,'
      '  FLGTIPOREGISTRO = :FLGTIPOREGISTRO,'
      '  IDPERFILINVEST = :IDPERFILINVEST'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MES = :OLD_MES and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into HSTBENEFBFCIARIO'
      
        '  (IDPESSJUR, IDPLANOPREV, IDPLANOORIGEM, IDTITULAR, IDPESSOA, I' +
        'DBENEFICIO,'
      
        '   IDMOTIVO, DATAPAGAMENTO, MES, MESREFERENCIA, NUMEROPROCESSO, ' +
        'VALORCALCULADO,'
      
        '   VALORPREV, VLBENEFPGTO, FLGCONCESSAO, FLGDEVOLUCAO, IDLOTE, V' +
        'ALORINTEGRAL,'
      
        '   VALORTOTAL, FLGENVIADO, VALOROP1, VALOROP2, VALOROP3, VALORSR' +
        'B, FLGPROVISORIO,'
      
        '   PERCENTUAL, FONTEPAGADORA, VALORBS, VALORFAB, VLRBASEDEFICIT,' +
        ' SEQBENEFICIO,'
      '   LOTEORIGINAL, FLGTIPOREGISTRO, IDPERFILINVEST)'
      'values'
      
        '  (:IDPESSJUR, :IDPLANOPREV, :IDPLANOORIGEM, :IDTITULAR, :IDPESS' +
        'OA, :IDBENEFICIO,'
      
        '   :IDMOTIVO, :DATAPAGAMENTO, :MES, :MESREFERENCIA, :NUMEROPROCE' +
        'SSO, :VALORCALCULADO,'
      
        '   :VALORPREV, :VLBENEFPGTO, :FLGCONCESSAO, :FLGDEVOLUCAO, :IDLO' +
        'TE, :VALORINTEGRAL,'
      
        '   :VALORTOTAL, :FLGENVIADO, :VALOROP1, :VALOROP2, :VALOROP3, :V' +
        'ALORSRB,'
      
        '   :FLGPROVISORIO, :PERCENTUAL, :FONTEPAGADORA, :VALORBS, :VALOR' +
        'FAB, :VLRBASEDEFICIT, :SEQBENEFICIO,'
      '   :LOTEORIGINAL, :FLGTIPOREGISTRO, :IDPERFILINVEST)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from HSTBENEFBFCIARIO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MES = :OLD_MES and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    Left = 346
    Top = 344
  end
  object qryHstNovoBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HST.IDPESSJUR, HST.IDPLANOPREV, HST.IDPLANOORIGEM, HST.ID' +
        'TITULAR,'
      
        '       HST.IDPESSOA,  HST.IDBENEFICIO,  HST.IDMOTIVO, HST.DATAPA' +
        'GAMENTO,'
      '       HST.MES,       HST.MESREFERENCIA, HST.NUMEROPROCESSO,'
      '       HST.VALORCALCULADO, HST.VALORPREV,     HST.VLBENEFPGTO,'
      '       HST.FLGCONCESSAO, HST.FLGDEVOLUCAO, HST.IDLOTE,'
      '       0 AS NOVOVALOR, P.NOME, 0 AS FLGNOVOBENEF,'
      '       '#39'               '#39' AS DESCRICAO,'
      '       HST.VALORINTEGRAL, HST.VALORTOTAL,'
      '       HST.FLGENVIADO,       HST.VALOROP1,'
      '       HST.VALOROP2,        HST.VALOROP3,         HST.VALORSRB,'
      '       HST.FLGPROVISORIO,   HST.PERCENTUAL, FONTEPAGADORA,'
      
        '       HST.VALORBS, HST.VALORFAB, HST.VLRBASEDEFICIT, HST.SEQBEN' +
        'EFICIO,'
      '       HST.LOTEORIGINAL, HST.FLGTIPOREGISTRO, HST.IDPERFILINVEST'
      'FROM   HSTBENEFBFCIARIO HST, PESSOA P'
      'WHERE  (HST.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND    (HST.IDBENEFICIO    = :IDBENEFICIO)'
      'AND    (HST.IDPESSOA       = :IDPESSOA)'
      'AND    (HST.MESREFERENCIA >= :MESREFERENCIA)'
      'AND    (HST.IDPESSOA = P.IDPESSOA)'
      'ORDER BY HST.MESREFERENCIA, HST.IDPESSOA '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updHstNovoBenef
    ValidateWithMask = True
    Left = 252
    Top = 303
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end>
  end
  object dsHstNovoBenef: TwwDataSource
    DataSet = qryHstNovoBenef
    Left = 540
    Top = 215
  end
  object updBeneficiarios: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  IDSITBENEFICIO = :IDSITBENEFICIO,'
      '  VALORATUAL = :ValorAtual,'
      '  VALORCALCULADO = :ValorCalculado,'
      '  VALORTOTAL = :ValorTotal,'
      '  VLRBSTOTAL = :VLRBSTOTAL,'
      '  VLRBSATUAL = :VLRBSATUAL,'
      '  VLRFABTOTAL = :VLRFABTOTAL,'
      '  VLRFABATUAL = :VLRFABATUAL,'
      '  VLRBASEDEFICIT  = :VLRBASEDEFICIT'
      ''
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO'
      ' ')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (IDSITBENEFICIO)'
      'values'
      '  (:IDSITBENEFICIO)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    Left = 423
    Top = 123
  end
  object qryContaBancaria: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, CB.IDAGENCIA, CB.FLGCON' +
        'TAPREF,'
      
        '       CB.IDPESSOA,    CB.TIPOCONTA, AGENCIABANCARIA.NUMAGENCIA,' +
        'AGENCIA.NOME AS AGENCIA, BANCO.NOME AS BANCO'
      'FROM CONTABANCARIA  CB, PESSOA AGENCIA,'
      '     PESSOA BANCO, AGENCIABANCARIA AGENCIABANCARIA'
      'WHERE CB.IDPESSOA = :IDPESSOA AND'
      '       CB.IDAGENCIA = AGENCIA.IDPESSOA AND'
      '       CB.IDAGENCIA  = AGENCIABANCARIA.IDPESSOA AND'
      '       AGENCIABANCARIA.IDBANCO =  BANCO.IDPESSOA AND'
      '       CB.FLGCONTAPREF = 1')
    ValidateWithMask = True
    Left = 550
    Top = 287
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updBenefINSS: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  IDSITBENEFICIO = :IDSITBENEFICIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (IDSITBENEFICIO)'
      'values'
      '  (:IDSITBENEFICIO)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    Left = 481
    Top = 178
  end
  object qryBenefINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.IDTITULAR,  BF.IDPLANOPREV,     BF.IDPLANOORIGEM,'
      '       BF.IDPESSJUR,  BF.IDBENEFICIO,     BF.NUMEROPROCESSO, '
      #9' BF.SEQPROPOSTA, BF.IDPERFILINVEST,'
      '       MAX(BF.NUMPROCINSS) AS NUMPROCINSS,'
      '       MAX(BF.VALORATUAL)  AS VALORATUAL, '
      '       MAX(BF.VALORCALCULADO) AS VALORCALCULADO,  '
      '       MAX(BF.VALORCOTAS) AS VALORCOTAS,'
      '       MAX(BF.VALORTOTAL) AS VALORTOTAL, '
      '       MAX(BF.VLRCALCINSS) AS VLRCALCINSS,'
      '       MAX(BF.VLRINFINSS) AS VLRINFINSS,'
      '       MAX(BF.DATAFINAL) AS DATAFINAL,'
      '       MAX(BF.DATAINICIO) AS DATAINICIO,'
      '       MAX(BF.DATAINICIOFUND) AS DATAINICIOFUND,'
      '       MAX(BF.DATAINICIOINSS) AS DATAINICIONSS,'
      '       MAX(BF.IDTPPAGTOBENEFIC) AS IDTPPAGTOBENEFIC,'
      '       MAX(BF.CODPORTFORMA ) AS CODPORTFORMA, FONTEPAGADORA'
      'FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    BP.IDPLANOPREV    = BF.IDPLANOPREV'
      'AND    BP.IDBENEFICIO    = BF.IDBENEFICIO'
      'AND    BP.FLGREFERENCIA  = 1'
      'AND    BP.FLGPAGAINSS    = 0 '
      'GROUP BY BF.IDTITULAR,  BF.IDPLANOPREV,     BF.IDPLANOORIGEM,'
      '       BF.IDPESSJUR,  BF.IDBENEFICIO,     BF.NUMEROPROCESSO,'
      '       BF.SEQPROPOSTA, FONTEPAGADORA, BF.IDPERFILINVEST'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = updBenefINSS
    ValidateWithMask = True
    Left = 483
    Top = 95
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object updHstNovoINSS: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTBENEFBFCIARIO'
      'set'
      '  IDMOTIVO = :IDMOTIVO,'
      '  MES = :MES,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  VALORPREV = :VALORPREV,'
      '  VLBENEFPGTO = :VLBENEFPGTO,'
      '  FLGCONCESSAO = :FLGCONCESSAO,'
      '  FLGDEVOLUCAO = :FLGDEVOLUCAO,'
      '  FLGPROVISORIO = :FLGPROVISORIO,'
      '  DATAPAGAMENTO = :DATAPAGAMENTO,'
      '  FLGENVIADO = :FLGENVIADO,'
      '  VALOROP1 = :VALOROP1,'
      '  VALOROP2 = :VALOROP2,'
      '  VALOROP3 = :VALOROP3,'
      '  VALORSRB = :VALORSRB,'
      '  IDPERFILINVEST = :IDPERFILINVEST'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MES = :OLD_MES and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO'
      ' ')
    InsertSQL.Strings = (
      'insert into HSTBENEFBFCIARIO'
      
        '  (IDPESSJUR, IDPLANOPREV, IDPLANOORIGEM, IDTITULAR, IDPESSOA, I' +
        'DBENEFICIO, '
      
        '   IDMOTIVO, MES, MESREFERENCIA, NUMEROPROCESSO, VALORCALCULADO,' +
        ' VALORPREV, '
      
        '   VLBENEFPGTO, FLGCONCESSAO, FLGDEVOLUCAO, FLGPROVISORIO, DATAP' +
        'AGAMENTO, '
      
        '   FLGENVIADO, VALOROP1, VALOROP2, VALOROP3, VALORSRB, FONTEPAGA' +
        'DORA, SEQBENEFICIO,'
      '   IDPERFILINVEST)'
      'values'
      
        '  (:IDPESSJUR, :IDPLANOPREV, :IDPLANOORIGEM, :IDTITULAR, :IDPESS' +
        'OA, :IDBENEFICIO, '
      
        '   :IDMOTIVO, :MES, :MESREFERENCIA, :NUMEROPROCESSO, :VALORCALCU' +
        'LADO, :VALORPREV, '
      
        '   :VLBENEFPGTO, :FLGCONCESSAO, :FLGDEVOLUCAO, :FLGPROVISORIO, :' +
        'DATAPAGAMENTO, '
      
        '   :FLGENVIADO, :VALOROP1, :VALOROP2, :VALOROP3, :VALORSRB, :FON' +
        'TEPAGADORA, :SEQBENEFICIO,'
      '   :IDPERFILINVEST)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from HSTBENEFBFCIARIO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MES = :OLD_MES and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    Left = 344
    Top = 300
  end
  object qryHstNovoINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HST.IDPESSJUR, HST.IDPLANOPREV, HST.IDPLANOORIGEM, HST.ID' +
        'TITULAR,'
      '       HST.IDPESSOA,  HST.IDBENEFICIO,  HST.IDMOTIVO,'
      '       HST.MES,       HST.MESREFERENCIA, HST.NUMEROPROCESSO,'
      '       HST.VALORCALCULADO, HST.VALORPREV,     HST.VLBENEFPGTO,'
      '       HST.FLGCONCESSAO, HST.FLGDEVOLUCAO, HST.FLGPROVISORIO,'
      '       HST.DATAPAGAMENTO,   HST.FLGENVIADO,       HST.VALOROP1,'
      '       HST.VALOROP2,        HST.VALOROP3,         HST.VALORSRB,'
      ''
      '       0 AS NOVOVALOR, P.NOME, 0 AS FLGNOVOBENEF,'
      
        '       '#39'               '#39' AS DESCRICAO, FONTEPAGADORA, HST.SEQBEN' +
        'EFICIO,'
      '       HST.IDPERFILINVEST'
      'FROM   HSTBENEFBFCIARIO HST, PESSOA P'
      'WHERE  (HST.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND    (HST.IDBENEFICIO    = :IDBENEFICIO)'
      'AND    (HST.IDPESSOA       = :IDPESSOA)'
      'AND    (HST.MESREFERENCIA >= :MESREFERENCIA)'
      'AND    (HST.IDPESSOA = P.IDPESSOA)'
      'ORDER BY HST.MESREFERENCIA, HST.IDPESSOA '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updHstNovoINSS
    ValidateWithMask = True
    Left = 251
    Top = 358
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end>
  end
  object QryBeneficiariosValidos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  COUNT(0) AS TOTALVALIDOS'
      'FROM'
      
        '  BENEFBFCIARIO BF, PESSOA P, PESSOAFISICA PF, BFCIARIOTITPLAN B' +
        'T,'
      '  PESSOA PRESP, DEPEN D, DEPENTIT DT'
      'WHERE'
      '       BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    BF.IDBENEFICIO    = :IDBENEFICIO'
      'AND    BF.IDSITBENEFICIO IN (1,2)'
      'AND    BF.IDPESSOA       = P.IDPESSOA'
      'AND    PF.IDPESSOA       = P.IDPESSOA '
      'AND    BF.IDPESSOA       = BT.IDPESSOA'
      'AND    BF.IDTITULAR      = BT.IDTITULAR'
      'AND    BF.IDPESSJUR      = BT.IDPESSJUR'
      'AND    BF.IDPLANOPREV    = BT.IDPLANOPREV'
      'AND    BF.IDPLANOORIGEM  = BT.IDPLANOORIGEM'
      'AND    BF.IDBENEFICIO    = BT.IDBENEFICIO'
      'AND    BT.IDPESSOA       = DT.IDPESSOA'
      'AND    BT.IDTITULAR      = DT.IDTITULAR'
      'AND    BT.IDRESPONSAVEL  = PRESP.IDPESSOA(+)'
      'AND    DT.IDDEPENDENCIA  = D.IDDEPENDENCIA'
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 214
    Top = 19
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryloop: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 390
    Top = 234
  end
  object QryContribProc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 241
    Top = 172
  end
  object qryNucleoFamiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 324
    Top = 172
  end
  object qryHstBenefPagos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       0 AS IDMOTIVO, '
      '       0 AS FLGDEVOLUCAO,'
      '       -- HST.MES,'
      ''
      
        '       HST.IDPESSJUR,        HST.IDPLANOPREV,      HST.IDPLANOOR' +
        'IGEM,'
      
        '       HST.IDTITULAR,        HST.IDPESSOA,         HST.IDBENEFIC' +
        'IO,'
      
        '       HST.MESREFERENCIA,    HST.NUMEROPROCESSO,   HST.FLGPROVIS' +
        'ORIO,'
      '       HST.SEQPROPOSTA,      HST.FLGENVIADO,'
      '       -- HST.SEQBENEFICIO,'
      ''
      
        '       SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORCALCULADO,HST.VAL' +
        'ORCALCULADO)) AS VALORCALCULADO,'
      
        '       SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORPREV,HST.VALORPRE' +
        'V))           AS VALORPREV,'
      
        '       SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VLBENEFPGTO,HST.VLBENE' +
        'FPGTO))       AS VLBENEFPGTO,'
      ''
      '       MAX(HST.VALORINTEGRAL) AS VALORINTEGRAL,'
      '       MAX(HST.VALORTOTAL)    AS VALORTOTAL,'
      '       MAX(VALOROP1)          AS VALOROP1 ,'
      '       MAX(HST.VALOROP2)      AS VALOROP2,'
      '       MAX(HST.VALOROP3)      AS VALOROP3,'
      '       MAX(HST.VALORSRB)      AS VALORSRB,'
      ''
      '       P.NOME,'
      '       '#39'                    '#39' AS DESCRICAO, 0 AS NOVOVALOR,'
      '       TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39') AS DATAPAGAMENTO,'
      '       0 AS FLGENVIADO'
      '       , FONTEPAGADORA'
      '       , MAX(HST.VALORBS) AS VALORBS'
      '       , MAX(HST.VALORFAB) AS VALORFAB'
      '       , MAX(HST.VLRBASEDEFICIT) AS VLRBASEDEFICIT'
      '       , HST.IDPERFILINVEST'
      'FROM   HSTBENEFBFCIARIO HST, PESSOA P'
      'WHERE  (HST.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND    (HST.IDBENEFICIO    = :IDBENEFICIO)'
      'AND    (HST.MESREFERENCIA >= :MESREFERENCIA)'
      
        'AND    ((HST.MESREFERENCIA <= :ANOMESFINAL) OR ((HST.MESREFERENC' +
        'IA = :ANOMESFINAL13)) /*AND (&DATADIB <= '#39'16/02'#39'))*/)'
      ''
      
        'AND    ((HST.MESREFERENCIA <= :ANOMESFINAL) OR (HST.MESREFERENCI' +
        'A = :ANOMESFINAL13))'
      'AND    (HST.IDPESSOA = P.IDPESSOA)'
      'GROUP BY'
      '       --HST.IDMOTIVO,'
      '       --HST.FLGDEVOLUCAO,'
      '       --HST.MES,'
      '       HST.IDPESSJUR,       HST.IDPLANOPREV,'
      '       HST.IDPLANOORIGEM,   HST.IDTITULAR,'
      '       HST.IDPESSOA,        HST.IDBENEFICIO,'
      '       HST.MESREFERENCIA,   HST.NUMEROPROCESSO,'
      '       HST.FLGPROVISORIO,   HST.SEQPROPOSTA,'
      '       HST.FLGENVIADO,     '
      '       -- HST.SEQBENEFICIO,'
      '       P.NOME , FONTEPAGADORA, HST.IDPERFILINVEST'
      ''
      'ORDER BY'
      '  HST.MESREFERENCIA, HST.IDPESSOA, VALORPREV DESC'
      ''
      ' '
      ' ')
    UpdateObject = updHstBenefPagos
    ValidateWithMask = True
    Left = 443
    Top = 343
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOMESFINAL13'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOMESFINAL13'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = qryHstNovoBenef
    Left = 580
    Top = 401
  end
  object ppDemonstrativo: TppBDEPipeline
    DataSource = dsDemonstra
    UserName = 'ppDemonstrativo'
    Left = 24
    Top = 208
    object ppDemonstrativoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMEROPROCESSO'
      FieldName = 'NUMEROPROCESSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppDemonstrativoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTITULAR'
      FieldName = 'IDTITULAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppDemonstrativoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDemonstrativoppField4: TppField
      FieldAlias = 'MATRICULATIT'
      FieldName = 'MATRICULATIT'
      FieldLength = 13
      DisplayWidth = 13
      Position = 3
    end
    object ppDemonstrativoppField5: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppDemonstrativoppField6: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppDemonstrativoppField7: TppField
      FieldAlias = 'NOMETIT'
      FieldName = 'NOMETIT'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object ppDemonstrativoppField8: TppField
      FieldAlias = 'DATAMORTE'
      FieldName = 'DATAMORTE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object ppDemonstrativoppField9: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppDemonstrativoppField10: TppField
      FieldAlias = 'DIB'
      FieldName = 'DIB'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object ppDemonstrativoppField11: TppField
      FieldAlias = 'NOMEBENEFICIO'
      FieldName = 'NOMEBENEFICIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object ppDemonstrativoppField12: TppField
      FieldAlias = 'DIP'
      FieldName = 'DIP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppDemonstrativoppField13: TppField
      FieldAlias = 'DIBANT'
      FieldName = 'DIBANT'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object ppDemonstrativoppField14: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object ppDemonstrativoppField15: TppField
      FieldAlias = 'IRRFISENTO'
      FieldName = 'IRRFISENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 14
    end
    object ppDemonstrativoppField16: TppField
      FieldAlias = 'SITBENEF'
      FieldName = 'SITBENEF'
      FieldLength = 40
      DisplayWidth = 40
      Position = 15
    end
    object ppDemonstrativoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRBSTOTAL'
      FieldName = 'VLRBSTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppDemonstrativoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRBSATUAL'
      FieldName = 'VLRBSATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppDemonstrativoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRFABTOTAL'
      FieldName = 'VLRFABTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppDemonstrativoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRFABATUAL'
      FieldName = 'VLRFABATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppDemonstrativoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppDemonstrativoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORATUAL'
      FieldName = 'VALORATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppDemonstrativoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRBASEDEFICIT'
      FieldName = 'VLRBASEDEFICIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppDemonstrativoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppDemonstrativoppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppDemonstrativoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOORIGEM'
      FieldName = 'IDPLANOORIGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppDemonstrativoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEQPROPOSTA'
      FieldName = 'SEQPROPOSTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppDemonstrativoppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppDemonstrativoppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'FONTEPAGADORA'
      FieldName = 'FONTEPAGADORA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppDemonstrativoppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGAPRESENTABSFAB'
      FieldName = 'FLGAPRESENTABSFAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppDemonstrativoppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGAPRESENTADEFICIT'
      FieldName = 'FLGAPRESENTADEFICIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppDemonstrativoppField32: TppField
      FieldAlias = 'NOMEPERFIL'
      FieldName = 'NOMEPERFIL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 31
    end
  end
  object rpDemonstrativo: TppReport
    AutoStop = False
    DataPipeline = ppDemonstrativo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Demonstrativo de Desdobramento de Benefícios'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4500
    PrinterSetup.mmMarginLeft = 4500
    PrinterSetup.mmMarginRight = 4500
    PrinterSetup.mmMarginTop = 4500
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    AllowPrintToArchive = True
    BeforePrint = rpDemonstrativoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 57
    Top = 151
    Version = '7.04'
    mmColumnWidth = 201000
    DataPipelineName = 'ppDemonstrativo'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLabel44: TppLabel
        UserName = 'Label44'
        AutoSize = False
        Caption = 'Demonstrativo de Desdobramento de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 21167
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'lbl_dataconce1'
        Caption = 'Emissão: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 169334
        mmTop = 25135
        mmWidth = 10054
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        DirectDraw = True
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D6170D6A90000424DD6A90000000000003604000028000000C800
          0000D40000000100080000000000A0A50000232E0000232E0000000100000000
          00006A4F4D006B504E006B514F006C514F006D5351006D5250006F5453006F55
          53006E5452006F555400705654007157550072585600735A5800745B5900745B
          5A00765D5B00775E5D00765D5C00785F5E0079615F0078605E007B6361007A62
          60007B6462007C6463007E6765007E6665007D6564007F6866002DA0D5002FA0
          D50030A1D50034A3D60036A4D6003AA5D70039A5D7003CA6D7003EA7D80041A9
          D80041A8D80043A9D90047ABDA004AADDA004DAEDB004FAFDB0057B3DD0055B2
          DC0053B0DC005DB5DE005EB6DE005FB6DF0058B3DD0060B7DF0064B8DF0062B8
          DF0066B9E00069BBE0006BBCE1006DBCE1006EBDE10072BFE20077C1E30074C0
          E3007EC4E5007AC3E40080696700826B6900836C6A00836D6B00826C6A00846E
          6D0086706E0085706E0087716F0088727100897473008B7674008A7574008C77
          76008C7876008D7877008F7B79008D797700927E7D00907C7A0093807F009480
          7F0095828100978583009987850098868400998685009B8887009C8B89009E8C
          8B009F8E8D00A08F8E00A1908F00A2929100A5959300A4949300A7979500A493
          9200A8989700A9999800AA9B9A00A99A9900AB9C9B00AD9E9D00AEA09F00AEA0
          9E00AFA1A000B0A2A100B2A4A300B3A5A400B4A6A500B4A7A600B5A7A600B5A8
          A700B6A9A800B7AAA900B7ABAA00B8ABAA00B9ACAB00BAAEAD00BCB0AF00BEB2
          B100BFB4B30081C5E50084C7E50086C8E6008BCAE70089C9E7008ECBE70096CF
          E90097CFE90095CEE9009AD1EA009ED3EB00A1D4EC00A6D6EC00A9D7ED00AEDA
          EE00ADD9EE00AAD8ED00B2DBEF00B6DEF000B9DFF000C2B7B700C2B7B600C1B5
          B500C3B8B700C3B9B800C5BAB900C5BBBA00C6BBBB00C4B9B900C6BCBB00C8BE
          BD00C8BEBE00CBC2C100CBC2C200CCC3C200CCC3C300CFC6C500CFC7C600CFC6
          C600CDC4C300D0C8C700D1C9C800D2CACA00D3CBCA00D2CAC900D4CDCC00D4CC
          CC00D5CECD00D6CFCF00D7D0D000D8D1D100DAD3D300D9D3D200DCD6D500DBD5
          D500DED8D700DFD9D900DFDAD900C6E5F300CCE7F400CEE8F400D2EAF500D7EC
          F600D4EBF500DBEEF700DBEFF700D9EDF700DDEFF800DEF0F800E0DBDA00E1DC
          DB00E2DDDD00E4E0DF00E7E3E200E6E2E200E6E1E100E8E4E300E9E4E400EAE6
          E600EBE7E700E9E6E500EBE8E800ECE8E800EEEBEB00EFECEC00E6F3F900E7F4
          FA00E7F4F900E3F2F800EAF5FA00EDF7FB00EDF6FB00EEF7FB00F0EDED00F1EF
          EE00F2EFEF00F2F0F000F3F1F100F4F2F200F6F5F500F7F6F500F7F6F600F5F4
          F400F3F9FC00F1F8FC00F5FAFC00F6FBFD00F4F9FC00F9F7F700F8F7F700F9F8
          F800FAF9F900FBFAFA00F8FBFD00F9FCFD00F8FCFD00FBFDFE00FCFBFB00FCFC
          FC00FDFCFC00FDFDFD00FDFEFE00FEFDFD00FEFEFE00FFFFFF00FCFDFE00FCFC
          FB00FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFCE1B097726A666C7499B4E6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDF8C99F786C686C779FCCFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD564444444444444444A4FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDE37E4B0200000000000000000004559EEFFDFDFDFDFDFD
          FDFDFDFD524444444444444449F6FDFDFDFDFDFDFDFD6C4444444444444444B6
          FDFDFDFDFDFDFDFDFDFCC665100000000000000000001671D5FDFDFDFDFDFDFD
          FDFDEF4644444444444444444444444444444444444444444444A5FDFDFDEE44
          4444444444444444C9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF87D0D0000000000000000000000000000
          0018A5FDFDFDFDFDFDFDFDFD140000000000000004F6FDFDFDFDFDFDFDB20000
          00000000000000AEFDFDFDFDFDFDFDFDD15B0000000000000000000000000000
          0A7CF9FDFDFDFDFDFDFDED000000000000000000000000000000000000000000
          00009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE6540000000000000000
          00000000000000000000006EFCFDFDFDFDFDFDFD140000000000000004F6FDFD
          FDFDFDFDEE1C000000000000000000AEFDFDFDFDFDFDFC9E0A00000000000000
          0000000000000000000059E6FDFDFDFDFDFDED00000000000000000000000000
          000000000000000000009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF95800
          00000000000000000000000000000000000000007CFDFDFDFDFDFDFD14000000
          0000000004F6FDFDFDFDFDFD6C00000000000000000000AEFDFDFDFDFDFD7D01
          0000000000000000000000000000000000000054F1FDFDFDFDFDED0000000000
          0000000000000000000000000000000000009AFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFD980000000000000000000000000000000000000000000005CCFDFD
          FDFDFDFD140000000000000004F6FDFDFDFDFDB80200000000000000000000AE
          FDFDFDFDFDA3000000000000000000000000000000000000000000006CFDFDFD
          FDFDED00000000000000000000000000000000000000000000009AFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDF617000000000000000000000000000000000000
          00000000005EFDFDFDFDFDFD140000000000000004F6FDFDFDFDF14500000000
          00000000000000AEFDFDFDFDD40C000000000000000000000000000000000000
          0000000001C6FDFDFDFDED000000000000000000000000000000000000000000
          00009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAC0000000000000000000258
          747C704C00000000000000000004E3FDFDFDFDFD140000000000000004F6FDFD
          FDFD74000000000000000000000000AEFDFDFDFD60000000000000000000085F
          809F7B4800000000000000000057FDFDFDFDED0000000000000000001D484848
          48484848484848484848A9FDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD66000000
          000000000004B1FDFDFDFDFC7C000000000000000000A1FDFDFDFDFD14000000
          0000000004F6FDFDFDC904000000000000000000000000AEFDFDFDD202000000
          000000000042CDFDFDFDFDF970000000000000000001CFFDFDFDED0000000000
          00000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFD4B000000000000000066FDFDFDFDFDFDFB4600000000000000006CFD
          FDFDFDFD140000000000000004F6FDFDF74C00000000000000000000000000AE
          FDFDFD78000000000000000008CDFDFDFDFDFDFDFC4D00000000000000007EFD
          FDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFC0C0000000000000000A9FDFDFDFDFDFDFD6D0000
          00000000000057FDFDFDFDFD140000000000000004F7FDFD7D00000000000000
          00000000000000AEFDFDFD4E000000000000000065FDFDFDFDFDFDFDFDA80000
          0000000000005BFDFDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000005070707070707070707A4FDFDFDFDFDE4000000000000000000C8FDFD
          FDFDFDFDFD97000000000000000047FDFDFDFDFD14000000000000000DFCFDD1
          070000000000000000000000000000AEFDFDF0040000000000000000AEFDFDFD
          FDFDFDFDFDE300000000000000001BFDFDFDED000000000000000000B6FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDE50000000000000000000807070707070707
          0707CEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000A1FDFDFDFDFDDE00000000
          0000000000CBFDFDFDFDFDFDFD9A000000000000000019FDFDFDFDFD14000000
          0000000014FDFB55000000000000000000000000000000AEFDFDCB0000000000
          00000000E1FDFDFDFDFDFDFDFDFCCFCFCFCFCFCFCFCFD0FCFDFDED0000000000
          000000000C0E0E0E0E0E0E0E0E0E0E58FDFDFDFDFDFDE5000000000000000000
          00000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000000000000000000000000A1FDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD140000000000000042FD9800000000000000000000000000000000AE
          FDFDB000000000000000000AF9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDED000000000000000000000000000000000000000051FDFDFDFDFDFDE500
          000000000000000000000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A00000000000000000000000000
          0000000000A1FDFDFDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD14000000000000004AD40C000000000000005300
          00000000000000AEFDFDA1000000000000000011FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDED000000000000000000000000000000000000000051
          FDFDFDFDFDFDE500000000000000000000000000000000000000CDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000A1FDFDFDFDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000051590000
          000000000053980000000000000000AEFDFDA0000000000000000011FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED00000000000000000000000000
          0000000000000051FDFDFDFDFDFDE50000000000000000000000000000000000
          0000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000A1FDFDFDFDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          000000000B0000000000000008CA7E0000000000000000AEFDFDA60000000000
          0000000BFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED0000000000
          00000000000000000000000000000051FDFDFDFDFDFDE5000000000000000000
          00000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A0000000000000000485A5A5A5A5A5A5A5A5AB6FDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD140000000000000000000000000000007CFD780000000000000000AE
          FDFDB8000000000000000000E2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDED000000000000000000000000000000000000000051FDFDFDFDFDFDE500
          0000000000000000525A5A5A5A5A5A5A5A5ADEFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD1400000000000000000000000000004AF6FD7000
          00000000000000AEFDFDE2000000000000000000B3FDFDFDFDFDFDFDFDEE6F6E
          6E6E6E6E6E6E9BFDFDFDED0000000000000000004E565656565656565656566D
          FDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000000000000
          000005C8FDFD690000000000000000AEFDFDFD1D00000000000000006DFDFDFD
          FDFDFDFDFDC7000000000000000064FDFDFDED000000000000000000B6FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000000000000071FDFDFD640000000000000000AEFDFDFD6B00000000
          0000000012EEFDFDFDFDFDFDFD7900000000000000009AFDFDFDED0000000000
          00000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD1400000000000000000000000043F0FDFDFD640000000000000000AE
          FDFDFDB90000000000000000006DFDFDFDFDFDFDDE110000000000000001D4FD
          FDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000066A6A6A6A6
          A6A6A6A6A6A6A6AAFCFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD14000000000000000000000001B7FDFDFDFD6400
          00000000000000AEFDFDFDFD530000000000000000006ADFFCFDE49915000000
          000000000054FDFDFDFDED0000000000000000007AA6A6A6A6A6A6A6A6A6A6A6
          A6B2FDFDFDFDE50000000000000000007DA6A6A6A6A6A6A6A6A6A6A6B4FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000000007F9FDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000000000000
          69FDFDFDFDFD640000000000000000AEFDFDFDFDC60200000000000000000003
          181B0400000000000000000000B1FDFDFDFDED00000000000000000000000000
          00000000000000000045FDFDFDFDE50000000000000000000000000000000000
          000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000000007F9FDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000000019E4FDFDFDFDFD640000000000000000AEFDFDFDFDFD710000
          000000000000000000000000000000000000000059FCFDFDFDFDED0000000000
          000000000000000000000000000000000045FDFDFDFDE5000000000000000000
          0000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000000000000000000000000000007
          F9FDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD1400000000000000000000AEFDFDFDFDFDFD640000000000000000AE
          FDFDFDFDFDF758000000000000000000000000000000000000000013DEFDFDFD
          FDFDED0000000000000000000000000000000000000000000045FDFDFDFDE500
          00000000000000000000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A00000000000000000000000000
          0000000000000007F9FDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD1400000000000000000062FCFDFDFDFDFDFD6400
          00000000000000AEFDFDFDFDFDFDF05800000000000000000000000000000000
          00000AB9FDFDFDFDFDFDED000000000000000000000000000000000000000000
          0045FDFDFDFDE50000000000000000000000000000000000000000004DFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000000007F9FDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000000000000011E2FD
          FDFDFDFDFDFD640000000000000000AEFDFDFDFDFDFDFDF77305000000000000
          00000000000000000016B8FDFDFDFDFDFDFDED00000000000000000000000000
          00000000000000000045FDFDFDFDE50000000000000000000000000000000000
          000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000000007F9FDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000A8FDFDFDFDFDFDFDFD640000000000000000AEFDFDFDFDFDFDFDFD
          FDCB600400000000000000000000001377E6FDFDFDFDFDFDFDFDED0000000000
          000000000000000000000000000000000045FDFDFDFDE5000000000000000000
          0000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDACA3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A5
          FCFDFDEFA3A3A3A3A3A3A3A3A3E5FDFDFDFDFDFDFDD0A3A3A3A3A3A3A3A3ABFD
          FDFDFDFDA9A3A3A3A3A3A3A3ADFCFDFDFDFDFDFDFDFDC6A3A3A3A3A3A3A3A3DF
          FDFDFDFDFDFDFDFDFDFDFDDF965A1907050911475A78B4F7FDFDFDFDFDFDFDFD
          FDFDF7A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B0FDFDFDFDFFA4
          A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B3FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCF8F6F9FCFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE8DB
          DBDBDBDBDBDBDBDDFCFCDBDBDBDBDBDBDBDBDBE8FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFCE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1F6FDFD
          FDEEE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E7FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDDDDBDBDBDBDBDBDBDBE8FDF5DBDBDBDBDBDBDBDBDB
          EBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7400000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD361E1E1E1E1E1E1E1E22FCFA221E1E1E1E1E
          1E1E1E36FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFA231E1E1E1E
          1E1E1E1E35FDC41E1E1E1E1E1E1E1E1E86FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEA231E1E1E1E1E1E1E1E2D
          FCFC2D1E1E1E1E1E1E1E1E23EAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDC01E1E1E1E1E1E1E1E1E41FDEC1F1E1E1E1E1E1E1E1E2EFCFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC851E1E
          1E1E1E1E1E1E1E82FDFD821E1E1E1E1E1E1E1E1E85FCFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF5351E1E1E1E1E1E1E1E1E8FFDFC341E1E1E1E1E1E1E1E
          1E92FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDEB841E1E1E1E1E1E1E1E1E1EBEFDFDC01E1E1E1E1E1E1E1E1E1E84EBFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDA391E1E1E1E1E1E1E1E1E24E8FDFD8E
          1E1E1E1E1E1E1E1E1E208DFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC413E3E3E3E3E
          3E3E3E3E3E3E3E3E3E3E3C251E1E1E1E1E1E1E1E1E1E3BFCFDFDFC3B1E1E1E1E
          1E1E1E1E1E1E253B3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E41FDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDD83E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E38211E1E1E1E1E1E1E
          1E1E1E8AFDFDFDF22B1E1E1E1E1E1E1E1E1E1E2A3D3E3E3E3E3E3E3E3E3E3E3E
          3E3E3E3E88FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E26D7FD
          FDFDFDD6261E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDC21E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E2EF3FDFDFDFDBC201E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E22BDFDFDFDFDFDFDBD221E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E21FDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDC21E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2AD7FDFDFDFDFDFD901F1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC211E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E29BEFDFDFDFDFDFDFDFDBE291E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21FDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDC21E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2ED7FDFDFDFDFDFD
          FDFD93211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC211E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2040DDFDFDFDFDFDFDFDFDFDFDDB40
          201E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21FDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDC21E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2487
          F3FDFDFDFDFDFDFDFDFDFDC4391E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC3731313131313131313131313131313131313131353D8CD6FDFDFDFDFDFD
          FDFDFDFDFDFDFDFDD68C3D333131313131313131313131313131313131313136
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDD93131313131313131313131313131313131
          31313135418FE9FDFDFDFDFDFDFDFDFDFDFDFDFDFCC3873A3231313131313131
          31313131313131313131313182FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDC4842F23232F84C5FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBC402C222631
          8ADCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3851F1E1E1E1E1E1E1F84F3FD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          DB3A1E1E1E1E1E1E1E248EFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3381E1E1E1E
          1E1E1E1E1E1E38F4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDDA2B1E1E1E1E1E1E1E1E1E1E84FCFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD831E1E1E1E1E1E1E1E1E1E1E1E82FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFE311E1E1E1E1E1E1E1E1E1E1E1E8FFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDBF1E1E1E1E1E1E1E1E1E1E1E1E1E1EBFFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD8F1E1E1E1E1E1E1E1E1E
          1E1E1E1E25E8FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD811E1E1E1E1E1E1E1E1E1E1E1E1E1E
          81FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC2F1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E91FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC2A1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E2AFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDDC1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E3DFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          F2201E1E1E1E1E1E1E1E1E1E1E1E1E1E20F3FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDBE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2FFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDEB1F1E1E1E1E1E1E1E1E1E1E1E1E1E1E1EEBFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBD1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E30FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC281E1E1E1E1E1E1E1E1E1E1E1E1E1E
          28FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD71E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E39FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3F1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E3FFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFC2B1E1E1E1E1E1E1E1E1E1E1E1E1E1E8BFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDBB1E1E1E1E1E1E1E1E1E1E1E1E1E1EBBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD8A1E1E1E1E1E1E1E1E1E1E1E1E1E21DAFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC391E1E1E1E1E1E1E1E1E1E1E1E3AFCFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEA2A1E1E1E1E1E1E1E1E
          1E1E1E1E89FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDC2C1E1E1E1E1E1E1E1E1E1E2CDC
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBF
          231E1E1E1E1E1E1E1E1E1E39F5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDC361E1E1E
          1E1E1E1E1E36DCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDC32C1E1E1E1E1E1E1E1E81F2FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFA9436211E1E213894FAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF48D2E1F1E1E233DBDFCFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3D7D7F3FDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCEAD6DAFE
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7700000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE60000000000000000000000000000
          0000000000B1FDFDFD7B00000000000000000000000000000000000043FCFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDB3000000000000
          00000000000000000000000000C9FDFDFD9E0000000000000000000000000000
          0000000003E3FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD6500000000000000000000000000000000000005EFFDFDFDB9000000000000
          0000000000000000000000000096FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDCD040000000000000000000000000000000000004CFDFDFD
          FDF00700000000000000000000000000000000000018EEFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF14D000000000000000000000000000000
          0000000074FDFDFDFDFD580000000000000000000000000000000000000066FC
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF15E0000000000000000
          000000000000000000000001CEFDFDFDFDFDA100000000000000000000000000
          0000000000000079FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD35200
          0000000000000000000000000000000000000056FDFDFDFDFDFDF11500000000
          0000000000000000000000000000000063E4FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDF7C76A0A000000000000000000000000000000000000000000B7FDFDFDFD
          FDFDFD7F0000000000000000000000000000000000000000001179D1F9FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC1C14141414141414141414141414
          1414141414141414141414141414141414141414141414141414141414141414
          1414141414141414141509000000000000000000000000000000000000000000
          00005DFDFDFDFDFDFDFDFDF14200000000000000000000000000000000000000
          000000000C151414141414141414141414141414141414141414141414141414
          141414141414141414141414141414141414141414141414141414145BFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000DD5FDFDFDFDFDFDFDFDFDB40100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC060000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000A5FDFDFDFDFDFDFDFDFDFDFD710000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC06000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000073FDFDFDFDFDFDFD
          FDFDFDFDFDF85800000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC0600000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000064
          FCFDFDFDFDFDFDFDFDFDFDFDFDFDEE5100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000069F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE45400000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC060000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000037EFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          F164000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC06000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000001DB6FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFCA00E0000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC0600000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000B76EFFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDF670500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000001C
          78E2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCF6A0F
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC441A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A424C5E7DC7FBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDF1B373594A1D1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A5EFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDE7B3967671799BB8F0FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEF9D5203000000000000000A5CAAF8FD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF6801200000000000000
          00000000000043AAFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD04E00
          000000000000000000000000000000005FE7FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDB40F0000000000000000000000000000000000000046D3FDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDB40700000000000000000000000000000000000000
          000017D2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCD0E000000000000000000000000
          000000000000000000000043E6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF1480000000000
          000000000000000000000000000000000000000061FCFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD7C000000000000000000000000000000000000000000000000000000B1FDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDE30D00000000000000000000000000000000000000000000
          00000000004BFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7D000000000000000000000000000000
          0000000000000000000000000000B5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC4700000000000000
          0000000000000000000000000000000000000000000063FDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD3
          00000000000000000000000000000000000000000000000000000000000011F9
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDA1000000000000000000000000000000000000000000000000
          00000000000000D1FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7300000000000000000000000000000000
          000000000000000000000000000000AAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650000000000000000
          000000000000000000000000000000000000000000000095FDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD60
          000000000000000000000000000000000000000000000000000000000000007F
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFD67000000000000000000000000000000000000000000000000
          0000000000000096FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7100000000000000000000000000000000
          000000000000000000000000000000A9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA00000000000000000
          0000000000000000000000000000000000000000000000CBFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCE
          0000000000000000000000000000000000000000000000000000000000000EF8
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFC420000000000000000000000000000000000000000000000
          0000000000005FFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD77000000000000000000000000000000
          0000000000000000000000000000AFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE009000000000000
          00000000000000000000000000000000000000000046F9FDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD72000000000000000000000000000000000000000000000000000000A9FDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDEE42000000000000000000000000000000000000000000
          000000005BFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDC707000000000000000000000000
          00000000000000000000001CE2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA703000000
          0000000000000000000000000000000000000ECBFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDA7070000000000000000000000000000000000000014C8FDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDC7420000000000000000000000000000000000
          55DEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED720A00000000000000
          0000000000001598F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          E079430000000000000000014F98EFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFCD3A27569656A7BAAE0FCFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD}
        mmHeight = 17000
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 14000
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        AutoSize = False
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 1058
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        AutoSize = False
        Caption = 
          'SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e ' +
          '13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 6879
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        AutoSize = False
        Caption = 'Brasília  DF CEP 70.712-900 - (061)3329-1700 - www.funcef.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 10054
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        AutoSize = False
        Caption = 'CNPJ: 00.436.923/0001-90'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 13758
        mmWidth = 201084
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 179388
        mmTop = 25135
        mmWidth = 19844
        BandType = 0
      end
    end
    object ppBndDetalhe: TppDetailBand
      BeforePrint = ppBndDetalheBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 62442
      mmPrintPosition = 0
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Matrícula Pensionista: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 10848
        mmWidth = 33338
        BandType = 4
      end
      object ppLabel43: TppLabel
        UserName = 'Label101'
        Caption = 'Nome Pensionista: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 59002
        mmTop = 10848
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 35454
        mmTop = 10848
        mmWidth = 10964
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'NOMEBENEF'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 86784
        mmTop = 10848
        mmWidth = 51065
        BandType = 4
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        Caption = 'Data Nascimento Pensionista: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 140229
        mmTop = 10848
        mmWidth = 43656
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DATANASC'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 184150
        mmTop = 10848
        mmWidth = 14139
        BandType = 4
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = 'Benefício Desdobrado: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 18256
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'NOMEBENEFICIO'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3175
        mmLeft = 35719
        mmTop = 18256
        mmWidth = 102129
        BandType = 4
      end
      object ppLabel67: TppLabel
        UserName = 'Label601'
        Caption = 'DIB Anterior: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 94721
        mmTop = 14552
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DIBANT'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 113506
        mmTop = 14552
        mmWidth = 10414
        BandType = 4
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = 'DIB: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2381
        mmTop = 14552
        mmWidth = 6646
        BandType = 4
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'DIP: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 59002
        mmTop = 14552
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        AutoSize = True
        DataField = 'DIB'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 8467
        mmTop = 14552
        mmWidth = 14139
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'DIP'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 65088
        mmTop = 14552
        mmWidth = 14139
        BandType = 4
      end
      object ppLabel74: TppLabel
        UserName = 'Label74'
        Caption = 'Data Final: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 140229
        mmTop = 14552
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DATAFINAL'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 155840
        mmTop = 14552
        mmWidth = 15198
        BandType = 4
      end
      object ppLblValorTotal: TppLabel
        UserName = 'Label701'
        Caption = 'Valor Total: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 102129
        mmTop = 26723
        mmWidth = 13758
        BandType = 4
      end
      object ppLblValorAtual: TppLabel
        UserName = 'LblValorAtual'
        Caption = 'Valor Atual: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 128059
        mmTop = 26723
        mmWidth = 14288
        BandType = 4
      end
      object ppVlrValorTotal: TppDBText
        UserName = 'VlrValorTotal'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = ppDemonstrativo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2879
        mmLeft = 115094
        mmTop = 26723
        mmWidth = 9483
        BandType = 4
      end
      object ppVlrValorAtual: TppDBText
        UserName = 'VlrValorAtual'
        AutoSize = True
        DataField = 'VALORATUAL'
        DataPipeline = ppDemonstrativo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2879
        mmLeft = 141023
        mmTop = 26723
        mmWidth = 9483
        BandType = 4
      end
      object ppLblBaseDeficit: TppLabel
        UserName = 'LblValorAtual1'
        Caption = 'Base de Cálculo do Déficit: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 155311
        mmTop = 26723
        mmWidth = 32015
        BandType = 4
      end
      object ppVlrBaseDeficit: TppDBText
        UserName = 'TxtValorAtual1'
        AutoSize = True
        DataField = 'VLRBASEDEFICIT'
        DataPipeline = ppDemonstrativo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2879
        mmLeft = 185738
        mmTop = 26723
        mmWidth = 20870
        BandType = 4
      end
      object ppLblBSTotal: TppLabel
        UserName = 'LblBSTotal'
        Caption = 'BS Total: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 2646
        mmTop = 26723
        mmWidth = 11377
        BandType = 4
      end
      object ppVlrBSTotal: TppDBText
        UserName = 'TxtValorTotal1'
        AutoSize = True
        DataField = 'VLRBSTOTAL'
        DataPipeline = ppDemonstrativo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2879
        mmLeft = 13494
        mmTop = 26723
        mmWidth = 15833
        BandType = 4
      end
      object ppLblBSAtual: TppLabel
        UserName = 'LblBSAtual'
        Caption = 'BS Atual: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 26988
        mmTop = 26723
        mmWidth = 11113
        BandType = 4
      end
      object ppVlrBSAtual: TppDBText
        UserName = 'TxtValorTotal2'
        AutoSize = True
        DataField = 'VLRBSATUAL'
        DataPipeline = ppDemonstrativo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2879
        mmLeft = 38629
        mmTop = 26723
        mmWidth = 15875
        BandType = 4
      end
      object ppLblFABTotal: TppLabel
        UserName = 'LblFABTotal'
        Caption = 'FAB Total: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 51065
        mmTop = 26723
        mmWidth = 12700
        BandType = 4
      end
      object ppVlrFABTotal: TppDBText
        UserName = 'TxtValorTotal3'
        AutoSize = True
        DataField = 'VLRFABTOTAL'
        DataPipeline = ppDemonstrativo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2879
        mmLeft = 63236
        mmTop = 26723
        mmWidth = 17187
        BandType = 4
      end
      object ppLblFABAtual: TppLabel
        UserName = 'LblFABTotal1'
        Caption = 'FAB Atual: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 76729
        mmTop = 26723
        mmWidth = 13039
        BandType = 4
      end
      object ppVlrFabAtual: TppDBText
        UserName = 'VlrFabAtual'
        AutoSize = True
        DataField = 'VLRFABATUAL'
        DataPipeline = ppDemonstrativo
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2879
        mmLeft = 88900
        mmTop = 26723
        mmWidth = 17230
        BandType = 4
      end
      object ppLabel75: TppLabel
        UserName = 'Label75'
        Caption = 'Matrícula Titular: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 1588
        mmWidth = 24342
        BandType = 4
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'Nome Titular: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 59002
        mmTop = 1588
        mmWidth = 20638
        BandType = 4
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        Caption = 'Data Falecimento Titular: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 140229
        mmTop = 1588
        mmWidth = 35719
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 1058
        mmTop = 0
        mmWidth = 201084
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'IRRFISENTO'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 83873
        mmTop = 22225
        mmWidth = 6138
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Isento de IRRF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 61383
        mmTop = 22225
        mmWidth = 21696
        BandType = 4
      end
      object SubRelDivida: TppSubReport
        UserName = 'SubRelDivida'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelAcertos
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 51858
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Desdobramento de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 384
          Top = 232
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 10319
            mmPrintPosition = 0
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'Parcelamento da Dívida de Benefícios:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 4233
              mmTop = 1323
              mmWidth = 56092
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              Caption = 'Quantidade de Parcelas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 4233
              mmTop = 5292
              mmWidth = 35454
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label4'
              Caption = 'Valor da Parcela:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 52652
              mmTop = 5292
              mmWidth = 24342
              BandType = 1
            end
            object ppQtdParc: TppLabel
              UserName = 'QtdParc'
              AutoSize = False
              Caption = 'QtdParc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3260
              mmLeft = 40217
              mmTop = 5292
              mmWidth = 8467
              BandType = 1
            end
            object ppVlrParc: TppLabel
              UserName = 'VlrParc'
              Caption = 'VlrParc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3260
              mmLeft = 77788
              mmTop = 5292
              mmWidth = 9313
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOMETIT'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 80433
        mmTop = 1588
        mmWidth = 57415
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'MATRICULATIT'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 27517
        mmTop = 1588
        mmWidth = 10964
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DATAMORTE'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 176742
        mmTop = 1588
        mmWidth = 14139
        BandType = 4
      end
      object SubRelContrib: TppSubReport
        UserName = 'SubRelContrib'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelBenef
        TraverseAllData = False
        DataPipelineName = 'ppContribuicao'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 35190
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppContribuicao
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Desdobramento de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 392
          Top = 240
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppContribuicao'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand3: TppDetailBand
            BeforePrint = ppDetailBand3BeforePrint
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppShape8: TppShape
              UserName = 'Shape8'
              mmHeight = 4498
              mmLeft = 1588
              mmTop = 0
              mmWidth = 26458
              BandType = 4
            end
            object ppShape7: TppShape
              UserName = 'Shape7'
              mmHeight = 4498
              mmLeft = 27781
              mmTop = 0
              mmWidth = 137054
              BandType = 4
            end
            object ppShape3: TppShape
              UserName = 'Shape3'
              mmHeight = 4498
              mmLeft = 164571
              mmTop = 0
              mmWidth = 33338
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'MESREFERENCIA'
              DataPipeline = ppContribuicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppContribuicao'
              mmHeight = 3175
              mmLeft = 5821
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'NOME'
              DataPipeline = ppContribuicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppContribuicao'
              mmHeight = 3175
              mmLeft = 30427
              mmTop = 529
              mmWidth = 131234
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'VALORPREV'
              DataPipeline = ppContribuicao
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppContribuicao'
              mmHeight = 3175
              mmLeft = 166688
              mmTop = 529
              mmWidth = 28840
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup4: TppGroup
            BreakName = 'IDRESPONSAVEL'
            DataPipeline = ppContribuicao
            OutlineSettings.CreateNode = True
            UserName = 'Group4'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppContribuicao'
            object ppGroupHeaderBand4: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 7144
              mmPrintPosition = 0
              object ppShape2: TppShape
                UserName = 'Shape2'
                mmHeight = 5821
                mmLeft = 1588
                mmTop = 1588
                mmWidth = 196321
                BandType = 3
                GroupNo = 0
              end
              object ppLabel5: TppLabel
                UserName = 'Label5'
                Caption = 'Contribuições'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2646
                mmTop = 2117
                mmWidth = 24077
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand4: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup6: TppGroup
            BreakName = 'IDCONTRIBUICAO'
            DataPipeline = ppContribuicao
            OutlineSettings.CreateNode = True
            UserName = 'Group6'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppContribuicao'
            object ppGroupHeaderBand6: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 5556
              mmPrintPosition = 0
              object ppShape6: TppShape
                UserName = 'Shape6'
                mmHeight = 5556
                mmLeft = 164571
                mmTop = 0
                mmWidth = 33338
                BandType = 3
                GroupNo = 1
              end
              object ppLabel8: TppLabel
                UserName = 'Label8'
                AutoSize = False
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 166159
                mmTop = 1058
                mmWidth = 30163
                BandType = 3
                GroupNo = 1
              end
              object ppShape5: TppShape
                UserName = 'Shape5'
                mmHeight = 5556
                mmLeft = 27781
                mmTop = 0
                mmWidth = 137054
                BandType = 3
                GroupNo = 1
              end
              object ppLabel7: TppLabel
                UserName = 'LblNomeContrib1'
                Caption = 'Nome da Contribuição'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 33338
                mmTop = 1058
                mmWidth = 33867
                BandType = 3
                GroupNo = 1
              end
              object ppShape1: TppShape
                UserName = 'Shape1'
                mmHeight = 5556
                mmLeft = 1588
                mmTop = 0
                mmWidth = 26458
                BandType = 3
                GroupNo = 1
              end
              object ppLabel6: TppLabel
                UserName = 'Label6'
                Caption = 'Mês'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 5292
                mmTop = 1058
                mmWidth = 6350
                BandType = 3
                GroupNo = 1
              end
            end
            object ppGroupFooterBand6: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object SubRelAcertos: TppSubReport
        UserName = 'SubRelAcertos'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelAcaoJud
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 46302
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Desdobramento de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 456
          Top = 304
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand3: TppTitleBand
            BeforePrint = ppTitleBand3BeforePrint
            mmBottomOffset = 0
            mmHeight = 28575
            mmPrintPosition = 0
            object ppShape4: TppShape
              UserName = 'Shape4'
              mmHeight = 28046
              mmLeft = 1588
              mmTop = 0
              mmWidth = 196321
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Total de Acertos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 140759
              mmTop = 1852
              mmWidth = 27517
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Benefícios:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 150284
              mmTop = 9525
              mmWidth = 17727
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Contribuições:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 145521
              mmTop = 15875
              mmWidth = 22490
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Total:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 159279
              mmTop = 22225
              mmWidth = 8467
              BandType = 1
            end
            object lbl_total: TppLabel
              UserName = 'lbl_total'
              Caption = 'lbl_total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 169334
              mmTop = 22225
              mmWidth = 25665
              BandType = 1
            end
            object lbl_tot_contri: TppLabel
              UserName = 'lbl_tot_contri'
              Caption = 'lbl_tot_contri'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 169334
              mmTop = 15875
              mmWidth = 25929
              BandType = 1
            end
            object lbl_tot_benef: TppLabel
              UserName = 'lbl_tot_benef'
              Caption = 'lbl_tot_benef'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 169334
              mmTop = 9525
              mmWidth = 25665
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object SubRelBenef: TppSubReport
        UserName = 'SubRelBenef'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppBeneficio'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 30427
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = ppBeneficio
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Desdobramento de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 408
          Top = 256
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBeneficio'
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppHeaderBand2: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand6: TppDetailBand
            BeforePrint = ppDetailBand6BeforePrint
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppShpBenefLatE: TppShape
              UserName = 'ppShpBenefLatE'
              mmHeight = 5292
              mmLeft = 1588
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLblPercAtuDet: TppDBText
              UserName = 'LblPercAtuDet'
              DataField = 'PERCENTUAL_ATUAL'
              DataPipeline = ppBeneficio
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppBeneficio'
              mmHeight = 3175
              mmLeft = 38894
              mmTop = 1058
              mmWidth = 16669
              BandType = 4
            end
            object ppLblDifDet: TppDBText
              UserName = 'LblDifDet'
              DataField = 'DIFERENCA'
              DataPipeline = ppBeneficio
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBeneficio'
              mmHeight = 3175
              mmLeft = 130440
              mmTop = 1058
              mmWidth = 17198
              BandType = 4
            end
            object ppLblBenefDevDet: TppDBText
              UserName = 'LblBenefDevDet'
              DataField = 'BENEFDEVIDO'
              DataPipeline = ppBeneficio
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBeneficio'
              mmHeight = 3175
              mmLeft = 93663
              mmTop = 1058
              mmWidth = 16669
              BandType = 4
            end
            object ppLblBenefPagDet: TppDBText
              UserName = 'LblBenefPagDet'
              DataField = 'BENEFPAGO'
              DataPipeline = ppBeneficio
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBeneficio'
              mmHeight = 3175
              mmLeft = 112184
              mmTop = 1058
              mmWidth = 16669
              BandType = 4
            end
            object ppLblTotalDet: TppDBText
              UserName = 'LblTotalDet'
              DataField = 'VALORTOTAL'
              DataPipeline = ppBeneficio
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBeneficio'
              mmHeight = 3175
              mmLeft = 149225
              mmTop = 1058
              mmWidth = 20638
              BandType = 4
            end
            object ppLblPercAntDet: TppDBText
              UserName = 'LblPercAntDet'
              DataField = 'PERCENTUAL_ANTERIOR'
              DataPipeline = ppBeneficio
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppBeneficio'
              mmHeight = 3175
              mmLeft = 20108
              mmTop = 1058
              mmWidth = 16669
              BandType = 4
            end
            object ppLblFABDevDet: TppDBText
              UserName = 'LblFABDevDet'
              DataField = 'VALORFAB'
              DataPipeline = ppBeneficio
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBeneficio'
              mmHeight = 3175
              mmLeft = 75142
              mmTop = 1058
              mmWidth = 16933
              BandType = 4
            end
            object ppLblDeficitDet: TppDBText
              UserName = 'LblDeficitDet'
              DataField = 'VLRDEFICITHST'
              DataPipeline = ppBeneficio
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBeneficio'
              mmHeight = 3175
              mmLeft = 171715
              mmTop = 1058
              mmWidth = 25665
              BandType = 4
            end
            object ppShpBenefDet: TppShape
              UserName = 'ppShpBenefDet'
              mmHeight = 265
              mmLeft = 1588
              mmTop = 5027
              mmWidth = 196321
              BandType = 4
            end
            object ppShpBenefLatD: TppShape
              UserName = 'ppShpBenefLatD'
              mmHeight = 5292
              mmLeft = 197644
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'LblPercAntDet1'
              DataField = 'MES'
              DataPipeline = ppBeneficio
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppBeneficio'
              mmHeight = 3175
              mmLeft = 4498
              mmTop = 1058
              mmWidth = 12171
              BandType = 4
            end
            object ppLblBSDevDet: TppDBText
              UserName = 'LblBSDevDet'
              DataField = 'VALORBS'
              DataPipeline = ppBeneficio
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBeneficio'
              mmHeight = 3175
              mmLeft = 57415
              mmTop = 1323
              mmWidth = 16404
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup3: TppGroup
            BreakName = 'IDPESSOA'
            DataPipeline = ppBeneficio
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group3'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppBeneficio'
            object ppGroupHeaderBand3: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 11906
              mmPrintPosition = 0
              object ppShpMes: TppShape
                UserName = 'ShpMes'
                mmHeight = 9790
                mmLeft = 1588
                mmTop = 2116
                mmWidth = 17992
                BandType = 3
                GroupNo = 0
              end
              object ppShpPercAnt: TppShape
                UserName = 'Shape101'
                mmHeight = 9790
                mmLeft = 19315
                mmTop = 2116
                mmWidth = 18785
                BandType = 3
                GroupNo = 0
              end
              object ppShpPercAtu: TppShape
                UserName = 'ShpPercAtu'
                mmHeight = 9790
                mmLeft = 37835
                mmTop = 2116
                mmWidth = 18785
                BandType = 3
                GroupNo = 0
              end
              object ppShpBSDev: TppShape
                UserName = 'ShpBSDev'
                mmHeight = 9790
                mmLeft = 56356
                mmTop = 2116
                mmWidth = 17992
                BandType = 3
                GroupNo = 0
              end
              object ppShpFABDev: TppShape
                UserName = 'ShpFABDev'
                mmHeight = 9790
                mmLeft = 74083
                mmTop = 2116
                mmWidth = 18785
                BandType = 3
                GroupNo = 0
              end
              object ppShpBenefDev: TppShape
                UserName = 'ShpBenefDev'
                mmHeight = 9790
                mmLeft = 92604
                mmTop = 2116
                mmWidth = 18785
                BandType = 3
                GroupNo = 0
              end
              object ppShpBenefPag: TppShape
                UserName = 'ShpBenefPag'
                mmHeight = 9790
                mmLeft = 111125
                mmTop = 2116
                mmWidth = 18785
                BandType = 3
                GroupNo = 0
              end
              object ppShpDif: TppShape
                UserName = 'ShpDif'
                mmHeight = 9790
                mmLeft = 129646
                mmTop = 2116
                mmWidth = 18785
                BandType = 3
                GroupNo = 0
              end
              object ppShpTotal: TppShape
                UserName = 'ShpTotal'
                mmHeight = 9790
                mmLeft = 148167
                mmTop = 2116
                mmWidth = 22490
                BandType = 3
                GroupNo = 0
              end
              object ppShpDeficit: TppShape
                UserName = 'Shape17'
                mmHeight = 9790
                mmLeft = 170392
                mmTop = 2116
                mmWidth = 27517
                BandType = 3
                GroupNo = 0
              end
              object ppLblMes: TppLabel
                UserName = 'LblMes'
                Caption = 'Mês'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 7144
                mmTop = 2646
                mmWidth = 6879
                BandType = 3
                GroupNo = 0
              end
              object ppLblPercAnt: TppLabel
                UserName = 'LblPercAnt'
                AutoSize = False
                Caption = 'Percentual Anterior'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                WordWrap = True
                mmHeight = 8467
                mmLeft = 20373
                mmTop = 2646
                mmWidth = 16669
                BandType = 3
                GroupNo = 0
              end
              object ppLblPercAtu: TppLabel
                UserName = 'LblPercAtu'
                AutoSize = False
                Caption = 'Percentual Atual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                WordWrap = True
                mmHeight = 8467
                mmLeft = 38894
                mmTop = 2646
                mmWidth = 16669
                BandType = 3
                GroupNo = 0
              end
              object ppLblDif: TppLabel
                UserName = 'LblDif'
                AutoSize = False
                Caption = 'Diferença'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                WordWrap = True
                mmHeight = 8467
                mmLeft = 130440
                mmTop = 2646
                mmWidth = 17198
                BandType = 3
                GroupNo = 0
              end
              object ppLblBenefDev: TppLabel
                UserName = 'LblBenefDev'
                AutoSize = False
                Caption = 'Benefício Devido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                WordWrap = True
                mmHeight = 8467
                mmLeft = 93663
                mmTop = 2646
                mmWidth = 16669
                BandType = 3
                GroupNo = 0
              end
              object ppLblBenefPag: TppLabel
                UserName = 'LblBenefPag'
                AutoSize = False
                Caption = 'Benefício Pago'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                WordWrap = True
                mmHeight = 8467
                mmLeft = 112184
                mmTop = 2646
                mmWidth = 16669
                BandType = 3
                GroupNo = 0
              end
              object ppLblTotal: TppLabel
                UserName = 'Label201'
                AutoSize = False
                Caption = 'Valor Total Benefício'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                WordWrap = True
                mmHeight = 8467
                mmLeft = 149225
                mmTop = 2646
                mmWidth = 20638
                BandType = 3
                GroupNo = 0
              end
              object ppLblBSDev: TppLabel
                UserName = 'RellblValorTotal1'
                AutoSize = False
                Caption = 'BS Devido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                WordWrap = True
                mmHeight = 8467
                mmLeft = 57150
                mmTop = 2646
                mmWidth = 16404
                BandType = 3
                GroupNo = 0
              end
              object ppLblFABDev: TppLabel
                UserName = 'LblFABDev'
                AutoSize = False
                Caption = 'FAB Devido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                WordWrap = True
                mmHeight = 8467
                mmLeft = 75142
                mmTop = 2646
                mmWidth = 16933
                BandType = 3
                GroupNo = 0
              end
              object ppLblDeficit: TppLabel
                UserName = 'LblDeficit'
                AutoSize = False
                Caption = 'Base de Cálculo do Déficit'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                WordWrap = True
                mmHeight = 8467
                mmLeft = 171450
                mmTop = 2646
                mmWidth = 25665
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand3: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object SubRelSemacerto: TppSubReport
        UserName = 'SubRelSemacerto'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelDivida
        TraverseAllData = False
        Visible = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 57415
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Desdobramento de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 456
          Top = 232
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand5: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 11377
            mmPrintPosition = 0
            object ppShape9: TppShape
              UserName = 'Shape9'
              mmHeight = 9790
              mmLeft = 1588
              mmTop = 0
              mmWidth = 196321
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              AutoSize = False
              Caption = 'O benefício não possui acertos a serem lançados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 5292
              mmTop = 2646
              mmWidth = 189442
              BandType = 1
            end
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Situação do Benefício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 140229
        mmTop = 18256
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'SITBENEF'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 172773
        mmTop = 18256
        mmWidth = 9144
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'NUMEROPROCESSO'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 30956
        mmTop = 22225
        mmWidth = 9398
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Número Processo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 22225
        mmWidth = 28046
        BandType = 4
      end
      object lblPerfilInv: TppLabel
        UserName = 'lblPerfilInv'
        Caption = 'Perfil Investimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2381
        mmTop = 5556
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'NOMEPERFIL'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3260
        mmLeft = 32279
        mmTop = 5556
        mmWidth = 18415
        BandType = 4
      end
      object SubRelAcaoJud: TppSubReport
        UserName = 'SubRelAcaoJud'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelContrib
        TraverseAllData = False
        DataPipelineName = 'ppAcJudDeficit'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 40746
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport6: TppChildReport
          AutoStop = False
          DataPipeline = ppAcJudDeficit
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Desdobramento de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 460
          Top = 244
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppAcJudDeficit'
          object ppTitleBand6: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 11642
            mmPrintPosition = 0
            object ppShapeTitleBandAcJudDeficit1: TppShape
              UserName = 'Shape302'
              mmHeight = 5292
              mmLeft = 1588
              mmTop = 1587
              mmWidth = 196321
              BandType = 1
            end
            object ppLabelTitleBandAcJudDeficit1: TppLabel
              UserName = 'LabelTitleBandAcJudDeficit1'
              Caption = 'Informações da Ação Judicial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 2381
              mmTop = 2381
              mmWidth = 194469
              BandType = 1
            end
            object ppShapeTitleBandAcJudDeficit2: TppShape
              UserName = 'ShapeTitleBandAcJudDeficit2'
              mmHeight = 5027
              mmLeft = 1588
              mmTop = 6615
              mmWidth = 196321
              BandType = 1
            end
            object ppLabelAcJudANOMESFIMACJUDDEFICIT: TppLabel
              UserName = 'LabelAcJudANOMESFIMACJUDDEFICIT'
              AutoSize = False
              Caption = 'Ano/Mês Fim'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 176213
              mmTop = 7408
              mmWidth = 19844
              BandType = 1
            end
            object ppLabelAcJudANOMESINIACJUDDEFICIT: TppLabel
              UserName = 'Label1'
              AutoSize = False
              Caption = 'Ano/Mês Início'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 151077
              mmTop = 7408
              mmWidth = 21960
              BandType = 1
            end
            object ppLabelAcJudPERCACJUDDEFICIT: TppLabel
              UserName = 'LabelAcJudPERCACJUDDEFICIT'
              AutoSize = False
              Caption = 'Percentual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 132821
              mmTop = 7408
              mmWidth = 15875
              BandType = 1
            end
            object ppLabelAcJudNOME: TppLabel
              UserName = 'LabelAcJudNOME'
              Caption = 'Contribuição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3704
              mmTop = 7408
              mmWidth = 17463
              BandType = 1
            end
            object ppLineTitleBandAcJudDeficit3: TppLine
              UserName = 'LineTitleBandAcJudDeficit3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 174361
              mmTop = 6615
              mmWidth = 265
              BandType = 1
            end
            object ppLineTitleBandAcJudDeficit2: TppLine
              UserName = 'LineTitleBandAcJudDeficit2'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 149754
              mmTop = 6615
              mmWidth = 265
              BandType = 1
            end
            object ppLineTitleBandAcJudDeficit1: TppLine
              UserName = 'LineTitleBandAcJudDeficit1'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 131763
              mmTop = 6615
              mmWidth = 265
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppShapeDetailBandAcJudDeficit1: TppShape
              UserName = 'ShapeDetailBandAcJudDeficit1'
              mmHeight = 4498
              mmLeft = 1323
              mmTop = 0
              mmWidth = 196322
              BandType = 4
            end
            object ppLineDetailBandAcJudDeficit3: TppLine
              UserName = 'LineDetailBandAcJudDeficit3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 174096
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLineDetailBandAcJudDeficit2: TppLine
              UserName = 'LineDetailBandAcJudDeficit2'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 149490
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLineDetailBandAcJudDeficit1: TppLine
              UserName = 'LineDetailBandAcJudDeficit1'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 131498
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBTextAcJudANOMESINIACJUDDEFICIT: TppDBText
              UserName = 'DBTextAcJudANOMESINIACJUDDEFICIT'
              DataField = 'ANOMESINIACJUDDEFICIT'
              DataPipeline = ppAcJudDeficit
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppAcJudDeficit'
              mmHeight = 2910
              mmLeft = 150813
              mmTop = 794
              mmWidth = 21960
              BandType = 4
            end
            object ppDBTextAcJudANOMESFIMACJUDDEFICIT: TppDBText
              UserName = 'DBText101'
              DataField = 'ANOMESFIMACJUDDEFICIT'
              DataPipeline = ppAcJudDeficit
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppAcJudDeficit'
              mmHeight = 2910
              mmLeft = 175948
              mmTop = 794
              mmWidth = 19845
              BandType = 4
            end
            object ppDBTextAcJudPERCACJUDDEFICIT: TppDBText
              UserName = 'HCPvlrPag1'
              DataField = 'PERCACJUDDEFICIT'
              DataPipeline = ppAcJudDeficit
              DisplayFormat = ',0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppAcJudDeficit'
              mmHeight = 2910
              mmLeft = 132557
              mmTop = 794
              mmWidth = 15875
              BandType = 4
            end
            object ppDBTextAcJudNOME: TppDBText
              UserName = 'DBTextAcJudNOME'
              DataField = 'NOME'
              DataPipeline = ppAcJudDeficit
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppAcJudDeficit'
              mmHeight = 2910
              mmLeft = 3440
              mmTop = 794
              mmWidth = 123296
              BandType = 4
            end
          end
          object ppSummaryBand6: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      BeforePrint = ppFooterBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 182298
        mmTop = 12435
        mmWidth = 13589
        BandType = 8
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'FUNCEF/DIBEN/GEBEN/CMABE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 84519
        mmTop = 15346
        mmWidth = 32046
        BandType = 8
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        Caption = 'Demonstrativo de Desdobramento de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 1058
        mmTop = 12700
        mmWidth = 49107
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 12171
        mmWidth = 201084
        BandType = 8
      end
      object lbl_usuario: TppLabel
        UserName = 'lbl_usuario'
        Caption = 'lbl_usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 138377
        mmTop = 5292
        mmWidth = 53711
        BandType = 8
      end
      object lblNomUsuario: TppLine
        UserName = 'lblNomUsuario'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 138113
        mmTop = 4763
        mmWidth = 54240
        BandType = 8
      end
      object ppLabelLote: TppLabel
        UserName = 'LabelLote'
        Caption = 'LabelLote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 2646
        mmTop = 1058
        mmWidth = 11472
        BandType = 8
      end
      object ppLabelVersao: TppLabel
        UserName = 'LabelVersao'
        Caption = 'LabelVersao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 2646
        mmTop = 4233
        mmWidth = 14393
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMEROPROCESSO'
      DataPipeline = ppDemonstrativo
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonstrativo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand1AfterPrint
        mmBottomOffset = 0
        mmHeight = 1323
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'IDPESSOA'
      DataPipeline = ppDemonstrativo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonstrativo'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDBENEFICIO'
      DataPipeline = ppDemonstrativo
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonstrativo'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryDemonstra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       BF.NUMEROPROCESSO,'
      '       BF.IDTITULAR,'
      '       BF.IDPESSOA, '
      '       DPT.MATRICULA AS MATRICULATIT, '
      '       DP.MATRICULA,'
      '       P.NOME AS NOMEBENEF, '
      '       PT.NOME AS NOMETIT,'
      '       PT.DATAMORTE,'
      '       PF.DATANASC,'
      ''
      '       BF.DATAINICIOFUND AS DIB,'
      '       B.NOME NOMEBENEFICIO,'
      '       BF.DATAINICIO AS DIP,'
      '       BF.DIBBENEFANT AS DIBANT,'
      '       BF.DATAFINAL,        '
      '       DECODE(PF.FLGISENTOIRRF, 1, '#39'SIM'#39', '#39'NÃO'#39') AS IRRFISENTO,'
      '       SB.DESCRICAO AS SITBENEF,'
      ''
      '       BF.VLRBSTOTAL,'
      '       BF.VLRBSATUAL,'
      '       BF.VLRFABTOTAL,'
      '       BF.VLRFABATUAL,'
      '       BF.VALORTOTAL,'
      '       BF.VALORATUAL,'
      '       BF.VLRBASEDEFICIT,'
      '       BF.IDBENEFICIO,'
      '       BF.IDPESSJUR,'
      '       BF.IDPLANOORIGEM,'
      '       BF.SEQPROPOSTA,'
      '       BF.IDPLANOPREV,'
      '       BF.FONTEPAGADORA,'
      '       BP.FLGAPRESENTABSFAB,'
      '       BP.FLGAPRESENTADEFICIT,'
      '       PI.NOME AS NOMEPERFIL'
      ''
      '  FROM BENEFBFCIARIO BF'
      '       JOIN ELEGPATRO DPT ON DPT.IDPESSOA = BF.IDTITULAR'
      
        '                         and dpt.idpessjur = bf.idpessjur   -- S' +
        'IG32303'
      '                         '
      '       JOIN DEPENTIT DP ON BF.IDPESSOA = DP.IDPESSOA'
      '                       AND BF.IDTITULAR = DP.IDTITULAR'
      '       JOIN PESSOA P ON P.IDPESSOA = BF.IDPESSOA'
      ''
      '       JOIN (SELECT P1.NOME, P1.IDPESSOA, PFT.DATAMORTE'
      '               FROM PESSOA P1, PESSOAFISICA PFT'
      '              WHERE P1.IDPESSOA = PFT.IDPESSOA'
      '            ) PT ON PT.IDPESSOA = BF.IDTITULAR'
      ''
      '       JOIN BENEFICIO B ON BF.IDBENEFICIO = B.IDBENEFICIO'
      
        '       JOIN SITBENEFICIO SB ON SB.IDSITBENEFICIO = BF.IDSITBENEF' +
        'ICIO'
      ''
      '       LEFT JOIN PESSOAFISICA PF ON PF.IDPESSOA = BF.IDPESSOA'
      
        '       LEFT JOIN BENEFPLANPREV BP ON BP.IDPLANOPREV = BF.IDPLANO' +
        'PREV'
      '            AND BP.IDBENEFICIO = B.IDBENEFICIO'
      ''
      
        '       LEFT JOIN PERFILINVEST PI ON PI.IDPERFILINVEST = BF.IDPER' +
        'FILINVEST'
      ''
      ' WHERE BF.IDSITBENEFICIO IN (1,2,3)'
      '   --AND BF.IDTPPAGTOBENEFIC = 1'
      '   AND BF.NUMEROPROCESSO in (:NUMEROPROCESSO)'
      '   AND BF.IDTITULAR = :IDTITULAR'
      '   AND BF.IDPESSOA <> BF.IDTITULAR'
      ''
      ' ORDER BY  1, 2, 3, 4'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 17
    Top = 330
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = '913669'
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '403463'
      end>
  end
  object dsDemonstra: TDataSource
    AutoEdit = False
    DataSet = qryDemonstra
    Left = 17
    Top = 259
  end
  object qryDivida: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'select * from CONTROLEDIVIDABENEFICIO'
      ' where flgquitado = 0'
      '   and saldodevedoratual > 0'
      '   and idpessoa = :idpessoa'
      '   and idtitular = :idtitular'
      '   and idbeneficio = :idbeneficio'
      '   and idplanoprev = :idplanoprev')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 17
    Top = 378
    ParamData = <
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'idtitular'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'idbeneficio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'idplanoprev'
        ParamType = ptInput
      end>
  end
  object qryDemoContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT P.NOME  AS RECEBEDOR, H.IDPESSOA AS IDRESPONSAVE' +
        'L,'
      '       CO.NOME,'
      '       H.MESREFERENCIA,'
      
        '       DECODE(H.FLGDEVOLUCAO, 1, H.VALORESPERADO, -H.VALORESPERA' +
        'DO) AS VALORPREV,'
      '       0 FLGDESCONTO,'
      '       H.FLGDEVOLUCAO,'
      '       BT.IDBENEFICIO,'
      '       CO.IDCONTRIBUICAO'
      'FROM   HSTCONTRIBPREV H'
      
        '       INNER JOIN BENEFXTAXA B ON (B.IDCONTRIBUICAO = H.IDCONTRI' +
        'BUICAO)'
      
        '       INNER JOIN CONTRIBUICAO CO ON (CO.IDCONTRIBUICAO = H.IDCO' +
        'NTRIBUICAO)'
      '       INNER JOIN PESSOA P ON (P.IDPESSOA = H.IDPESSOA)'
      
        '       INNER JOIN BFCIARIOTITPLAN BT ON (BT.IDRESPONSAVEL = H.ID' +
        'PESSOA)'
      
        '                                    AND (BT.IDPESSJUR     = H.ID' +
        'PESSJUR)'
      
        '                                    AND (BT.IDPLANOPREV   = H.ID' +
        'PLANOPREV)'
      
        '                                    AND (BT.IDBENEFICIO   = B.ID' +
        'BENEFICIO)'
      'WHERE  H.IDLOTE          = :IDLOTE'
      'AND    H.IDPESSJUR       = :IDPESSJUR'
      'AND    BT.IDTITULAR      = :IDTITULAR'
      'AND    H.IDPESSOA        = :IDPESSOA'
      'AND    B.IDBENEFICIO     = :IDBENEFICIO'
      'AND    H.TRGDTINCLUSAO   >= :DTDESDOBRA'
      'AND    H.SEQPROPOSTA     = 1'
      'AND    BT.SEQPROPOSTA    = 1'
      ''
      'ORDER BY H.IDPESSOA, CO.IDCONTRIBUICAO, H.MESREFERENCIA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 102
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTDESDOBRA'
        ParamType = ptUnknown
      end>
  end
  object dsDemoContrib: TDataSource
    AutoEdit = False
    DataSet = qryDemoContrib
    Left = 103
    Top = 264
  end
  object qryDemoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       HSTBENF.MESREFERENCIA AS MES,'
      ''
      '       BF.IDPESSOA,'
      '       BF.IDBENEFICIO,'
      '       BF.IDPESSJUR,'
      '       BF.IDPLANOORIGEM,'
      '       BF.FONTEPAGADORA,'
      ''
      '       BF.VLRBSTOTAL,'
      '       BF.VLRBSATUAL,'
      '       BF.VLRFABTOTAL,'
      '       BF.VLRFABATUAL,'
      
        '       NVL(HBFVLRTOTAL.VALORTOTAL,HSTBENF.VALORTOTAL) AS VALORTO' +
        'TAL,'
      '       BF.VALORATUAL,'
      '       BF.VLRBASEDEFICIT,'
      ''
      '       BTT.PERCENTUAL AS PERCENTUAL_ATUAL,'
      ''
      '       (SELECT MAX(PERCENTUAL)'
      '          FROM HSTPERCGRUPO HG'
      '         WHERE HG.IDPESSJUR = BF.IDPESSJUR'
      '           AND HG.IDTITULAR = BF.IDTITULAR'
      '           AND HG.IDPLANOORIGEM = BF.IDPLANOORIGEM '
      '           AND HG.IDPESSOA = BF.IDPESSOA'
      '           AND HG.SEQPROPOSTA = BF.SEQPROPOSTA'
      '           AND HG.IDPLANOPREV = BF.IDPLANOPREV '
      '           AND HG.IDBENEFICIO = BF.IDBENEFICIO '
      '           AND HG.NUMEROPROCESSO = BF.NUMEROPROCESSO'
      
        '           AND TO_CHAR(HG.DATAFIM, '#39'YYYY/MM'#39') = :ANOMES ) AS PER' +
        'CENTUAL_ANTERIOR,'
      ''
      '       HSTBENF.VALORBS,'
      '       HSTBENF.VALORFAB,'
      '       NVL(HSTBENF.VALORPREV, 0) AS  DIFERENCA,'
      ''
      '       NVL(HBFPAG.BENEFPAGO,0) AS BENEFPAGO,'
      
        '       DECODE(HSTBENF.FLGENVIADO,8,HSTBENF.VALORPREV,9,HSTBENF.V' +
        'ALORPREV,NVL(HBFPAG.BENEFPAGO,0)) +  NVL(HSTBENF.VALORPREV,0) AS' +
        ' BENEFDEVIDO,'
      '       HSTBENF.VLRBASEDEFICIT AS VLRDEFICITHST,'
      '       BP.FLGAPRESENTABSFAB,'
      '       BP.FLGAPRESENTADEFICIT'
      ''
      '  FROM BENEFBFCIARIO BF'
      '       JOIN BENEFICIO B ON BF.IDBENEFICIO = B.IDBENEFICIO'
      '       JOIN BFCIARIOTITPLAN BTT ON BTT.IDPESSJUR = BF.IDPESSJUR'
      '                               AND BTT.IDTITULAR = BF.IDTITULAR '
      
        '                               AND BTT.IDPLANOORIGEM = BF.IDPLAN' +
        'OORIGEM'
      '                               AND BTT.IDPESSOA = BF.IDPESSOA'
      
        '                               AND BTT.SEQPROPOSTA = BF.SEQPROPO' +
        'STA '
      
        '                               AND BTT.IDPLANOPREV = BF.IDPLANOP' +
        'REV '
      
        '                               AND BTT.IDBENEFICIO = BF.IDBENEFI' +
        'CIO'
      ''
      
        '       LEFT JOIN BENEFPLANPREV BP ON BP.IDPLANOPREV = BF.IDPLANO' +
        'PREV'
      '            AND BP.IDBENEFICIO = B.IDBENEFICIO'
      ''
      
        '       LEFT JOIN (SELECT HST.MESREFERENCIA, HST.VALORBS, HST.VAL' +
        'ORFAB, HST.VLRBASEDEFICIT, HST.VALORTOTAL,'
      
        '                         DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORP' +
        'REV, HST.VALORPREV) AS VALORPREV,'
      
        '                         HST.SEQPROPOSTA, HST.IDPESSOA, HST.IDPL' +
        'ANOORIGEM, HST.IDTITULAR,  HST.FLGENVIADO,'
      
        '                         HST.IDPESSJUR, HST.IDLOTE, HST.NUMEROPR' +
        'OCESSO, HST.IDBENEFICIO, HST.IDPLANOPREV'
      '                    FROM HSTBENEFBFCIARIO HST'
      '             ) HSTBENF'
      '             ON HSTBENF.IDPLANOPREV = BF.IDPLANOPREV'
      '             AND HSTBENF.IDBENEFICIO = BF.IDBENEFICIO'
      '             AND HSTBENF.NUMEROPROCESSO = BF.NUMEROPROCESSO'
      '             AND HSTBENF.NUMEROPROCESSO = :NUMEROPROCESSO'
      '             AND HSTBENF.IDLOTE         = :IDLOTE'
      '             AND HSTBENF.SEQPROPOSTA = 1'
      '             AND HSTBENF.IDPESSJUR  = BF.IDPESSJUR'
      '             AND HSTBENF.IDTITULAR = BF.IDTITULAR'
      '             AND HSTBENF.IDPLANOORIGEM = BF.IDPLANOORIGEM'
      '             AND HSTBENF.IDPESSOA = BF.IDPESSOA'
      '             AND HSTBENF.SEQPROPOSTA = BF.SEQPROPOSTA'
      ''
      
        '       LEFT JOIN (SELECT HST1.VALORTOTAL, HST1.MESREFERENCIA, HS' +
        'T1.NUMEROPROCESSO, HST1.IDTITULAR, '
      
        '                         HST1.IDPESSOA, HST1.IDBENEFICIO, HST1.I' +
        'DPLANOPREV, HST1.IDPLANOORIGEM, HST1.SEQPROPOSTA'
      '                  FROM HSTBENEFBFCIARIO HST1'
      '                   WHERE HST1.NUMEROPROCESSO = :NUMEROPROCESSO'
      '                   AND   HST1.IDTITULAR = :IDTITULAR'
      '                   AND   HST1.IDPESSOA = :IDPESSOA'
      '                   AND   HST1.IDBENEFICIO = :IDBENEFICIO'
      '                   AND   HST1.TRGDTINCLUSAO =                   '
      '                         (SELECT MAX(HHP.Trgdtinclusao)'
      '                            FROM HSTBENEFBFCIARIO HHP'
      
        '                           WHERE HHP.NUMEROPROCESSO = HST1.NUMER' +
        'OPROCESSO'
      '                             AND HHP.IDTITULAR = HST1.IDTITULAR'
      '                             AND HHP.IDPESSOA = HST1.IDPESSOA'
      '                             AND HHP.IDLOTE <> :IDLOTE'
      
        '                             AND HHP.MESREFERENCIA = HST1.MESREF' +
        'ERENCIA'
      
        '                             AND HHP.IDBENEFICIO = HST1.IDBENEFI' +
        'CIO))  HBFVLRTOTAL ON '
      '                             '
      
        '                                 HBFVLRTOTAL.NUMEROPROCESSO = HS' +
        'TBENF.NUMEROPROCESSO'
      
        '                             AND HBFVLRTOTAL.IDTITULAR = HSTBENF' +
        '.IDTITULAR'
      
        '                             AND HBFVLRTOTAL.IDPESSOA = HSTBENF.' +
        'IDPESSOA'
      
        '                             AND HBFVLRTOTAL.MESREFERENCIA = HST' +
        'BENF.MESREFERENCIA'
      
        '                             AND HBFVLRTOTAL.IDPLANOPREV   = HST' +
        'BENF.IDPLANOPREV'
      
        '                             AND HBFVLRTOTAL.IDPLANOORIGEM = HST' +
        'BENF.IDPLANOORIGEM'
      
        '                             AND HBFVLRTOTAL.IDBENEFICIO = HSTBE' +
        'NF.IDBENEFICIO     '
      
        '                             AND HBFVLRTOTAL.SEQPROPOSTA = HSTBE' +
        'NF.SEQPROPOSTA'
      ''
      
        '       LEFT  JOIN (SELECT HP.IDPESSOA, HP.IDPESSJUR, HP.SEQPROPO' +
        'STA, HP.IDTITULAR, HP.MESREFERENCIA,'
      
        '                          HP.IDPLANOORIGEM, HP.IDBENEFICIO, HP.I' +
        'DPLANOPREV,'
      
        '                          NVL(SUM(DECODE(HP.FLGDEVOLUCAO, 1, -HP' +
        '.VLBENEFPGTO, HP.VLBENEFPGTO)),0) AS BENEFPAGO'
      '                     FROM HSTBENEFBFCIARIO HP'
      '                    WHERE HP.NUMEROPROCESSO = :NUMEROPROCESSO'
      '                      AND HP.IDTITULAR = :IDTITULAR'
      '                      AND HP.IDPESSOA = :IDPESSOA'
      '                      AND HP.IDBENEFICIO = :IDBENEFICIO'
      
        '                      AND ((HP.IDLOTE <> :IDLOTE) OR ((HP.IDLOTE' +
        ' = :IDLOTE) AND (HP.FLGENVIADO <> 1)) )'
      
        '                    GROUP BY HP.IDPESSOA, HP.IDPESSJUR, HP.SEQPR' +
        'OPOSTA, HP.IDTITULAR, HP.MESREFERENCIA,'
      
        '                             HP.IDPLANOORIGEM, HP.IDBENEFICIO, H' +
        'P.IDPLANOPREV'
      ''
      
        '                  ) HBFPAG   ON HBFPAG.IDPLANOPREV = BF.IDPLANOP' +
        'REV'
      
        '                            AND HBFPAG.IDBENEFICIO = BF.IDBENEFI' +
        'CIO'
      '                            AND HBFPAG.IDPESSJUR  = BF.IDPESSJUR'
      '                            AND HBFPAG.IDTITULAR = BF.IDTITULAR'
      
        '                            AND HBFPAG.IDPLANOORIGEM = BF.IDPLAN' +
        'OORIGEM'
      '                            AND HBFPAG.IDPESSOA = BF.IDPESSOA'
      
        '                            AND HBFPAG.SEQPROPOSTA = BF.SEQPROPO' +
        'STA'
      
        '                            AND HBFPAG.MESREFERENCIA = HSTBENF.M' +
        'ESREFERENCIA'
      
        '                            AND HBFPAG.IDBENEFICIO = HSTBENF.IDB' +
        'ENEFICIO'
      
        '                            AND HBFPAG.IDPLANOORIGEM = HSTBENF.I' +
        'DPLANOORIGEM'
      
        '                            AND HBFPAG.IDPESSOA = HSTBENF.IDPESS' +
        'OA'
      ''
      ' WHERE BF.IDSITBENEFICIO IN (1,2,3)'
      '   --AND BF.IDTPPAGTOBENEFIC = 1'
      '   AND BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      '   AND BF.IDTITULAR = :IDTITULAR'
      '   AND BF.IDPESSOA = :IDPESSOA'
      '   AND BF.IDBENEFICIO = :IDBENEFICIO'
      ' ORDER BY 1'
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 182
    Top = 332
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object dsDemoBenef: TDataSource
    AutoEdit = False
    DataSet = qryDemoBenef
    Left = 183
    Top = 264
  end
  object ppContribuicao: TppBDEPipeline
    DataSource = dsDemoContrib
    UserName = 'ppContribuicao'
    Left = 104
    Top = 208
    object ppContribuicaoppField1: TppField
      FieldAlias = 'RECEBEDOR'
      FieldName = 'RECEBEDOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppContribuicaoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESPONSAVEL'
      FieldName = 'IDRESPONSAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppContribuicaoppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppContribuicaoppField4: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 3
    end
    object ppContribuicaoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPREV'
      FieldName = 'VALORPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppContribuicaoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGDESCONTO'
      FieldName = 'FLGDESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppContribuicaoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGDEVOLUCAO'
      FieldName = 'FLGDEVOLUCAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppContribuicaoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppContribuicaoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRIBUICAO'
      FieldName = 'IDCONTRIBUICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object ppBeneficio: TppBDEPipeline
    DataSource = dsDemoBenef
    UserName = 'ppBeneficio'
    Left = 184
    Top = 208
  end
  object QryBuscaContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CON.IDPLANOPREV,     CON.IDCONTRIBUICAO,'
      '  CON.IDEVENTOGERADOR, CON.IDREGRAVALIDAASS, CTB.FLGPAGADOR'
      'FROM'
      '  CONTPREVEVENTO CON, CONTPREV CTB'
      'WHERE'
      '  (CON.IDEVENTOGERADOR = :IDEVENTOGERADOR)   AND'
      '--  (CTB.FLGPAGADOR      = '#39'R'#39')                AND'
      '  (CON.IDCONTRIBUICAO  = CTB.IDCONTRIBUICAO) AND'
      '  (CON.IDPLANOPREV     = CTB.IDPLANOPREV)    AND'
      '  (CON.IDPLANOPREV     = :IDPLANOPREV)   '
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryDemonstraAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       BF.IDTITULAR,'
      '       BF.IDPESSOA, '
      '       DPT.MATRICULA AS MATRICULATIT, '
      '       DP.MATRICULA,'
      '       P.NOME AS NOMEBENEF, '
      '       PT.NOME AS NOMETIT,'
      '       PT.DATAMORTE,'
      '       PF.DATANASC,'
      ''
      '       BF.DATAINICIOFUND AS DIB,'
      '       B.NOME NOMEBENEFICIO,'
      '       BF.DATAINICIO AS DIP,'
      '       BF.DIBBENEFANT AS DIBANT,'
      '       BF.DATAFINAL,        '
      '       DECODE(PF.FLGISENTOIRRF, 1, '#39'SIM'#39', '#39'NÃO'#39') AS IRRFISENTO,'
      '       SB.DESCRICAO AS SITBENEF,'
      ''
      '       BF.VLRBSTOTAL,'
      '       BF.VLRBSATUAL,'
      '       BF.VLRFABTOTAL,'
      '       BF.VLRFABATUAL,'
      '       BF.VALORTOTAL,'
      '       BF.VALORATUAL,'
      '       BF.VLRBASEDEFICIT,'
      ''
      '       BF.IDBENEFICIO,'
      '       BF.IDPESSJUR,'
      '       BF.IDPLANOORIGEM,'
      '       BF.SEQPROPOSTA,'
      '       BF.IDPLANOPREV,'
      '       BF.NUMEROPROCESSO,'
      '       BF.FONTEPAGADORA,'
      '       BP.FLGAPRESENTABSFAB,'
      '       BP.FLGAPRESENTADEFICIT,'
      '       PI.NOME AS NOMEPERFIL'
      ''
      '  FROM BENEFBFCIARIO BF'
      '       JOIN ELEGPATRO DPT ON DPT.IDPESSOA = BF.IDTITULAR'
      
        '                         and dpt.idpessjur = bf.idpessjur   -- S' +
        'IG32303'
      ''
      '       JOIN DEPENTIT DP ON BF.IDPESSOA = DP.IDPESSOA'
      '                       AND BF.IDTITULAR = DP.IDTITULAR'
      '       JOIN PESSOA P ON P.IDPESSOA = BF.IDPESSOA'
      ''
      '       JOIN (SELECT P1.NOME, P1.IDPESSOA, PFT.DATAMORTE'
      '               FROM PESSOA P1, PESSOAFISICA PFT'
      '              WHERE P1.IDPESSOA = PFT.IDPESSOA'
      '            ) PT ON PT.IDPESSOA = BF.IDTITULAR'
      ''
      '       JOIN BENEFICIO B ON BF.IDBENEFICIO = B.IDBENEFICIO'
      
        '       JOIN SITBENEFICIO SB ON SB.IDSITBENEFICIO = BF.IDSITBENEF' +
        'ICIO'
      ''
      '       LEFT JOIN PESSOAFISICA PF ON PF.IDPESSOA = BF.IDPESSOA'
      
        '       LEFT JOIN BENEFPLANPREV BP ON BP.IDPLANOPREV = BF.IDPLANO' +
        'PREV'
      '            AND BP.IDBENEFICIO = B.IDBENEFICIO'
      ''
      
        '       LEFT JOIN PERFILINVEST PI ON PI.IDPERFILINVEST = BF.IDPER' +
        'FILINVEST'
      ''
      ' WHERE BF.IDSITBENEFICIO IN (1,2,3)'
      '   --AND BF.IDTPPAGTOBENEFIC = 1'
      '   AND BF.NUMEROPROCESSO in (&NUMEROPROCESSO)'
      '   AND BF.IDTITULAR = :IDTITULAR'
      '   AND BF.IDPESSOA <> BF.IDTITULAR'
      ''
      ' ORDER BY 1, 2, 3'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 81
    Top = 394
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '3333'
      end>
  end
  object qryAcJudDeficit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CO.IDCONTRIBUICAO, CO.NOME'
      '      ,AC.PERCACJUDDEFICIT '
      '      ,AC.ANOMESINIACJUDDEFICIT'
      '      ,AC.ANOMESFIMACJUDDEFICIT'
      '  FROM CONTRIBUICAO CO'
      '      ,CONTRIBNUCLEOACJUDDEFICIT AC'
      ' WHERE AC.IDCONTRIBUICAO = CO.IDCONTRIBUICAO'
      'UNION'
      'SELECT DISTINCT CO.IDCONTRIBUICAO, CO.NOME'
      '      ,AC.PERCACJUDDEFICIT '
      '      ,AC.ANOMESINIACJUDDEFICIT'
      '      ,AC.ANOMESFIMACJUDDEFICIT'
      '  FROM CONTRIBUICAO CO'
      '      ,CONTRIBPARTPACJUDDEFICIT AC'
      ' WHERE AC.IDCONTRIBUICAO = CO.IDCONTRIBUICAO'
      ' ORDER BY 1, 4')
    ValidateWithMask = True
    Left = 844
    Top = 392
    object qryAcJudDeficitIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryAcJudDeficitNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryAcJudDeficitPERCACJUDDEFICIT: TFloatField
      FieldName = 'PERCACJUDDEFICIT'
    end
    object qryAcJudDeficitANOMESINIACJUDDEFICIT: TStringField
      FieldName = 'ANOMESINIACJUDDEFICIT'
      Size = 7
    end
    object qryAcJudDeficitANOMESFIMACJUDDEFICIT: TStringField
      FieldName = 'ANOMESFIMACJUDDEFICIT'
      Size = 7
    end
  end
  object dsAcJudDeficit: TwwDataSource
    AutoEdit = False
    DataSet = qryAcJudDeficit
    Left = 844
    Top = 360
  end
  object ppAcJudDeficit: TppBDEPipeline
    DataSource = dsAcJudDeficit
    UserName = 'ppAcJudDeficit'
    Left = 844
    Top = 328
    object ppAcJudDeficitppField1: TppField
      FieldAlias = 'IDCONTRIBUICAO'
      FieldName = 'IDCONTRIBUICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField3: TppField
      FieldAlias = 'PERCACJUDDEFICIT'
      FieldName = 'PERCACJUDDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField4: TppField
      FieldAlias = 'ANOMESINIACJUDDEFICIT'
      FieldName = 'ANOMESINIACJUDDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField5: TppField
      FieldAlias = 'ANOMESFIMACJUDDEFICIT'
      FieldName = 'ANOMESFIMACJUDDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
end
