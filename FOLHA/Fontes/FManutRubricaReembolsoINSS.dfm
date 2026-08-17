inherited frmManutRubricaReembolsoINSS: TfrmManutRubricaReembolsoINSS
  Left = 186
  Top = 72
  Caption = 'Manutenção de Rubricas do Reembolso do INSS e NB'
  ClientHeight = 513
  ClientWidth = 1023
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1023
    Height = 427
    object pcPaginas: TPageControl
      Left = 1
      Top = 1
      Width = 1021
      Height = 425
      ActivePage = tsIndividual
      Align = alClient
      TabOrder = 0
      object tsIndividual: TTabSheet
        Caption = 'Individual'
        object pnOpcaoLista: TPanel
          Left = 0
          Top = 0
          Width = 1013
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object chkbxListaIndividual: TCheckBox
            Left = 8
            Top = 12
            Width = 257
            Height = 17
            Caption = 'Utiliza Lista Individual de Processamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = chkbxListaIndividualClick
          end
        end
        object pnOpcoesIndiv01: TPanel
          Left = 0
          Top = 374
          Width = 1013
          Height = 95
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 9
            Top = 5
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object Label2: TLabel
            Left = 139
            Top = 5
            Width = 68
            Height = 13
            Caption = 'Beneficiário'
          end
          object Label3: TLabel
            Left = 636
            Top = 5
            Width = 145
            Height = 13
            Caption = 'Valor Provento/Desconto'
          end
          object Label4: TLabel
            Left = 10
            Top = 52
            Width = 100
            Height = 13
            Caption = 'Mês de Cobrança'
          end
          object Label5: TLabel
            Left = 139
            Top = 52
            Width = 108
            Height = 13
            Caption = 'Mês de Referência'
          end
          object Label6: TLabel
            Left = 278
            Top = 52
            Width = 261
            Height = 13
            Caption = 'Versão de Pagamento da Folha de Benefícios'
          end
          object Label26: TLabel
            Left = 636
            Top = 49
            Width = 75
            Height = 13
            Caption = 'Seq. Rubrica'
          end
          object edtMatricula: TEdit
            Left = 10
            Top = 21
            Width = 102
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 0
          end
          object edtBeneficiario: TEdit
            Left = 139
            Top = 20
            Width = 462
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 1
          end
          object edtValorProvento: TEdit
            Left = 636
            Top = 20
            Width = 102
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 2
          end
          object edtMesCobranca: TEdit
            Left = 10
            Top = 68
            Width = 102
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 3
          end
          object edtMesReferencia: TEdit
            Left = 140
            Top = 68
            Width = 102
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 4
          end
          object edtVersaoPagamento: TEdit
            Left = 280
            Top = 67
            Width = 102
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 5
          end
          object edtSeqRubrica: TEdit
            Left = 636
            Top = 63
            Width = 102
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 6
          end
        end
        object pnOpcaoMesCompetencia: TPanel
          Left = 0
          Top = 469
          Width = 1013
          Height = 63
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label7: TLabel
            Left = 11
            Top = 10
            Width = 253
            Height = 13
            Caption = 'Mês de competência do Reembolso do INSS'
          end
          object chkbxOpcHistRubricas: TCheckBox
            Left = 387
            Top = 28
            Width = 198
            Height = 17
            Caption = 'Histórico de Rubricas Salariais'
            Enabled = False
            TabOrder = 0
            OnClick = chkbxOpcHistRubricasClick
          end
          object chkbxOpcHistBeneficios: TCheckBox
            Left = 595
            Top = 28
            Width = 160
            Height = 17
            Caption = 'Histórico de Beneficios'
            Enabled = False
            TabOrder = 1
          end
          object chkbxOpcRubIndividuais: TCheckBox
            Left = 611
            Top = 47
            Width = 160
            Height = 17
            Caption = 'Rubricas Individuais'
            Enabled = False
            TabOrder = 2
            Visible = False
          end
          object edtMesCompetenciaINSS: TMaskEdit
            Left = 13
            Top = 24
            Width = 121
            Height = 21
            EditMask = '9999/99;1; '
            MaxLength = 7
            ReadOnly = True
            TabOrder = 3
            Text = '    /  '
          end
        end
        object pnOpcoesIndiv02: TPanel
          Left = 0
          Top = 532
          Width = 1013
          Height = 59
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object Label8: TLabel
            Left = 10
            Top = 4
            Width = 172
            Height = 13
            Caption = 'Número do Benefício do INSS'
          end
          object Label9: TLabel
            Left = 192
            Top = 4
            Width = 216
            Height = 13
            Caption = 'Identificador da Rubrica na Fundação'
          end
          object Label10: TLabel
            Left = 427
            Top = 5
            Width = 45
            Height = 13
            Caption = 'Rubrica'
          end
          object edtIdentificadorRubrica: TEdit
            Left = 193
            Top = 19
            Width = 102
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 0
          end
          object edtRubrica: TEdit
            Left = 427
            Top = 19
            Width = 317
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 1
          end
          object cbNumBeneficioINSS: TComboBox
            Left = 12
            Top = 20
            Width = 146
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
          end
        end
        object pnOpcoesLista: TPanel
          Left = 0
          Top = 33
          Width = 1013
          Height = 341
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          Visible = False
          object pnOpcoesProcLista: TPanel
            Left = 0
            Top = 0
            Width = 1013
            Height = 154
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label18: TLabel
              Left = 9
              Top = 94
              Width = 254
              Height = 13
              Caption = 'Mês de Competência do Reembolso do INSS'
            end
            object Label19: TLabel
              Left = 10
              Top = 1
              Width = 137
              Height = 13
              Caption = 'Mês de Cobrança Início'
            end
            object Label20: TLabel
              Left = 169
              Top = 1
              Width = 156
              Height = 13
              Caption = 'Mês de Competência Início'
            end
            object Label21: TLabel
              Left = 353
              Top = 1
              Width = 145
              Height = 13
              Caption = 'Mês de Referência Início'
            end
            object Label22: TLabel
              Left = 353
              Top = 41
              Width = 131
              Height = 13
              Caption = 'Mês de Referência Fim'
            end
            object Label23: TLabel
              Left = 169
              Top = 41
              Width = 142
              Height = 13
              Caption = 'Mês de Competência Fim'
            end
            object Label24: TLabel
              Left = 10
              Top = 41
              Width = 123
              Height = 13
              Caption = 'Mês de Cobrança Fim'
            end
            object Label25: TLabel
              Left = 531
              Top = 2
              Width = 45
              Height = 13
              Caption = 'Rubrica'
            end
            object btnProcessar: TBitBtn
              Left = 794
              Top = 97
              Width = 105
              Height = 33
              Caption = '&Processar'
              Default = True
              Enabled = False
              ModalResult = 1
              TabOrder = 11
              OnClick = btnProcessarClick
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333330000333333333333333333333333F33333333333
                00003333344333333333333333388F3333333333000033334224333333333333
                338338F3333333330000333422224333333333333833338F3333333300003342
                222224333333333383333338F3333333000034222A22224333333338F338F333
                8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                0000333333333A222433333333333338F338F33300003333333333A222433333
                333333338F338F33000033333333333A222433333333333338F338F300003333
                33333333A222433333333333338F338F00003333333333333A22433333333333
                3338F38F000033333333333333A223333333333333338F830000333333333333
                333A333333333333333338330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
              Spacing = 2
            end
            object chkbxOpcHistRubricasLista: TCheckBox
              Left = 423
              Top = 111
              Width = 198
              Height = 17
              Caption = 'Histórico de Rubricas Salariais'
              Enabled = False
              TabOrder = 8
              OnClick = chkbxOpcHistRubricasListaClick
            end
            object chkbxOpcHistBeneficiosLista: TCheckBox
              Left = 627
              Top = 111
              Width = 160
              Height = 17
              Caption = 'Histórico de Beneficios'
              Enabled = False
              TabOrder = 9
            end
            object chkbxOpcRubIndividuaisLista: TCheckBox
              Left = 644
              Top = 134
              Width = 140
              Height = 17
              Caption = 'Rubricas Individuais'
              Enabled = False
              TabOrder = 10
              Visible = False
            end
            object edtMesCompetenciaINSSLista: TMaskEdit
              Left = 11
              Top = 110
              Width = 121
              Height = 21
              EditMask = '9999/99;1; '
              MaxLength = 7
              ReadOnly = True
              TabOrder = 7
              Text = '    /  '
              OnChange = edtMesCompetenciaINSSListaChange
              OnExit = edtMesCompetenciaINSSListaExit
            end
            object edtMesCobrancaInicioConsulta: TMaskEdit
              Left = 12
              Top = 16
              Width = 101
              Height = 21
              EditMask = '9999/99;1; '
              MaxLength = 7
              TabOrder = 0
              Text = '    /  '
            end
            object edtMesCompetenciaInicioConsulta: TMaskEdit
              Left = 172
              Top = 16
              Width = 101
              Height = 21
              EditMask = '9999/99;1; '
              MaxLength = 7
              TabOrder = 2
              Text = '    /  '
            end
            object edtMesReferenciaInicioConsulta: TMaskEdit
              Left = 355
              Top = 16
              Width = 101
              Height = 21
              EditMask = '9999/99;1; '
              MaxLength = 7
              TabOrder = 4
              Text = '    /  '
            end
            object edtMesReferenciaFimConsulta: TMaskEdit
              Left = 355
              Top = 55
              Width = 101
              Height = 21
              EditMask = '9999/99;1; '
              MaxLength = 7
              TabOrder = 5
              Text = '    /  '
            end
            object edtMesCompetenciaFimConsulta: TMaskEdit
              Left = 172
              Top = 55
              Width = 101
              Height = 21
              EditMask = '9999/99;1; '
              MaxLength = 7
              TabOrder = 3
              Text = '    /  '
            end
            object edtMesCobrancaFimConsulta: TMaskEdit
              Left = 12
              Top = 56
              Width = 101
              Height = 21
              EditMask = '9999/99;1; '
              MaxLength = 7
              TabOrder = 1
              Text = '    /  '
            end
            object btnConsultar: TBitBtn
              Left = 680
              Top = 46
              Width = 106
              Height = 32
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
              TabOrder = 6
              TabStop = False
              OnClick = btnConsultarClick
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
            object dblcRubrica: TwwDBLookupCombo
              Left = 529
              Top = 16
              Width = 373
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'150'#9'Descrição'#9'F')
              LookupTable = qryRubrica
              LookupField = 'DESCRICAO'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              DropDownWidth = 320
              TabOrder = 12
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnKeyDown = dblcRubricaKeyDown
            end
          end
          object dbgrdConsulta: TwwDBGrid
            Left = 0
            Top = 154
            Width = 1013
            Height = 187
            Selected.Strings = (
              'MATRICULA'#9'10'#9'Matrícula'
              'NOME'#9'25'#9'Beneficiário'
              'VALORPROVENTO'#9'12'#9'Provento/~Desconto'
              'MESCOBRANCA'#9'10'#9'Mês de~Cobrança'
              'MES'#9'10'#9'Mês de~Referência'
              'IDHSTFOLHABENEF'#9'10'#9'Versão do pagamento ~Folha de Benefício'
              'MESCOMPREEM'#9'7'#9'Competência ~Reembolso INSS'
              'NUMPROCINSS'#9'10'#9'Número ~Benefício INSS'
              'CODPROVDESC'#9'7'#9'Rubrica na~Fundação'
              'DESCRICAO'#9'25'#9'Rubrica'
              'SEQRUBRICA'#9'10'#9'Seq. Rubrica')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            DataSource = dsConsulta
            EditCalculated = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = [dgAllowDelete]
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTrailingEllipsis, dgShowCellHint]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      object tsLista: TTabSheet
        Caption = 'Lista'
        ImageIndex = 1
        inline frameBenef: TfrmFrameListaBenef
          Width = 1013
          Height = 397
          Align = alClient
          inherited Panel3: TPanel
            Width = 1013
            inherited Dock971: TDock97
              Width = 1011
              inherited TB97oKCancelar: TToolbar97
                inherited lblQuant: TLabel
                  Width = 5
                end
              end
            end
          end
          inherited dbgrdPessoas: TwwDBGrid
            Width = 1013
            Height = 363
          end
        end
      end
      object tsResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 2
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 1013
          Height = 107
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label11: TLabel
            Left = 3
            Top = 13
            Width = 137
            Height = 13
            Caption = 'Mês de Cobrança Início'
          end
          object Label12: TLabel
            Left = 3
            Top = 53
            Width = 123
            Height = 13
            Caption = 'Mês de Cobrança Fim'
          end
          object Label13: TLabel
            Left = 346
            Top = 13
            Width = 145
            Height = 13
            Caption = 'Mês de Referência Início'
          end
          object Label14: TLabel
            Left = 346
            Top = 53
            Width = 131
            Height = 13
            Caption = 'Mês de Referência Fim'
          end
          object Label15: TLabel
            Left = 162
            Top = 13
            Width = 156
            Height = 13
            Caption = 'Mês de Competência Início'
          end
          object Label16: TLabel
            Left = 162
            Top = 53
            Width = 142
            Height = 13
            Caption = 'Mês de Competência Fim'
          end
          object Label17: TLabel
            Left = 514
            Top = 14
            Width = 45
            Height = 13
            Caption = 'Rubrica'
          end
          object btnProcurar: TBitBtn
            Left = 555
            Top = 59
            Width = 100
            Height = 32
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
            TabStop = False
            OnClick = btnProcurarClick
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
          object edtMesCobrancaInicio: TMaskEdit
            Left = 5
            Top = 28
            Width = 101
            Height = 21
            EditMask = '9999/99;1; '
            MaxLength = 7
            TabOrder = 1
            Text = '    /  '
          end
          object edtMesCobrancaFim: TMaskEdit
            Left = 5
            Top = 68
            Width = 101
            Height = 21
            EditMask = '9999/99;1; '
            MaxLength = 7
            TabOrder = 2
            Text = '    /  '
          end
          object edtMesCompetenciaInicio: TMaskEdit
            Left = 165
            Top = 28
            Width = 101
            Height = 21
            EditMask = '9999/99;1; '
            MaxLength = 7
            TabOrder = 3
            Text = '    /  '
          end
          object edtMesCompetenciaFim: TMaskEdit
            Left = 165
            Top = 67
            Width = 101
            Height = 21
            EditMask = '9999/99;1; '
            MaxLength = 7
            TabOrder = 4
            Text = '    /  '
          end
          object edtMesReferenciaInicio: TMaskEdit
            Left = 348
            Top = 28
            Width = 101
            Height = 21
            EditMask = '9999/99;1; '
            MaxLength = 7
            TabOrder = 5
            Text = '    /  '
          end
          object edtMesReferenciaFim: TMaskEdit
            Left = 348
            Top = 67
            Width = 101
            Height = 21
            EditMask = '9999/99;1; '
            MaxLength = 7
            TabOrder = 6
            Text = '    /  '
          end
          object dblcRubricaResultado: TwwDBLookupCombo
            Left = 514
            Top = 28
            Width = 373
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'150'#9'Descrição'#9'F')
            LookupTable = qryRubricaResultado
            LookupField = 'DESCRICAO'
            Options = [loColLines, loRowLines, loTitles]
            Style = csDropDownList
            DropDownWidth = 320
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnKeyDown = dblcRubricaResultadoKeyDown
          end
        end
        object dbgrdResultado: TwwDBGrid
          Left = 0
          Top = 107
          Width = 1013
          Height = 290
          Selected.Strings = (
            'MATRICULA'#9'10'#9'Matrícula'#9'F'
            'NOME'#9'25'#9'Beneficiário'#9'F'
            'VALORPROVENTO'#9'15'#9'Provento/~Desconto'#9'F'
            'MESCOBRANCA'#9'10'#9'Mês de~Cobrança'#9'F'
            'MES'#9'10'#9'Mês de~Referência'#9'F'
            'IDHSTFOLHABENEF'#9'10'#9'Versão do pagamento ~Folha de Benefício'#9'F'
            'MESCOMPREEM'#9'7'#9'Competência ~Reembolso INSS'#9'F'
            'NUMEROPROCESSO'#9'10'#9'Número ~Benefício INSS'#9'F'
            'CODPROVDESC'#9'7'#9'Rubrica na~Fundação'#9'F'
            'DESCRICAO'#9'30'#9'Rubrica'#9'F')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsResultado
          EditCalculated = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = [dgAllowDelete]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTrailingEllipsis, dgShowCellHint]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1023
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        OnClick = sbtnAlterarClick
      end
      inherited sbtnProcurar: TToolbarButton97
        OnClick = sbtnProcurarClick
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 474
    Width = 1023
    inherited tb97Fundo: TToolbar97
      Left = 862
      DockPos = 862
      inherited sep1: TToolbarSep97
        Left = 84
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Width = 0
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 693
      DockPos = 693
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 800
    Top = 14
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
  inherited ds: TwwDataSource
    Left = 384
    Top = 12
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 416
    Top = 11
  end
  object MSBeneficiario: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'HISTRUBSAL.VALORPROVENTO'
      'HISTRUBSAL.MESCOBRANCA'
      'HISTRUBSAL.MES'
      'HISTRUBSAL.NUMPROCINSS'
      'HISTRUBSAL.IDHSTFOLHABENEF'
      'HISTRUBSAL.MESCOMPREEM'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRICAO'
      'HISTRUBSAL.SEQRUBRICA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Valor'
      'Mês Cobrança'
      'Mês Referência'
      'Número Benefício INSS'
      'Versão do Pagamento'
      'Competência INSS'
      'Rubrica Fundação'
      'Rubrica'
      'Seq. Rubrica')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'S'
      'S'
      'S'
      'S'
      'S'
      'S'
      'N'
      'S')
    Tabelas.Strings = (
      'HISTRUBSAL'
      'DEPENTIT'
      'PESSOA'
      'PROVDESC')
    CamposChave.Strings = (
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'HISTRUBSAL.VALORPROVENTO'
      'HISTRUBSAL.MESCOBRANCA'
      'HISTRUBSAL.MES'
      'HISTRUBSAL.IDHSTFOLHABENEF'
      'HISTRUBSAL.MESCOMPREEM'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRICAO'
      'PESSOA.IDPESSOA'
      'HISTRUBSAL.IDRUBRICA'
      'HISTRUBSAL.SEQORIGINAL'
      'HISTRUBSAL.SEQRUBRICA'
      'HISTRUBSAL.IDPLANOPREV'
      'HISTRUBSAL.IDBENEFICIO'
      'HISTRUBSAL.IDMOTIVO'
      'HISTRUBSAL.NUMEROPROCESSO'
      'HISTRUBSAL.IDPATRO'
      'HISTRUBSAL.IDTITULAR'
      'HISTRUBSAL.IDPLANOORIGEM')
    Filtro.Strings = (
      'DEPENTIT.IDPESSOA                     = PESSOA.IDPESSOA'
      'HISTRUBSAL.IDPESSOA                 = PESSOA.IDPESSOA'
      'HISTRUBSAL.IDRUBRICA               = PROVDESC.IDPROVENTO'
      'HISTRUBSAL.FONTEPAGADORA   = PROVDESC.CODFONTEPAGADORA'
      'HISTRUBSAL.FONTEPAGADORA   = 2')
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
      ''
      '')
    Larguras.Strings = (
      '15'
      '20'
      '15'
      '15'
      '15'
      '10'
      '10'
      '10'
      '20'
      '10'
      '15')
    OperComparador.Strings = (
      '1'
      '1'
      '1'
      '1'
      '1'
      '1'
      '1'
      '1'
      '1'
      '-1'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = MSBeneficiarioBeforeOpenCds
    LookupSQL.Strings = (
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
      '')
    LookupCampoChave.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
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
      '')
    Left = 454
    Top = 16
  end
  object dsResultado: TwwDataSource
    DataSet = qryResultado
    Left = 643
    Top = 10
  end
  object qryResultado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT '#39'       '#39' AS MATRICULA,'
      '       '#39'                    '#39' AS NOME,'
      '       0 AS VALORPROVENTO,'
      '       '#39'       '#39' AS MESCOBRANCA,'
      '       '#39'       '#39' AS MES,'
      '       0 AS IDVERSAOPAGTO,'
      '       '#39'       '#39' AS MESCOMPREEM,'
      '       '#39'       '#39' AS NUMEROPROCESSO,'
      '       '#39'       '#39' AS CODPROVDESC,'
      '       '#39'                   '#39' AS DESCRICAO,'
      '       0 AS IDHSTFOLHABENEF,'
      '       0 AS IDRUBRICA'
      'FROM DUAL'
      'WHERE 1=2'
      ' ')
    PictureMasks.Strings = (
      
        'VLRTOTAL'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 635
    Top = 226
    object qryResultadoMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 10
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 7
    end
    object qryResultadoNOME: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 25
      FieldName = 'NOME'
      FixedChar = True
    end
    object qryResultadoVALORPROVENTO: TFloatField
      DisplayLabel = 'Provento/~Desconto'
      DisplayWidth = 15
      FieldName = 'VALORPROVENTO'
    end
    object qryResultadoMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de~Cobrança'
      DisplayWidth = 10
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryResultadoMES: TStringField
      DisplayLabel = 'Mês de~Referência'
      DisplayWidth = 10
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryResultadoIDHSTFOLHABENEF: TFloatField
      DisplayLabel = 'Versão do pagamento ~Folha de Benefício'
      DisplayWidth = 10
      FieldName = 'IDHSTFOLHABENEF'
    end
    object qryResultadoMESCOMPREEM: TStringField
      DisplayLabel = 'Competência ~Reembolso INSS'
      DisplayWidth = 7
      FieldName = 'MESCOMPREEM'
      FixedChar = True
      Size = 7
    end
    object qryResultadoNUMEROPROCESSO: TStringField
      DisplayLabel = 'Número ~Benefício INSS'
      DisplayWidth = 10
      FieldName = 'NUMEROPROCESSO'
      FixedChar = True
      Size = 7
    end
    object qryResultadoCODPROVDESC: TStringField
      DisplayLabel = 'Rubrica na~Fundação'
      DisplayWidth = 7
      FieldName = 'CODPROVDESC'
      FixedChar = True
      Size = 7
    end
    object qryResultadoDESCRICAO: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 19
    end
    object qryResultadoIDVERSAOPAGTO: TFloatField
      DisplayLabel = 'Versão do pagamento ~Folha de Benefício'
      DisplayWidth = 10
      FieldName = 'IDVERSAOPAGTO'
      Visible = False
    end
    object qryResultadoIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Visible = False
    end
  end
  object qryRubricaResultado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT CODPROVDESC , DESCRICAO, DESCRPROVDESC, IDPROVENTO'
      'FROM PROVDESC'
      'WHERE CODFONTEPAGADORA = 2'
      'AND CODPROVDESC IS NOT  NULL'
      'AND SUBSTR(CODPROVDESC,3,3) <> '#39'280'#39
      'ORDER BY CODPROVDESC')
    PictureMasks.Strings = (
      
        'VLRTOTAL'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 603
    Top = 50
  end
  object dsRubricaResultado: TwwDataSource
    DataSet = qryRubricaResultado
    Left = 635
    Top = 50
  end
  object qryBeneficioINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT DISTINCT NUMPROCINSS'
      'FROM DETCONCINSS D'
      'WHERE IDPESSOA = 386015 ')
    PictureMasks.Strings = (
      
        'VLRTOTAL'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 731
    Top = 50
  end
  object dsBeneficioINSS: TwwDataSource
    DataSet = qryBeneficioINSS
    Left = 763
    Top = 50
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT CODPROVDESC , DESCRICAO, DESCRPROVDESC, IDPROVENTO'
      'FROM PROVDESC'
      'WHERE CODFONTEPAGADORA = 2'
      'AND CODPROVDESC IS NOT  NULL'
      'ORDER BY CODPROVDESC')
    PictureMasks.Strings = (
      
        'VLRTOTAL'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 875
    Top = 50
  end
  object qryConsulta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT /*+ PARALLEL(HISTRUBSAL,20,1) (PESSOA,20,1)*/            ' +
        '    '
      
        '        DISTINCT DEPENTIT.MATRICULA,                            ' +
        '     '
      
        '        PESSOA.NOME,                                            ' +
        '     '
      
        '        HISTRUBSAL.VALORPROVENTO,                               ' +
        '     '
      
        '        HISTRUBSAL.MESCOBRANCA,                                 ' +
        '     '
      
        '        HISTRUBSAL.MES,                                         ' +
        '     '
      
        '        HISTRUBSAL.IDVERSAOPAGTO,                               ' +
        '     '
      
        '        HISTRUBSAL.MESCOMPREEM,                                 ' +
        '     '
      
        '        HistRubSal.NumProcInss as NUMEROPROCESSO,               ' +
        '     '
      
        '        HistRubSal.NumProcInss,                                 ' +
        '     '
      
        '        PROVDESC.CODPROVDESC,                                   ' +
        '     '
      
        '        PROVDESC.DESCRICAO,                                     ' +
        '     '
      
        '        HISTRUBSAL.IDPESSOA,                                    ' +
        '     '
      
        '        HISTRUBSAL.IDRUBRICA,                                   ' +
        '     '
      
        '        HISTRUBSAL.SEQORIGINAL,                                 ' +
        '     '
      
        '        HISTRUBSAL.SEQORIGINAL,                                 ' +
        '     '
      
        '        HISTRUBSAL.SEQRUBRICA,                                  ' +
        '     '
      '        HISTRUBSAL.IDHSTFOLHABENEF,'
      '        HISTRUBSAL.IDPLANOPREV,   '
      '        HISTRUBSAL.IDBENEFICIO,   '
      '        HISTRUBSAL.IDMOTIVO,      '
      '        HISTRUBSAL.NUMEROPROCESSO AS NUMEROPROCESSO1,'
      '        HISTRUBSAL.IDPATRO,     '
      '        HISTRUBSAL.IDTITULAR,     '
      '        HISTRUBSAL.IDPLANOORIGEM, '
      
        '        HISTRUBSAL.ROWID AS ROWID_HISTRUBSAL                    ' +
        '           '
      ' FROM CM.HISTRUBSAL,'
      
        '     CM.HSTBENEFBFCIARIO,                                       ' +
        '   '
      
        '     CM.DEPENTIT,                                               ' +
        '   '
      
        '     CM.PESSOA,                                                 ' +
        '   '
      
        '     CM.PROVDESC                                                ' +
        '   '
      
        'WHERE HISTRUBSAL.IDTITULAR       = HSTBENEFBFCIARIO.IDTITULAR   ' +
        '   '
      
        'AND   HISTRUBSAL.IDPESSOA        = HSTBENEFBFCIARIO.IDPESSOA    ' +
        '   '
      
        'AND   HISTRUBSAL.IDPATRO         = HSTBENEFBFCIARIO.IDPESSJUR   ' +
        '   '
      
        'AND   HSTBENEFBFCIARIO.IDPESSOA  = DEPENTIT.IDPESSOA            ' +
        '   '
      
        'AND   HSTBENEFBFCIARIO.IDTITULAR = DEPENTIT.IDTITULAR           ' +
        '   '
      
        'AND   DEPENTIT.IDPESSOA          = PESSOA.IDPESSOA              ' +
        '   '
      
        'AND   HSTBENEFBFCIARIO.IDPESSOA  = PESSOA.IDPESSOA              ' +
        '   '
      
        'AND   HISTRUBSAL.IDPESSOA        = PESSOA.IDPESSOA              ' +
        '   '
      
        'AND   HISTRUBSAL.IDRUBRICA       = PROVDESC.IDPROVENTO          ' +
        '   '
      
        'AND   HISTRUBSAL.FONTEPAGADORA   = PROVDESC.CODFONTEPAGADORA    ' +
        '   '
      
        'AND   HSTBENEFBFCIARIO.MES       = HISTRUBSAL.MESCOBRANCA       ' +
        '   '
      
        'AND   HISTRUBSAL.FONTEPAGADORA   = 2                            ' +
        '   '
      
        'AND   HSTBENEFBFCIARIO.FONTEPAGADORA  = 2                       ' +
        '   '
      'AND   1 = 2'
      ' '
      ' ')
    PictureMasks.Strings = (
      
        'VLRTOTAL'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 419
    Top = 290
    object qryConsultaMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 10
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS."CM.DEPENTIT".MATRICULA'
      Size = 15
    end
    object qryConsultaNOME: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'BASEDADOS."CM.PESSOA".NOME'
      Size = 60
    end
    object qryConsultaVALORPROVENTO: TFloatField
      DisplayLabel = 'Provento/~Desconto'
      DisplayWidth = 12
      FieldName = 'VALORPROVENTO'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".VALORPROVENTO'
    end
    object qryConsultaMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de~Cobrança'
      DisplayWidth = 10
      FieldName = 'MESCOBRANCA'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryConsultaMES: TStringField
      DisplayLabel = 'Mês de~Referência'
      DisplayWidth = 10
      FieldName = 'MES'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".MES'
      FixedChar = True
      Size = 7
    end
    object qryConsultaIDHSTFOLHABENEF: TFloatField
      DisplayLabel = 'Versão do pagamento ~Folha de Benefício'
      DisplayWidth = 10
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".IDHSTFOLHABENEF'
    end
    object qryConsultaMESCOMPREEM: TStringField
      DisplayLabel = 'Competência ~Reembolso INSS'
      DisplayWidth = 7
      FieldName = 'MESCOMPREEM'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".MESCOMPREEM'
      FixedChar = True
      Size = 7
    end
    object qryConsultaNUMPROCINSS: TStringField
      DisplayLabel = 'Número ~Benefício INSS'
      DisplayWidth = 10
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".NUMPROCINSS'
      Size = 15
    end
    object qryConsultaCODPROVDESC: TStringField
      DisplayLabel = 'Rubrica na~Fundação'
      DisplayWidth = 7
      FieldName = 'CODPROVDESC'
      Origin = 'BASEDADOS."CM.PROVDESC".CODPROVDESC'
      Size = 15
    end
    object qryConsultaDESCRICAO: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS."CM.PROVDESC".DESCRICAO'
      Size = 130
    end
    object qryConsultaSEQRUBRICA: TFloatField
      DisplayLabel = 'Seq. Rubrica'
      DisplayWidth = 10
      FieldName = 'SEQRUBRICA'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".SEQRUBRICA'
    end
    object qryConsultaIDVERSAOPAGTO: TFloatField
      FieldName = 'IDVERSAOPAGTO'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".IDVERSAOPAGTO'
      Visible = False
    end
    object qryConsultaNUMEROPROCESSO: TStringField
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object qryConsultaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".IDPESSOA'
      Visible = False
    end
    object qryConsultaIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".IDRUBRICA'
      Visible = False
    end
    object qryConsultaSEQORIGINAL: TFloatField
      FieldName = 'SEQORIGINAL'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".SEQORIGINAL'
      Visible = False
    end
    object qryConsultaSEQORIGINAL_1: TFloatField
      FieldName = 'SEQORIGINAL_1'
      Origin = 'BASEDADOS."CM.HISTRUBSAL".SEQORIGINAL'
      Visible = False
    end
    object qryConsultaROWID_HISTRUBSAL: TStringField
      FieldName = 'ROWID_HISTRUBSAL'
      Size = 18
    end
    object qryConsultaIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryConsultaIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryConsultaIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
    end
    object qryConsultaIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryConsultaIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryConsultaNUMEROPROCESSO1: TFloatField
      FieldName = 'NUMEROPROCESSO1'
    end
    object qryConsultaIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
  end
  object dsConsulta: TwwDataSource
    DataSet = qryConsulta
    Left = 507
    Top = 298
  end
  object qryRubrica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT CODPROVDESC , DESCRICAO, DESCRPROVDESC, IDPROVENTO'
      'FROM PROVDESC'
      'WHERE CODFONTEPAGADORA = 2'
      'AND CODPROVDESC IS NOT  NULL'
      'AND SUBSTR(CODPROVDESC,3,3) <> '#39'280'#39
      'ORDER BY CODPROVDESC')
    PictureMasks.Strings = (
      
        'VLRTOTAL'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 515
    Top = 50
  end
  object dsRubrica: TwwDataSource
    DataSet = qryRubrica
    Left = 547
    Top = 50
  end
  object MSBeneficiarioOld: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'HISTRUBSAL.VALORPROVENTO'
      'HISTRUBSAL.MESCOBRANCA'
      'HISTRUBSAL.MES'
      'HISTRUBSAL.NUMPROCINSS'
      'HISTRUBSAL.IDHSTFOLHABENEF'
      'HISTRUBSAL.MESCOMPREEM'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRICAO'
      'HISTRUBSAL.SEQRUBRICA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Valor'
      'Mês Cobrança'
      'Mês Referência'
      'Número Benefício INSS'
      'Versão do Pagamento'
      'Competência INSS'
      'Rubrica Fundação'
      'Rubrica'
      'Seq. Rubrica')
    SensivelACaixa.Strings = (
      'N'
      'N'
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
      'HISTRUBSAL'
      'HSTBENEFBFCIARIO'
      'DEPENTIT'
      'PESSOA'
      'PROVDESC')
    CamposChave.Strings = (
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'HISTRUBSAL.VALORPROVENTO'
      'HISTRUBSAL.MESCOBRANCA'
      'HISTRUBSAL.MES'
      'HISTRUBSAL.IDHSTFOLHABENEF'
      'HISTRUBSAL.MESCOMPREEM'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRICAO'
      'PESSOA.IDPESSOA'
      'HISTRUBSAL.IDRUBRICA'
      'HISTRUBSAL.SEQORIGINAL'
      'HISTRUBSAL.SEQRUBRICA')
    Filtro.Strings = (
      'HISTRUBSAL.IDTITULAR       = HSTBENEFBFCIARIO.IDTITULAR'
      'HISTRUBSAL.IDPESSOA        = HSTBENEFBFCIARIO.IDPESSOA'
      'HISTRUBSAL.IDPATRO         = HSTBENEFBFCIARIO.IDPESSJUR'
      'HSTBENEFBFCIARIO.IDPESSOA  = DEPENTIT.IDPESSOA'
      'HSTBENEFBFCIARIO.IDTITULAR = DEPENTIT.IDTITULAR'
      'DEPENTIT.IDPESSOA          = PESSOA.IDPESSOA'
      'HSTBENEFBFCIARIO.IDPESSOA  = PESSOA.IDPESSOA'
      'HISTRUBSAL.IDPESSOA        = PESSOA.IDPESSOA'
      'HISTRUBSAL.IDRUBRICA       = PROVDESC.IDPROVENTO'
      'HISTRUBSAL.FONTEPAGADORA   = PROVDESC.CODFONTEPAGADORA'
      'HSTBENEFBFCIARIO.MES       = HISTRUBSAL.MESCOBRANCA'
      'HISTRUBSAL.FONTEPAGADORA   = 2'
      'HSTBENEFBFCIARIO.FONTEPAGADORA   = 2')
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
      ''
      '')
    Larguras.Strings = (
      '15'
      '20'
      '15'
      '15'
      '15'
      '10'
      '10'
      '10'
      '20'
      '10'
      '15')
    OperComparador.Strings = (
      '1'
      '1'
      '1'
      '1'
      '1'
      '1'
      '1'
      '1'
      '1'
      '-1'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
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
      '')
    LookupCampoChave.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
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
      '')
    Left = 542
    Top = 8
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 781
    Top = 377
  end
end
