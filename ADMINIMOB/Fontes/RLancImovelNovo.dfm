inherited frmRelLancImovelNovo: TfrmRelLancImovelNovo
  Left = 408
  Top = 154
  HelpContext = 640022
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Consulta de Lançamentos'
  ClientHeight = 405
  ClientWidth = 783
  PixelsPerInch = 96
  TextHeight = 13
  object Label29: TLabel [0]
    Left = 657
    Top = 114
    Width = 116
    Height = 13
    Caption = 'Valor do Documento'
  end
  inherited pnlFundo: TPanel
    Width = 783
    Height = 335
    object pgcPrincipal: TPageControl
      Left = 1
      Top = 1
      Width = 781
      Height = 280
      ActivePage = tbsGeral
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Dados Gerais'
        Enabled = False
        object Label22: TLabel
          Left = 5
          Top = 10
          Width = 155
          Height = 13
          Caption = 'Tipo de Receita / Despesa'
        end
        object Label3: TLabel
          Left = 5
          Top = 50
          Width = 103
          Height = 13
          Caption = 'Credor / Debitado'
        end
        object Label7: TLabel
          Left = 309
          Top = 10
          Width = 188
          Height = 13
          Caption = 'Forma de Cobrança / Pagamento'
        end
        object Label16: TLabel
          Left = 649
          Top = 10
          Width = 116
          Height = 13
          Caption = 'Valor do Documento'
        end
        object Label15: TLabel
          Left = 5
          Top = 90
          Width = 74
          Height = 13
          Caption = 'Competência'
        end
        object lblDataVencimento: TLabel
          Left = 197
          Top = 90
          Width = 75
          Height = 13
          Caption = 'Data Lancto.'
        end
        object Label8: TLabel
          Left = 5
          Top = 202
          Width = 217
          Height = 13
          Caption = 'Usuário responsável pelo Lançamento'
        end
        object Label4: TLabel
          Left = 493
          Top = 202
          Width = 40
          Height = 13
          Caption = 'Origem'
        end
        object Label2: TLabel
          Left = 277
          Top = 90
          Width = 76
          Height = 13
          Caption = 'Data Vencto.'
        end
        object Label11: TLabel
          Left = 357
          Top = 90
          Width = 63
          Height = 13
          Caption = 'Data Baixa'
        end
        object Label12: TLabel
          Left = 685
          Top = 202
          Width = 80
          Height = 13
          Caption = 'Data Inclusão'
        end
        object Label1: TLabel
          Left = 649
          Top = 90
          Width = 63
          Height = 13
          Caption = 'Valor Total'
        end
        object Label26: TLabel
          Left = 5
          Top = 130
          Width = 75
          Height = 13
          Caption = 'Observações'
        end
        object Bevel1: TBevel
          Left = 5
          Top = 196
          Width = 762
          Height = 3
          Shape = bsTopLine
        end
        object Label27: TLabel
          Left = 445
          Top = 90
          Width = 127
          Height = 13
          Caption = 'Bco.   Ag.         Conta'
        end
        object Label30: TLabel
          Left = 649
          Top = 50
          Width = 116
          Height = 13
          Caption = 'Valor de Alteradores'
        end
        object Label31: TLabel
          Left = 649
          Top = 130
          Width = 117
          Height = 13
          Caption = 'Saldo do documento'
        end
        object DBEdit3: TDBEdit
          Left = 5
          Top = 24
          Width = 289
          Height = 21
          DataField = 'DESCCUSTORECIMO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit6: TDBEdit
          Left = 237
          Top = 64
          Width = 361
          Height = 21
          DataField = 'RS_FORCLI'
          DataSource = ds
          ReadOnly = True
          TabOrder = 1
        end
        object DBedtPortadorForma: TDBEdit
          Left = 309
          Top = 24
          Width = 289
          Height = 21
          DataField = 'FORMA_RECTOPAGTO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit1: TDBEdit
          Left = 5
          Top = 64
          Width = 233
          Height = 21
          DataField = 'NF_FORCLI'
          DataSource = ds
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit4: TDBEdit
          Left = 649
          Top = 24
          Width = 117
          Height = 21
          Color = 12648447
          DataField = 'VALOR_DOCUMENTO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit11: TDBEdit
          Left = 5
          Top = 104
          Width = 117
          Height = 21
          DataField = '_MESCOMPETENCIA'
          DataSource = ds
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit12: TDBEdit
          Left = 121
          Top = 104
          Width = 65
          Height = 21
          DataField = 'ANOCOMPETENCIA'
          DataSource = ds
          ReadOnly = True
          TabOrder = 6
        end
        object DBedtNomeUsuario: TDBEdit
          Left = 5
          Top = 216
          Width = 121
          Height = 21
          DataField = 'LOGIN_USUARIO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 7
        end
        object DBedtNomeExtenso: TDBEdit
          Left = 125
          Top = 216
          Width = 337
          Height = 21
          DataField = 'NF_USUARIO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 8
        end
        object DBedtOrigem: TDBEdit
          Left = 493
          Top = 216
          Width = 173
          Height = 21
          DataField = '_ORIGEMLANC'
          DataSource = ds
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit16: TDBEdit
          Left = 197
          Top = 104
          Width = 77
          Height = 21
          DataField = 'DATALANCAMENTO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit17: TDBEdit
          Left = 277
          Top = 104
          Width = 77
          Height = 21
          DataField = 'DATAVENCIMENTO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit18: TDBEdit
          Left = 357
          Top = 104
          Width = 77
          Height = 21
          DataField = 'DATA_BAIXA'
          DataSource = ds
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit19: TDBEdit
          Left = 685
          Top = 216
          Width = 81
          Height = 21
          DataField = 'TRGDTINCLUSAO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit9: TDBEdit
          Left = 649
          Top = 104
          Width = 117
          Height = 21
          Color = 12648447
          DataField = 'VALOR_TOTAL'
          DataSource = ds
          ReadOnly = True
          TabOrder = 14
        end
        object DBmemObs: TDBMemo
          Left = 5
          Top = 144
          Width = 636
          Height = 41
          DataField = 'OBS'
          DataSource = dsObs
          TabOrder = 15
        end
        object DBEdit5: TDBEdit
          Left = 445
          Top = 104
          Width = 37
          Height = 21
          DataField = 'NUMBANCO'
          DataSource = dsContaBancairia
          ReadOnly = True
          TabOrder = 16
        end
        object DBEdit7: TDBEdit
          Left = 481
          Top = 104
          Width = 57
          Height = 21
          DataField = 'NUMAGENCIA'
          DataSource = dsContaBancairia
          ReadOnly = True
          TabOrder = 17
        end
        object DBEdit8: TDBEdit
          Left = 538
          Top = 104
          Width = 104
          Height = 21
          DataField = 'CONTACORRENTE'
          DataSource = dsContaBancairia
          ReadOnly = True
          TabOrder = 18
        end
        object DBEdit21: TDBEdit
          Left = 649
          Top = 64
          Width = 117
          Height = 21
          Color = 12648447
          DataField = 'TOT_ALTERADOR'
          DataSource = ds
          ReadOnly = True
          TabOrder = 19
        end
        object DBREdt_SaldoDoc: TDBRealEdit
          Left = 648
          Top = 144
          Width = 117
          Height = 21
          Alignment = taRightJustify
          Color = 12648447
          Lines.Strings = (
            '0,00')
          TabOrder = 20
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object tbsImovel: TTabSheet
        Caption = 'Detalhamento'
        ImageIndex = 1
        object DBgrdReajuste: TwwDBGrid
          Left = 11
          Top = 35
          Width = 758
          Height = 198
          Selected.Strings = (
            'IMOVEL_EXTENSO'#9'40'#9'Imovel'#9'F'
            'IMOCODIGO'#9'15'#9'Código'
            'CODTIPIMOVEL'#9'5'#9'Segmento'#9'F'
            'CONTRATO_EXTENSO'#9'40'#9'Contrato'
            'VALOR_LANC'#9'13'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = False
          DataSource = dsLancamentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdReajusteCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdReajusteTopRowChanged
        end
        object Panel3: TPanel
          Left = 11
          Top = 8
          Width = 758
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Lançamentos / Imóveis'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object tbsMensagem: TTabSheet
        Caption = 'Mensagem'
        Enabled = False
        ImageIndex = 2
        object Label13: TLabel
          Left = 80
          Top = 20
          Width = 47
          Height = 13
          Caption = 'Linha 1:'
        end
        object Label17: TLabel
          Left = 80
          Top = 44
          Width = 47
          Height = 13
          Caption = 'Linha 2:'
        end
        object Label18: TLabel
          Left = 80
          Top = 68
          Width = 47
          Height = 13
          Caption = 'Linha 3:'
        end
        object Label19: TLabel
          Left = 80
          Top = 92
          Width = 47
          Height = 13
          Caption = 'Linha 4:'
        end
        object Label20: TLabel
          Left = 80
          Top = 116
          Width = 47
          Height = 13
          Caption = 'Linha 5:'
        end
        object Label21: TLabel
          Left = 80
          Top = 140
          Width = 47
          Height = 13
          Caption = 'Linha 6:'
        end
        object Label23: TLabel
          Left = 80
          Top = 164
          Width = 47
          Height = 13
          Caption = 'Linha 7:'
        end
        object Label24: TLabel
          Left = 80
          Top = 188
          Width = 47
          Height = 13
          Caption = 'Linha 8:'
        end
        object Label25: TLabel
          Left = 80
          Top = 212
          Width = 47
          Height = 13
          Caption = 'Linha 9:'
        end
        object DBedtLinha1: TDBEdit
          Left = 136
          Top = 16
          Width = 505
          Height = 21
          DataField = 'TEXTO_LINHA_1'
          DataSource = dsMsg
          TabOrder = 0
        end
        object DBedtLinha2: TDBEdit
          Left = 136
          Top = 40
          Width = 505
          Height = 21
          DataField = 'TEXTO_LINHA_2'
          DataSource = dsMsg
          TabOrder = 1
        end
        object DBedtLinha3: TDBEdit
          Left = 136
          Top = 64
          Width = 505
          Height = 21
          DataField = 'TEXTO_LINHA_3'
          DataSource = dsMsg
          TabOrder = 2
        end
        object DBedtLinha4: TDBEdit
          Left = 136
          Top = 88
          Width = 505
          Height = 21
          DataField = 'TEXTO_LINHA_4'
          DataSource = dsMsg
          TabOrder = 3
        end
        object DBedtLinha5: TDBEdit
          Left = 136
          Top = 112
          Width = 505
          Height = 21
          DataField = 'TEXTO_LINHA_5'
          DataSource = dsMsg
          TabOrder = 4
        end
        object DBedtLinha6: TDBEdit
          Left = 136
          Top = 136
          Width = 505
          Height = 21
          DataField = 'TEXTO_LINHA_6'
          DataSource = dsMsg
          TabOrder = 5
        end
        object DBedtLinha7: TDBEdit
          Left = 136
          Top = 160
          Width = 505
          Height = 21
          DataField = 'TEXTO_LINHA_7'
          DataSource = dsMsg
          TabOrder = 6
        end
        object DBedtLinha8: TDBEdit
          Left = 136
          Top = 184
          Width = 505
          Height = 21
          DataField = 'TEXTO_LINHA_8'
          DataSource = dsMsg
          TabOrder = 7
        end
        object DBedtLinha9: TDBEdit
          Left = 136
          Top = 208
          Width = 505
          Height = 21
          DataField = 'TEXTO_LINHA_9'
          DataSource = dsMsg
          TabOrder = 8
        end
      end
      object tbsAlterador: TTabSheet
        Caption = 'Alteradores / Baixas'
        ImageIndex = 3
        object DBgrdAlteradoresDoc: TwwDBGrid
          Left = 11
          Top = 35
          Width = 758
          Height = 206
          Selected.Strings = (
            'DESCRICAO'#9'32'#9'Tipo do Alterador'#9'T'
            'VALOR'#9'17'#9'Valor'#9'T'
            'DATALANCTO'#9'15'#9'Data Lançamento'#9'T'
            'DATABAIXA'#9'13'#9'Data Baixa'#9'F'
            'DEBCRE'#9'5'#9'D / C'#9'T'
            'NOME'#9'60'#9'Usuário de Inclusão'#9'F'
            'TRGDTINCLUSAO'#9'18'#9'Data de Inclusão'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsAlteradoresDoc
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object Panel1: TPanel
          Left = 11
          Top = 8
          Width = 758
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Alteradores e Baixas do Documento'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBgrdAlteradoresLanc: TwwDBGrid
          Left = 11
          Top = 36
          Width = 758
          Height = 209
          Selected.Strings = (
            'DESCRICAO'#9'54'#9'Tipo do Alterador'#9'F'
            'VLRALTERADOR'#9'10'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsAlteradoresLanc
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object tbsAutorizacao: TTabSheet
        Caption = 'Liberações'
        ImageIndex = 4
        object Panel4: TPanel
          Left = 6
          Top = 8
          Width = 758
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Liberações do Documento'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object wwDBGrid1: TwwDBGrid
          Left = 6
          Top = 35
          Width = 758
          Height = 174
          Selected.Strings = (
            'DATA'#9'11'#9'Data'#9'F'
            'TIPO_CONCILIACAO'#9'45'#9'Tipo Autorização'#9'F'
            'DIFDIAS'#9'13'#9'Diferença Dias'#9'F'
            'DIFVLR'#9'15'#9'Diferença Valores'#9'F'
            'NOMEUSUARIO'#9'15'#9'Usuário'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsAutorizacoes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object wwDBRichEdit1: TwwDBRichEdit
          Left = 6
          Top = 212
          Width = 758
          Height = 33
          AutoURLDetect = False
          DataField = 'MOTIVO'
          DataSource = dsAutorizacoes
          PrintJobName = 'Delphi 5'
          ReadOnly = True
          TabOrder = 2
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            830000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C625C66305C6673313420777744425269636845646974315C7061
            720D0A7D0D0A00}
        end
      end
      object tbsCorrecao: TTabSheet
        Caption = 'Correções'
        ImageIndex = 5
        object Panel5: TPanel
          Left = 6
          Top = 8
          Width = 758
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Correções Diária por Atraso de Pagamento'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbgCorrecaoDoc: TwwDBGrid
          Left = 7
          Top = 35
          Width = 755
          Height = 206
          Selected.Strings = (
            'DATAOPER'#9'13'#9'Dt. Lancto'#9'F'
            'DATABAIXA'#9'13'#9'Dt. Baixa'#9'F'
            'VLRDIA_MUL'#9'12'#9'Multa'#9'F'
            'VLRDIA_JUR'#9'12'#9'Juros'#9'F'
            'VLRDIA_COR'#9'11'#9'Correção'#9'F'
            'VLRACUM_MUL'#9'11'#9'Acum. Multa'#9'F'
            'VLRACUM_JUR'#9'12'#9'Acum. Juros'#9'F'
            'VLRACUM_COR'#9'12'#9'Acum. Correção'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsCorrecaoDoc
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object tsEventos: TTabSheet
        Caption = 'Eventos'
        ImageIndex = 6
        object Panel6: TPanel
          Left = 6
          Top = 8
          Width = 758
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Eventos do Documento'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object wwDBGrid2: TwwDBGrid
          Left = 6
          Top = 35
          Width = 758
          Height = 126
          Selected.Strings = (
            'EVIDATA'#9'11'#9'Data'#9'F'
            'EVICABECALHO'#9'41'#9'Evento'#9'F'
            'FLGAVISO'#9'5'#9'Aviso'#9'F'
            'DIASAVISO'#9'5'#9'Dias'#9'F'
            'USUARIO_EXTENSO'#9'38'#9'Usuário'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsEvento
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object wwDBRichEdit2: TwwDBRichEdit
          Left = 6
          Top = 164
          Width = 758
          Height = 80
          AutoURLDetect = False
          DataField = 'EVIDESCRICAO'
          DataSource = dsEvento
          PrintJobName = 'Delphi 5'
          ReadOnly = True
          TabOrder = 2
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            660000007B5C727466315C616E73695C64656666307B5C666F6E7474626C7B5C
            66305C666E696C204D532053616E732053657269663B7D7D0D0A5C766965776B
            696E64345C7563315C706172645C6C616E67313034365C625C66305C66733134
            5C7061720D0A7D0D0A00}
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 281
      Width = 781
      Height = 53
      Align = alBottom
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label6: TLabel
        Left = 119
        Top = 7
        Width = 103
        Height = 13
        Caption = 'Cód. Documento: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 485
        Top = 7
        Width = 104
        Height = 13
        Caption = 'Planilha Contábil: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 576
        Top = 23
        Width = 16
        Height = 20
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 240
        Top = 7
        Width = 71
        Height = 13
        Caption = 'Nº AP/GR:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 338
        Top = 7
        Width = 81
        Height = 13
        Caption = 'Nº do Boleto  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 12
        Top = 7
        Width = 109
        Height = 13
        Caption = 'Nº do Documento  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 679
        Top = 7
        Width = 90
        Height = 13
        Caption = 'Comp. Orçamen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit13: TDBEdit
        Left = 485
        Top = 23
        Width = 90
        Height = 21
        DataField = 'PLNPLANIL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit14: TDBEdit
        Left = 119
        Top = 23
        Width = 116
        Height = 21
        DataField = 'CODDOCUMENTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit15: TDBEdit
        Left = 592
        Top = 23
        Width = 83
        Height = 21
        DataField = 'PLNCODIGO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 240
        Top = 23
        Width = 93
        Height = 21
        Color = 12648447
        DataField = 'NUMAPGR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit10: TDBEdit
        Left = 12
        Top = 23
        Width = 102
        Height = 21
        Color = 12648447
        DataField = 'DOC_CAPCAR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit20: TDBEdit
        Left = 338
        Top = 23
        Width = 140
        Height = 21
        Color = 12648447
        DataField = 'NOSSONUMERO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit22: TDBEdit
        Left = 679
        Top = 23
        Width = 95
        Height = 21
        Color = 12648447
        DataField = 'NUMRESERVA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
  end
  inherited Dock972: TDock97
    Width = 783
    object lblStatus: TLabel [0]
      Left = 637
      Top = 5
      Width = 104
      Height = 24
      Caption = 'em Aberto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblEstornado: TLabel [1]
      Left = 637
      Top = 5
      Width = 105
      Height = 24
      Alignment = taRightJustify
      Caption = 'Estornado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblRecPag: TLabel [2]
      Left = 528
      Top = 5
      Width = 102
      Height = 24
      Alignment = taRightJustify
      Caption = 'a Receber'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 25
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 75
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 50
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Left = 166
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 251
        Caption = 'Imprimir'
        Enabled = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        Visible = True
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 160
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 783
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 582
      DockPos = 582
      inherited sep1: TToolbarSep97
        Left = 87
      end
      inherited sep3: TToolbarSep97
        Left = 174
      end
      inherited bbtnSair: TBitBtn
        Width = 85
        Height = 29
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 89
        Width = 85
        Height = 29
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 402
      DockPos = 402
      Visible = False
      inherited ToolbarSep971: TToolbarSep97
        Left = 87
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 174
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 85
        Height = 29
        Enabled = False
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 89
        Width = 85
        Height = 29
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 376
    Top = 120
  end
  inherited upd: TUpdateSQL
    Left = 312
    Top = 120
  end
  inherited MontaSelect: TMontaSelect
    Left = 741
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 977
    Top = 70
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 676
    Top = 10
  end
  inherited qry: TwwQuery
    OnCalcFields = qryCalcFields
    SQL.Strings = (
      'SELECT'
      
        '--FORCLI_DOC, MOEDA_LANC, COD_MOEDA, SUM(VALOR_OM_LANC) AS VALOR' +
        '_OM_TOTAL, IDFORCLI, NODOCUMENTO,'
      '   L.RECPAG, L.DESCCUSTORECIMO,'
      '   L.STATUS_DOC,'
      '   L.PLNPLANIL, L.PLNCODIGO,'
      '   L.CODDOCUMENTO, L.IDDOCUMENTO,'
      '   L.FORMA_RECTOPAGTO,'
      '   L.TOT_ALTERADOR,'
      '   L.NF_FORCLI, L.RS_FORCLI,'
      '   L.DATALANCAMENTO, L.DATAVENCIMENTO, L.DATA_BAIXA,'
      '   L.MESCOMPETENCIA, L.ANOCOMPETENCIA,'
      '   L.FLGORIGEMLANC, L.FLGESTORNADO, L.FLGINTEGRADO,'
      '   L.DOC_CAPCAR, L.NUMAPGR, L.NOSSONUMERO, L.IDCBANCARIA,'
      '   R.NUMRESERVA,'
      '   SUM(L.VALOR_LANC) AS VALOR_DOCUMENTO,'
      
        '   (SUM(NVL(L.VALOR_LANC,0)) + NVL(L.TOT_ALTERADOR,0)) AS VALOR_' +
        'TOTAL,'
      
        '   L.LOGIN_USUARIO, L.NF_USUARIO, MAX(L.TRGDTINCLUSAO) TRGDTINCL' +
        'USAO'
      'FROM'
      '   VWLANCAMENTO L, RESERVAORCAMEN R'
      ''
      'WHERE'
      '      ( L.IDPESSOA =:PIDEMPRESAPROP )'
      '  AND ( L.IDDOCUMENTO =:PIDDOCUMENTO )'
      '  AND ( L.IDRESERVAORCAMEN = R.IDRESERVAORCAMEN(+))'
      ''
      'GROUP BY'
      '   L.RECPAG, L.DESCCUSTORECIMO,'
      '   L.STATUS_DOC,'
      '   L.PLNPLANIL, L.PLNCODIGO,'
      '   L.CODDOCUMENTO, L.IDDOCUMENTO,'
      '   L.FORMA_RECTOPAGTO,'
      '   L.TOT_ALTERADOR,'
      '   L.NF_FORCLI, L.RS_FORCLI,'
      '   L.DATALANCAMENTO, L.DATAVENCIMENTO, L.DATA_BAIXA,'
      '   L.MESCOMPETENCIA, L.ANOCOMPETENCIA,'
      '   L.FLGORIGEMLANC, L.FLGESTORNADO, L.FLGINTEGRADO,'
      '   L.DOC_CAPCAR, L.NUMAPGR, L.NOSSONUMERO, L.IDCBANCARIA,'
      '   R.NUMRESERVA, L.LOGIN_USUARIO, L.NF_USUARIO'
      '/*   DESCCUSTORECIMO, RECPAG,'
      ''
      '   FORCLI_DOC, STATUS_DOC,'
      '   PLNPLANIL, PLNCODIGO,'
      '   CODDOCUMENTO, IDDOCUMENTO, NODOCUMENTO,'
      '   FORMA_RECTOPAGTO,'
      ''
      '   MOEDA_LANC, COD_MOEDA, TOT_ALTERADOR,'
      ''
      '   IDFORCLI, NF_FORCLI, RS_FORCLI,'
      ''
      '   DATALANCAMENTO, DATAVENCIMENTO, DATA_BAIXA,'
      '   MESCOMPETENCIA, ANOCOMPETENCIA,'
      ''
      '   FLGORIGEMLANC, FLGESTORNADO, FLGINTEGRADO,'
      ''
      '   DOC_CAPCAR, NUMAPGR, NOSSONUMERO, IDCBANCARIA'
      '*/'
      ''
      ' '
      '')
    UpdateObject = nil
    Left = 344
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qry_ORIGEMLANC: TStringField
      FieldKind = fkCalculated
      FieldName = '_ORIGEMLANC'
      Visible = False
      Size = 25
      Calculated = True
    end
    object qry_MESCOMPETENCIA: TStringField
      FieldKind = fkCalculated
      FieldName = '_MESCOMPETENCIA'
      Visible = False
      Size = 15
      Calculated = True
    end
    object qryDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qrySTATUS_DOC: TStringField
      FieldName = 'STATUS_DOC'
      Size = 1
    end
    object qryPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryFORMA_RECTOPAGTO: TStringField
      FieldName = 'FORMA_RECTOPAGTO'
      Size = 50
    end
    object qryTOT_ALTERADOR: TFloatField
      FieldName = 'TOT_ALTERADOR'
      DisplayFormat = '###,##0.00'
    end
    object qryNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object qryRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object qryDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
    object qryMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryFLGORIGEMLANC: TStringField
      FieldName = 'FLGORIGEMLANC'
      FixedChar = True
      Size = 1
    end
    object qryFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryFLGINTEGRADO: TFloatField
      FieldName = 'FLGINTEGRADO'
    end
    object qryDOC_CAPCAR: TFloatField
      FieldName = 'DOC_CAPCAR'
    end
    object qryNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object qryNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object qryIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
      DisplayFormat = '###,##0.00'
    end
    object qryVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,##0.00'
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryNUMRESERVA: TFloatField
      FieldName = 'NUMRESERVA'
    end
    object qryLOGIN_USUARIO: TStringField
      FieldName = 'LOGIN_USUARIO'
      FixedChar = True
    end
    object qryNF_USUARIO: TStringField
      FieldName = 'NF_USUARIO'
      Size = 60
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
  end
  object dsLancamentos: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qryLancImovel
    Left = 237
    Top = 176
  end
  object dsObs: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qrySelectObsLanc
    Left = 277
    Top = 120
  end
  object dsMsg: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qrySelectMsgLanc
    Left = 237
    Top = 120
  end
  object dsAlteradoresDoc: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qrySelectAlteraDoc
    Left = 237
    Top = 224
  end
  object dsAutorizacoes: TwwDataSource
    DataSet = dtmLancImovel.qryConciliaDoc
    Left = 327
    Top = 176
  end
  object dsContaBancairia: TwwDataSource
    AutoEdit = False
    DataSet = dtmLookImobiliario.qryLookContaBancaria
    Left = 327
    Top = 224
  end
  object dsAlteradoresLanc: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qrySelectAlteraLanc
    Left = 430
    Top = 176
  end
  object dsCorrecaoDoc: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qrySelectCorrecaoDoc
    Left = 430
    Top = 224
  end
  object dsEvento: TwwDataSource
    DataSet = qryEvento
    Left = 624
    Top = 35
  end
  object qryEvento: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDEVENTOIMOVEL, E.CODDOCUMENTO, E.EVIDATA,'
      '       E.EVICABECALHO,   E.EVIDESCRICAO,'
      '       E.FLGAVISO,       E.DIASAVISO,'
      '       RTRIM(U.NOMEUSUARIO)||'#39' - '#39'||PU.NOME AS USUARIO_EXTENSO'
      '  FROM EVENTOIMOVEL E,'
      '       PESSOA PU,'
      '       USUARIOSISTEMA U'
      ' WHERE E.IDUSUARIO = U.IDUSUARIO(+)'
      '   AND U.IDUSUARIO = PU.IDPESSOA(+)'
      '   AND E.CODDOCUMENTO = :PCODDOCUMENTO'
      ' ORDER BY E.EVIDATA'
      '')
    UpdateObject = upd
    ControlType.Strings = (
      'FLGAVISO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 624
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryEventoIDEVENTOIMOVEL: TFloatField
      FieldName = 'IDEVENTOIMOVEL'
    end
    object qryEventoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryEventoEVIDATA: TDateTimeField
      FieldName = 'EVIDATA'
    end
    object qryEventoEVICABECALHO: TStringField
      FieldName = 'EVICABECALHO'
      Size = 60
    end
    object qryEventoEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryEventoFLGAVISO: TStringField
      FieldName = 'FLGAVISO'
      FixedChar = True
      Size = 1
    end
    object qryEventoDIASAVISO: TFloatField
      FieldName = 'DIASAVISO'
    end
    object qryEventoUSUARIO_EXTENSO: TStringField
      FieldName = 'USUARIO_EXTENSO'
      Size = 83
    end
  end
end
