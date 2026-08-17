inherited FrmReconstruirINSS: TFrmReconstruirINSS
  Left = 364
  Top = 131
  HelpContext = 4540001
  Caption = 'Reconstrução do histórico do INSS'
  ClientHeight = 396
  ClientWidth = 721
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 721
    Height = 357
    inherited PagControle: TPageControl
      Width = 719
      Height = 355
      ActivePage = TbProcessamento
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 711
          Caption = ' Reconstrução do histórico do INSS'
        end
        object PnlDados: TPanel
          Left = 2
          Top = 32
          Width = 705
          Height = 311
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          TabOrder = 0
          object Label4: TLabel
            Left = 4
            Top = 44
            Width = 87
            Height = 13
            Caption = 'Nome do titular'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 4
            Top = 84
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
            Left = 365
            Top = 84
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
            Left = 4
            Top = 174
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
            Left = 205
            Top = 175
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
            Left = 4
            Top = 218
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
            Left = 4
            Top = 261
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
            Left = 4
            Top = 2
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
            Left = 205
            Top = 2
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
            Left = 205
            Top = 218
            Width = 22
            Height = 13
            Caption = 'DIP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 361
            Top = 218
            Width = 62
            Height = 13
            Caption = 'Valor atual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel1: TBevel
            Left = 4
            Top = 146
            Width = 698
            Height = 3
          end
          object Label5: TLabel
            Left = 548
            Top = 218
            Width = 59
            Height = 13
            Caption = 'Valor total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object bbtnProcurar: TBitBtn
            Left = 597
            Top = 16
            Width = 106
            Height = 63
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
            Layout = blGlyphTop
          end
          object lblParticipante: TStaticText
            Left = 4
            Top = 60
            Width = 570
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object lblPatro: TStaticText
            Left = 4
            Top = 98
            Width = 330
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object lblPlano: TStaticText
            Left = 366
            Top = 98
            Width = 336
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object lblNUmProc: TStaticText
            Left = 4
            Top = 189
            Width = 171
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object lblDIB: TStaticText
            Left = 4
            Top = 232
            Width = 103
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object lblBeneficio: TStaticText
            Left = 205
            Top = 189
            Width = 496
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
          object lblBeneficiario: TStaticText
            Left = 4
            Top = 275
            Width = 698
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 7
          end
          object lblMatricula: TStaticText
            Left = 4
            Top = 17
            Width = 171
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 8
          end
          object lblSituacaoAtual: TStaticText
            Left = 206
            Top = 17
            Width = 368
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object lblDIP: TStaticText
            Left = 205
            Top = 232
            Width = 103
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object lblValorAtual: TStaticText
            Left = 362
            Top = 232
            Width = 153
            Height = 20
            Alignment = taRightJustify
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object lblValorTotal: TStaticText
            Left = 549
            Top = 232
            Width = 153
            Height = 20
            Alignment = taRightJustify
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 12
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 711
          Caption = ' Nome do Formulário [ página 2 ]'
          Visible = False
        end
        object Label6: TLabel
          Left = 6
          Top = 88
          Width = 95
          Height = 13
          Caption = 'Informe o motivo'
        end
        object Label7: TLabel
          Left = 6
          Top = 32
          Width = 233
          Height = 13
          Caption = 'Informe a moeda para buscar os índices '
        end
        object DbLkcMotivo: TwwDBLookupCombo
          Left = 6
          Top = 103
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Descrição'#9'F')
          LookupTable = CdsMotivo
          LookupField = 'IDMOTIVO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DbLkcMoeda: TwwDBLookupCombo
          Left = 6
          Top = 47
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MOESIGLA'#9'10'#9'Sigla'#9'F'
            'MOEDESC'#9'20'#9'Descrição'#9'F')
          LookupTable = CdsMoeda
          LookupField = 'MOECODIGO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object TbProcessamento: TTabSheet
        Caption = 'Processamento'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 711
          Height = 24
          Align = alTop
          Caption = 'Resultado do processamento'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 32
          Width = 711
          Height = 313
          Align = alBottom
          DataSource = DataSource
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 357
    Width = 721
    inherited tb97Fundo: TToolbar97
      Left = 261
      inherited sep1: TToolbarSep97
        Left = 87
      end
      inherited CMSeparaWizard2: TToolbarSep97
        Left = 89
      end
      inherited CMSeparaWizard1: TToolbarSep97
        Left = 176
      end
      inherited bbtnSair: TBitBtn
        Left = 286
        Width = 85
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 371
        Width = 85
      end
      inherited btnContinuar: TfcShapeBtn
        Left = 91
        Width = 85
      end
      inherited btnVoltar: TfcShapeBtn
        Width = 85
      end
      inherited btnConfirmar: TfcShapeBtn
        Left = 201
        Width = 85
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
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
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PES.NOME'
      'BF.NOME'
      'DEPENTIT.MATRICULA'
      'BENEF.NOME'
      'P.DTEVENTO'
      'BF.NOME AS BENEFICIO'
      'P.NUMEROPROCESSO'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'D'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Matrícula do Titular'
      'Nº de Inscrição'
      'Participante Titular'
      'Benefício Requerido'
      'Matrícula do Beneficiário'
      'Beneficiário'
      'Data do Evento'
      'Benefício'
      'Nº do Processo'
      'Plano previdenciário')
    SensivelACaixa.Strings = (
      'S'
      'N'
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
      'DEPENTIT')
    CamposChave.Strings = (
      'PP.IDPESSOA'
      'PP.IDPESSOA'
      'PP.SEQPROPOSTA'
      'PP.IDPESSJUR'
      'DECODE(B.IDPLANOPREV, NULL, PP.IDPLANOPREV, B.IDPLANOPREV)'
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
      'NVL(B.IDBENEFICIO,0)'
      'B.DATAINICIO'
      'B.IDPESSOA'
      'BENEF.NOME'
      'P.NUMEROPROCESSO'
      'SP.FLGINTERNO'
      'DECODE(B.IDPLANOORIGEM, NULL, PP.IDPLANOPREV, B.IDPLANOORIGEM)'
      'B.VALORATUAL'
      'B.VALORTOTAL')
    Filtro.Strings = (
      '( PP.IDPESSJUR        = EL.IDPESSJUR )'
      '( PP.IDPESSOA         = EL.IDPESSOA )'
      '( PES.IDPESSOA        = EL.IDPESSOA )'
      '( PAT.IDPESSOA        = PP.IDPESSJUR )'
      '( PL.IDPLANOPREV      = PP.IDPLANOPREV )'
      '( B.IDPESSJUR(+)      = PP.IDPESSJUR )'
      '( B.IDPLANOORIGEM(+)  = PP.IDPLANOPREV )'
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
      '( B.IDTITULAR = DEPENTIT.IDTITULAR(+) )'
      '( B.IDPESSOA = DEPENTIT.IDPESSOA(+) )'
      '( BPL.FLGREFERENCIA  = 1 )')
    Mascaras.Strings = (
      ''
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
      '30'
      '15'
      '30'
      '15'
      '60'
      '15'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
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
    Left = 7
    Top = 363
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 39
    Top = 364
  end
  object Query: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   * from moeda'
      ' ')
    Left = 121
    Top = 363
  end
  object DataSource: TDataSource
    DataSet = CdsAux
    Left = 150
    Top = 363
  end
  object DataSetProvider: TDataSetProvider
    DataSet = Query
    Constraints = True
    Left = 180
    Top = 363
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 215
    Top = 364
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 71
    Top = 364
  end
end
