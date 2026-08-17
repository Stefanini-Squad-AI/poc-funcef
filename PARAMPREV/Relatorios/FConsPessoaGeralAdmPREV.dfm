inherited frmConsPessoaGeralAdmPREV: TfrmConsPessoaGeralAdmPREV
  Left = 144
  Top = 17
  Caption = 'Consulta Geral de Pessoas ligadas ao AdmPREV'
  ClientHeight = 423
  ClientWidth = 657
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 657
    Height = 384
    object pgctrlBusca: TPageControl
      Left = 5
      Top = 5
      Width = 647
      Height = 374
      ActivePage = tbsBusca
      Align = alClient
      TabOrder = 0
      OnChange = pgctrlBuscaChange
      object tbsBusca: TTabSheet
        Caption = 'Informações para a Procura'
        object pnlInscricao: TPanel
          Left = 0
          Top = 41
          Width = 639
          Height = 41
          Align = alTop
          TabOrder = 1
          object Label5: TLabel
            Left = 21
            Top = 16
            Width = 77
            Height = 13
            Caption = 'Inscrição No.'
          end
          object cmbInscricao: TComboBox
            Left = 126
            Top = 12
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edInscricao: TEdit
            Left = 285
            Top = 12
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlMatricula: TPanel
          Left = 0
          Top = 0
          Width = 639
          Height = 41
          Align = alTop
          TabOrder = 0
          object Label1: TLabel
            Left = 21
            Top = 16
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object cmbMatricula: TComboBox
            Left = 126
            Top = 12
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edMatricula: TEdit
            Left = 285
            Top = 12
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlNome: TPanel
          Left = 0
          Top = 82
          Width = 639
          Height = 41
          Align = alTop
          TabOrder = 2
          object Label2: TLabel
            Left = 21
            Top = 16
            Width = 33
            Height = 13
            Caption = 'Nome'
          end
          object cmbNome: TComboBox
            Left = 126
            Top = 12
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edNome: TEdit
            Left = 285
            Top = 12
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlCPF: TPanel
          Left = 0
          Top = 123
          Width = 639
          Height = 41
          Align = alTop
          TabOrder = 3
          object Label3: TLabel
            Left = 21
            Top = 16
            Width = 24
            Height = 13
            Caption = 'CPF'
          end
          object cmbCPF: TComboBox
            Left = 126
            Top = 12
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edCPF: TEdit
            Left = 285
            Top = 12
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado da Pesquisa'
        ImageIndex = 1
        object dbgResultado: TwwDBGrid
          Left = 0
          Top = 0
          Width = 639
          Height = 346
          Selected.Strings = (
            'NOME'#9'60'#9'Nome'
            'MATRICULA'#9'13'#9'Matrícula'
            'INSCRICAONUMERO'#9'10'#9'Nº da Inscrição'#9'F'
            'NUMDOCUMENTO'#9'18'#9'Nº do CPF')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRes
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDblClick = dbgResultadoDblClick
          IndicatorColor = icBlack
        end
        object pnlResult: TPanel
          Left = 0
          Top = 0
          Width = 639
          Height = 346
          Align = alClient
          TabOrder = 0
          object Label4: TLabel
            Left = 12
            Top = 21
            Width = 105
            Height = 13
            Caption = 'Esta pessoa é um '
          end
          object edTipoPessoa: TEdit
            Left = 126
            Top = 21
            Width = 499
            Height = 21
            Color = clSilver
            ReadOnly = True
            TabOrder = 0
          end
          object pgctrlResult: TPageControl
            Left = 9
            Top = 57
            Width = 616
            Height = 283
            ActivePage = tbsBenefPP
            TabOrder = 1
            object tbsElegivel: TTabSheet
              Caption = 'tbsElegivel'
              object Label6: TLabel
                Left = 9
                Top = 3
                Width = 55
                Height = 13
                Caption = 'Matrícula'
              end
              object Label7: TLabel
                Left = 8
                Top = 184
                Width = 107
                Height = 13
                Caption = 'Inscrição no Plano'
              end
              object Label8: TLabel
                Left = 9
                Top = 40
                Width = 33
                Height = 13
                Caption = 'Nome'
              end
              object Label9: TLabel
                Left = 181
                Top = 3
                Width = 24
                Height = 13
                Caption = 'CPF'
              end
              object Label10: TLabel
                Left = 9
                Top = 144
                Width = 118
                Height = 13
                Caption = 'Plano Previdenciário'
              end
              object Label11: TLabel
                Left = 9
                Top = 104
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object Label13: TLabel
                Left = 312
                Top = 104
                Width = 152
                Height = 13
                Caption = 'Situação na Patrocinadora'
              end
              object Label14: TLabel
                Left = 313
                Top = 144
                Width = 105
                Height = 13
                Caption = 'Situação no Plano'
              end
              object Label15: TLabel
                Left = 312
                Top = 184
                Width = 129
                Height = 13
                Caption = 'Situação na Fundação'
              end
              object Label16: TLabel
                Left = 371
                Top = 3
                Width = 116
                Height = 13
                Caption = 'Data de Nascimento'
              end
              object Label17: TLabel
                Left = 567
                Top = 3
                Width = 29
                Height = 13
                Caption = 'Sexo'
              end
              object Bevel1: TBevel
                Left = 8
                Top = 91
                Width = 593
                Height = 3
              end
              object dbeMatriculaEL: TDBEdit
                Left = 9
                Top = 17
                Width = 121
                Height = 21
                Color = clSilver
                DataField = 'MATRICULA'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 0
              end
              object dbeInscPlanEL: TDBEdit
                Left = 8
                Top = 200
                Width = 289
                Height = 21
                Color = clSilver
                DataField = 'INSCRICAONUMERO'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 1
              end
              object dbeCpfEL: TDBEdit
                Left = 181
                Top = 17
                Width = 121
                Height = 21
                Color = clSilver
                DataField = 'NUMDOCUMENTO'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 2
              end
              object dbeNomeEL: TDBEdit
                Left = 9
                Top = 56
                Width = 592
                Height = 21
                Color = clSilver
                DataField = 'NOME'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 3
              end
              object dbePatroEL: TDBEdit
                Left = 9
                Top = 120
                Width = 289
                Height = 21
                Color = clSilver
                DataField = 'PATROCINADORA'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 4
              end
              object dbeSitPatroEL: TDBEdit
                Left = 312
                Top = 120
                Width = 289
                Height = 21
                Color = clSilver
                DataField = 'SITUACAONAPATRO'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 5
              end
              object dbePlanPrevEL: TDBEdit
                Left = 9
                Top = 160
                Width = 289
                Height = 21
                Color = clSilver
                DataField = 'PLANO'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 6
              end
              object dbeSitPlanoEL: TDBEdit
                Left = 313
                Top = 160
                Width = 289
                Height = 21
                Color = clSilver
                DataField = 'SITUACAONOPLANO'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 7
              end
              object dbeSitFuncEL: TDBEdit
                Left = 312
                Top = 200
                Width = 289
                Height = 21
                Color = clSilver
                DataField = 'SITUACAONAFUND'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 8
              end
              object dbeNascEL: TDBEdit
                Left = 371
                Top = 17
                Width = 121
                Height = 21
                Color = clSilver
                DataField = 'DATANASC'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 9
              end
              object DbeSexoEL: TDBEdit
                Left = 567
                Top = 17
                Width = 34
                Height = 21
                Color = clSilver
                DataField = 'SEXO'
                DataSource = dsElegivel
                ReadOnly = True
                TabOrder = 10
              end
            end
            object tbsDependente: TTabSheet
              Caption = 'tbsDependente'
              ImageIndex = 1
              object grbTitular: TGroupBox
                Left = 8
                Top = 8
                Width = 593
                Height = 105
                Caption = '  Dados do Titular   '
                TabOrder = 0
                object Label20: TLabel
                  Left = 9
                  Top = 19
                  Width = 33
                  Height = 13
                  Caption = 'Nome'
                end
                object Label18: TLabel
                  Left = 9
                  Top = 56
                  Width = 55
                  Height = 13
                  Caption = 'Matrícula'
                end
                object Label21: TLabel
                  Left = 181
                  Top = 56
                  Width = 24
                  Height = 13
                  Caption = 'CPF'
                end
                object Label28: TLabel
                  Left = 371
                  Top = 56
                  Width = 116
                  Height = 13
                  Caption = 'Data de Nascimento'
                end
                object Label29: TLabel
                  Left = 556
                  Top = 56
                  Width = 29
                  Height = 13
                  Caption = 'Sexo'
                end
                object dbeNomeTitDP: TDBEdit
                  Left = 9
                  Top = 33
                  Width = 576
                  Height = 21
                  Color = clSilver
                  DataField = 'TITULAR'
                  DataSource = dsDep
                  ReadOnly = True
                  TabOrder = 0
                end
                object dbeMatriculaDP: TDBEdit
                  Left = 9
                  Top = 72
                  Width = 121
                  Height = 21
                  Color = clSilver
                  DataField = 'MATRICULA'
                  DataSource = dsDep
                  ReadOnly = True
                  TabOrder = 1
                end
                object dbeCPFTitDP: TDBEdit
                  Left = 181
                  Top = 72
                  Width = 121
                  Height = 21
                  Color = clSilver
                  DataField = 'CPFTIT'
                  DataSource = dsDep
                  ReadOnly = True
                  TabOrder = 2
                end
                object dbeNascTitDP: TDBEdit
                  Left = 371
                  Top = 72
                  Width = 121
                  Height = 21
                  Color = clSilver
                  DataField = 'DTNASCTIT'
                  DataSource = dsDep
                  ReadOnly = True
                  TabOrder = 3
                end
                object dbeSexoTitDP: TDBEdit
                  Left = 551
                  Top = 72
                  Width = 34
                  Height = 21
                  Color = clSilver
                  DataField = 'SEXOTIT'
                  DataSource = dsDep
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object grbDepedente: TGroupBox
                Left = 7
                Top = 120
                Width = 593
                Height = 105
                Caption = '  Dados do Dependente   '
                TabOrder = 1
                object Label19: TLabel
                  Left = 9
                  Top = 19
                  Width = 33
                  Height = 13
                  Caption = 'Nome'
                end
                object Label22: TLabel
                  Left = 9
                  Top = 56
                  Width = 68
                  Height = 13
                  Caption = 'Estado Civil'
                end
                object Label23: TLabel
                  Left = 245
                  Top = 56
                  Width = 24
                  Height = 13
                  Caption = 'CPF'
                end
                object Label24: TLabel
                  Left = 403
                  Top = 56
                  Width = 116
                  Height = 13
                  Caption = 'Data de Nascimento'
                end
                object Label25: TLabel
                  Left = 556
                  Top = 56
                  Width = 29
                  Height = 13
                  Caption = 'Sexo'
                end
                object dbeNomeDepDP: TDBEdit
                  Left = 9
                  Top = 33
                  Width = 576
                  Height = 21
                  Color = clSilver
                  DataField = 'DEPENDENTE'
                  DataSource = dsDep
                  ReadOnly = True
                  TabOrder = 0
                end
                object dbeEstCivilDP: TDBEdit
                  Left = 9
                  Top = 72
                  Width = 216
                  Height = 21
                  Color = clSilver
                  DataField = 'ESTCIVIL'
                  DataSource = dsDep
                  ReadOnly = True
                  TabOrder = 1
                end
                object dbeCPFDepDP: TDBEdit
                  Left = 245
                  Top = 72
                  Width = 121
                  Height = 21
                  Color = clSilver
                  DataField = 'CPFDEP'
                  DataSource = dsDep
                  ReadOnly = True
                  TabOrder = 2
                end
                object dbeNascDepDP: TDBEdit
                  Left = 403
                  Top = 72
                  Width = 121
                  Height = 21
                  Color = clSilver
                  DataField = 'DTNASCTIT'
                  DataSource = dsDep
                  ReadOnly = True
                  TabOrder = 3
                end
                object dbeSexoDepDP: TDBEdit
                  Left = 551
                  Top = 72
                  Width = 34
                  Height = 21
                  Color = clSilver
                  DataField = 'SEXODEP'
                  DataSource = dsDep
                  ReadOnly = True
                  TabOrder = 4
                end
              end
            end
            object tbsRecebedor: TTabSheet
              Caption = 'tbsRecebedor'
              ImageIndex = 2
              object GroupBox1: TGroupBox
                Left = 0
                Top = 0
                Width = 608
                Height = 105
                Align = alTop
                Caption = '  Dados do Recebedor   '
                TabOrder = 0
                object Label26: TLabel
                  Left = 9
                  Top = 19
                  Width = 33
                  Height = 13
                  Caption = 'Nome'
                end
                object Label27: TLabel
                  Left = 9
                  Top = 56
                  Width = 68
                  Height = 13
                  Caption = 'Estado Civil'
                end
                object Label30: TLabel
                  Left = 245
                  Top = 56
                  Width = 24
                  Height = 13
                  Caption = 'CPF'
                end
                object Label31: TLabel
                  Left = 403
                  Top = 56
                  Width = 116
                  Height = 13
                  Caption = 'Data de Nascimento'
                end
                object Label32: TLabel
                  Left = 556
                  Top = 56
                  Width = 29
                  Height = 13
                  Caption = 'Sexo'
                end
                object dbeNomeRC: TDBEdit
                  Left = 9
                  Top = 33
                  Width = 576
                  Height = 21
                  Color = clSilver
                  DataField = 'TITULAR'
                  DataSource = dsRec
                  ReadOnly = True
                  TabOrder = 0
                end
                object dbeEstCivilRC: TDBEdit
                  Left = 9
                  Top = 72
                  Width = 216
                  Height = 21
                  Color = clSilver
                  DataField = 'ESTCIVIL'
                  DataSource = dsRec
                  ReadOnly = True
                  TabOrder = 1
                end
                object dbeCpfRC: TDBEdit
                  Left = 245
                  Top = 72
                  Width = 121
                  Height = 21
                  Color = clSilver
                  DataField = 'CPFTITULAR'
                  DataSource = dsRec
                  ReadOnly = True
                  TabOrder = 2
                end
                object dbeNascRC: TDBEdit
                  Left = 403
                  Top = 72
                  Width = 121
                  Height = 21
                  Color = clSilver
                  DataField = 'DATANASC'
                  DataSource = dsRec
                  ReadOnly = True
                  TabOrder = 3
                end
                object dbeSexoRC: TDBEdit
                  Left = 551
                  Top = 72
                  Width = 34
                  Height = 21
                  Color = clSilver
                  DataField = 'SEXO'
                  DataSource = dsRec
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object dbgDepRec: TwwDBGrid
                Left = 0
                Top = 105
                Width = 608
                Height = 150
                Selected.Strings = (
                  'DEPENDENTE'#9'51'#9'Nome do Dependente'
                  'TIPORECEBEDOR'#9'30'#9'Tipo de Recebedor')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsRec
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
            object tbsBenefPP: TTabSheet
              Caption = 'tbsBenefPP'
              ImageIndex = 3
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 608
                Height = 89
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label33: TLabel
                  Left = 9
                  Top = 3
                  Width = 33
                  Height = 13
                  Caption = 'Nome'
                end
                object Label35: TLabel
                  Left = 149
                  Top = 40
                  Width = 24
                  Height = 13
                  Caption = 'CPF'
                end
                object Label36: TLabel
                  Left = 283
                  Top = 40
                  Width = 75
                  Height = 13
                  Caption = 'Mantenedora'
                end
                object Label34: TLabel
                  Left = 9
                  Top = 40
                  Width = 55
                  Height = 13
                  Caption = 'Matrícula'
                end
                object dbeNomeBP: TDBEdit
                  Left = 9
                  Top = 17
                  Width = 576
                  Height = 21
                  Color = clSilver
                  DataField = 'BENEFICIARIO'
                  DataSource = dsBen
                  ReadOnly = True
                  TabOrder = 0
                end
                object dbeCpfBP: TDBEdit
                  Left = 149
                  Top = 56
                  Width = 121
                  Height = 21
                  Color = clSilver
                  DataField = 'CPFBENEF'
                  DataSource = dsBen
                  ReadOnly = True
                  TabOrder = 1
                end
                object dbeMantBP: TDBEdit
                  Left = 283
                  Top = 56
                  Width = 302
                  Height = 21
                  Color = clSilver
                  DataField = 'MANTENEDORA'
                  DataSource = dsBenpp
                  ReadOnly = True
                  TabOrder = 2
                end
                object dbeMatrBP: TDBEdit
                  Left = 9
                  Top = 56
                  Width = 121
                  Height = 21
                  Color = clSilver
                  DataField = 'MATRICULA_DEPENDENTE'
                  DataSource = dsBen
                  ReadOnly = True
                  TabOrder = 3
                end
              end
              object Panel3: TPanel
                Left = 0
                Top = 89
                Width = 608
                Height = 166
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object dbgBen: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 608
                  Height = 166
                  Selected.Strings = (
                    'BENEFICIO'#9'52'#9'Descrição do Benefício'
                    'DATAINICIO'#9'12'#9'Iniciado em'
                    'VALORATUAL'#9'12'#9'Valor Atual')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsBenpp
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
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 657
    inherited tb97Fundo: TToolbar97
      Left = 1
      DockPos = 144
      inherited sep1: TToolbarSep97
        Left = 570
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 488
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [3]
        Left = 406
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep975: TToolbarSep97 [4]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep974: TToolbarSep97 [5]
        Left = 244
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 490
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 572
      end
      object bbtnElegivel: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Elegível'
        TabOrder = 2
        OnClick = bbtnElegivelClick
        NumGlyphs = 2
      end
      object bbtnDependente: TBitBtn
        Left = 164
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Dependente'
        TabOrder = 3
        OnClick = bbtnDependenteClick
        NumGlyphs = 2
      end
      object bbtnBusca: TBitBtn
        Left = 408
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Busca'
        Default = True
        TabOrder = 4
        OnClick = bbtnBuscaClick
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
      object bbtnParticipante: TBitBtn
        Left = 82
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Participante'
        TabOrder = 5
        OnClick = bbtnElegivelClick
        NumGlyphs = 2
      end
      object bbtnRecebedor: TBitBtn
        Left = 246
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Recebedor'
        TabOrder = 6
        OnClick = bbtnRecebedorClick
        NumGlyphs = 2
      end
      object bbtnBeneficiarioPP: TBitBtn
        Left = 326
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Beneficiário'
        TabOrder = 7
        OnClick = bbtnBeneficiarioPPClick
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 64
    Top = 517
  end
  object qryElegivel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EL.IDPESSJUR,'
      '       EL.IDPESSOA,'
      '       EL.MATRICULA,'
      '       P.NUMDOCUMENTO,'
      '       P.NOME,'
      '       PF.DATANASC,'
      '       PF.SEXO,'
      '       PAT.NOME AS PATROCINADORA,'
      '       DECODE(PL.NOME, NULL, '#39'<nenhum>'#39', PL.NOME) AS PLANO,'
      '       PP.INSCRICAONUMERO,'
      '       SF.DESCRICAO    AS SITUACAONAPATRO,'
      '       SPART.DESCRICAO AS SITUACAONAFUND,'
      '       SPLANO.DESCRICAO AS SITUACAONOPLANO'
      'FROM   PESSOA P,'
      '       PESSOA PAT,'
      '       PESSOAFISICA PF,'
      '       ELEGPATRO EL,'
      '       PARTPREVPLAN PP,'
      '       SITFUNC SF,'
      '       SITPART SPART,'
      '       SITPLANOPREV SPLANO,'
      '       PLANPREV PL'
      'WHERE  EL.IDPESSOA       = :IDPESSOA'
      'AND    EL.IDPESSJUR      = :IDPESSJUR'
      'AND    P.IDPESSOA        = EL.IDPESSOA'
      'AND    PAT.IDPESSOA      = EL.IDPESSJUR'
      'AND    PF.IDPESSOA       = EL.IDPESSOA'
      'AND    SF.IDSITFUNC      = EL.IDSITFUNC'
      'AND    EL.IDPESSJUR      = PP.IDPESSJUR(+)'
      'AND    EL.IDPESSOA       = PP.IDPESSOA(+)'
      'AND    0                 = PP.FLGDESATIVADO(+)'
      'AND    PP.IDSITPART      = SPART.IDSITPART(+)'
      'AND    PP.IDSITPLANOPREV = SPLANO.IDSITPLANOPREV(+)'
      'AND    PP.IDPLANOPREV    = PL.IDPLANOPREV(+)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 428
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object dsElegivel: TDataSource
    AutoEdit = False
    DataSet = qryElegivel
    Left = 428
    Top = 50
  end
  object qryBusca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 339
    Top = 6
  end
  object qryDep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' DPT.IDTITULAR,'
      ' PET.NOME AS TITULAR,'
      ' PET.NUMDOCUMENTO AS CPFTIT,'
      ' ELG.MATRICULA,'
      ' PFT.DATANASC AS DTNASCTIT,'
      ' PFT.SEXO AS SEXOTIT,'
      ' DPT.IDPESSOA,'
      ' PED.NOME AS DEPENDENTE,'
      ' PED.NUMDOCUMENTO AS CPFDEP,'
      ' PFD.DATANASC AS DTNASCDEP,'
      
        ' DECODE(PFD.ESTCIVIL,'#39'S'#39','#39'SOLTEIRO(A)'#39', '#39'C'#39','#39'CASADO(A)'#39', '#39'D'#39','#39'DI' +
        'VORCIADO(A)'#39', '#39'E'#39','#39'DESQUITADO(A)'#39',  '#39'J'#39','#39'SEPARADO(A) JUDICIAL'#39', ' +
        #39'V'#39','#39'VIÚVO(A)'#39', '#39'O'#39','#39'OUTROS'#39') AS ESTCIVIL,'
      ' PFD.SEXO AS SEXODEP,'
      ' ELG.IDPESSJUR,'
      ' PAT.NOME AS PATROCINADORA,'
      ' PTP.IDPLANOPREV'
      'FROM'
      ' PESSOA        PET,  /* PESSOA TITULAR           */'
      ' PESSOA        PED,  /* PESSOA DEPENDENTE        */'
      ' PESSOA        PAT,  /* PATROCINADORA            */'
      ' PESSOAFISICA  PFT,  /* PESSOA FISICA TITULAR    */'
      ' PESSOAFISICA  PFD,  /* PESSOA FISICA DEPENDENTE */'
      ' ELEGPATRO     ELG,  /* ELEGIVEL                 */'
      ' DEPENTIT      DPT,  /* TITULAR E DEPENDENTE     */'
      ' PARTPREVPLAN  PTP   /* PARTICIPANTES            */'
      'WHERE'
      '-- FILTRO DEPENTIT (DEPENDENTE )'
      ' (DPT.IDPESSOA      =   :IDPESSOA     )      AND'
      ' (DPT.IDPESSOA      <> DPT.IDTITULAR  )      AND'
      '-- JOIN PESSOA TITULAR COM DEPENTIT'
      ' (PET.IDPESSOA      =   DPT.IDTITULAR )      AND'
      '-- JOIN PESSOA TITULAR COM ELEGPATRO'
      ' (PET.IDPESSOA      =   ELG.IDPESSOA  )      AND'
      '-- JOIN PESSOA TITULAR COM PESSOA FISICA TITULAR'
      ' (PET.IDPESSOA      =   PFT.IDPESSOA  )      AND'
      '-- JOIN PESSOA DEPENDENTE COM DEPENTIT'
      ' (PED.IDPESSOA     =    DPT.IDPESSOA  )      AND'
      '-- JOIN PESSOA DEPENDENTE COM PESSOA FISICA DEPEDENTE'
      ' (PED.IDPESSOA     =    PFD.IDPESSOA  )      AND'
      '-- JOIN ELEGIVEL COM PATROCINADORA'
      ' (ELG.IDPESSJUR    =    PAT.IDPESSOA  )      AND'
      '-- JOIN ELEGIVEL COM PARTICIPANTES'
      ' (ELG.IDPESSOA     =    PTP.IDPESSOA  )      AND'
      ' (ELG.IDPESSJUR    =    PTP.IDPESSJUR )      AND'
      '-- FILTRO PARTICIPANTES'
      ' (PTP.FLGDESATIVADO=    0             )'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 476
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsDep: TDataSource
    AutoEdit = False
    DataSet = qryDep
    Left = 476
    Top = 50
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = qryRec
    Left = 524
    Top = 50
  end
  object qryRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' DISTINCT'
      ' PR.IDPESSOA AS IDTITULAR,'
      ' PR.NOME     AS TITULAR,'
      
        ' DECODE(PF.ESTCIVIL,'#39'S'#39','#39'SOLTEIRO(A)'#39', '#39'C'#39','#39'CASADO(A)'#39', '#39'D'#39','#39'DIV' +
        'ORCIADO(A)'#39', '#39'E'#39','#39'DESQUITADO(A)'#39',  '#39'J'#39','#39'SEPARADO(A) JUDICIAL'#39', '#39 +
        'V'#39','#39'VIÚVO(A)'#39', '#39'O'#39','#39'OUTROS'#39') AS ESTCIVIL,'
      ' PR.NUMDOCUMENTO AS CPFTITULAR,'
      ' PF.DATANASC,'
      ' PF.SEXO,'
      ' PD.IDPESSOA  AS IDDEPENDENTE,'
      ' PD.NOME      AS DEPENDENTE,'
      ' TR.DESCRICAO AS TIPORECEBEDOR'
      'FROM'
      ' PESSOA           PR,   /* PESSOA RESPONSAVEL   */'
      ' PESSOA           PD,   /* PESSOA DEPENDENTE    */'
      ' PESSOAFISICA     PF,   /* PESSOA FISICA        */'
      ' RESPONSAVEL      RE,   /* RESPONSAVEL          */'
      ' BFCIARIOTITPLAN  BF,   /* BFCIARIOTITPLAN      */'
      ' TIPORECEBEDOR    TR    /* TIPO RECEBEDOR       */'
      'WHERE'
      '-- FILTRO RESPONSAVEL'
      ' (RE.IDRESPONSAVEL    =   :IDPESSOA        ) AND'
      '-- JOIN PESSOA RESPONSAVEL COM RESPONSAVEL'
      ' (PR.IDPESSOA         =   RE.IDRESPONSAVEL ) AND'
      '-- JOIN PESSOA FISICA COM PESSOA RESPONSAVEL'
      ' (PF.IDPESSOA         =   PR.IDPESSOA      ) AND'
      '-- JOIN BFCIARIOTITPLAN COM PESSOA DEPENDENTE'
      ' (BF.IDPESSOA         =   PD.IDPESSOA      ) AND'
      '-- JOIN BFCIARIOTITPLAN COM PESSOA RESPONSAVEL'
      ' (BF.IDRESPONSAVEL    =   PR.IDPESSOA      ) AND'
      '-- JOIN BFCIARIOTITPLAN COM BFCIARIOTITPLAN'
      ' (BF.IDTITULAR        =   BF.IDTITULAR     ) AND'
      ' (BF.IDPESSJUR        =   BF.IDPESSJUR     ) AND'
      ' (BF.IDPLANOPREV      =   BF.IDPLANOPREV   ) AND'
      ' (BF.IDBENEFICIO      =   BF.IDBENEFICIO   ) AND'
      ' (BF.SEQPROPOSTA      =   BF.SEQPROPOSTA   ) AND'
      '-- JOIN BFCIARIOTITPLAN COM TIPORECEBEDOR'
      ' (BF.CODTIPORECEBEDOR=TR.CODTIPORECEBEDOR(+))'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 524
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsBen: TDataSource
    AutoEdit = False
    DataSet = qryBen
    Left = 572
    Top = 50
  end
  object qryBen: TwwQuery
    AfterOpen = qryBenAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' PE.IDPESSOA,'
      ' PE.NOME AS BENEFICIARIO,'
      ' EL.MATRICULA AS MATRICULA_TITULAR,'
      ' DT.MATRICULA AS MATRICULA_DEPENDENTE,'
      ' DT.IDDEPENDENCIA,'
      ' PE.NUMDOCUMENTO AS CPFBENEF,'
      ' BE.NOME AS BENEFICIO,'
      ' BF.DATAINICIO,'
      ' BF.VALORATUAL,'
      ' PV.IDPESSOA AS IDTITULAR,'
      ' PV.IDPESSJUR,'
      ' PV.IDPLANOPREV'
      'FROM'
      ' PESSOA           PE,   /* PESSOA BENEFICIÁRIO    */'
      ' PESSOAFISICA     PF,   /* PESSOA FISICA          */'
      ' ELEGPATRO        EL,   /* ELEGIVEL               */'
      ' PARTPREVPLAN     PV,   /* PARTICIPANTES          */'
      ' BENEFBFCIARIO    BF,   /* BENEFICIÁRIO           */'
      ' BENEFICIO        BE,   /* BENEFICIO              */'
      ' DEPENTIT         DT    /* DEPENDENTES DO TITULAR */'
      'WHERE'
      '-- FILTRO PESSOA'
      ' (PE.IDPESSOA       =  :IDPESSOA         ) AND'
      '-- JOIN PESSOA FISICA COM PESSOA'
      ' (PF.IDPESSOA       =  PE.IDPESSOA       ) AND'
      '-- JOIN BENEFICIARIO COM PESSOA FISICA'
      ' (BF.IDPESSOA       =  PF.IDPESSOA       ) AND'
      '-- JOIN BENEFICIARIO COM ELEGIVEL'
      ' (BF.IDTITULAR      =  EL.IDPESSOA       ) AND'
      ' (BF.IDPESSJUR      =  EL.IDPESSJUR      ) AND'
      '-- JOIN BENEFICIARIO COM BENEFICIO'
      ' (BF.IDBENEFICIO    =  BE.IDBENEFICIO    ) AND'
      '-- FILTRO BENEFBFCIARIO'
      ' (BF.IDSITBENEFICIO = 1                  ) AND'
      '-- JOIN BENEFICIARIO COM BENEFICIARIO'
      ' (BF.IDSITBENEFICIO =  BF.IDSITBENEFICIO ) AND'
      '-- JOIN ELEGIVEL COM PARTICIPANTE'
      ' (EL.IDPESSOA       =  PV.IDPESSOA       ) AND'
      ' (EL.IDPESSJUR      =  PV.IDPESSJUR      ) AND'
      '-- FILTRO PARTICIPANTE'
      ' (PV.FLGDESATIVADO  =  0                 ) AND'
      '-- JOIN DEPENTIT COM PARTPREVPLAN'
      ' (DT.IDTITULAR      = PV.IDPESSOA        ) AND'
      '-- JOIN DEPENTIT COM PESSOA FISICA'
      ' (DT.IDPESSOA       = PE.IDPESSOA        ) AND'
      '-- JOIN DEPENTIT COM DEPENTIT'
      ' (DT.IDDEPENDENCIA  = DT.IDDEPENDENCIA   )'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 572
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBenpp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' PE.IDPESSOA,'
      ' PE.NOME AS BENEFICIARIO,'
      ' BF.MATRICULA,'
      ' PE.NUMDOCUMENTO AS CPFBENEF,'
      ' MA.NOME AS MANTENEDORA,'
      ' BE.NOME AS BENEFICIO,'
      ' BP.DATAINICIO,'
      ' BP.VALORATUAL'
      'FROM'
      ' PESSOA           PE,   /* PESSOA BENEFICIÁRIO  */'
      ' PESSOAFISICA     PF,   /* PESSOA FISICA        */'
      ' BENEFICIARIOPP   BF,   /* BENEFICIARIO PP      */'
      ' BENEFBFPP        BP,   /* BENEFICIO PP         */'
      ' BENEFICIO        BE,   /* BENEFICIO            */'
      ' MANTENEDORA      MA    /* MANTENEDORA          */'
      'WHERE'
      '-- FILTRO PESSOA'
      ' (PE.IDPESSOA         =  :IDPESSOA           ) AND'
      '-- JOIN PESSOA FISICA COM PESSOA'
      ' (PF.IDPESSOA         =  PE.IDPESSOA         ) AND'
      '-- JOIN BENEFICIARIO PP COM PESSOA FISICA'
      ' (BF.IDBENEFICIARIOPP =  PF.IDPESSOA         ) AND'
      '-- JOIN BENEFICIO PP COM BENEFICIARIO PP'
      ' (BP.IDBENEFICIARIOPP =  BF.IDBENEFICIARIOPP ) AND'
      '-- JOIN BENEFICIO PP COM BENEFICIO'
      ' (BP.IDBENEFICIO      =  BE.IDBENEFICIO      ) AND'
      '-- FILTRO BENEFICIO PP'
      ' (BP.IDSITBENEFICIO   = 1                    ) AND'
      '-- JOIN MANTENEDORA COM BENEFICIARIO PP'
      ' (MA.CODMANTENEDORA   =  BF.CODMANTENEDORA   )')
    ValidateWithMask = True
    Left = 620
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsBenpp: TDataSource
    AutoEdit = False
    DataSet = qryBenpp
    Left = 620
    Top = 50
  end
  object qryRes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ' PE.IDPESSOA,'
      ' PE.NOME,'
      
        ' DECODE(EL.MATRICULA, NULL, DT.MATRICULA, EL.MATRICULA) AS MATRI' +
        'CULA,'
      ' EL.IDPESSJUR,'
      ' PV.INSCRICAONUMERO,'
      ' PE.NUMDOCUMENTO'
      'FROM'
      ' PESSOA         PE,'
      ' ELEGPATRO      EL,'
      ' DEPENTIT       DT,'
      ' (SELECT IDPESSOA, INSCRICAONUMERO'
      '  FROM PARTPREVPLAN'
      '  WHERE FLGDESATIVADO = 0) PV'
      'WHERE'
      '-- FILTRO PESSOA'
      ' (PE.IDPESSOA       IN (49424)     )  AND'
      '-- JOIN PESSOA COM ELEGPATRO'
      ' (PE.IDPESSOA       =     EL.IDPESSOA(+))  AND'
      '-- JOIN  PESSOA COM PARTPREVPLAN'
      ' (PE.IDPESSOA       =     PV.IDPESSOA(+))  AND'
      '-- JOIN  DEPENTIT COM PESSOA'
      ' (DT.IDPESSOA       =     PE.IDPESSOA   )  AND'
      '-- JOIN  DEPENTIT COM DEPENTIT'
      ' (DT.IDTITULAR      =     DT.IDTITULAR  )  AND'
      ' (DT.IDDEPENDENCIA  =   DT.IDDEPENDENCIA)'
      ''
      '')
    ValidateWithMask = True
    Left = 380
    Top = 6
  end
  object dsRes: TDataSource
    AutoEdit = False
    DataSet = qryRes
    Left = 380
    Top = 50
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 426
    Top = 316
  end
  object qryPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EL.IDPESSJUR,'
      '       EL.IDPESSOA,'
      '       EL.MATRICULA,'
      '       P.NUMDOCUMENTO,'
      '       P.NOME,'
      '       PF.DATANASC,'
      '       PF.SEXO,'
      '       PAT.NOME AS PATROCINADORA,'
      '       DECODE(PL.NOME, NULL, '#39'<nenhum>'#39', PL.NOME) AS PLANO,'
      '       PP.INSCRICAONUMERO,'
      '       SF.DESCRICAO    AS SITUACAONAPATRO,'
      '       SPART.DESCRICAO AS SITUACAONAFUND,'
      '       SPLANO.DESCRICAO AS SITUACAONOPLANO'
      'FROM   PESSOA P,'
      '       PESSOA PAT,'
      '       PESSOAFISICA PF,'
      '       ELEGPATRO EL,'
      '       PARTPREVPLAN PP,'
      '       SITFUNC SF,'
      '       SITPART SPART,'
      '       SITPLANOPREV SPLANO,'
      '       PLANPREV PL'
      'WHERE  EL.IDPESSOA       = :IDPESSOA'
      'AND    P.IDPESSOA        = EL.IDPESSOA'
      'AND    PAT.IDPESSOA      = EL.IDPESSJUR'
      'AND    PF.IDPESSOA       = EL.IDPESSOA'
      'AND    SF.IDSITFUNC      = EL.IDSITFUNC'
      'AND    EL.IDPESSJUR      = PP.IDPESSJUR'
      'AND    EL.IDPESSOA       = PP.IDPESSOA'
      'AND    0                 = PP.FLGDESATIVADO'
      'AND    PP.IDSITPART      = SPART.IDSITPART'
      'AND    PP.IDSITPLANOPREV = SPLANO.IDSITPLANOPREV'
      'AND    PP.IDPLANOPREV    = PL.IDPLANOPREV'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 431
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
