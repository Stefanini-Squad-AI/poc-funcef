object Form1: TForm1
  Left = 5
  Top = 102
  Width = 783
  Height = 439
  Caption = 'Consulta ao Participante/Dependente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblnome: TLabel
    Left = 0
    Top = 0
    Width = 657
    Height = 23
    AutoSize = False
    Caption = 'Nome do Elegível/Participante'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object lblpatro: TLabel
    Left = -1
    Top = 24
    Width = 659
    Height = 18
    AutoSize = False
    Caption = 'Nome da Patrocinadora'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object pgDadosFuncionais: TPageControl
    Left = 2
    Top = 44
    Width = 656
    Height = 368
    ActivePage = TabSheet1
    HotTrack = True
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'DADOS FUNCIONAIS'
      object lblNomeFilial: TLabel
        Left = 2
        Top = 38
        Width = 20
        Height = 13
        Cursor = crNo
        Caption = 'Filial'
      end
      object lblValor1: TLabel
        Left = 2
        Top = 76
        Width = 38
        Height = 13
        Cursor = crNo
        Caption = 'Opção1'
      end
      object lblValor2: TLabel
        Left = 233
        Top = 77
        Width = 38
        Height = 13
        Cursor = crNo
        Caption = 'Opção2'
      end
      object lblSitFunc: TLabel
        Left = 292
        Top = 38
        Width = 198
        Height = 13
        Cursor = crNo
        Caption = 'Situação do Empregado na Patrocinadora'
      end
      object lblNomeCargo: TLabel
        Left = 2
        Top = 0
        Width = 28
        Height = 13
        Cursor = crNo
        Caption = 'Cargo'
      end
      object Label1: TLabel
        Left = 293
        Top = 0
        Width = 26
        Height = 13
        Cursor = crNo
        Caption = 'Nível'
      end
      object lblDataAdmissao: TLabel
        Left = 540
        Top = 0
        Width = 86
        Height = 13
        Cursor = crNo
        Caption = 'Data de Admissão'
      end
      object lblValor3: TLabel
        Left = 448
        Top = 76
        Width = 38
        Height = 13
        Cursor = crNo
        Caption = 'Opção3'
      end
      object lblSalarioTotal: TLabel
        Left = 539
        Top = 39
        Width = 59
        Height = 13
        Cursor = crNo
        Caption = 'Salário Total'
      end
      object Label59: TLabel
        Left = 2
        Top = 112
        Width = 181
        Height = 13
        Cursor = crNo
        Caption = 'Tempo Serviço Total (sem Conversão)'
      end
      object Label60: TLabel
        Left = 333
        Top = 112
        Width = 182
        Height = 13
        Cursor = crNo
        Caption = 'Tempo Serviço Total (com Conversão)'
      end
      object dbedFilial: TwwDBEdit
        Left = 2
        Top = 52
        Width = 276
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'FILIAL'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeValor1: TwwDBEdit
        Left = 2
        Top = 91
        Width = 223
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'VALORBASE1'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeValor2: TwwDBEdit
        Left = 231
        Top = 91
        Width = 212
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'VALORBASE2'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedsitfunc: TwwDBEdit
        Left = 292
        Top = 52
        Width = 241
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'DESCRICAO'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedcargo: TwwDBEdit
        Left = 2
        Top = 14
        Width = 278
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'TITULO'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbednivel: TwwDBEdit
        Left = 292
        Top = 14
        Width = 237
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'NIVEL'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeddataadmissao: TwwDBEdit
        Left = 537
        Top = 14
        Width = 108
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'DATAADMISSAO'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeValor3: TwwDBEdit
        Left = 447
        Top = 91
        Width = 199
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'VALORBASE3'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedsaltotal: TwwDBEdit
        Left = 538
        Top = 52
        Width = 110
        Height = 21
        Cursor = crNo
        Color = clGray
        DataField = 'SALTOTAL'
        DataSource = dtmConsPart.dspartgeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit12: TwwDBEdit
        Left = 2
        Top = 125
        Width = 47
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'TEMPOSERVCALC'
        DataSource = dtmConsPart.dshistfunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edTempoTotal: TEdit
        Left = 55
        Top = 125
        Width = 267
        Height = 21
        Color = clGrayText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object wwDBEdit13: TwwDBEdit
        Left = 335
        Top = 125
        Width = 47
        Height = 21
        Cursor = crNo
        TabStop = False
        Color = clGray
        DataField = 'TEMPOSITESPECIAL'
        DataSource = dtmConsPart.dshistfunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edTempoEspecial: TEdit
        Left = 384
        Top = 125
        Width = 261
        Height = 21
        Color = clGrayText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object pnlHstFuncional: TPanel
        Left = 0
        Top = 150
        Width = 648
        Height = 23
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Histórico Funcional'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 13
      end
      object dbgridhistfunc: TwwDBGrid
        Left = 0
        Top = 174
        Width = 648
        Height = 165
        Selected.Strings = (
          'EMPRESA'#9'30'#9'Empresa'
          'MATRICULA'#9'13'#9'Matrícula'
          'DATAINICIO'#9'10'#9'Data Inicial'
          'DATAFINAL'#9'10'#9'Data Final'
          'TEMPOCALC'#9'10'#9'Dias'
          'TEMPOPOREMPRESAEXTENSO'#9'49'#9'Tempo por empresa'
          'INSALUBRI'#9'30'#9'Insalubridade'
          'FLGCONTATS'#9'15'#9'Conta como tempo ~de Serviço?'
          'TEMPOSERVANTERIOR'#9'22'#9'Tempo de Serviço Anterior ~[em meses]'
          'TEMPONAOCREDITADO'#9'17'#9'Tempo não Creditado ~[em meses]')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 4
        ShowHorzScrollBar = True
        DataSource = dtmConsPart.dshistfunc
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 14
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  object pgDadosGerais: TPageControl
    Left = 0
    Top = 44
    Width = 658
    Height = 368
    ActivePage = TbShtPes
    HotTrack = True
    TabOrder = 2
    object TbShtPes: TTabSheet
      Caption = 'DADOS PESSOAIS'
      object pnlParticipante: TPanel
        Left = 1
        Top = 2
        Width = 649
        Height = 347
        TabOrder = 0
        object scbDadosPessoaisParticip: TScrollBox
          Left = 4
          Top = 3
          Width = 640
          Height = 122
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          object lblNomePai: TLabel
            Left = 13
            Top = 39
            Width = 61
            Height = 13
            Cursor = crNo
            Caption = 'Nome do Pai'
          end
          object lblNomeMae: TLabel
            Left = 13
            Top = 3
            Width = 67
            Height = 13
            Cursor = crNo
            Caption = 'Nome da Mãe'
          end
          object lblsexo: TLabel
            Left = 335
            Top = 76
            Width = 24
            Height = 13
            Cursor = crNo
            Caption = 'Sexo'
          end
          object lbldataFalecimento: TLabel
            Left = 101
            Top = 77
            Width = 57
            Height = 13
            Cursor = crNo
            Caption = 'Falecimento'
          end
          object lbldataNascimento: TLabel
            Left = 13
            Top = 77
            Width = 56
            Height = 13
            Cursor = crNo
            Caption = 'Nascimento'
          end
          object lblEstadoCivil: TLabel
            Left = 186
            Top = 77
            Width = 55
            Height = 13
            Cursor = crNo
            Caption = 'Estado Civil'
          end
          object lblEMail: TLabel
            Left = 421
            Top = 77
            Width = 28
            Height = 13
            Caption = 'E-mail'
          end
          object Label62: TLabel
            Left = 420
            Top = 40
            Width = 25
            Height = 13
            Caption = 'IRRF'
          end
          object Label2: TLabel
            Left = 498
            Top = 40
            Width = 101
            Height = 13
            Cursor = crNo
            Caption = 'Moléstia grave desde'
          end
          object dbednomepai: TwwDBEdit
            Left = 13
            Top = 53
            Width = 396
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'NOMEPAI'
            DataSource = dtmConsPart.dspartgeral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbednomemae: TwwDBEdit
            Left = 13
            Top = 17
            Width = 396
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'NOMEMAE'
            DataSource = dtmConsPart.dspartgeral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeddatafalecimento: TwwDBEdit
            Left = 100
            Top = 90
            Width = 82
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'DATAMORTE'
            DataSource = dtmConsPart.dspartgeral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeddatanasc: TwwDBEdit
            Left = 13
            Top = 90
            Width = 82
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'DATANASC'
            DataSource = dtmConsPart.dspartgeral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedSexo: TwwDBEdit
            Left = 335
            Top = 89
            Width = 73
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'SEXO'
            DataSource = dtmConsPart.dspartgeral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedEstadoCivil: TwwDBEdit
            Left = 186
            Top = 90
            Width = 140
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'ESTADOCIVIL'
            DataSource = dtmConsPart.dspartgeral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedEMail: TwwDBEdit
            Left = 420
            Top = 90
            Width = 206
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'EMAIL'
            DataSource = dtmConsPart.dspartgeral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit15: TwwDBEdit
            Left = 420
            Top = 53
            Width = 65
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'SITIRRF'
            DataSource = dtmConsPart.dspartgeral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit1: TwwDBEdit
            Left = 497
            Top = 53
            Width = 104
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'DATAMOLESTIAGRAVE'
            DataSource = dtmConsPart.dspartgeral
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object Panel12: TPanel
          Left = 1
          Top = 258
          Width = 647
          Height = 85
          BevelOuter = bvNone
          Caption = 'Panel12'
          TabOrder = 1
          object pnlEnderecos: TPanel
            Left = 0
            Top = 0
            Width = 647
            Height = 27
            Align = alTop
            BevelInner = bvLowered
            BevelWidth = 2
            Caption = 'Endereços'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
          end
          object dbgridenderecos: TwwDBGrid
            Left = 0
            Top = 27
            Width = 647
            Height = 58
            Selected.Strings = (
              'NOME'#9'30'#9'Local'
              'LOGRADOURO'#9'30'#9'Logradouro'
              'NUMERO'#9'8'#9'Número'
              'COMPLEMENTO'#9'20'#9'Complemento'
              'BAIRRO'#9'20'#9'Bairro'
              'CIDADE'#9'30'#9'Cidade'
              'ESTADO'#9'30'#9'Estado'
              'UF'#9'3'#9'UF'
              'CEP'#9'8'#9'CEP'
              'NOMEPAIS'#9'20'#9'País')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtmConsPart.dsendereco
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 126
          Width = 647
          Height = 131
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 2
          object dbgriddepen: TwwDBGrid
            Left = 0
            Top = 27
            Width = 647
            Height = 104
            Selected.Strings = (
              'NOME'#9'38'#9'Nome'#9'F'
              'FLGCONTAIMPOSTOR'#9'5'#9'IRRF'#9'F'
              'FLGCONTASALARIOF'#9'7'#9'Sal. Fam.'#9'F'
              'FLGDEPLEGAL'#9'10'#9'Dep. Legal'#9'F'
              'DESCRICAO'#9'16'#9'Grau de Parentesco'#9'F'
              'DATANASC'#9'10'#9'Nascimento'#9'F'
              'DEPENDENCIA'#9'50'#9'Dependência'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtmConsPart.dsdepentit
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object pnlDependentes: TPanel
            Left = 0
            Top = 0
            Width = 647
            Height = 27
            Align = alTop
            BevelInner = bvLowered
            BevelWidth = 2
            Caption = 'Dependentes'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
    object tbContaCorrente: TTabSheet
      Caption = 'CONTAS BANCÁRIAS'
      ImageIndex = 1
      object dbgrContaBancaria: TwwDBGrid
        Left = 0
        Top = 0
        Width = 650
        Height = 340
        Selected.Strings = (
          'NUMBANCO'#9'10'#9'Banco'
          'NUMAGENCIA'#9'15'#9'Agência'
          'CONTACORRENTE'#9'15'#9'Conta Corrente'
          'CONTAPREF'#9'3'#9'Preferencial'
          'NOMEBANCO'#9'60'#9'Nome do Banco'
          'NOMEAGENCIA'#9'60'#9'Nome da Agência'
          'TPCONTA'#9'8'#9'Tipo'
          'FLGCONTACONJUNTA'#9'1'#9'Conjunta')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmConsPart.dsContaCorrente
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'DOCUMENTOS'
      ImageIndex = 2
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 0
        Width = 650
        Height = 340
        Selected.Strings = (
          'NOMEDOCUMENTO'#9'30'#9'Documento'
          'NUMDOCUMENTO'#9'18'#9'Número'
          'DATAEMISSAO'#9'18'#9'Emissão'
          'NOMEESTADO'#9'30'#9'Estado'
          'NOMEPAIS'#9'30'#9'País'
          'ORGAO'#9'30'#9'Órgão'#9'F'
          'UF'#9'3'#9'UF')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmConsPart.dsDocTitular
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 660
    Top = 0
    Width = 114
    Height = 89
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 4
      Top = 8
      Width = 107
      Height = 39
      GroupIndex = 1
      Down = True
      Caption = 'PARTICIPANTE'
    end
    object SpeedButton2: TSpeedButton
      Left = 4
      Top = 46
      Width = 107
      Height = 39
      GroupIndex = 1
      Caption = 'DEPENDENTE'
    end
  end
  object GroupBox2: TGroupBox
    Left = 660
    Top = 91
    Width = 114
    Height = 319
    TabOrder = 1
    object SpeedButton3: TSpeedButton
      Left = 4
      Top = 8
      Width = 107
      Height = 39
      GroupIndex = 1
      Down = True
      Caption = 'DADOS GERAIS'
    end
    object SpeedButton4: TSpeedButton
      Left = 4
      Top = 46
      Width = 107
      Height = 39
      GroupIndex = 1
      Caption = 'DADOS FUNCIONAIS'
    end
    object SpeedButton5: TSpeedButton
      Left = 4
      Top = 84
      Width = 107
      Height = 39
      GroupIndex = 1
      Caption = 'CONTRIBUIÇÕES'
    end
    object SpeedButton6: TSpeedButton
      Left = 4
      Top = 122
      Width = 107
      Height = 39
      GroupIndex = 1
      Caption = 'BENEFÍCIOS'
    end
    object SpeedButton7: TSpeedButton
      Left = 4
      Top = 160
      Width = 107
      Height = 39
      GroupIndex = 1
      Caption = 'EMPRÉSTIMOS'
    end
    object SpeedButton8: TSpeedButton
      Left = 4
      Top = 198
      Width = 107
      Height = 39
      GroupIndex = 1
      Caption = 'PROCESSOS'
    end
    object SpeedButton9: TSpeedButton
      Left = 4
      Top = 236
      Width = 107
      Height = 39
      GroupIndex = 1
      Caption = 'PROTOCOLO'
    end
    object SpeedButton10: TSpeedButton
      Left = 4
      Top = 274
      Width = 107
      Height = 39
      GroupIndex = 1
      Caption = 'EVENTOS'
    end
  end
end
