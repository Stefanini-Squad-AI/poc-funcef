object frmConsPart_Velho: TfrmConsPart_Velho
  Left = -8
  Top = 20
  Width = 812
  Height = 519
  HelpContext = 230045
  Caption = 'Consulta do Elegível/Participante'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label40: TLabel
    Left = 377
    Top = 147
    Width = 31
    Height = 13
    Caption = 'Banco'
  end
  object Label41: TLabel
    Left = 601
    Top = 363
    Width = 31
    Height = 13
    Caption = 'Banco'
  end
  object pnlFundo: TPanel
    Left = 0
    Top = 49
    Width = 804
    Height = 404
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Caption = 'pnlFundo'
    TabOrder = 0
    object pgcrtlConsPart: TPageControl
      Left = 5
      Top = 5
      Width = 794
      Height = 394
      ActivePage = TbShtBenef
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      MultiLine = True
      ParentFont = False
      TabOrder = 0
      OnChange = pgcrtlConsPartChange
      object TbShtPartic: TTabSheet
        Caption = 'Funcionário'
        object PagFuncionarios: TPageControl
          Left = 0
          Top = 0
          Width = 786
          Height = 348
          ActivePage = TbShFuncBeneficios
          Align = alClient
          HotTrack = True
          TabOrder = 0
          OnChange = PagFuncionariosChange
          object TbShtPes: TTabSheet
            Caption = 'Dados Pessoais'
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 778
              Height = 113
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Splitter1: TSplitter
                Left = 0
                Top = 0
                Width = 6
                Height = 113
                Cursor = crHSplit
              end
              object ScrollBox1: TScrollBox
                Left = 6
                Top = 0
                Width = 772
                Height = 113
                AutoScroll = False
                BorderStyle = bsNone
                Color = clBtnFace
                ParentColor = False
                TabOrder = 0
                object lblNomePai: TLabel
                  Left = 9
                  Top = 1
                  Width = 73
                  Height = 13
                  Cursor = crNo
                  Caption = 'Nome do Pai'
                end
                object lblNomeMae: TLabel
                  Left = 310
                  Top = 1
                  Width = 79
                  Height = 13
                  Cursor = crNo
                  Caption = 'Nome da Mãe'
                end
                object lblsexo: TLabel
                  Left = 276
                  Top = 38
                  Width = 29
                  Height = 13
                  Cursor = crNo
                  Caption = 'Sexo'
                end
                object lbldataFalecimento: TLabel
                  Left = 142
                  Top = 38
                  Width = 118
                  Height = 13
                  Cursor = crNo
                  Caption = 'Data de Falecimento'
                end
                object lbldataNascimento: TLabel
                  Left = 8
                  Top = 38
                  Width = 116
                  Height = 13
                  Cursor = crNo
                  Caption = 'Data de Nascimento'
                end
                object lblEstadoCivil: TLabel
                  Left = 392
                  Top = 38
                  Width = 68
                  Height = 13
                  Cursor = crNo
                  Caption = 'Estado Civil'
                end
                object lblEMail: TLabel
                  Left = 522
                  Top = 38
                  Width = 35
                  Height = 13
                  Caption = 'E-mail'
                end
                object Label63: TLabel
                  Left = 608
                  Top = 2
                  Width = 24
                  Height = 13
                  Cursor = crNo
                  Caption = 'CPF'
                end
                object Naturalidade: TLabel
                  Left = 8
                  Top = 75
                  Width = 73
                  Height = 13
                  Cursor = crNo
                  Caption = 'Naturalidade'
                end
                object Label51: TLabel
                  Left = 94
                  Top = 75
                  Width = 82
                  Height = 13
                  Cursor = crNo
                  Caption = 'Nacionalidade'
                end
                object Label52: TLabel
                  Left = 284
                  Top = 75
                  Width = 93
                  Height = 13
                  Cursor = crNo
                  Caption = 'Tel. Residencial'
                end
                object Label53: TLabel
                  Left = 246
                  Top = 75
                  Width = 28
                  Height = 13
                  Cursor = crNo
                  Caption = 'DDD'
                end
                object Label54: TLabel
                  Left = 453
                  Top = 75
                  Width = 66
                  Height = 13
                  Cursor = crNo
                  Caption = 'Tel. Celular'
                end
                object Label66: TLabel
                  Left = 415
                  Top = 75
                  Width = 28
                  Height = 13
                  Cursor = crNo
                  Caption = 'DDD'
                end
                object dbednomepai: TwwDBEdit
                  Left = 7
                  Top = 15
                  Width = 292
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
                  Left = 308
                  Top = 15
                  Width = 292
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
                  Left = 140
                  Top = 53
                  Width = 121
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
                  Left = 7
                  Top = 53
                  Width = 121
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
                  Left = 276
                  Top = 53
                  Width = 108
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
                  Left = 391
                  Top = 53
                  Width = 121
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
                  Left = 520
                  Top = 53
                  Width = 247
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
                object wwwEdtCPF: TwwDBEdit
                  Left = 609
                  Top = 15
                  Width = 155
                  Height = 21
                  Cursor = crNo
                  TabStop = False
                  Color = clGray
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
                object wwDBEdit16: TwwDBEdit
                  Left = 7
                  Top = 89
                  Width = 70
                  Height = 21
                  Cursor = crNo
                  TabStop = False
                  Color = clGray
                  DataField = 'CODESTADO'
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
                object wwDBEdit17: TwwDBEdit
                  Left = 92
                  Top = 89
                  Width = 138
                  Height = 21
                  Cursor = crNo
                  TabStop = False
                  Color = clGray
                  DataField = 'NOMENACIONALIDADE'
                  DataSource = dtmConsPart.dspartgeral
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
                object DBEdtTelRes: TwwDBEdit
                  Left = 282
                  Top = 89
                  Width = 117
                  Height = 21
                  Cursor = crNo
                  TabStop = False
                  Color = clGray
                  DataField = 'NUMERO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 10
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object DbEdtDDDres: TwwDBEdit
                  Left = 245
                  Top = 89
                  Width = 32
                  Height = 21
                  Cursor = crNo
                  TabStop = False
                  Color = clGray
                  DataField = 'DDD'
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
                object DbEdtDDDcel: TwwDBEdit
                  Left = 414
                  Top = 89
                  Width = 32
                  Height = 21
                  Cursor = crNo
                  TabStop = False
                  Color = clGray
                  DataField = 'DDD'
                  DataSource = dtmConsPart.DsTelefonesCel
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 12
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object DBEdtTelCel: TwwDBEdit
                  Left = 451
                  Top = 89
                  Width = 117
                  Height = 21
                  Cursor = crNo
                  TabStop = False
                  Color = clGray
                  DataField = 'NUMERO'
                  DataSource = dtmConsPart.DsTelefonesCel
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 13
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
            end
            object Panel12: TPanel
              Left = 0
              Top = 238
              Width = 778
              Height = 82
              Align = alBottom
              BevelOuter = bvNone
              Caption = 'Panel12'
              TabOrder = 1
              object pnlEnderecos: TPanel
                Left = 0
                Top = 0
                Width = 778
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
                Width = 778
                Height = 55
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
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
                TabOrder = 1
                TitleAlignment = taCenter
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icBlack
              end
            end
            object Panel4: TPanel
              Left = 0
              Top = 128
              Width = 778
              Height = 108
              BevelOuter = bvNone
              Caption = 'Panel4'
              TabOrder = 2
              object dbgriddepen: TwwDBGrid
                Left = 0
                Top = 27
                Width = 778
                Height = 81
                Selected.Strings = (
                  'NUMSEQUENCIA'#9'7'#9'Seq.'#9'F'
                  'MATRICULA'#9'10'#9'Matrícula'#9'F'
                  'NOME'#9'40'#9'Nome'#9'F'
                  'DEPENDENCIA'#9'15'#9'Grau de~Parentesco'#9'F'
                  'FLGISENTOIRRF'#9'10'#9'Isento~de IR'#9'F'
                  'DATANASC'#9'13'#9'Data de ~Nascimento'#9'F'
                  'SEXO'#9'1'#9'Sexo'#9'F'
                  'FLGELEGIVEL'#9'10'#9'Elegível a~Benefício'#9'F'
                  'FLGBENEFICIARIO'#9'10'#9'Beneficiário'#9'F'
                  'FLGCONTAIMPOSTOR'#9'10'#9'Imposto~de Renda'#9'F'
                  'FLGCONTASALARIOF'#9'10'#9'Salário~Família'#9'F'
                  'FLGDESIGNADO'#9'10'#9'Designado'#9'F'
                  'FLGDEPLEGAL'#9'10'#9'Dependente~Legal'#9'F'
                  'FLGMOLESTIAGRAVE'#9'10'#9'Possui Moléstia~Grave'#9'F'
                  'DATAMOLESTIAGRAVE'#9'13'#9'Moléstia~Grave desde'#9'F'
                  'NOMEMAE'#9'35'#9'Nome da Mãe'#9'F'
                  'NOMEPAI'#9'35'#9'Nome do Pai'#9'F'
                  'NUMDOCUMENTO'#9'18'#9'CPF'#9'F'
                  'SITUACAODEPEN'#9'50'#9'Situaçao ~Dependente'#9'F'
                  'DATAMORTE'#9'13'#9'Data do~Falecimento'#9'F'
                  'DESCESTCIVIL'#9'26'#9'Estado~Civil'#9'F'
                  'VALORBASE1'#9'10'#9'Opção 1'#9'F'
                  'VALORBASE2'#9'10'#9'Opção 2'#9'F'
                  'VALORBASE3'#9'10'#9'Opção 3'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dtmConsPart.dsdepentit
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
                ReadOnly = True
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 2
                TitleButtons = False
                UseTFields = False
                IndicatorColor = icBlack
              end
              object pnlDependentes: TPanel
                Left = 0
                Top = 0
                Width = 778
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
          object TbShtFunc: TTabSheet
            Caption = 'Dados Funcionais'
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 778
              Height = 189
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object lblDataAdmissao: TLabel
                Left = 540
                Top = 38
                Width = 103
                Height = 13
                Cursor = crNo
                Caption = 'Data de Admissão'
              end
              object lblSalarioTotal: TLabel
                Left = 667
                Top = 39
                Width = 73
                Height = 13
                Cursor = crNo
                Caption = 'Salário Total'
              end
              object lblNomeCargo: TLabel
                Left = 292
                Top = 0
                Width = 34
                Height = 13
                Cursor = crNo
                Caption = 'Cargo'
              end
              object lblSitFunc: TLabel
                Left = 292
                Top = 38
                Width = 237
                Height = 13
                Cursor = crNo
                Caption = 'Situação do Empregado na Patrocinadora'
              end
              object lblnomepatro: TLabel
                Left = 5
                Top = 0
                Width = 80
                Height = 13
                Cursor = crNo
                Caption = 'Patrocinadora'
              end
              object lblNomeFilial: TLabel
                Left = 5
                Top = 38
                Width = 27
                Height = 13
                Cursor = crNo
                Caption = 'Filial'
              end
              object Label1: TLabel
                Left = 540
                Top = 0
                Width = 32
                Height = 13
                Cursor = crNo
                Caption = 'Nível'
              end
              object lblValor1: TLabel
                Left = 7
                Top = 75
                Width = 45
                Height = 13
                Cursor = crNo
                Caption = 'Opção1'
              end
              object lblValor2: TLabel
                Left = 292
                Top = 75
                Width = 45
                Height = 13
                Cursor = crNo
                Caption = 'Opção2'
              end
              object lblValor3: TLabel
                Left = 540
                Top = 75
                Width = 45
                Height = 13
                Cursor = crNo
                Caption = 'Opção3'
              end
              object Label59: TLabel
                Left = 6
                Top = 112
                Width = 217
                Height = 13
                Cursor = crNo
                Caption = 'Tempo Serviço Total (sem Conversão)'
              end
              object Label60: TLabel
                Left = 409
                Top = 112
                Width = 218
                Height = 13
                Cursor = crNo
                Caption = 'Tempo Serviço Total (com Conversão)'
              end
              object Label67: TLabel
                Left = 7
                Top = 148
                Width = 88
                Height = 13
                Cursor = crNo
                Caption = 'Dt. Início INSS'
              end
              object Label68: TLabel
                Left = 147
                Top = 149
                Width = 82
                Height = 13
                Cursor = crNo
                Caption = 'Tel. Comercial'
              end
              object Label69: TLabel
                Left = 111
                Top = 149
                Width = 28
                Height = 13
                Cursor = crNo
                Caption = 'DDD'
              end
              object dbedsaltotal: TwwDBEdit
                Left = 667
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
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedcargo: TwwDBEdit
                Left = 292
                Top = 14
                Width = 240
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
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbeddataadmissao: TwwDBEdit
                Left = 540
                Top = 52
                Width = 120
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
              object dbednomepatro: TwwDBEdit
                Left = 5
                Top = 14
                Width = 276
                Height = 21
                Cursor = crNo
                TabStop = False
                Color = clGray
                DataField = 'PATRO'
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
              object dbedFilial: TwwDBEdit
                Left = 5
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
                TabOrder = 5
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbednivel: TwwDBEdit
                Left = 540
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
                TabOrder = 6
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbeValor1: TwwDBEdit
                Left = 5
                Top = 91
                Width = 276
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
                TabOrder = 7
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbeValor2: TwwDBEdit
                Left = 292
                Top = 91
                Width = 240
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
                TabOrder = 8
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbeValor3: TwwDBEdit
                Left = 541
                Top = 91
                Width = 235
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
                TabOrder = 9
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object wwDBEdit12: TwwDBEdit
                Left = 5
                Top = 125
                Width = 47
                Height = 21
                Cursor = crNo
                TabStop = False
                Color = clGray
                DataField = 'TEMPOSEMCONVERSAO'
                DataSource = dtmConsPart.DSHistFunc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 10
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object wwDBEdit13: TwwDBEdit
                Left = 409
                Top = 125
                Width = 47
                Height = 21
                Cursor = crNo
                TabStop = False
                Color = clGray
                DataField = 'TEMPOSERVCALC'
                DataSource = dtmConsPart.DSHistFunc
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
              object edTempoTotal: TEdit
                Left = 55
                Top = 125
                Width = 334
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
              object edTempoEspecial: TEdit
                Left = 461
                Top = 125
                Width = 314
                Height = 21
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 13
              end
              object wwDBEdit18: TwwDBEdit
                Left = 5
                Top = 163
                Width = 92
                Height = 21
                Cursor = crNo
                TabStop = False
                Color = clGray
                DataField = 'DATAINICIOINSS'
                DataSource = dtmConsPart.DsDataInicioInss
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 14
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object wwDBEdit19: TwwDBEdit
                Left = 108
                Top = 163
                Width = 32
                Height = 21
                Cursor = crNo
                TabStop = False
                Color = clGray
                DataField = 'DDD'
                DataSource = dtmConsPart.DsTelefoneComercial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 15
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object wwDBEdit20: TwwDBEdit
                Left = 145
                Top = 163
                Width = 117
                Height = 21
                Cursor = crNo
                TabStop = False
                Color = clGray
                DataField = 'NUMERO'
                DataSource = dtmConsPart.DsTelefoneComercial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 16
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object pnlHstFuncional: TPanel
              Left = 0
              Top = 189
              Width = 778
              Height = 23
              Align = alTop
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
              TabOrder = 1
            end
            object dbgridhistfunc: TwwDBGrid
              Left = 0
              Top = 212
              Width = 778
              Height = 108
              Selected.Strings = (
                'EMPRESA'#9'30'#9'Empresa'#9'F'
                'MATRICULA'#9'13'#9'Matrícula'#9'F'
                'DATAINICIO'#9'10'#9'Data Inicial'#9'F'
                'DATAFINAL'#9'10'#9'Data Final'#9'F'
                'TEMPOCALC'#9'10'#9'Dias'#9'F'
                'TEMPOPOREMPRESAEXTENSO'#9'49'#9'Tempo por empresa'#9'F'
                'INSALUBRI'#9'30'#9'Insalubridade'#9'F'
                'FLGCONTATS'#9'10'#9'Conta como tempo ~de Serviço'#9'F'
                'TEMPOSERVANTERIOR'#9'22'#9'Tempo de Serviço Anterior ~[em meses]'#9'F'
                'TEMPONAOCREDITADO'#9'17'#9'Tempo não Creditado ~[em meses]'#9'F'
                'TEMPOSEMCONVERSAO'#9'10'#9'Tempo Sem Conversão'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 4
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.DSHistFunc
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              ReadOnly = True
              TabOrder = 2
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
          object TbShFuncContribuicoes: TTabSheet
            Caption = 'Contribuições'
            object dbgridcontribuicoes: TwwDBGrid
              Left = 0
              Top = 0
              Width = 778
              Height = 320
              Selected.Strings = (
                'NOME'#9'30'#9'Contribuição'#9'F'
                'DECODE(CP.FLGCOBRA,1,'#39'COBRA'#39','#39'N'#9'12'#9'Cobra'#9'F'
                'NOMEVALORBASE1'#9'20'#9'Opção1'#9'F'
                'VALORBASE1'#9'10'#9'ValorOp1'#9'F'
                'NOMEVALORBASE2'#9'20'#9'Opção2'#9'F'
                'VALORBASE2'#9'10'#9'ValorOp2'#9'F'
                'NOMEVALORBASE3'#9'20'#9'Opção3'#9'F'
                'VALORBASE3'#9'10'#9'ValorOp3'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.DsContribuicoes
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
          object TbShFuncBeneficios: TTabSheet
            Caption = 'Benefícios'
            object Label12: TLabel
              Left = 0
              Top = 167
              Width = 68
              Height = 13
              Caption = 'Beneficiário'
            end
            object Label13: TLabel
              Left = 0
              Top = 273
              Width = 63
              Height = 13
              Caption = 'Recebedor'
            end
            object Label14: TLabel
              Left = 1
              Top = 202
              Width = 98
              Height = 13
              Caption = 'Data Nascimento'
            end
            object Label15: TLabel
              Left = 105
              Top = 202
              Width = 142
              Height = 13
              Caption = 'Situação do Dependente'
            end
            object Label61: TLabel
              Left = 1
              Top = 237
              Width = 65
              Height = 13
              Caption = 'Parentesco'
            end
            object Label62: TLabel
              Left = 281
              Top = 239
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object dbgridbeneficios: TwwDBGrid
              Left = 1
              Top = 2
              Width = 765
              Height = 159
              Selected.Strings = (
                'NOME'#9'43'#9'Benefício'
                'DESCRICAO'#9'10'#9'Situação'
                'VALORATUAL'#9'15'#9'Valor Atual'
                'DATAINICIO'#9'11'#9'Início'
                'DATAFINAL'#9'10'#9'Final'
                'VALORSRB'#9'12'#9'SRB'
                'DATAFINALPREVISTA'#9'11'#9'Final Prevista'
                'VALORTOTAL'#9'10'#9'Valor total'
                'ULTMESPREPARO'#9'11'#9'Preparado até'
                'ULTMESREAJUSTE'#9'12'#9'Reajustado até'
                'NUMEROPROCESSO'#9'10'#9'Processo CM'
                'NUMPROCINSS'#9'15'#9'Processo INSS'
                'DATAINICIOINSS'#9'18'#9'Início INSS'
                'NOMEVALORBASE1'#9'20'#9'Opção1'
                'VALORBASE1'#9'10'#9'ValorOp1'
                'NOMEVALORBASE2'#9'20'#9'Opção2'
                'VALORBASE2'#9'10'#9'ValorOp2'
                'NOMEVALORBASE3'#9'20'#9'Opção3'
                'VALORBASE3'#9'10'#9'ValorOp3'
                'BENEFMIN'#9'9'#9'Benef. Mín.'
                'PERCENTUAL'#9'10'#9'Percentual'
                'MOTIVO'#9'43'#9'Motivo de Retenção'
                'DATAEMISSAORECAD'#9'18'#9'Data de Emissão ~do Recadastramento'
                'DATALIMITERECAD'#9'18'#9'Data Limite ~de Recadastramento'
                'DATARECEBRECAD'#9'18'#9'Data de Recebimento~do Recadastramento')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              IndicatorColor = icBlack
              OnFieldChanged = dbgridbeneficiosFieldChanged
            end
            object wwDBEdit8: TwwDBEdit
              Left = 0
              Top = 180
              Width = 348
              Height = 21
              Color = clInfoBk
              DataField = 'NOMEBEN'
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit9: TwwDBEdit
              Left = 0
              Top = 286
              Width = 347
              Height = 21
              Color = clInfoBk
              DataField = 'NOMERESP'
              ReadOnly = True
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbgrMovBenef: TwwDBGrid
              Left = 356
              Top = 182
              Width = 410
              Height = 124
              Selected.Strings = (
                'DESCMOV'#9'17'#9'Movimento'
                'DATAFINAL'#9'10'#9'Final'
                'DATAFINALANT'#9'12'#9'Final~Anterior'
                'DATAMOV'#9'12'#9'Data~Movimentação'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dtmConsPart.dsMovBenef
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              TabOrder = 3
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object wwDBEdit10: TwwDBEdit
              Left = 0
              Top = 216
              Width = 97
              Height = 21
              Color = clInfoBk
              DataField = 'DATANASC'
              ReadOnly = True
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit11: TwwDBEdit
              Left = 104
              Top = 216
              Width = 243
              Height = 21
              Color = clInfoBk
              DataField = 'DESCDEPEN'
              ReadOnly = True
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit14: TwwDBEdit
              Left = 0
              Top = 251
              Width = 270
              Height = 21
              Color = clInfoBk
              DataField = 'DEPENDENCIA'
              ReadOnly = True
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit15: TwwDBEdit
              Left = 277
              Top = 251
              Width = 69
              Height = 21
              Color = clInfoBk
              DataField = 'PERCENTUAL'
              ReadOnly = True
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object TabSheet1: TTabSheet
            Caption = 'Reserva/Saldo Conta'
            ImageIndex = 4
            object dbgrdResPoupanca: TwwDBGrid
              Left = 0
              Top = 0
              Width = 778
              Height = 291
              Selected.Strings = (
                'DATAULTALIM'#9'10'#9'Data~ Referência'#9'F'
                'VALORRESERVA'#9'16'#9'Reserva~ Em Cotas'#9'F'
                'COTVALOR'#9'11'#9'Valor ~da Cota'#9'F'
                'VLRATUAL'#9'16'#9'Valor na Moeda~Corrente'#9'F'
                'NOME'#9'47'#9'Nome da Reserva '#9'F'
                'FLGATIVO'#9'7'#9'Situação'#9'F'
                'PREV'#9'30'#9'Plano Previdenciário'#9'F'
                'TIT'#9'25'#9'Titular'#9'F'
                'PATRO'#9'25'#9'Patrocinadora'#9'F'
                'DATAMAX'#9'18'#9'DATAMAX'#9'F'
                'FLGCONTROLE'#9'10'#9'FLGCONTROLE'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 1
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.dsreserva
              EditCalculated = True
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object pnlTotais: TPanel
              Left = 0
              Top = 291
              Width = 778
              Height = 29
              Align = alBottom
              TabOrder = 1
              object lblSaldosReserva: TLabel
                Left = 146
                Top = 1
                Width = 631
                Height = 27
                Align = alClient
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Saldo: R$  '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
              end
              object lblDatacota: TLabel
                Left = 1
                Top = 1
                Width = 145
                Height = 13
                Align = alLeft
                Caption = ' Data cota: dd/mm/aaaa '
                Layout = tlCenter
              end
            end
          end
          object tbContaCorrente: TTabSheet
            Caption = 'Contas Bancárias'
            ImageIndex = 5
            object dbgrContaBancaria: TwwDBGrid
              Left = 0
              Top = 0
              Width = 778
              Height = 320
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
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
          object tbsRubIndiv: TTabSheet
            Caption = 'Rubricas Individuais'
            ImageIndex = 6
            object Panel8: TPanel
              Left = 0
              Top = 131
              Width = 778
              Height = 189
              Align = alBottom
              TabOrder = 0
              object Label26: TLabel
                Left = 8
                Top = 39
                Width = 53
                Height = 13
                Caption = 'Valor / %'
              end
              object Label22: TLabel
                Left = 8
                Top = 75
                Width = 64
                Height = 13
                Caption = 'Favorecido'
              end
              object Label25: TLabel
                Left = 102
                Top = 40
                Width = 35
                Height = 13
                Caption = 'Regra'
              end
              object Label18: TLabel
                Left = 453
                Top = 3
                Width = 65
                Height = 13
                Caption = 'Data Início'
              end
              object Label23: TLabel
                Left = 497
                Top = 76
                Width = 63
                Height = 13
                Caption = 'Alimentado'
              end
              object Label24: TLabel
                Left = 541
                Top = 39
                Width = 50
                Height = 13
                Caption = 'Id Regra'
              end
              object Label19: TLabel
                Left = 536
                Top = 3
                Width = 51
                Height = 13
                Caption = 'Data Fim'
              end
              object Label20: TLabel
                Left = 620
                Top = 3
                Width = 68
                Height = 13
                Caption = 'Permanente'
              end
              object Label21: TLabel
                Left = 697
                Top = 3
                Width = 69
                Height = 13
                Caption = 'Ocorrências'
              end
              object Label27: TLabel
                Left = 721
                Top = 18
                Width = 7
                Height = 13
                Caption = '/'
              end
              object Label16: TLabel
                Left = 8
                Top = 3
                Width = 68
                Height = 13
                Caption = 'Beneficiário'
              end
              object Label29: TLabel
                Left = 10
                Top = 111
                Width = 65
                Height = 13
                Caption = 'Logradouro'
              end
              object Label30: TLabel
                Left = 308
                Top = 111
                Width = 44
                Height = 13
                Caption = 'Número'
              end
              object Label31: TLabel
                Left = 627
                Top = 111
                Width = 40
                Height = 13
                Caption = 'Cidade'
              end
              object Label32: TLabel
                Left = 451
                Top = 111
                Width = 34
                Height = 13
                Caption = 'Bairro'
              end
              object Label33: TLabel
                Left = 364
                Top = 111
                Width = 25
                Height = 13
                Caption = 'CEP'
              end
              object Label34: TLabel
                Left = 10
                Top = 147
                Width = 40
                Height = 13
                Caption = 'Estado'
              end
              object Label35: TLabel
                Left = 402
                Top = 147
                Width = 37
                Height = 13
                Caption = 'Banco'
              end
              object Label36: TLabel
                Left = 218
                Top = 147
                Width = 98
                Height = 13
                Caption = 'Número Telefone'
              end
              object Label37: TLabel
                Left = 321
                Top = 147
                Width = 26
                Height = 13
                Caption = 'Tipo'
              end
              object Label38: TLabel
                Left = 178
                Top = 147
                Width = 28
                Height = 13
                Caption = 'DDD'
              end
              object Label39: TLabel
                Left = 501
                Top = 147
                Width = 101
                Height = 13
                Caption = 'Nome da Agência'
              end
              object Label42: TLabel
                Left = 673
                Top = 147
                Width = 34
                Height = 13
                Caption = 'Conta'
              end
              object Label43: TLabel
                Left = 444
                Top = 147
                Width = 45
                Height = 13
                Caption = 'Num Ag'
              end
              object Label44: TLabel
                Left = 374
                Top = 76
                Width = 65
                Height = 13
                Caption = 'Documento'
              end
              object DBEdit7: TDBEdit
                Left = 8
                Top = 52
                Width = 86
                Height = 21
                Color = clInfoBk
                DataField = 'VALORRUBRICA'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                TabOrder = 0
              end
              object DBEdit13: TDBEdit
                Left = 8
                Top = 89
                Width = 362
                Height = 21
                Color = clAppWorkSpace
                DataField = 'NOMEFAV'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                TabOrder = 1
              end
              object DBEdit8: TDBEdit
                Left = 102
                Top = 52
                Width = 433
                Height = 21
                Color = clInfoBk
                DataField = 'NOMEREGRA'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 2
              end
              object DBEdit9: TDBEdit
                Left = 453
                Top = 16
                Width = 78
                Height = 21
                Color = clInfoBk
                DataField = 'DATAINICIO'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                TabOrder = 3
              end
              object DBEdit12: TDBEdit
                Left = 495
                Top = 89
                Width = 274
                Height = 21
                Color = clInfoBk
                DataField = 'NOMEALIM'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                TabOrder = 4
              end
              object DBEdit11: TDBEdit
                Left = 541
                Top = 52
                Width = 52
                Height = 21
                Color = clInfoBk
                DataField = 'IDREGRACALCULO'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 5
              end
              object DBEdit14: TDBEdit
                Left = 536
                Top = 16
                Width = 78
                Height = 21
                Color = clInfoBk
                DataField = 'DATAFINAL'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                TabOrder = 6
              end
              object DBEdit10: TDBEdit
                Left = 619
                Top = 16
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'TIPOPERMANENTE'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                TabOrder = 7
              end
              object DBEdit16: TDBEdit
                Left = 699
                Top = 16
                Width = 33
                Height = 21
                Color = clInfoBk
                DataField = 'NUMOCORRENCIAS'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 8
              end
              object DBEdit17: TDBEdit
                Left = 737
                Top = 16
                Width = 33
                Height = 21
                Color = clInfoBk
                DataField = 'PARCELAS'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 9
              end
              object DBEdit15: TDBEdit
                Left = 8
                Top = 16
                Width = 440
                Height = 21
                Color = clAppWorkSpace
                DataField = 'NOMEBENEF'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 10
              end
              object DBEdit18: TDBEdit
                Left = 9
                Top = 124
                Width = 294
                Height = 21
                Color = clInfoBk
                DataField = 'LOGRADOURO'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 11
              end
              object DBEdit19: TDBEdit
                Left = 307
                Top = 124
                Width = 53
                Height = 21
                Color = clInfoBk
                DataField = 'NUMERO'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 12
              end
              object DBEdit20: TDBEdit
                Left = 450
                Top = 124
                Width = 173
                Height = 21
                Color = clInfoBk
                DataField = 'BAIRRO'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 13
              end
              object DBEdit21: TDBEdit
                Left = 627
                Top = 124
                Width = 142
                Height = 21
                Color = clInfoBk
                DataField = 'NOME'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 14
              end
              object DBEdit22: TDBEdit
                Left = 10
                Top = 160
                Width = 156
                Height = 21
                Color = clInfoBk
                DataField = 'NOMEESTADO'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 15
              end
              object DBEdit23: TDBEdit
                Left = 364
                Top = 124
                Width = 82
                Height = 21
                Color = clInfoBk
                DataField = 'CEP'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 16
              end
              object DBEdit24: TDBEdit
                Left = 174
                Top = 160
                Width = 36
                Height = 21
                Color = clInfoBk
                DataField = 'DDD'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 17
              end
              object DBEdit25: TDBEdit
                Left = 402
                Top = 160
                Width = 36
                Height = 21
                Color = clInfoBk
                DataField = 'NUMBANCO'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 18
              end
              object DBEdit26: TDBEdit
                Left = 217
                Top = 160
                Width = 96
                Height = 21
                Color = clInfoBk
                DataField = 'NUMEROTEL'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 19
              end
              object DBEdit27: TDBEdit
                Left = 321
                Top = 160
                Width = 48
                Height = 21
                Color = clInfoBk
                DataField = 'TIPO'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 20
              end
              object DBEdit28: TDBEdit
                Left = 501
                Top = 160
                Width = 164
                Height = 21
                Color = clInfoBk
                DataField = 'NOMEAGENCIA'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 21
              end
              object DBEdit30: TDBEdit
                Left = 443
                Top = 160
                Width = 53
                Height = 21
                Color = clInfoBk
                DataField = 'NUMAGENCIA'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 22
              end
              object DBEdit31: TDBEdit
                Left = 373
                Top = 89
                Width = 118
                Height = 21
                Color = clInfoBk
                DataField = 'DOCFAV'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 23
              end
              object DBEdit4: TDBEdit
                Left = 669
                Top = 160
                Width = 100
                Height = 21
                Color = clInfoBk
                DataField = 'CONTACORRENTE'
                DataSource = dtmConsPart.dsRubIndiv
                Enabled = False
                ReadOnly = True
                TabOrder = 24
              end
            end
            object dbgRubIndiv: TwwDBGrid
              Left = 0
              Top = 0
              Width = 778
              Height = 129
              Selected.Strings = (
                'IDRUBRICA'#9'10'#9'Rubrica'#9'F'
                'PROVDESC'#9'1'#9'+/-'#9'F'
                'DESCRICAO'#9'92'#9'Descrição'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alTop
              DataSource = dtmConsPart.dsRubIndiv
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
      end
      object TbShtPlanos: TTabSheet
        Caption = 'Planos'
        object Splitter6: TSplitter
          Left = 0
          Top = 202
          Width = 3
          Height = 146
          Cursor = crHSplit
        end
        object Splitter7: TSplitter
          Left = 0
          Top = 169
          Width = 786
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object dbgridplanass: TwwDBGrid
          Left = 3
          Top = 202
          Width = 783
          Height = 146
          Selected.Strings = (
            'NOME_1'#9'30'#9'Plano Previdenciário'
            'NOME'#9'30'#9'Plano Assistencial'
            'DESCRICAO'#9'15'#9'Situação no Plano Assistencial'
            'DATACANCELAMENTO'#9'10'#9'Data da Situação Atual')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object dbgridPrev: TwwDBGrid
          Left = 0
          Top = 28
          Width = 786
          Height = 141
          Selected.Strings = (
            'NOME'#9'30'#9'Plano Previdenciário'#9'F'
            'SITPART'#9'20'#9'Situação~ na Fundação'#9'F'
            'DESCRICAO'#9'20'#9'Situação~ no Plano Previdenciário'#9'F'
            'FLGFITESPECIAL'#9'10'#9'Situação~Especial'#9'F'
            'INSCRICAONUMERO'#9'10'#9'Inscrição Nº'#9'F'
            'DTINICIOINSC'#9'10'#9'Primeira ~Inscrição em'#9'F'
            'INSCRICAODATA'#9'10'#9'Inscrição~ Atual em'#9'F'
            'DATACANCELAMENTO'#9'12'#9'Cancelado em '#9'F'
            'DATAINICIOMANUT'#9'18'#9'Início~ Manutenção'#9'F'
            'SALPARTICIPACAO'#9'13'#9'Salário~ de Participação'#9'F'
            'SALMANTIDO'#9'12'#9'Salário~de Manutenção'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ReadOnly = True
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
          OnFieldChanged = dbgridPrevFieldChanged
        end
        object pnlAssistencial: TPanel
          Left = 0
          Top = 172
          Width = 786
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Assistencial'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 2
        end
        object pnlPrevidenciario: TPanel
          Left = 0
          Top = 0
          Width = 786
          Height = 28
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Previdenciário'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 3
        end
      end
      object TbShtContrib: TTabSheet
        Caption = 'Histórico Contribuições'
        object PageContrib: TPageControl
          Left = 0
          Top = 0
          Width = 786
          Height = 348
          ActivePage = TbShtContAss
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 0
          object TbShtContPrev: TTabSheet
            Caption = 'Previdenciário'
            object dbgrdContribPrev: TwwDBGrid
              Left = 0
              Top = 30
              Width = 778
              Height = 290
              Selected.Strings = (
                'MESREFERENCIA'#9'8'#9'Mês~Referência'#9'F'
                'MESCOBRANCA'#9'7'#9'Mês~Cobrança'#9'F'
                'MOTIVO'#9'25'#9'Motivo'#9'F'
                'CONTRIB'#9'30'#9'Contribuição'#9'F'
                'VALORESPERADO'#9'10'#9'Valor~ Esperado'#9'F'
                'VALORRECEBIDO'#9'12'#9'Valor~ Recebido'#9'F'
                'FLGDEVOLUCAO'#9'10'#9'Devolução'#9'F'
                'FLGCALCRESERVA'#9'7'#9'Alimentou~Reserva'#9'F'
                'DESCRICAO'#9'25'#9'Situação'#9'F'
                'DATARECEBIMENTO'#9'10'#9'Data~Recebimento'#9'F'
                'QUANTCOTAS'#9'17'#9'Quantidade de Cotas'#9'F'
                'PLANPREV'#9'25'#9'Plano Previdenciário'#9'F'
                'DATAFINAL'#9'10'#9'Data Final'#9'F'
                'NOME_1'#9'20'#9'Periodicidade'#9'F'
                'NOME'#9'35'#9'Titular'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 1
              ShowHorzScrollBar = True
              Align = alClient
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              UseTFields = False
              IndicatorColor = icBlack
            end
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 778
              Height = 30
              Align = alTop
              BevelInner = bvLowered
              BevelWidth = 2
              Caption = 'Histórico de Contribuições do Previdenciário'
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
          object TbShtContAss: TTabSheet
            Caption = 'Assistencial'
            object dbgirdcontrib: TwwDBGrid
              Left = 0
              Top = 30
              Width = 778
              Height = 290
              Selected.Strings = (
                'MES'#9'7'#9'Mês de Referência'
                'PLANPREV'#9'25'#9'Plano Previdenciário'
                'PLANASS'#9'25'#9'Plano Assistencial'
                'CONTRIB'#9'25'#9'Contribuição'
                'VALORESPERADO'#9'10'#9'Valor Esperado'
                'VALORRECEBIDO'#9'10'#9'Valor Recebido'
                'DATA'#9'10'#9'Data do Recebimento'
                'MESCOBRANCA'#9'7'#9'Mês de Cobrança'
                'NOME'#9'25'#9'Titular'
                'DESCRICAO'#9'25'#9'Motivo')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 1
              ShowHorzScrollBar = True
              Align = alClient
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object pnlContribAssistencial: TPanel
              Left = 0
              Top = 0
              Width = 778
              Height = 30
              Align = alTop
              BevelInner = bvLowered
              BevelWidth = 2
              Caption = 'Histórico de Contribuições do Assistencial'
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
      object TbShtBenef: TTabSheet
        Caption = 'Histórico Benefícios'
        object dbgirdbenef: TwwDBGrid
          Left = 0
          Top = 30
          Width = 786
          Height = 318
          Selected.Strings = (
            'MESREFERENCIA'#9'8'#9'Mês~Referência'
            'MES'#9'9'#9'Mês~Pagamento'
            'NOME'#9'40'#9'Benefício'
            'VALORPREV'#9'11'#9'Valor Previsto'
            'VLBENEFPGTO'#9'10'#9'Valor Pago'
            'MOTIVO'#9'48'#9'Motivo'
            'NUMEROPROCESSO'#9'12'#9'Num Processo.'
            'BENEFICIARIO'#9'60'#9'Beneficiário'
            'DATAPAGAMENTO'#9'10'#9'Data Pagto~Prevista'
            'DTEFETPGTO'#9'13'#9'Data Efetivação'
            'VALORBASE1'#9'10'#9'Vlr Base 1'
            'VALORBASE2'#9'10'#9'Vlr Base 2'
            'VALORBASE3'#9'10'#9'Vlr Base 3'
            'VALORCALCULADO'#9'10'#9'Vlr Calculado'
            'VALOROP1'#9'10'#9'Valor Opção 1'
            'VALOROP2'#9'10'#9'Valor Opção 2'
            'VALOROP3'#9'10'#9'Valor Opção 3'
            'VALORINTEGRAL'#9'10'#9'Valor Integral'
            'VALORSRB'#9'10'#9'Valor SRB'
            'VALORTOTAL'#9'10'#9'Valor Total'
            'PATROCINADORA'#9'60'#9'Patrocinadora'
            'PLANO'#9'50'#9'Plano'
            'IDHSTFOLHABENEF'#9'10'#9'Versão da Folha'
            'FLGMANUAL'#9'10'#9'Entrada Manual')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          DataSource = dtmConsPart.dsbenef
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object pnlBeneficios: TPanel
          Left = 0
          Top = 0
          Width = 786
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Histórico de Benefícios'
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
      object TbShtBenefic: TTabSheet
        Caption = 'Beneficiários'
        object PageControl1: TPageControl
          Left = 0
          Top = 0
          Width = 786
          Height = 348
          ActivePage = tbsBenefPrevid
          Align = alClient
          TabOrder = 0
          object tbsBenefPrevid: TTabSheet
            Caption = 'Previdenciários'
            object Label50: TLabel
              Left = 4
              Top = 134
              Width = 65
              Height = 13
              Caption = 'Documento'
            end
            object Label55: TLabel
              Left = 122
              Top = 134
              Width = 65
              Height = 13
              Caption = 'Logradouro'
            end
            object Label56: TLabel
              Left = 518
              Top = 134
              Width = 44
              Height = 13
              Caption = 'Número'
            end
            object Label49: TLabel
              Left = 278
              Top = 209
              Width = 26
              Height = 13
              Caption = 'Tipo'
            end
            object Label48: TLabel
              Left = 109
              Top = 209
              Width = 98
              Height = 13
              Caption = 'Número Telefone'
            end
            object Label47: TLabel
              Left = 4
              Top = 209
              Width = 28
              Height = 13
              Caption = 'DDD'
            end
            object Label17: TLabel
              Left = 206
              Top = 171
              Width = 25
              Height = 13
              Caption = 'CEP'
            end
            object Label28: TLabel
              Left = 4
              Top = 170
              Width = 34
              Height = 13
              Caption = 'Bairro'
            end
            object Label45: TLabel
              Left = 318
              Top = 171
              Width = 40
              Height = 13
              Caption = 'Cidade'
            end
            object Label46: TLabel
              Left = 528
              Top = 171
              Width = 40
              Height = 13
              Caption = 'Estado'
            end
            object Label57: TLabel
              Left = 439
              Top = 209
              Width = 63
              Height = 13
              Caption = 'Recebedor'
            end
            object Label64: TLabel
              Left = 575
              Top = 132
              Width = 76
              Height = 13
              Caption = 'Complemento'
            end
            object pnlBenefPrevidenciario: TPanel
              Left = 0
              Top = 0
              Width = 778
              Height = 30
              Align = alTop
              BevelInner = bvLowered
              BevelWidth = 2
              Caption = 'Beneficiários Previdenciários'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 0
            end
            object dbgridpartprev: TwwDBGrid
              Left = 0
              Top = 30
              Width = 778
              Height = 91
              Selected.Strings = (
                'MATRICULA'#9'10'#9'Matrícula'
                'NOMEBENEF'#9'41'#9'Beneficiário'
                'PLANPREV'#9'36'#9'Plano'
                'BENEFICIO'#9'60'#9'Benefício'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alTop
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              ReadOnly = True
              TabOrder = 1
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object DBEdit36: TDBEdit
              Left = 4
              Top = 148
              Width = 113
              Height = 21
              Color = clInfoBk
              DataField = 'DOCBEN'
              Enabled = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit41: TDBEdit
              Left = 122
              Top = 148
              Width = 391
              Height = 21
              Color = clInfoBk
              DataField = 'LOGRADOURO'
              Enabled = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit42: TDBEdit
              Left = 518
              Top = 148
              Width = 52
              Height = 21
              Color = clInfoBk
              DataField = 'NUMERO'
              Enabled = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit35: TDBEdit
              Left = 279
              Top = 222
              Width = 64
              Height = 21
              Color = clInfoBk
              DataField = 'TIPO'
              Enabled = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit34: TDBEdit
              Left = 109
              Top = 222
              Width = 101
              Height = 21
              Color = clInfoBk
              DataField = 'NUMEROTEL'
              Enabled = False
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit33: TDBEdit
              Left = 4
              Top = 222
              Width = 36
              Height = 21
              Color = clInfoBk
              DataField = 'DDD'
              Enabled = False
              ReadOnly = True
              TabOrder = 7
            end
            object DBEdit5: TDBEdit
              Left = 206
              Top = 184
              Width = 104
              Height = 21
              Color = clInfoBk
              DataField = 'CEP'
              Enabled = False
              ReadOnly = True
              TabOrder = 8
            end
            object DBEdit6: TDBEdit
              Left = 4
              Top = 184
              Width = 196
              Height = 21
              Color = clInfoBk
              DataField = 'BAIRRO'
              Enabled = False
              ReadOnly = True
              TabOrder = 9
            end
            object DBEdit29: TDBEdit
              Left = 316
              Top = 184
              Width = 207
              Height = 21
              Color = clInfoBk
              DataField = 'NOME'
              Enabled = False
              ReadOnly = True
              TabOrder = 10
            end
            object DBEdit32: TDBEdit
              Left = 529
              Top = 184
              Width = 239
              Height = 21
              Color = clInfoBk
              DataField = 'NOMEESTADO'
              Enabled = False
              ReadOnly = True
              TabOrder = 11
            end
            object DBEdit43: TDBEdit
              Left = 439
              Top = 222
              Width = 330
              Height = 21
              Color = clInfoBk
              DataField = 'NOMERESP'
              Enabled = False
              ReadOnly = True
              TabOrder = 12
            end
            object DBEdit45: TDBEdit
              Left = 575
              Top = 148
              Width = 193
              Height = 21
              Color = clInfoBk
              DataField = 'COMPLEMENTO'
              Enabled = False
              ReadOnly = True
              TabOrder = 13
            end
            object wwDBGrid8: TwwDBGrid
              Left = 4
              Top = 248
              Width = 767
              Height = 65
              Selected.Strings = (
                'NUMBANCO'#9'4'#9'Banco'#9'F'
                'NOMEBANCO'#9'30'#9'Nome do Banco'#9'F'
                'NUMAGENCIA'#9'10'#9'Num. Agência'#9'F'
                'NOMEAGENCIA'#9'30'#9'Nome da Agência'#9'F'
                'CONTACORRENTE'#9'15'#9'Conta'#9'F'
                'CONTAPREF'#9'3'#9'Conta Pref.'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Color = clInfoBk
              TabOrder = 14
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
          object tbsBenefAssist: TTabSheet
            Caption = 'Assistenciais'
            ImageIndex = 1
            object pnlBenefAssistencial: TPanel
              Left = 0
              Top = 0
              Width = 778
              Height = 30
              Align = alTop
              BevelInner = bvLowered
              BevelWidth = 2
              Caption = 'Beneficiários Assistenciais'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 0
            end
            object dbgridpart: TwwDBGrid
              Left = 0
              Top = 30
              Width = 778
              Height = 290
              Selected.Strings = (
                'DEPEN'#9'48'#9'Nome do Beneficiário'
                'PLANASS'#9'35'#9'Plano Assistencial'
                'PLANPREV'#9'25'#9'Plano previdenciário')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.dspart
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              ReadOnly = True
              TabOrder = 1
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
      end
      object tbsEmprestimo: TTabSheet
        Caption = 'tbsEmprestimo'
        ImageIndex = 12
        TabVisible = False
      end
      object TbShtEvent: TTabSheet
        Caption = 'Eventos'
        object pgCrtlEvent: TPageControl
          Left = 0
          Top = 0
          Width = 786
          Height = 348
          ActivePage = tbShtEventPrev
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 0
          OnChange = pgCrtlEventChange
          object tbShtEventPrev: TTabSheet
            Caption = 'Previdenciário'
            object Splitter5: TSplitter
              Left = 0
              Top = 153
              Width = 778
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object pnlEventPrev: TPanel
              Left = 0
              Top = 0
              Width = 778
              Height = 30
              Align = alTop
              BevelInner = bvLowered
              BevelWidth = 2
              Caption = 'Eventos Previdenciários'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 0
            end
            object grpbxHstEventPro: TGroupBox
              Left = 0
              Top = 30
              Width = 778
              Height = 123
              Align = alTop
              Caption = 'Histórico de Eventos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -19
              Font.Name = 'Bookman Old Style'
              Font.Style = [fsItalic]
              ParentFont = False
              TabOrder = 1
              object dbgEventosPrev: TwwDBGrid
                Left = 2
                Top = 25
                Width = 774
                Height = 96
                Selected.Strings = (
                  'NOME'#9'40'#9'Evento Gerador'
                  'DATAEVENTO'#9'11'#9'Evento'
                  'INSCRICAONUMERO'#9'11'#9'Número~Inscrição'
                  'DATAREGISTRO'#9'11'#9'Registro'
                  'DATAEFETIVADO'#9'10'#9'Efetivação'
                  'DATAVOLTA'#9'13'#9'Encerramento'
                  'SITPARTNOVO'#9'30'#9'Nova Situação~na Fundação'
                  'SITFUNCNOVO'#9'30'#9'Nova Situação~na Patrocinadora'
                  'SITPLANONOVO'#9'30'#9'Nova Situação~no Plano'
                  'SITPARTATUAL'#9'30'#9'Situação Fundação ~Antes do Evento'
                  'SITFUNCATUAL'#9'30'#9'Situação Patrocinadora ~Antes do Evento'
                  'SITPLANOATUAL'#9'30'#9'Situação Plano ~Antes do Evento'
                  'PLANO'#9'40'#9'Plano'
                  'PATRO'#9'40'#9'Patrocinadora')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 1
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dtmConsPart.dsEventosPrev
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 2
                TitleButtons = False
                IndicatorColor = icBlack
              end
            end
            object GroupBox2: TGroupBox
              Left = 0
              Top = 156
              Width = 778
              Height = 164
              Align = alClient
              Caption = 'Histórico de Contribuições'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -19
              Font.Name = 'Bookman Old Style'
              Font.Style = [fsItalic]
              ParentFont = False
              TabOrder = 2
              object pnlEventPrevHstContrib: TPanel
                Left = 611
                Top = 25
                Width = 165
                Height = 137
                Align = alRight
                BevelOuter = bvNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object Shape1: TShape
                  Left = 7
                  Top = 17
                  Width = 16
                  Height = 12
                  Brush.Color = clMaroon
                end
                object Shape4: TShape
                  Left = 7
                  Top = 50
                  Width = 16
                  Height = 12
                  Brush.Color = clTeal
                end
                object lblLegendaNovasContrib: TLabel
                  Left = 35
                  Top = 50
                  Width = 101
                  Height = 26
                  Caption = 'Novas Contribuições Associadas'
                  WordWrap = True
                end
                object lblLegendaContribSusp: TLabel
                  Left = 33
                  Top = 14
                  Width = 122
                  Height = 26
                  Caption = 'Contribuições Suspensas de Cobrança'
                  WordWrap = True
                end
              end
              object Panel1: TPanel
                Left = 2
                Top = 25
                Width = 609
                Height = 137
                Align = alClient
                BevelOuter = bvNone
                Caption = 'Panel1'
                TabOrder = 1
                object dbgHstContFechado: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 609
                  Height = 137
                  Selected.Strings = (
                    'CONTRIBUICAOF'#9'85'#9'Contribuição')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dtmConsPart.dsHstContF
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
                  ParentFont = False
                  TabOrder = 0
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 2
                  TitleButtons = False
                  OnCalcCellColors = dbgHstContFechadoCalcCellColors
                  IndicatorColor = icBlack
                end
              end
            end
          end
          object tbShtEventAssistencial: TTabSheet
            Caption = 'Assistencial'
            object pnlEventos: TPanel
              Left = 0
              Top = 0
              Width = 778
              Height = 30
              Align = alTop
              BevelInner = bvLowered
              BevelWidth = 2
              Caption = 'Eventos Assistenciais'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 0
            end
            object dbgrdEventos: TwwDBGrid
              Left = 0
              Top = 30
              Width = 778
              Height = 290
              Selected.Strings = (
                'DATAEVENT'#9'10'#9'Data do Evento'#9'No'
                'VALOREVENT'#9'10'#9'Valor do Evento'#9'No'
                'SERV'#9'25'#9'Serviço'#9'No'
                'PLANASS'#9'25'#9'Plano Assistencial'#9'No'
                'PREV'#9'25'#9'Plano Previdenciário'#9'No'
                'TIT'#9'25'#9'Titular'#9'No'
                'DEP'#9'25'#9'Dependente'#9'No'
                'VALORPAGO'#9'10'#9'Valor Pago'#9'No'
                'DATAPAG'#9'10'#9'Data do Pagamento'#9'No'
                'FLGREEMBOLSO'#9'10'#9'Reembolso ?'#9'No'
                'MATRICULA'#9'13'#9'Matrícula'#9'No'
                'CPF'#9'13'#9'CPF'#9'No'
                'DATAADMISSAO'#9'10'#9'Data de Admissão'#9'No')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 1
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmConsPart.dsevent
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              TabOrder = 1
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
      end
      object TbShTReserv: TTabSheet
        Caption = 'Histórico Reserva/Saldo Conta '
        object pnlResPoupanca: TPanel
          Left = 0
          Top = 0
          Width = 786
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Histórico Reserva/Saldo de Conta'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object dbgrHistReserva: TwwDBGrid
          Left = 0
          Top = 30
          Width = 786
          Height = 318
          Selected.Strings = (
            'CODIGO'#9'8'#9'Código'#9'F'
            'MESREFERENCIA'#9'8'#9'Referência'#9'F'
            'FLGENTRADA'#9'3'#9'E/S'#9'F'
            'SALDOCOTAS'#9'18'#9'Saldo Cotas'#9'F'
            'VALORINDICE'#9'12'#9'Valor Índice'#9'F'
            'SALDOREAL'#9'13'#9'Saldo Real'#9'F'
            'VLRCOTAS'#9'18'#9'Valor Cotas'#9'F'
            'VLRREAL'#9'14'#9'Valor Real'#9'F'
            'NOME'#9'43'#9'Nome da Reserva '#9'F'
            'DATAALIMENTACAO'#9'10'#9'Alimentação'#9'F'
            'DATAMOV'#9'10'#9'Movimento'#9'F'
            'MOESIGLA'#9'11'#9'Índice'#9'F'
            'NOMEBENEF'#9'34'#9'Benefício'#9'F'
            'NOMECONTRIB'#9'40'#9'Contribuição'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dtmConsPart.dsHistReserva
          EditCalculated = True
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object TbShtProc: TTabSheet
        Caption = 'Processos RAD'
        object dbgridproc: TwwDBGrid
          Left = 0
          Top = 30
          Width = 786
          Height = 318
          Selected.Strings = (
            'IDPROCESSO'#9'10'#9'Num. Processo'
            'DATAINIPROCESSO'#9'10'#9'Data Ini'
            'DATAFIMPROCESSO'#9'10'#9'Data Fim'
            'DATAFIMPREV'#9'10'#9'Fim Prev.'
            'STATUS'#9'20'#9'Status'
            'TIPOPROCESSO'#9'35'#9'Tipo de Processo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dtmConsPart.dsprocesso
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentShowHint = False
          ReadOnly = True
          ShowHint = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object pnlProcessoRAD: TPanel
          Left = 0
          Top = 0
          Width = 786
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Processos RAD'
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
      object tbhRub: TTabSheet
        Caption = 'Rub'
        object Splitter3: TSplitter
          Left = 783
          Top = 0
          Width = 3
          Height = 348
          Cursor = crHSplit
          Align = alRight
        end
        object Splitter8: TSplitter
          Left = 373
          Top = 0
          Width = 5
          Height = 348
          Cursor = crHSplit
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 373
          Height = 348
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel5'
          TabOrder = 0
          object Splitter2: TSplitter
            Left = 0
            Top = 180
            Width = 373
            Height = 5
            Cursor = crHSplit
            Align = alNone
          end
          object GrdRub: TwwDBGrid
            Left = 0
            Top = 25
            Width = 373
            Height = 155
            Selected.Strings = (
              'IDRUBS'#9'10'#9'Num Rubs'
              'STATUS'#9'13'#9'Status'
              'DATAMOV'#9'19'#9'Data de Movimentação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dtmConsPart.DsRubs
            KeyOptions = []
            Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel23: TPanel
            Left = 0
            Top = 0
            Width = 373
            Height = 25
            BevelInner = bvLowered
            Caption = 'RUBS'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 1
          end
          object Panel27: TPanel
            Left = 0
            Top = 185
            Width = 373
            Height = 163
            Align = alBottom
            BevelOuter = bvNone
            Caption = 'Panel27'
            TabOrder = 2
            object wwDBGrid4: TwwDBGrid
              Left = 0
              Top = 0
              Width = 373
              Height = 163
              Selected.Strings = (
                'NOME'#9'50'#9'Benefício\Serviço'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dtmConsPart.DsRubXBeneficio
              KeyOptions = []
              MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
              Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object Panel30: TPanel
              Left = 0
              Top = 0
              Width = 373
              Height = 25
              BevelInner = bvLowered
              Caption = 'Benefícios/Serviços'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object Panel28: TPanel
          Left = 378
          Top = 0
          Width = 405
          Height = 348
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel28'
          TabOrder = 1
          object Splitter10: TSplitter
            Left = 0
            Top = 180
            Width = 405
            Height = 5
            Cursor = crVSplit
            Align = alBottom
          end
          object Panel22: TPanel
            Left = 0
            Top = 0
            Width = 405
            Height = 25
            Align = alTop
            BevelInner = bvLowered
            Caption = 'Documentos'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
          end
          object wwDBGrid5: TwwDBGrid
            Left = 0
            Top = 25
            Width = 405
            Height = 155
            Selected.Strings = (
              'FLGRECEBIDO'#9'2'#9'Recebido'#9'F'
              'DATARECEB'#9'13'#9'Data Recebimento'#9'F'
              'NOMEDOCUMENTO'#9'100'#9'Documento'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Color = clWhite
            DataSource = dtmConsPart.dsTipoDocXRub
            KeyOptions = []
            MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
            Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            ReadOnly = True
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = wwDBGrid5CalcCellColors
            IndicatorColor = icBlack
          end
          object Panel29: TPanel
            Left = 0
            Top = 185
            Width = 405
            Height = 163
            Align = alBottom
            BevelOuter = bvNone
            Caption = 'Panel29'
            TabOrder = 2
            object wwDBGrid6: TwwDBGrid
              Left = 0
              Top = 25
              Width = 405
              Height = 138
              Hint = 'Duplo Click exibe o conteúdo do histórico'
              Selected.Strings = (
                'HISTORICO'#9'9'#9'Histórico'
                'STATUS'#9'20'#9'Descrição'
                'TRGDTINCLUSAO'#9'10'#9'Data')
              MemoAttributes = [mSizeable, mWordWrap, mGridShow]
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dtmConsPart.DsHistRubs
              KeyOptions = []
              Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object Panel31: TPanel
              Left = 0
              Top = 0
              Width = 405
              Height = 25
              BevelInner = bvLowered
              Caption = 'Histórico de Movimentacão da RUBS'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
      object tbsPagamento: TTabSheet
        Caption = 'Pagamentos'
        ImageIndex = 11
        object dbgrVersoes: TwwDBGrid
          Left = 0
          Top = 0
          Width = 387
          Height = 124
          Selected.Strings = (
            'HISTORICO'#9'50'#9'Histórico')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnRowChanged = dbgrVersoesRowChanged
          FixedCols = 0
          ShowHorzScrollBar = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 128
          Width = 751
          Height = 217
          Selected.Strings = (
            'MES'#9'7'#9'Referência'#9'F'
            'FLGDESCONTO'#9'1'#9'P/D'#9'F'
            'VALORPROVENTO'#9'10'#9'Valor'#9'F'
            'IDRUBRICA'#9'10'#9'Rubrica'#9'F'
            'DESCPROVENTO'#9'130'#9'Descrição'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ReadOnly = True
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object Panel7: TPanel
          Left = 391
          Top = 0
          Width = 360
          Height = 125
          TabOrder = 2
          object Recebedor: TLabel
            Left = 8
            Top = 2
            Width = 63
            Height = 13
            Caption = 'Recebedor'
          end
          object Label2: TLabel
            Left = 9
            Top = 39
            Width = 37
            Height = 13
            Caption = 'Banco'
          end
          object Label3: TLabel
            Left = 62
            Top = 39
            Width = 47
            Height = 13
            Caption = 'Agência'
          end
          object Label4: TLabel
            Left = 9
            Top = 78
            Width = 85
            Height = 13
            Caption = 'Conta corrente'
          end
          object Label5: TLabel
            Left = 138
            Top = 39
            Width = 73
            Height = 13
            Caption = 'Valor líquido'
          end
          object Label6: TLabel
            Left = 272
            Top = 39
            Width = 68
            Height = 13
            Caption = 'Programada'
          end
          object Label7: TLabel
            Left = 272
            Top = 79
            Width = 51
            Height = 13
            Caption = 'Situação'
          end
          object Label8: TLabel
            Left = 138
            Top = 78
            Width = 76
            Height = 13
            Caption = 'Arquivo texto'
          end
          object dblkRecebedor: TwwDBLookupCombo
            Left = 8
            Top = 15
            Width = 346
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Recebedor'#9'F')
            LookupTable = dtmConsPart.qryRecebedor
            LookupField = 'IDRESPONSAVEL'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = dblkRecebedorChange
          end
          object wwDBEdit1: TwwDBEdit
            Left = 8
            Top = 52
            Width = 47
            Height = 21
            Color = clInfoBk
            DataField = 'NUMBANCO'
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit2: TwwDBEdit
            Left = 62
            Top = 52
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'NUMAGENCIA'
            ReadOnly = True
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit3: TwwDBEdit
            Left = 8
            Top = 91
            Width = 110
            Height = 21
            Color = clInfoBk
            DataField = 'CONTACORRENTE'
            ReadOnly = True
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit7: TwwDBEdit
            Left = 138
            Top = 91
            Width = 119
            Height = 21
            Color = clInfoBk
            DataField = 'NOMETXT'
            ReadOnly = True
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit4: TwwDBEdit
            Left = 138
            Top = 52
            Width = 118
            Height = 21
            Color = clInfoBk
            DataField = 'LIQRECEBIDO'
            ReadOnly = True
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit5: TwwDBEdit
            Left = 272
            Top = 52
            Width = 79
            Height = 21
            Color = clInfoBk
            DataField = 'DATAPROGRAMADA'
            ReadOnly = True
            TabOrder = 6
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit6: TwwDBEdit
            Left = 272
            Top = 91
            Width = 80
            Height = 21
            Color = clInfoBk
            DataField = 'SITDOCPAGTO'
            ReadOnly = True
            TabOrder = 7
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Protocolo'
        ImageIndex = 12
        object DBCtrlGrid1: TDBCtrlGrid
          Left = 8
          Top = 8
          Width = 761
          Height = 337
          ColCount = 1
          DataSource = dtmConsPart.dsFiario
          PanelHeight = 112
          PanelWidth = 745
          TabOrder = 0
          RowCount = 3
          object Label9: TLabel
            Left = 88
            Top = 19
            Width = 24
            Height = 13
            Caption = 'Rub'
          end
          object Label10: TLabel
            Left = 8
            Top = 19
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object Label11: TLabel
            Left = 8
            Top = 56
            Width = 44
            Height = 13
            Caption = 'Usuário'
          end
          object Label58: TLabel
            Left = 208
            Top = 8
            Width = 35
            Height = 13
            Caption = 'Grupo'
          end
          object DBMemo1: TDBMemo
            Left = 209
            Top = 32
            Width = 529
            Height = 60
            Color = clInfoBk
            DataField = 'DESCRICAO'
            DataSource = dtmConsPart.dsFiario
            Enabled = False
            TabOrder = 0
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 32
            Width = 75
            Height = 21
            Color = clInfoBk
            DataField = 'DATAINCLUSAO'
            DataSource = dtmConsPart.dsFiario
            Enabled = False
            TabOrder = 1
          end
          object DBEdit2: TDBEdit
            Left = 8
            Top = 69
            Width = 194
            Height = 21
            Color = clInfoBk
            DataField = 'NOMEUSUARIO'
            DataSource = dtmConsPart.dsFiario
            Enabled = False
            TabOrder = 2
          end
          object DBEdit3: TDBEdit
            Left = 88
            Top = 32
            Width = 114
            Height = 21
            Color = clInfoBk
            DataField = 'IDRUBS'
            DataSource = dtmConsPart.dsFiario
            Enabled = False
            TabOrder = 3
          end
          object DBEdit44: TDBEdit
            Left = 248
            Top = 5
            Width = 489
            Height = 21
            Color = clInfoBk
            DataField = 'DESCGRUPO'
            DataSource = dtmConsPart.dsFiario
            Enabled = False
            TabOrder = 4
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Empréstimos'
        ImageIndex = 13
        object wwDBGrid2: TwwDBGrid
          Left = 2
          Top = 148
          Width = 778
          Height = 196
          Selected.Strings = (
            'ITEDESCRICAO'#9'27'#9'Ítem'
            'HMEPARCELA'#9'6'#9'Parcela'
            'HMEDATA'#9'10'#9'Data~Movimento'
            'HMEVLRPREVISTO'#9'11'#9'Valor~Previsto'
            'HMEVLREFETIVO'#9'10'#9'Valor~Efetivo'
            'DESCBAIXADO'#9'9'#9'Situação'
            'HMEDATAPREVISTA'#9'10'#9'Prevista'
            'HMEDATAEFETIVA'#9'10'#9'Efetiva'
            'HMEANOCOMPETENCIA'#9'10'#9'Ano~Competência'
            'HMEMESCOMPETENCIA'#9'10'#9'Mês~Competência'
            'HMEANOCOBRANCA'#9'7'#9'Ano~Cobrança'
            'HMEMESCOBRANCA'#9'8'#9'Mês~Cobrança'
            'HMETIPOMOV'#9'34'#9'Tipo Movimento'
            'HMESALDODEV'#9'10'#9'Saldo ')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtmConsPart.dsHstEmprestimo
          TabOrder = 0
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
        object wwDBGrid3: TwwDBGrid
          Left = 2
          Top = 0
          Width = 778
          Height = 136
          Selected.Strings = (
            'TCEDESCRICAO'#9'29'#9'Tipo'
            'DESCSITUACAO'#9'7'#9'Situação'
            'VLRCONTRATO'#9'11'#9'Valor Contrato'
            'VLRPARCELA'#9'11'#9'Valor Parcelas'
            'NUMPARCELAS'#9'10'#9'No Parcelas'
            'PARCELASRESTANTES'#9'8'#9'Restantes'
            'HMESALDODEV'#9'12'#9'Saldo Devedor'
            'DATAASSINATURA'#9'18'#9'Assinatura'
            'DATACANC'#9'18'#9'Cancelamento'
            'TXJUROS'#9'10'#9'Tx Juros'
            'DATACREDITO'#9'18'#9'Crédito'
            'DATAPRIMPARC'#9'18'#9'1a Parcela'
            'HMEDATAATUALIZA'#9'18'#9'Atualização'
            'DESCREC'#9'50'#9'Contas/Caixas Recbto'
            'DESCPAG'#9'50'#9'Contas/Caixas Pagto'
            'DESCFORMA'#9'30'#9'Forma Pagto')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnRowChanged = wwDBGrid3RowChanged
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtmConsPart.dsEmprestimo
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object TbshHstRubricas: TTabSheet
        Caption = 'Histórico de Rubricas'
        ImageIndex = 13
        OnShow = TbshHstRubricasShow
        object Label65: TLabel
          Left = 11
          Top = 3
          Width = 100
          Height = 13
          Caption = 'Mês de Cobrança'
        end
        object dblkMesCobranca: TwwDBLookupCombo
          Left = 10
          Top = 17
          Width = 103
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MESCOBRANCA'#9'7'#9'MESCOBRANCA'#9'F')
          LookupTable = dtmConsPart.qryMesRubrica
          LookupField = 'MESCOBRANCA'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkMesCobrancaChange
        end
        object Panel6: TPanel
          Left = 0
          Top = 44
          Width = 786
          Height = 27
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Histórico de Rubricas Salariais - Ativo'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
        object wwDBGrid7: TwwDBGrid
          Left = 1
          Top = 72
          Width = 782
          Height = 273
          Selected.Strings = (
            'MES'#9'9'#9'Mês de ~Referrência'
            'MESCOBRANCA'#9'9'#9'Mês de ~Cob./Pag.'
            'IDRUBRICA'#9'12'#9'Código da Rubrica'
            'VALORPROVENTO'#9'12'#9'Valor (R$)'
            'DESCRICAO'#9'50'#9'Rubrica'
            'DESCFLGSRB'#9'30'#9'Tipo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtmConsPart.DsHstRubricas
          TabOrder = 2
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
      end
    end
  end
  object pnlNomeElegPart: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = clGray
    TabOrder = 1
    object lblnome: TLabel
      Left = 3
      Top = 1
      Width = 794
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
      Left = 4
      Top = 26
      Width = 794
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
  end
  object Dock971: TDock97
    Left = 0
    Top = 453
    Width = 804
    Height = 39
    AllowDrag = False
    Background.Data = {
      760F0000424D760F0000000000007600000028000000800000003C0000000100
      040000000000000F000000000000000000001000000000000000000000008080
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      777777777777171717777777777777177771777777777777777077F7FF7FFFF7
      77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
      777777777771717717777777777777777717777777777777777777777FFFFF7F
      7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
      77777777777777171777777777777777717777777777777777777777777FF7FF
      7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
      7777777777771771777777777777777771777777777777777777777777777FFF
      FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
      777777777777771777777777777777777777777777777777777777777777777F
      F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
      7777777777777777777777777777777777777777777777777777777777777771
      77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
      7777777777777177777777777777777777777777777777777777777777777777
      777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
      7777777777777777771777777777777777777777777777777777777777777777
      7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
      7777777777777717771777777777777777777777777777777777777777777777
      77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
      7777777777777771777777777777777777777777777777777777777777777777
      777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
      7777777777777777777777777777777777777777777777777777777777777777
      777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
      7777777777777777177777777777777777777777777777777777777777777777
      7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
      7777777777777777717777777777777777777777777777777777777777777777
      7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
      7777777777777777777771777777777777777777777777777777777777777777
      7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
      F7F7777777777777771777777777177777777777777777777777777777777777
      77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
      777F7F7777777777777177177771717777777777777777777777777777777777
      77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
      77777F7F77777777777717771777777777777777777777777777777777777777
      777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
      1777777777777777777771717717777177777777777777777777777777777777
      777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
      7777777777771777777777177771777777777777777777777777777777777777
      77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
      7777777777777777777771777777777777777777777777777777777777777777
      777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
      7777777777171777777717777777777777777777777777777777777777777777
      77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
      7777777777777177777771777777777777777777777777777777777777777777
      777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
      7777777777777777777771177777777777777777777777777777777777777777
      7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
      7777777777777777777777777777777777777777777777777777777777777777
      7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
      7777777777777777777771717777777777777777777777777777777777777777
      777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
      7777777777777777777777171777777777777777777777777777777777777777
      71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
      7777777777777777777777177777777777777777777777777777777777777717
      77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
      77777777777777777777777777777777777F7777777777777777777777777171
      7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
      771777777777777777777777777777777177F777777777777777777777777717
      171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
      7777777777777777777777777777777777777F77777777777777777777777777
      77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
      7177777177777777777777777777777777777FF7F77771777777777777777777
      1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
      7777777717777777777777777777777777777777777777777777777777777777
      717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
      7177777777777777777777777777777777771777777777777777777777777777
      77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
      777777F777777777777777777777777777777777717177717777777777777777
      77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
      171777F7F7777777777777177777777777777777777777777777777777777777
      777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
      7777777F77777777777777777777777777777777777777777777777777777777
      77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
      7717777F77777777777777717177777777777777777777777777777777777777
      7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
      777777777F777777777777777717777777777777777777777777777777777777
      777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
      7777777777777777777777771777777777777777777777777777777777777777
      77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
      7777777777777777777777777717177777777771777777777777777777777777
      7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
      7777777777777177777777777777777777777717177777777777777777777777
      77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
      7777777777717777777777777717177777777777777777777777777777777777
      777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
      777777777717171717777777777777777777777771777777777F777777777777
      777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
      77777777171777777777777777777777777777777777777777F7F77777777777
      77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
      7777777777171777777777777777777777777777777777777777777777777777
      777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
      7777777717177777777777777777777777777777777777777777777777777777
      77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
      7777777777171777777777777777777777777777777777777777777777777777
      7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
      77777777777777777F7F77777717777777777777777777777777777771777777
      7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
      77777777777777777F7F7F777777777777777777777777777777771777777777
      77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
      777777777777777777FFF77F7777717777777777777777777777777777177777
      77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
      77F7777777777777777777F77777777777777777777777777777777777777777
      77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
      F77777777777777777777777F7F7777777777777777777777777777777777777
      777777777717777777777777777777777777717777777777777F7F7F7F77F77F
      77F77777777F77777717777777F7777777777777777777777777777777777777
      77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
      7F77F77777777F77777717777777777777777777777777777777777777777777
      7777777777771777777777777777777777777777777777777F77F7F7F777F777
      F77F777777777777771771777777771777777777777777777777777777777777
      777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
      F7F7777777777777777717171777777777777777777777777777777777777777
      77777777777771777777777777777177777777777771777777777777F777F777
      7777777777777777777171717177771777777777777777777777777777777777
      77777777777777777777777777777777777777777777777777777F7F7F7F7777
      F77F77F777777777777771771717177777777777777777777777777777777777
      7777777777777777777777777777777777777777777177777777}
    BoundLines = [blTop, blBottom]
    FixAlign = True
    LimitToOneRow = True
    Position = dpBottom
    object lblBloqueio: TLabel
      Left = 199
      Top = 7
      Width = 109
      Height = 24
      Caption = 'Bloqueado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object tb97Fundo: TToolbar97
      Left = 521
      Top = 0
      Caption = 'tb97Fundo'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 521
      TabOrder = 0
      object sep1: TToolbarSep97
        Left = 160
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object sep3: TToolbarSep97
        Left = 243
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object bbtnSair: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnSairClick
        Glyph.Data = {
          F6010000424DF601000000000000760000002800000030000000100000000100
          0400000000008001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8F8FF8F00F
          8F77FF8F8FF8F00F8F778FF8F8FF8F8FF8F7F8FF8F8FF0E0FF87F8FF8F8FF0E0
          FF878F8FF8F8FF8F8FF7F8F8FF8F80E608F7F8F8FF8F80E608F7FF8F8FF8F8FF
          8F87000000FF80E66007000000FF80E66007F8FF8F8FF8F8FF87777770F8F0E6
          6087777770F8F0E6608777777066666668777777007770E660877777007770E6
          608777777066666668777777007770E660877777007770E66087777770666666
          68777788060770E760877788060770E76087777770666666687770000E6070E0
          608770000E6070E0608777777066666668770EEEEEE600E660870EEEEEE600E6
          608777777067666668770EEEEEE600E660870EEEEEE600E66087777770606666
          687770000E6070E6608770000E6070E6608777777066666668777777060770E6
          60877777060770E66087777770666666687777770077770E608777770077770E
          60877777706666666877777770777770E087777770777770E087777770666666
          687777777000000000777777700000000077777770EEEEEEE877}
        NumGlyphs = 3
        Spacing = 2
      end
      object bbtnAjuda: TmaHelpBitBtn
        Left = 163
        Top = 0
        Width = 80
        Height = 33
        Caption = 'Ajuda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Kind = bkHelp
        Spacing = 2
        ClickHelpContext = 0
      end
      object bbtnProcurar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
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
        Spacing = 2
      end
    end
  end
  object qryAux: TwwQuery
    ValidateWithMask = True
    Left = 488
    Top = 16
  end
  object MSConsPart_VELHO: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante/Dependente'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'CPF'
      'Inscrição'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PJ'
      'ELEGPATRO'
      'PLANPREV'
      'PARTPREVPLAN'
      'SITPART'
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME'
      'PJ.IDPESSOA'
      'VWPARTICIPDEPEN.IDTITULAR'
      'SITPART.DESCRICAO'
      'VWPARTICIPDEPEN.IDPESSOA'
      'PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA'
      'PLANPREV.IDRGELEGBENEF'
      'VWPARTICIPDEPEN.IDPESSJUR'
      'ELEGPATRO.IDPESSJUR')
    Filtro.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSOA = VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPESSOA(+) = VWPARTICIPDEPEN.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR(+) = VWPARTICIPDEPEN.IDPESSJUR'
      'PJ.IDPESSOA(+) = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART(+)'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV(+)'
      
        '((PARTPREVPLAN.FLGDESATIVADO = 1 AND PARTPREVPLAN.IDPESSOA NOT I' +
        'N (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESS' +
        'OA = PARTPREVPLAN.IDPESSOA AND PPP1.FLGDESATIVADO = 0)) OR PARTP' +
        'REVPLAN.FLGDESATIVADO = 0 )')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '60'
      '18'
      '10'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 325
    Top = 18
  end
  object MsConsPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.PLANO'
      
        'DECODE (VWPARTICIPDEPEN.FLGDESATIVADO, NULL, '#39' '#39',  1, '#39'NÃO'#39', 0, ' +
        #39'SIM'#39')'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'VWPARTICIPDEPEN.PATRO'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Plano'
      'Ativo no Plano'
      'Inscrição'
      'Patrocinadora'
      'CPF'
      'Sit. Participante')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.IDPESSJUR'
      'VWPARTICIPDEPEN.IDPLANOPREV'
      'VWPARTICIPDEPEN.SEQPROPOSTA'
      'VWPARTICIPDEPEN.IDRGELEGBENEF'
      'VWPARTICIPDEPEN.IDTITULAR')
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
      '35'
      '35'
      '6'
      '10'
      '30'
      '18'
      '35')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 587
    Top = 16
  end
end
