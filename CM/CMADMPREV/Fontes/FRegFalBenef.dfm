inherited FrmRegFalBenef: TFrmRegFalBenef
  Left = 184
  Top = 247
  HelpContext = 160083
  BorderStyle = bsSingle
  Caption = 'Registro de Falecimento de Beneficiário'
  ClientHeight = 357
  ClientWidth = 729
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 729
    Height = 318
    object Label1: TLabel
      Left = 22
      Top = 217
      Width = 122
      Height = 13
      Caption = 'Nome do Beneficiário'
    end
    object SB1: TSpeedButton
      Left = 489
      Top = 230
      Width = 22
      Height = 23
      Hint = 'Procura Beneficiário'
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
      ParentShowHint = False
      ShowHint = True
    end
    object wwDBGrid1: TwwDBGrid
      Left = 1
      Top = 180
      Width = 727
      Height = 137
      Selected.Strings = (
        'NOME'#9'25'#9'Benefício'
        'DESCRICAO'#9'15'#9'Situação'#9'F'
        'VALORTOTAL'#9'10'#9'Valor ~Total'
        'VALORATUAL'#9'10'#9'Valor ~Atual'
        'DATAINICIO'#9'12'#9'Data de ~Início'
        'DATAFINAL'#9'12'#9'Data ~Final'
        'ULTMESPREPARO'#9'7'#9'Último ~Pagamento')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DsBenefBfciario
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 3
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
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 727
      Height = 32
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'Registro de Falecimento de Beneficiário'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object pnlTitular: TPanel
      Left = 1
      Top = 33
      Width = 727
      Height = 86
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object Label13: TLabel
        Left = 311
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label6: TLabel
        Left = 7
        Top = 43
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 311
        Top = 43
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 7
        Top = 4
        Width = 37
        Height = 13
        Caption = 'Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 440
        Top = 4
        Width = 77
        Height = 13
        Caption = 'Processo No.'
      end
      object pnlBotaoProcurar: TPanel
        Left = 618
        Top = 1
        Width = 108
        Height = 84
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 4
        object bbtnProcurar: TBitBtn
          Left = 6
          Top = 7
          Width = 99
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
      end
      object DBEdit4: TDBEdit
        Left = 7
        Top = 18
        Width = 300
        Height = 21
        Color = clMenu
        DataField = 'NOMETITULAR'
        DataSource = DsBenefBfciario
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit5: TDBEdit
        Left = 7
        Top = 57
        Width = 300
        Height = 21
        Color = clMenu
        DataField = 'NOMEPLANO'
        DataSource = DsBenefBfciario
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit6: TDBEdit
        Left = 311
        Top = 18
        Width = 121
        Height = 21
        Color = clMenu
        DataField = 'MATRICULA'
        DataSource = DsBenefBfciario
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit7: TDBEdit
        Left = 311
        Top = 57
        Width = 300
        Height = 21
        Color = clMenu
        DataField = 'NOMEPATRO'
        DataSource = DsBenefBfciario
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit8: TDBEdit
        Left = 440
        Top = 18
        Width = 121
        Height = 21
        Color = clMenu
        DataField = 'NUMEROPROCESSO'
        DataSource = DsBenefBfciario
        ReadOnly = True
        TabOrder = 5
      end
    end
    object pnlSubTitulo: TPanel
      Left = 1
      Top = 119
      Width = 727
      Height = 61
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 2
      object lblTitulo: TLabel
        Left = 7
        Top = 6
        Width = 213
        Height = 13
        Caption = 'Registrar Falecimento do Beneficiário'
      end
      object dbNomeBeneficiario: TDBText
        Left = 75
        Top = 21
        Width = 328
        Height = 17
        DataField = 'NOMEDEPENDENTE'
        DataSource = DsBenefBfciario
      end
      object Label5: TLabel
        Left = 418
        Top = 6
        Width = 118
        Height = 13
        Caption = 'Data de Falecimento'
      end
      object EdDtFalecimento: TCMDateTimePicker
        Left = 418
        Top = 21
        Width = 125
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
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 554
        Top = 1
        Width = 172
        Height = 59
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object BtEncerraBeneficio: TBitBtn
          Left = 7
          Top = 4
          Width = 162
          Height = 25
          Caption = 'Encerrar Beneficios'
          Enabled = False
          TabOrder = 0
          OnClick = BtEncerraBeneficioClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333000003333333333F777773FF333333008877700
            33333337733FFF773F33330887000777033333733F777FFF73F330880F9F9F07
            703337F37733377FF7F33080F00000F07033373733777337F73F087F0091100F
            77037F3737333737FF7F08090919110907037F737F3333737F7F0F0F0999910F
            07037F737F3333737F7F0F090F99190908037F737FF33373737F0F7F00FF900F
            780373F737FFF737F3733080F00000F0803337F73377733737F330F80F9F9F08
            8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
            3333333773FFFF77333333333000003333333333377777333333}
          NumGlyphs = 2
        end
        object bbtnRequerBenef: TBitBtn
          Left = 7
          Top = 31
          Width = 162
          Height = 25
          Caption = 'Requerer Benefícios'
          Enabled = False
          TabOrder = 1
          OnClick = bbtnRequerBenefClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
            0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
            00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
            00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
            F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
            F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
            FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
            0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
            00337777FFFF77FF7733EEEE0000000003337777777777777333}
          NumGlyphs = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 318
    Width = 729
    inherited tb97Fundo: TToolbar97
      Left = 345
      DockPos = 345
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 176
      DockPos = 176
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 461
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MSBeneficiarioOLD: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Beneficiário'
    Colunas.Strings = (
      'DEPENTIT.MATRICULA'
      'ELEGPATRO.MATRICULA'
      'TIT.NOME'
      'DEP.NOME'
      'DEP.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula do Beneficiário'
      'Matrícula do Titular'
      'Nome do Titular'
      'Nome do Beneficiário'
      'CPF do Beneficiário')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA TIT'
      'PESSOA DEP'
      'DEPENTIT'
      'PESSOAFISICA'
      'ELEGPATRO')
    CamposChave.Strings = (
      'DEPENTIT.IDPESSOA'
      'TIT.NOME'
      'DEP.NOME'
      'DEPENTIT.IDTITULAR'
      'DEP.NUMDOCUMENTO'
      'PESSOAFISICA.DATAMORTE')
    Filtro.Strings = (
      'DEPENTIT.IDTITULAR=TIT.IDPESSOA'
      'DEPENTIT.IDPESSOA=DEP.IDPESSOA'
      'DEPENTIT.IDDEPENDENCIA <> '#39'PRP'#39
      'DEPENTIT.IDPESSOA=PESSOAFISICA.IDPESSOA'
      'ELEGPATRO.IDPESSOA = DEPENTIT.IDTITULAR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '40'
      '40'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 100
    Top = 512
  end
  object QryBenefBfciario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PTIT.NOME         AS NOMETITULAR,'
      '  PDEP.NOME         AS NOMEDEPENDENTE,'
      '  PDEP.NUMDOCUMENTO AS CPFDEPEN,'
      '  PT.NOME           AS NOMEPATRO,'
      '  PL.NOME           AS NOMEPLANO,'
      
        '  PF.DATAMORTE,        EL.MATRICULA,         BEN.NOME,          ' +
        '    SIT.DESCRICAO,'
      
        '  BNF.IDPLANOPREV,     BNF.IDPESSJUR,        BNF.IDTITULAR,     ' +
        '    BNF.IDPESSOA,'
      
        '  BNF.IDBENEFICIO,     BNF.IDSITBENEFICIO,   BNF.NUMEROPROCESSO,' +
        '    BNF.SEQPROPOSTA,'
      
        '  BNF.VALORTOTAL,      BNF.VALORATUAL,       BNF.VALORCOTAS,    ' +
        '    BNF.DATAINICIO,'
      
        '  BNF.DATAFINAL,       BNF.IDPLANOORIGEM,    BNF.ULTMESPREPARO, ' +
        '    BNF.FLGDATAPREVISTA,'
      
        '  DECODE(BNF.FLGDATAPREVISTA,1,BNF.DATAFINALPREVISTA, DATAFINAL)' +
        ' AS DATAFINALGRAVA,'
      '  BNF.IDPERFILINVEST, BNF.IDPLANPREVCONTAB'
      'FROM'
      
        '  PESSOA PTIT, PESSOA PDEP, PESSOA PT, PESSOAFISICA PF, ELEGPATR' +
        'O EL,'
      '  BENEFBFCIARIO BNF,  PROCESSOBENEF PRB,  BENEFICIO BEN,'
      '  SITBENEFICIO SIT, PLANPREV PL'
      'WHERE'
      '  (BNF.IDPESSOA       = :IDPESSOA)          AND'
      '  (BNF.NUMEROPROCESSO = PRB.NUMEROPROCESSO) AND'
      '  (BNF.IDBENEFICIO    = BEN.IDBENEFICIO)    AND'
      '  (BNF.IDSITBENEFICIO = SIT.IDSITBENEFICIO) AND'
      '  (PTIT.IDPESSOA      = BNF.IDTITULAR)      AND'
      '  (PF.IDPESSOA        = BNF.IDPESSOA)       AND'
      '  (PDEP.IDPESSOA      = BNF.IDPESSOA)       AND'
      '  (PT.IDPESSOA        = BNF.IDPESSJUR)      AND'
      '  (PL.IDPLANOPREV     = BNF.IDPLANOPREV)    AND'
      '  (EL.IDPESSJUR       = BNF.IDPESSJUR)      AND'
      '  (EL.IDPESSOA        = BNF.IDTITULAR)'
      '')
    ValidateWithMask = True
    Left = 87
    Top = 283
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '525674'
      end>
  end
  object DsBenefBfciario: TwwDataSource
    DataSet = QryBenefBfciario
    Left = 95
    Top = 350
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 140
    Top = 281
  end
  object MSBeneficiario: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Beneficiário Falecido'
    Colunas.Strings = (
      'EL.MATRICULA'
      'DT.MATRICULA'
      'PES.NOME'
      'PD.NOME'
      'P.NUMEROPROCESSO'
      'BF.NOME'
      'P.DTEVENTO'
      'PP.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Matrícula do Titular'
      'Matrícula Beneficiário'
      'Nome do Titular'
      'Nome Beneficiário'
      'Nº do Processo'
      'Nome do Benefício'
      'Data do Evento'
      'Nº Inscrição Titular')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
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
      'PARTPREVPLAN PP'
      'DEPENTIT DT'
      'PESSOA PD'
      'PESSOAFISICA PF')
    CamposChave.Strings = (
      'P.NUMEROPROCESSO'
      'B.IDTITULAR'
      'B.SEQPROPOSTA'
      'B.IDPESSJUR'
      'B.IDPLANOPREV'
      'EL.MATRICULA'
      'B.IDPLANOORIGEM'
      'B.IDPESSOA'
      'PF.DATAMORTE')
    Filtro.Strings = (
      'P.NUMEROPROCESSO = B.NUMEROPROCESSO'
      'B.IDTITULAR = PES.IDPESSOA'
      'BF.IDBENEFICIO = B.IDBENEFICIO'
      'BPL.IDBENEFICIO = B.IDBENEFICIO'
      'BPL.IDPLANOPREV = B.IDPLANOPREV'
      
        '((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND (BPL.FL' +
        'GPAGAINSS = 1)))'
      'EL.IDPESSOA = B.IDTITULAR'
      'EL.IDPESSJUR = B.IDPESSJUR'
      'P.IDSITPROCESSO IN (1,2,3,9)'
      'PP.IDPESSJUR = EL.IDPESSJUR'
      'PP.IDPESSOA = EL.IDPESSOA'
      'PP.FLGDESATIVADO = 0'
      'DT.IDTITULAR = B.IDTITULAR'
      'DT.IDPESSOA  = B.IDPESSOA'
      'DT.IDPESSOA = PD.IDPESSOA'
      'PF.IDPESSOA = B.IDPESSOA'
      'DT.IDDEPENDENCIA <> '#39'PRP'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '30'
      '30'
      '15'
      '20'
      '10'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 7
    Top = 281
  end
end
