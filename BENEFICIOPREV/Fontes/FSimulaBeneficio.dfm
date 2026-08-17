inherited frmSimulaBeneficio: TfrmSimulaBeneficio
  Left = 16
  Top = 85
  HelpContext = 160075
  Caption = 'Simulação de Benefício'
  ClientHeight = 416
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 377
    object TwCons: TTreeWzd
      Left = 1
      Top = 1
      Width = 182
      Height = 375
      Align = alLeft
      Color = clGray
      BevelInner = bvLowered
      BevelWidth = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Etapa.Caption.Strings = (
        'Selecionar Participante/Beneficiário'
        'Demonstrativo de Resultado'
        'Selecionar Benefício Desejado'
        'Confirmar Requerimento')
      Etapa.Forma = stRoundSquare
      Etapa.LinhaWidth = 1
      Etapa.Top = 25
      Etapa.Espaco = 15
      Etapa.Quantidade = 4
      Etapa.BorderWidth = 1
      Etapa.Left = 10
      Etapa.Identacao = 30
      Etapa.Height = 30
      Etapa.Width = 20
      Etapa.BoderColor = clNavy
      Etapa.BrushColor = clWhite
      Etapa.Imagem.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777744777777777777746647777777777746666477777777746666664777
        77774666E66664777777666E7E6664777777E6E777E6664777777E77777E6664
        777777777777E6664777777777777E6664777777777777E6664777777777777E
        6664777777777777E6647777777777777E6677777777777777E7}
      Etapa.Pos = 2
    end
    object BtnAnterior: TBitBtn
      Tag = 8
      Left = 13
      Top = 343
      Width = 75
      Height = 25
      Caption = 'Anteriror'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnAnteriorClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88880666666666088888788888F88878F880E6666F6666
        608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
        66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
        66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
        660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
        6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
        8888888778FFFF77888888888000008888888888877777888888}
      NumGlyphs = 2
    end
    object BtnProximo: TBitBtn
      Tag = 9
      Left = 93
      Top = 343
      Width = 75
      Height = 25
      Caption = 'Próximo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnProximoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88880666666666088888788888F88878F880E6666F6666
        608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
        66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
        66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
        660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
        6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
        8888888778FFFF77888888888000008888888888877777888888}
      NumGlyphs = 2
    end
    object pnlDireita: TPanel
      Left = 183
      Top = 1
      Width = 568
      Height = 375
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object pnlTitulo: TPanel
        Left = 0
        Top = 0
        Width = 568
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Simulação de Benefícios - Matrícula : xxxx'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnlSubTitulo: TPanel
        Left = 0
        Top = 25
        Width = 568
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Etapa 1'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object pgctrlEtapa: TPageControl
        Left = 0
        Top = 50
        Width = 568
        Height = 325
        ActivePage = tbsEtapa4
        Align = alClient
        TabOrder = 2
        object tbsEtapa1: TTabSheet
          Caption = 'tbsEtapa1'
          object Bevel1: TBevel
            Left = 0
            Top = 0
            Width = 560
            Height = 297
            Align = alClient
          end
          object Label4: TLabel
            Left = 12
            Top = 11
            Width = 69
            Height = 13
            Caption = 'Participante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 12
            Top = 51
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 219
            Top = 51
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 12
            Top = 126
            Width = 100
            Height = 13
            Caption = 'Número Processo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 12
            Top = 162
            Width = 56
            Height = 13
            Caption = 'Benefício'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 219
            Top = 126
            Width = 22
            Height = 13
            Caption = 'DIB'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 12
            Top = 200
            Width = 68
            Height = 13
            Caption = 'Beneficiário'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 12
            Top = 90
            Width = 55
            Height = 13
            Caption = 'Matrícula'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 219
            Top = 90
            Width = 228
            Height = 13
            Caption = 'Situação Atual na Fundação (Categoria)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 12
            Top = 239
            Width = 177
            Height = 13
            Caption = 'Simular Benefícios do Plano ...'
          end
          object bbtnProcurar: TBitBtn
            Left = 362
            Top = 18
            Width = 91
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
          object lblParticipante: TStaticText
            Left = 12
            Top = 27
            Width = 334
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object lblPatro: TStaticText
            Left = 12
            Top = 65
            Width = 199
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object lblPlano: TStaticText
            Left = 219
            Top = 65
            Width = 234
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object lblNUmProc: TStaticText
            Left = 12
            Top = 140
            Width = 199
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object lblDIB: TStaticText
            Left = 219
            Top = 140
            Width = 234
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
          end
          object lblBeneficio: TStaticText
            Left = 12
            Top = 176
            Width = 445
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
          end
          object lblBeneficiario: TStaticText
            Left = 12
            Top = 214
            Width = 445
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
          end
          object lblMatricula: TStaticText
            Left = 12
            Top = 104
            Width = 199
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
          end
          object lblSituacaoAtual: TStaticText
            Left = 219
            Top = 104
            Width = 234
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
          end
          object dblkpcmbPlano: TwwDBLookupCombo
            Left = 12
            Top = 252
            Width = 445
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Plano'#9'F')
            LookupTable = qryPlano
            LookupField = 'IDPLANOPREV'
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
        end
        object tbsEtapa2: TTabSheet
          Caption = 'tbsEtapa2'
          ImageIndex = 1
          object memResult: TMemo
            Left = 0
            Top = 0
            Width = 560
            Height = 297
            Align = alClient
            Color = clScrollBar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object tbsEtapa3: TTabSheet
          Caption = 'tbsEtapa3'
          ImageIndex = 2
        end
        object tbsEtapa4: TTabSheet
          Caption = 'tbsEtapa4'
          ImageIndex = 3
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 377
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 13
    Top = 371
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Pessoa'
    Colunas.Strings = (
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PES.NOME'
      'PF.DATANASC'
      'PES.NUMDOCUMENTO'
      'BF.NOME'
      'P.DTEVENTO'
      'BENEF.NOME'
      'P.NUMEROPROCESSO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'D'
      'C'
      'C'
      'D'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula'
      'Nº de Inscrição'
      'Nome do Participante'
      'Data de Nascimento'
      'CPF do Participante'
      'Benefício Requerido'
      'Data do Evento'
      'Nome do Beneficiário'
      'Nº do Processo')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSOBENEF P'
      'BENEFBFCIARIO B'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'PESSOA PES'
      'BENEFPLANPREV BPL'
      'BENEFICIO BF'
      'PESSOA PAT'
      'PLANPREV PL'
      'PESSOA BENEF'
      'SITPART SP'
      'PESSOAFISICA PF')
    CamposChave.Strings = (
      'PP.IDPESSOA'
      'PP.IDPESSOA'
      'PP.SEQPROPOSTA'
      'PP.IDPESSJUR'
      'PP.IDPLANOPREV'
      'PES.NOME'
      'BF.NOME'
      'PP.IDSITPART'
      'EL.IDSITFUNC'
      'PP.IDSITPLANOPREV'
      'B.FLGPOSSUIACOMPINSS'
      'B.DATAINICIOFUND'
      'PAT.NOME'
      'PL.NOME'
      'P.DTEVENTO'
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'B.DATAINICIOINSS'
      'B.DATAFINAL'
      'B.IDBENEFICIO'
      'B.DATAINICIO'
      'B.IDPESSOA'
      'BENEF.NOME'
      'P.NUMEROPROCESSO'
      'SP.FLGINTERNO')
    Filtro.Strings = (
      '( PP.IDPESSJUR        = EL.IDPESSJUR )'
      '( PP.IDPESSOA         = EL.IDPESSOA )'
      '( PES.IDPESSOA        = EL.IDPESSOA )'
      '( PAT.IDPESSOA        = PP.IDPESSJUR )'
      '( PL.IDPLANOPREV      = PP.IDPLANOPREV )'
      '( B.IDPESSJUR(+)      = PP.IDPESSJUR )'
      '( B.IDPLANOPREV(+)    = PP.IDPLANOPREV )'
      '( B.IDTITULAR(+)      = PP.IDPESSOA )'
      '( B.SEQPROPOSTA(+)    = PP.SEQPROPOSTA )'
      '( P.NUMEROPROCESSO(+) = B.NUMEROPROCESSO )'
      '( BPL.IDPLANOPREV(+)  = B.IDPLANOPREV )'
      '( BPL.IDBENEFICIO(+)  = B.IDBENEFICIO )'
      '( BF.IDBENEFICIO(+)   = B.IDBENEFICIO )'
      
        '( (BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND (BPL.F' +
        'LGPAGAINSS = 1))  OR (BPL.FLGREFERENCIA IS NULL ) )'
      '( BENEF.IDPESSOA(+)   = B.IDPESSOA            )'
      '( SP.IDSITPART = PP.IDSITPART )'
      '( PF.IDPESSOA = PES.IDPESSOA ) ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '10'
      '30'
      '10'
      '15'
      '30'
      '15'
      '30'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 630
    Top = 393
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.IDPLANOPREV, PL.NOME'
      'FROM   PLANPREV PL, PLANPREVPATRO PLP'
      'WHERE  PL.IDPLANOPREV = PLP.IDPLANOPREV'
      
        'AND    PLP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUND' +
        'ACAO = :IDFUNDACAO)'
      ' ')
    ValidateWithMask = True
    Left = 614
    Top = 265
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.IDPLANOPREV, PL.NOME'
      'FROM   PLANPREV PL, PLANPREVPATRO PLP'
      'WHERE  PL.IDPLANOPREV = PLP.IDPLANOPREV'
      
        'AND    PLP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUND' +
        'ACAO = :IDFUNDACAO)'
      ' ')
    ValidateWithMask = True
    Left = 614
    Top = 322
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficiosSimular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.IDPLANOPREV, PL.NOME'
      'FROM   PLANPREV PL, PLANPREVPATRO PLP'
      'WHERE  PL.IDPLANOPREV = PLP.IDPLANOPREV'
      
        'AND    PLP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUND' +
        'ACAO = :IDFUNDACAO)'
      ' ')
    ValidateWithMask = True
    Left = 605
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
end
