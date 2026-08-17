inherited frmExecExcluiLanc: TfrmExecExcluiLanc
  Left = 374
  Top = 163
  HelpContext = 540019
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Exclusão de Movimentações'
  ClientHeight = 389
  ClientWidth = 770
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 770
    Height = 319
    object pgcPrincipal: TPageControl
      Left = 1
      Top = 1
      Width = 768
      Height = 276
      ActivePage = tbsGeral
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Dados Gerais'
        object Label5: TLabel
          Left = 632
          Top = 50
          Width = 101
          Height = 13
          Caption = 'Nº do Documento'
        end
        object Label3: TLabel
          Left = 12
          Top = 50
          Width = 103
          Height = 13
          Caption = 'Credor / Debitado'
        end
        object Label7: TLabel
          Left = 392
          Top = 10
          Width = 188
          Height = 13
          Caption = 'Forma de Cobrança / Pagamento'
        end
        object Label16: TLabel
          Left = 632
          Top = 10
          Width = 73
          Height = 13
          Caption = 'Nº do Boleto'
        end
        object Label15: TLabel
          Left = 12
          Top = 90
          Width = 74
          Height = 13
          Caption = 'Competência'
        end
        object lblDataVencimento: TLabel
          Left = 180
          Top = 90
          Width = 75
          Height = 13
          Caption = 'Data Lancto.'
        end
        object Label8: TLabel
          Left = 12
          Top = 202
          Width = 217
          Height = 13
          Caption = 'Usuário responsável pelo Lançamento'
        end
        object Label4: TLabel
          Left = 12
          Top = 10
          Width = 109
          Height = 13
          Caption = 'Tipo de Movimento'
        end
        object Label2: TLabel
          Left = 260
          Top = 90
          Width = 76
          Height = 13
          Caption = 'Data Vencto.'
        end
        object Label11: TLabel
          Left = 340
          Top = 90
          Width = 63
          Height = 13
          Caption = 'Data Baixa'
        end
        object Label12: TLabel
          Left = 668
          Top = 202
          Width = 80
          Height = 13
          Caption = 'Data Inclusão'
        end
        object Label1: TLabel
          Left = 632
          Top = 90
          Width = 63
          Height = 13
          Caption = 'Valor Total'
        end
        object Label26: TLabel
          Left = 12
          Top = 130
          Width = 75
          Height = 13
          Caption = 'Observações'
        end
        object Bevel1: TBevel
          Left = 12
          Top = 196
          Width = 733
          Height = 5
          Shape = bsTopLine
        end
        object Label27: TLabel
          Left = 428
          Top = 90
          Width = 127
          Height = 13
          Caption = 'Bco.   Ag.         Conta'
        end
        object Label22: TLabel
          Left = 174
          Top = 10
          Width = 97
          Height = 13
          Caption = 'Tipo de Despesa'
        end
        object DBEdit6: TDBEdit
          Left = 264
          Top = 64
          Width = 361
          Height = 21
          DataField = 'RS_FORCLI'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit10: TDBEdit
          Left = 632
          Top = 64
          Width = 117
          Height = 21
          Color = 12648447
          DataField = 'DOC_CAPCAR'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBedtPortadorForma: TDBEdit
          Left = 392
          Top = 24
          Width = 233
          Height = 21
          DataField = 'FORMA_RECTOPAGTO'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit1: TDBEdit
          Left = 12
          Top = 64
          Width = 253
          Height = 21
          DataField = 'NF_FORCLI'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit4: TDBEdit
          Left = 632
          Top = 24
          Width = 117
          Height = 21
          Color = 12648447
          DataField = 'NOSSONUMERO'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit11: TDBEdit
          Left = 12
          Top = 104
          Width = 93
          Height = 21
          DataField = '_MESCOMPETENCIA'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit12: TDBEdit
          Left = 104
          Top = 104
          Width = 65
          Height = 21
          DataField = 'ANOCOMPETENCIA'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBedtNomeUsuario: TDBEdit
          Left = 12
          Top = 216
          Width = 121
          Height = 21
          DataField = 'LOGIN_USUARIO'
          DataSource = dsLancamentos
          Enabled = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBedtNomeExtenso: TDBEdit
          Left = 132
          Top = 216
          Width = 421
          Height = 21
          DataField = 'NF_USUARIO'
          DataSource = dsLancamentos
          Enabled = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBedtOrigem: TDBEdit
          Left = 12
          Top = 24
          Width = 157
          Height = 21
          DataField = '_ORIGEMLANC'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit16: TDBEdit
          Left = 180
          Top = 104
          Width = 77
          Height = 21
          DataField = 'DATALANCAMENTO'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit17: TDBEdit
          Left = 260
          Top = 104
          Width = 77
          Height = 21
          DataField = 'DATAVENCIMENTO'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit18: TDBEdit
          Left = 340
          Top = 104
          Width = 77
          Height = 21
          DataField = 'DATA_BAIXA'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit19: TDBEdit
          Left = 668
          Top = 216
          Width = 81
          Height = 21
          DataField = 'TRGDTINCLUSAO'
          DataSource = dsLancamentos
          Enabled = False
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit9: TDBEdit
          Left = 632
          Top = 104
          Width = 117
          Height = 21
          Color = 12648447
          DataField = 'VALOR_TOTAL'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 14
        end
        object DBmemObs: TDBMemo
          Left = 14
          Top = 144
          Width = 733
          Height = 41
          DataField = 'OBS'
          DataSource = dsObs
          ScrollBars = ssVertical
          TabOrder = 15
        end
        object DBEdit5: TDBEdit
          Left = 428
          Top = 104
          Width = 37
          Height = 21
          DataField = 'NUMBANCO'
          DataSource = dsContaBancairia
          Enabled = False
          ReadOnly = True
          TabOrder = 16
        end
        object DBEdit7: TDBEdit
          Left = 464
          Top = 104
          Width = 57
          Height = 21
          DataField = 'NUMAGENCIA'
          DataSource = dsContaBancairia
          Enabled = False
          ReadOnly = True
          TabOrder = 17
        end
        object DBEdit8: TDBEdit
          Left = 521
          Top = 104
          Width = 104
          Height = 21
          DataField = 'CONTACORRENTE'
          DataSource = dsContaBancairia
          Enabled = False
          ReadOnly = True
          TabOrder = 18
        end
        object DBEdit3: TDBEdit
          Left = 174
          Top = 24
          Width = 213
          Height = 21
          DataField = 'DESCCUSTORECIMO'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 19
        end
      end
      object tbsImovel: TTabSheet
        Caption = 'Detalhamento'
        ImageIndex = 1
        object DBgrdReajuste: TwwDBGrid
          Left = 11
          Top = 35
          Width = 738
          Height = 85
          Selected.Strings = (
            'IMOVEL_EXTENSO'#9'102'#9'Imovel'#9'F'
            'VALOR_LANC'#9'14'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnRowChanged = DBgrdReajusteRowChanged
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
          Left = 10
          Top = 8
          Width = 740
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
        object Panel5: TPanel
          Left = 10
          Top = 133
          Width = 740
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Lançamentos /  Bens'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object wwDBGrid2: TwwDBGrid
          Left = 11
          Top = 152
          Width = 738
          Height = 89
          Selected.Strings = (
            'NOME_BEM'#9'43'#9'Bem'#9'F'
            'VLRMOV'#9'20'#9'Valor'#9'F'
            'DESCTIPOMOVIMENTACAO'#9'55'#9'Movimentação'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = False
          DataSource = dsLancImovelxBem
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 3
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
        Caption = 'Alteradores'
        ImageIndex = 3
        object DBgrdAlteradoresDoc: TwwDBGrid
          Left = 11
          Top = 35
          Width = 734
          Height = 198
          Selected.Strings = (
            'DESCRICAO'#9'66'#9'Tipo do Alterador'#9'F'
            'VALOR'#9'17'#9'Valor'#9'F'
            'DATALANCTO'#9'13'#9'Data'#9'F')
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
          Width = 734
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Alteradores do Documento'
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
          Top = 35
          Width = 734
          Height = 198
          Selected.Strings = (
            'DESCRICAO'#9'66'#9'Tipo do Alterador'#9'F'
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
          Left = 11
          Top = 8
          Width = 740
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
          Left = 11
          Top = 35
          Width = 738
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
          Left = 11
          Top = 212
          Width = 738
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
      object tbsParcelas: TTabSheet
        Caption = 'Parcelas'
        ImageIndex = 5
        TabVisible = False
        object Panel7: TPanel
          Left = 10
          Top = 8
          Width = 740
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Aquisição Parcelada - Parcelas '
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object wwDBGrid3: TwwDBGrid
          Left = 11
          Top = 35
          Width = 738
          Height = 198
          Selected.Strings = (
            'DATAVENCIMENTO'#9'20'#9'Dt Vencimento'#9'F'
            'VLRLANCPAGAR'#9'14'#9'Valor'#9'F'
            'CODDOCUMENTO'#9'10'#9'Documento'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnRowChanged = DBgrdReajusteRowChanged
          FixedCols = 0
          ShowHorzScrollBar = False
          DataSource = dsLancAquis
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
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
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 277
      Width = 768
      Height = 41
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
        Left = 8
        Top = 14
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
        Left = 451
        Top = 14
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
        Left = 649
        Top = 10
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
        Left = 268
        Top = 14
        Width = 69
        Height = 13
        Caption = 'nº AP/GR:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit13: TDBEdit
        Left = 553
        Top = 10
        Width = 96
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
        Left = 109
        Top = 10
        Width = 124
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
        Left = 664
        Top = 10
        Width = 89
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
        Left = 332
        Top = 10
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
    end
  end
  inherited Dock972: TDock97
    Width = 770
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
        Width = 17
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 17
        Width = 16
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 33
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
        Left = 124
        Width = 79
      end
      inherited btnRefresh: TToolbarButton97
        Left = 203
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 288
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 118
        Visible = False
      end
    end
    object Panel6: TPanel
      Left = 702
      Top = -1
      Width = 257
      Height = 49
      TabOrder = 1
      Visible = False
      object Label28: TLabel
        Left = 11
        Top = 6
        Width = 64
        Height = 13
        Caption = 'ID IMOVEL'
      end
      object Label29: TLabel
        Left = 88
        Top = 4
        Width = 88
        Height = 13
        Caption = 'Data Alienação'
      end
      object edIdImovel: TEdit
        Left = 11
        Top = 20
        Width = 54
        Height = 21
        TabOrder = 0
      end
      object edtDataBaixa: TCMDateTimePicker
        Left = 88
        Top = 20
        Width = 97
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
        TabOrder = 1
      end
      object Button1: TButton
        Left = 192
        Top = 16
        Width = 51
        Height = 25
        Caption = 'Exclui'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
  end
  inherited Dock971: TDock97
    Top = 354
    Width = 770
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
    Left = 408
    Top = 0
  end
  inherited upd: TUpdateSQL
    Left = 344
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 725
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 977
    Top = 70
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 665
    Top = 1
  end
  inherited qry: TwwQuery
    OnCalcFields = qryCalcFields
    SQL.Strings = (
      'SELECT'
      '   DESCCUSTORECIMO, RECPAG,'
      ''
      '   FORCLI_DOC, STATUS_DOC,'
      '   PLNPLANIL, PLNCODIGO,'
      '   CODDOCUMENTO, IDDOCUMENTO, NODOCUMENTO,'
      '   FORMA_RECTOPAGTO,'
      ''
      '   MOEDA_LANC, COD_MOEDA,'
      '   SUM(VALOR_OM_LANC) AS VALOR_OM_TOTAL,'
      '   SUM(VALOR_LANC) AS VALOR_TOTAL,'
      ''
      '   IDFORCLI, NF_FORCLI, RS_FORCLI,'
      ''
      '   DATALANCAMENTO, DATAVENCIMENTO, DATA_BAIXA,'
      '   MESCOMPETENCIA, ANOCOMPETENCIA,'
      ''
      '   FLGORIGEMLANC, FLGESTORNADO, FLGINTEGRADO,'
      ''
      '   DOC_CAPCAR, NUMAPGR, NOSSONUMERO, IDCBANCARIA'
      ''
      'FROM'
      '   VWLANCAMENTO'
      ''
      'WHERE'
      '   ( IDPESSOA =:PIDEMPRESAPROP )'
      '   AND ( IDDOCUMENTO =:PIDDOCUMENTO )'
      ''
      'GROUP BY'
      '   DESCCUSTORECIMO, RECPAG,'
      ''
      '   FORCLI_DOC, STATUS_DOC,'
      '   PLNPLANIL, PLNCODIGO,'
      '   CODDOCUMENTO, IDDOCUMENTO, NODOCUMENTO,'
      '   FORMA_RECTOPAGTO,'
      ''
      '   MOEDA_LANC, COD_MOEDA,'
      ''
      '   IDFORCLI, NF_FORCLI, RS_FORCLI,'
      ''
      '   DATALANCAMENTO, DATAVENCIMENTO, DATA_BAIXA,'
      '   MESCOMPETENCIA, ANOCOMPETENCIA,'
      ''
      '   FLGORIGEMLANC, FLGESTORNADO, FLGINTEGRADO,'
      ''
      '   DOC_CAPCAR, NUMAPGR, NOSSONUMERO, IDCBANCARIA'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = nil
    Left = 376
    Top = 0
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
      Origin = 'VWLANCAMENTO.DESCCUSTORECIMO'
      ReadOnly = True
      Size = 60
    end
    object qryFORCLI_DOC: TFloatField
      FieldName = 'FORCLI_DOC'
      Origin = 'VWLANCAMENTO.FORCLI_DOC'
      ReadOnly = True
    end
    object qrySTATUS_DOC: TStringField
      FieldName = 'STATUS_DOC'
      Origin = 'VWLANCAMENTO.STATUS_DOC'
      ReadOnly = True
      Size = 1
    end
    object qryPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
      Origin = 'VWLANCAMENTO.PLNPLANIL'
      ReadOnly = True
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'VWLANCAMENTO.PLNCODIGO'
      ReadOnly = True
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'VWLANCAMENTO.CODDOCUMENTO'
      ReadOnly = True
    end
    object qryMOEDA_LANC: TStringField
      FieldName = 'MOEDA_LANC'
      Origin = 'VWLANCAMENTO.MOEDA_LANC'
      ReadOnly = True
      Size = 10
    end
    object qryCOD_MOEDA: TFloatField
      FieldName = 'COD_MOEDA'
      Origin = 'VWLANCAMENTO.COD_MOEDA'
      ReadOnly = True
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'VWLANCAMENTO.IDFORCLI'
      ReadOnly = True
    end
    object qryNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Origin = 'VWLANCAMENTO.NF_FORCLI'
      ReadOnly = True
      Size = 60
    end
    object qryRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Origin = 'VWLANCAMENTO.RS_FORCLI'
      ReadOnly = True
      Size = 60
    end
    object qryDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
      Origin = 'VWLANCAMENTO.DATALANCAMENTO'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'VWLANCAMENTO.DATAVENCIMENTO'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
      Origin = 'VWLANCAMENTO.DATA_BAIXA'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
      Origin = 'VWLANCAMENTO.MESCOMPETENCIA'
      ReadOnly = True
    end
    object qryANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
      Origin = 'VWLANCAMENTO.ANOCOMPETENCIA'
      ReadOnly = True
    end
    object qryFLGORIGEMLANC: TStringField
      FieldName = 'FLGORIGEMLANC'
      Origin = 'VWLANCAMENTO.FLGORIGEMLANC'
      ReadOnly = True
      Size = 1
    end
    object qryFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
      Origin = 'VWLANCAMENTO.FLGESTORNADO'
      ReadOnly = True
    end
    object qryFLGINTEGRADO: TFloatField
      FieldName = 'FLGINTEGRADO'
      Origin = 'VWLANCAMENTO.FLGINTEGRADO'
      ReadOnly = True
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'VWLANCAMENTO.RECPAG'
      ReadOnly = True
      Size = 1
    end
    object qryVALOR_OM_TOTAL: TFloatField
      FieldName = 'VALOR_OM_TOTAL'
      Origin = '"CM.VWLANCAMENTO".VALOR_OM_LANC'
      ReadOnly = True
      DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      EditFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
    end
    object qryVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = '"CM.VWLANCAMENTO".VALOR_LANC'
      ReadOnly = True
      DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      EditFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
    end
    object qryIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
      DisplayFormat = '#0'
    end
    object qryDOC_CAPCAR: TFloatField
      FieldName = 'DOC_CAPCAR'
      Origin = 'VWLANCAMENTO.DOC_CAPCAR'
      DisplayFormat = '#0'
    end
    object qryNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
      Origin = 'VWLANCAMENTO.NUMAPGR'
      DisplayFormat = '#0'
    end
    object qryNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Origin = 'VWLANCAMENTO.NOSSONUMERO'
    end
    object qryFORMA_RECTOPAGTO: TStringField
      FieldName = 'FORMA_RECTOPAGTO'
      Size = 50
    end
    object qryIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
  end
  object dsLancamentos: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qryLancImovel
    Left = 461
    Top = 41
  end
  object dsObs: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qrySelectObsLanc
    Left = 533
    Top = 12
  end
  object dsMsg: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qrySelectMsgLanc
    Left = 533
  end
  object dsAlteradoresDoc: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qrySelectAlteraDoc
    Left = 453
    Top = 112
  end
  object dsAutorizacoes: TwwDataSource
    DataSet = dtmLancImovel.qryConciliaDoc
    Left = 463
    Top = 26
  end
  object dsContaBancairia: TwwDataSource
    AutoEdit = False
    DataSet = dtmLookImobiliario.qryLookContaBancaria
    Left = 461
    Top = 12
  end
  object dsAlteradoresLanc: TwwDataSource
    AutoEdit = False
    DataSet = dtmLancImovel.qrySelectAlteraLanc
    Left = 469
    Top = 8
  end
  object dsLancImovelxBem: TwwDataSource
    AutoEdit = False
    DataSet = qryLancImovelXBem
    Left = 293
    Top = 235
  end
  object qryLancImovelXBem: TwwQuery
    OnCalcFields = qryLancImovelXBemCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IB.IXBGRUPO, LB.VLRMOV, LB.FLGNUMMOV,'
      '   T.DESCTIPOMOVIMENTACAO,'
      '   -- campos para desfazer'
      
        '   LB.IDBEM, LI.DATALANCAMENTO, LI.IDIMOVEL, LB.IDMOVIMENTACAO, ' +
        'LI.IDLANCIMOVEL'
      'FROM'
      
        '   LANCAMENTOSIMOVEL LI, LANCIMOVELXBEM LB, IMOVELXBEM IB, TIPOM' +
        'OVIMENTACAO T'
      'WHERE'
      '   ( LI.IDLANCIMOVEL = LB.IDLANCIMOVEL )'
      '   AND ( LB.IDBEM = IB.IDBEM )'
      '   AND ( LB.FLGNUMMOV = T.IDTIPOMOVIMENTACAO(+) )'
      
        '   AND ( (:PIDLANCIMOVEL IS NULL) OR (LI.IDLANCIMOVEL = :PIDLANC' +
        'IMOVEL) )'
      
        '   AND ( (:PIDDOCUMENTO IS NULL) OR (IDDOCUMENTO = :PIDDOCUMENTO' +
        ') )'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 390
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryLancImovelXBemIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelXBemVLRMOV: TFloatField
      FieldName = 'VLRMOV'
      DisplayFormat = '#,##0.00'
    end
    object qryLancImovelXBemFLGNUMMOV: TFloatField
      FieldName = 'FLGNUMMOV'
    end
    object qryLancImovelXBemDESCTIPOMOVIMENTACAO: TStringField
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Size = 40
    end
    object qryLancImovelXBemNome_bem: TStringField
      FieldKind = fkCalculated
      FieldName = 'Nome_bem'
      Size = 21
      Calculated = True
    end
    object qryLancImovelXBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryLancImovelXBemDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryLancImovelXBemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryLancImovelXBemIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
    end
    object qryLancImovelXBemIDLANCIMOVEL: TFloatField
      FieldName = 'IDLANCIMOVEL'
    end
  end
  object qryLancAquis: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM LANCAMENTOSIMOVEL L'
      'WHERE L.IDIMOVEL = :IDIMOVEL'
      '  AND L.IDTIPOCUSTORECIMO = 235')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 48
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDIMOVEL'
        ParamType = ptUnknown
      end>
    object qryLancAquisDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Dt. Vencimento'
      FieldName = 'DATAVENCIMENTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.DATAVENCIMENTO'
    end
    object qryLancAquisDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.DATALANCAMENTO'
      DisplayFormat = 'Dt.Lancamento'
    end
    object qryLancAquisPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.PLNCODIGO'
      DisplayFormat = 'Planilha'
    end
    object qryLancAquisIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDDOCUMENTO'
      DisplayFormat = 'Documento'
    end
    object qryLancAquisVLRLANCPAGAR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VLRLANCPAGAR'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.VLRLANCPAGAR'
      DisplayFormat = '#,##0.00'
    end
    object qryLancAquisMESREFERENCIA: TFloatField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.MESREFERENCIA'
      DisplayFormat = 'Mês'
    end
    object qryLancAquisANOREFERENCIA: TFloatField
      FieldName = 'ANOREFERENCIA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.ANOREFERENCIA'
      DisplayFormat = 'Ano'
    end
    object qryLancAquisNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.NODOCUMENTO'
    end
    object qryLancAquisIDLANCIMOVEL: TFloatField
      FieldName = 'IDLANCIMOVEL'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDLANCIMOVEL'
    end
    object qryLancAquisMOEDARECEB: TFloatField
      FieldName = 'MOEDARECEB'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.MOEDARECEB'
    end
    object qryLancAquisIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDIMOVEL'
    end
    object qryLancAquisIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryLancAquisIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDPESSOA'
    end
    object qryLancAquisIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDTIPOCUSTORECIMO'
    end
    object qryLancAquisCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.CODDOCUMENTO'
    end
    object qryLancAquisVLRLANCOMPAGAR: TFloatField
      FieldName = 'VLRLANCOMPAGAR'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.VLRLANCOMPAGAR'
    end
    object qryLancAquisRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryLancAquisMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.MESCOMPETENCIA'
    end
    object qryLancAquisANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.ANOCOMPETENCIA'
    end
    object qryLancAquisFLGAGRUPAR: TStringField
      FieldName = 'FLGAGRUPAR'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGAGRUPAR'
      FixedChar = True
      Size = 1
    end
    object qryLancAquisFLGAGRUPADO: TFloatField
      FieldName = 'FLGAGRUPADO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGAGRUPADO'
    end
    object qryLancAquisFLGTIPOLANCAMENTO: TStringField
      FieldName = 'FLGTIPOLANCAMENTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGTIPOLANCAMENTO'
      FixedChar = True
      Size = 1
    end
    object qryLancAquisMOEDAPAGAR: TFloatField
      FieldName = 'MOEDAPAGAR'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.MOEDAPAGAR'
    end
    object qryLancAquisVLRLANCOMRECEB: TFloatField
      FieldName = 'VLRLANCOMRECEB'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.VLRLANCOMRECEB'
    end
    object qryLancAquisVLRLANCRECEB: TFloatField
      FieldName = 'VLRLANCRECEB'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.VLRLANCRECEB'
    end
    object qryLancAquisVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.VLRJUROS'
    end
    object qryLancAquisVLRMULTA: TFloatField
      FieldName = 'VLRMULTA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.VLRMULTA'
    end
    object qryLancAquisVLRCORRECAOMON: TFloatField
      FieldName = 'VLRCORRECAOMON'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.VLRCORRECAOMON'
    end
    object qryLancAquisTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.TRGDTINCLUSAO'
    end
    object qryLancAquisTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryLancAquisDATACORRECAO: TDateTimeField
      FieldName = 'DATACORRECAO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.DATACORRECAO'
    end
    object qryLancAquisFLGMULTACALCULADA: TFloatField
      FieldName = 'FLGMULTACALCULADA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGMULTACALCULADA'
    end
    object qryLancAquisFLGINTEGRADO: TFloatField
      FieldName = 'FLGINTEGRADO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGINTEGRADO'
    end
    object qryLancAquisIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDFORCLI'
    end
    object qryLancAquisIDUSUARIOSISTEMA: TFloatField
      FieldName = 'IDUSUARIOSISTEMA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDUSUARIOSISTEMA'
    end
    object qryLancAquisFLGORIGEM: TFloatField
      FieldName = 'FLGORIGEM'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGORIGEM'
    end
    object qryLancAquisFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGESTORNADO'
    end
    object qryLancAquisFLGORIGEMLANC: TStringField
      FieldName = 'FLGORIGEMLANC'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGORIGEMLANC'
      FixedChar = True
      Size = 1
    end
    object qryLancAquisFLGERRO: TFloatField
      FieldName = 'FLGERRO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGERRO'
    end
    object qryLancAquisIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDADMINIMOVEL'
    end
    object qryLancAquisANOPRESTACAO: TFloatField
      FieldName = 'ANOPRESTACAO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.ANOPRESTACAO'
    end
    object qryLancAquisMESPRESTACAO: TFloatField
      FieldName = 'MESPRESTACAO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.MESPRESTACAO'
    end
    object qryLancAquisFLGIMPORTADO: TFloatField
      FieldName = 'FLGIMPORTADO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGIMPORTADO'
    end
    object qryLancAquisVLRCOMISSAO: TFloatField
      FieldName = 'VLRCOMISSAO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.VLRCOMISSAO'
    end
    object qryLancAquisIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDRESERVAORCAMEN'
    end
    object qryLancAquisIDRATEIODOCUM: TFloatField
      FieldName = 'IDRATEIODOCUM'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDRATEIODOCUM'
    end
    object qryLancAquisCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.CODFORMA'
    end
    object qryLancAquisREFERENCIAAP: TStringField
      FieldName = 'REFERENCIAAP'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.REFERENCIAAP'
      Size = 30
    end
    object qryLancAquisOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object qryLancAquisIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDPROGRAMA'
    end
    object qryLancAquisIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDEMPRESA'
    end
    object qryLancAquisCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryLancAquisIDLANCREEMBDESP: TFloatField
      FieldName = 'IDLANCREEMBDESP'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDLANCREEMBDESP'
    end
    object qryLancAquisCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryLancAquisMSGERROINTEGRA: TStringField
      FieldName = 'MSGERROINTEGRA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.MSGERROINTEGRA'
      FixedChar = True
      Size = 120
    end
    object qryLancAquisCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.CODPORTFORMA'
    end
    object qryLancAquisFLGCONCILIADO: TFloatField
      FieldName = 'FLGCONCILIADO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.FLGCONCILIADO'
    end
    object qryLancAquisCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.COMPLDOCUMENTO'
      Size = 3
    end
    object qryLancAquisDATALIMITE: TDateTimeField
      FieldName = 'DATALIMITE'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.DATALIMITE'
    end
    object qryLancAquisIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDCBANCARIA'
    end
    object qryLancAquisIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDMODULO'
    end
    object qryLancAquisDTINICTBDIARIA: TDateTimeField
      FieldName = 'DTINICTBDIARIA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.DTINICTBDIARIA'
    end
    object qryLancAquisDTFIMCTBDIARIA: TDateTimeField
      FieldName = 'DTFIMCTBDIARIA'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.DTFIMCTBDIARIA'
    end
    object qryLancAquisNUMAPALT: TFloatField
      FieldName = 'NUMAPALT'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.NUMAPALT'
    end
    object qryLancAquisDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.DATAEMISSAO'
    end
    object qryLancAquisNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.NOSSONUMERO'
    end
    object qryLancAquisIDCONDPAGAQUISPARC: TFloatField
      FieldName = 'IDCONDPAGAQUISPARC'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDCONDPAGAQUISPARC'
    end
  end
  object qryBens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMOVEL_EXTENSO, I.IMOCODI' +
        'GO,'
      
        '   IB.IDIMOVEL, IB.IDBEM, IB.IXBPERCENT, IB.IXBGRUPO, B.IDGRUPO,' +
        ' I.CODTIPIMOVEL,'
      
        '   B.IDCONJUNTO, C.IDLOCALIZACAO, C.IDRESPONSAVEL, B.DESBEM, G.N' +
        'OME AS NOME_GRUPO,'
      '   0 AS VLR_BEM, 1 AS SEL_BEM'
      'FROM'
      
        '   IMOVEL I, IMOVEL IM, IMOVELXBEM IB, BEM B, CONJUNTO C, GRUPO ' +
        'G'
      'WHERE'
      '   IB.IDBEM = B.IDBEM'
      '   AND (I.IDIMOVEL = IB.IDIMOVEL)'
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '   AND ( B.IDGRUPO = G.IDGRUPO(+))'
      '   AND ( B.IDCONJUNTO = C.IDCONJUNTO(+) )'
      '   AND ( (:PIDBEM IS NULL) OR (B.IDBEM = :PIDBEM) )'
      ''
      'ORDER BY IMOVEL_EXTENSO, IDIMOVEL, DESBEM'
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
      ' ')
    ControlType.Strings = (
      'VLR_BEM;CheckBox;0;1'
      'SEL_BEM;CheckBox;1;0')
    ValidateWithMask = True
    Left = 537
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryBensSEL_BEM: TFloatField
      DisplayWidth = 5
      FieldName = 'SEL_BEM'
    end
    object qryBensDESBEM: TStringField
      DisplayLabel = 'Bem'
      DisplayWidth = 200
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBensNOME_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 60
      FieldName = 'NOME_GRUPO'
      Size = 60
    end
    object qryBensVLR_BEM: TFloatField
      DisplayLabel = '   '
      DisplayWidth = 3
      FieldName = 'VLR_BEM'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryBensIXBGRUPO: TStringField
      DisplayWidth = 9
      FieldName = 'IXBGRUPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryBensIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryBensIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
      Visible = False
    end
    object qryBensIMOVEL_EXTENSO: TStringField
      DisplayWidth = 123
      FieldName = 'IMOVEL_EXTENSO'
      Visible = False
      Size = 123
    end
    object qryBensCODTIPIMOVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryBensIMOCODIGO: TStringField
      DisplayWidth = 15
      FieldName = 'IMOCODIGO'
      Visible = False
      Size = 15
    end
    object qryBensIXBPERCENT: TFloatField
      DisplayWidth = 10
      FieldName = 'IXBPERCENT'
      Visible = False
      DisplayFormat = '##0.00%'
    end
    object qryBensIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Visible = False
    end
    object qryBensIDCONJUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONJUNTO'
      Visible = False
    end
    object qryBensIDLOCALIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCALIZACAO'
      Visible = False
    end
    object qryBensIDRESPONSAVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
  end
  object dsLancAquis: TwwDataSource
    AutoEdit = False
    DataSet = qryLancAquis
    Left = 141
    Top = 171
  end
  object qryImovelXBemBaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMOVEL_EXTENSO, I.IMOCODI' +
        'GO,'
      
        '   IB.IDIMOVEL, IB.IDBEM, IB.IXBPERCENT, IB.IXBGRUPO, B.IDGRUPO,' +
        ' I.CODTIPIMOVEL,'
      
        '   B.IDCONJUNTO, C.IDLOCALIZACAO, C.IDRESPONSAVEL, B.DESBEM, G.N' +
        'OME AS NOME_GRUPO,'
      '   0 AS VLR_BEM, 1 AS SEL_BEM'
      'FROM'
      
        '   IMOVEL I, IMOVEL IM, IMOVELXBEM IB, BEM B, CONJUNTO C, GRUPO ' +
        'G'
      'WHERE'
      '   IB.IDBEM = B.IDBEM'
      '   AND (I.IDIMOVEL = IB.IDIMOVEL)'
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '   AND ( B.IDGRUPO = G.IDGRUPO(+))'
      '   AND ( B.IDCONJUNTO = C.IDCONJUNTO(+) )'
      
        '   AND ( (:PBAIXATOTAL IS NULL) OR (B.BAIXATOTAL = :PBAIXATOTAL)' +
        ' )'
      '   AND ( (:PGRUPO IS NULL) OR (IB.IXBGRUPO = :PGRUPO) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (IB.IDIMOVEL = :PIDIMOVEL) )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL) OR ((I.IDIMOVELMESTRE = :PID' +
        'IMOVELMESTRE) AND (I.FLGATIVO = 1)) )'
      '   AND ( (:PIDBEM    IS NULL) OR (IB.IDBEM = :PIDBEM) )'
      
        '   AND ( (:PDATAINCLUSAO IS NULL) OR (B.DTAINCLUSAO = :PDATAINCL' +
        'USAO) )'
      
        '   /*SOL 132206 Kintana 766651 código comentado para corrigir er' +
        'ro de baixa de contrato*/'
      '   /*AND ( B.BAIXATOTAL <> '#39'S'#39' )*/'
      'ORDER BY IMOVEL_EXTENSO, IDIMOVEL, DESBEM'
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
      ' ')
    ControlType.Strings = (
      'SEL_BEM;CheckBox;1;0')
    ValidateWithMask = True
    Left = 49
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end>
    object qryImovelXBemBaixaIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 203
    end
    object qryImovelXBemBaixaIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryImovelXBemBaixaIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryImovelXBemBaixaIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryImovelXBemBaixaIXBPERCENT: TFloatField
      FieldName = 'IXBPERCENT'
    end
    object qryImovelXBemBaixaIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemBaixaIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryImovelXBemBaixaCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryImovelXBemBaixaIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryImovelXBemBaixaIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qryImovelXBemBaixaIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryImovelXBemBaixaDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryImovelXBemBaixaNOME_GRUPO: TStringField
      FieldName = 'NOME_GRUPO'
      Size = 60
    end
    object qryImovelXBemBaixaVLR_BEM: TFloatField
      FieldName = 'VLR_BEM'
    end
    object qryImovelXBemBaixaSEL_BEM: TFloatField
      FieldName = 'SEL_BEM'
    end
  end
end
