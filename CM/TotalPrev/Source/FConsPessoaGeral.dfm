inherited frmConsPessoaGeral: TfrmConsPessoaGeral
  Left = 199
  Top = 183
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta Geral de Pessoas'
  ClientHeight = 388
  ClientWidth = 745
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 745
    Height = 355
    object pgctrlBusca: TPageControl
      Left = 1
      Top = 1
      Width = 743
      Height = 353
      ActivePage = tbsBusca
      Align = alClient
      TabOrder = 0
      OnChange = pgctrlBuscaChange
      object tbsBusca: TTabSheet
        Caption = 'Dados para Consulta'
        object pnlInscricao: TPanel
          Left = 0
          Top = 33
          Width = 735
          Height = 33
          Align = alTop
          TabOrder = 1
          object Label5: TLabel
            Left = 20
            Top = 10
            Width = 77
            Height = 13
            Caption = 'Inscrição No.'
          end
          object cmbInscricao: TComboBox
            Left = 125
            Top = 6
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
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlNome: TPanel
          Left = 0
          Top = 66
          Width = 735
          Height = 33
          Align = alTop
          TabOrder = 2
          object Label2: TLabel
            Left = 20
            Top = 10
            Width = 33
            Height = 13
            Caption = 'Nome'
          end
          object cmbNome: TComboBox
            Left = 125
            Top = 6
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
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlCPF: TPanel
          Left = 0
          Top = 99
          Width = 735
          Height = 33
          Align = alTop
          TabOrder = 3
          object Label3: TLabel
            Left = 20
            Top = 10
            Width = 24
            Height = 13
            Caption = 'CPF'
          end
          object cmbCPF: TComboBox
            Left = 125
            Top = 6
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
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlSitFund: TPanel
          Left = 0
          Top = 198
          Width = 735
          Height = 33
          Align = alTop
          TabOrder = 6
          object Label4: TLabel
            Left = 20
            Top = 10
            Width = 56
            Height = 13
            Caption = 'Sit. Plano'
          end
          object CmbSitPlano: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object EdSitPlano: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlPlano: TPanel
          Left = 0
          Top = 132
          Width = 735
          Height = 33
          Align = alTop
          TabOrder = 4
          object Label6: TLabel
            Left = 20
            Top = 10
            Width = 33
            Height = 13
            Caption = 'Plano'
          end
          object CmbPlano: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edPlano: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlPatro: TPanel
          Left = 0
          Top = 165
          Width = 735
          Height = 33
          Align = alTop
          TabOrder = 5
          object Label7: TLabel
            Left = 20
            Top = 10
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object CmbPatro: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object EdPatro: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlSitPlano: TPanel
          Left = 0
          Top = 264
          Width = 735
          Height = 33
          Align = alTop
          TabOrder = 7
          object Label8: TLabel
            Left = 20
            Top = 10
            Width = 80
            Height = 13
            Caption = 'Sit. Fundação'
          end
          object CmbSitFund: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object EdSitFund: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlMatricula: TPanel
          Left = 0
          Top = 0
          Width = 735
          Height = 33
          Align = alTop
          TabOrder = 0
          object Label9: TLabel
            Left = 20
            Top = 10
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object cmbMatricula: TComboBox
            Left = 125
            Top = 6
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
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlSitPatro: TPanel
          Left = 0
          Top = 231
          Width = 735
          Height = 33
          Align = alTop
          TabOrder = 8
          object Label1: TLabel
            Left = 20
            Top = 10
            Width = 54
            Height = 13
            Caption = 'Sit. Patro'
          end
          object cmbSitPatro: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edSitPatro: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object chkPlanoAtivo: TCheckBox
          Left = 20
          Top = 304
          Width = 205
          Height = 17
          Caption = 'Mostrar apenas no Plano ATIVO'
          TabOrder = 9
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado da Pesquisa'
        ImageIndex = 1
        object dbgResultado: TwwDBGrid
          Left = 0
          Top = 0
          Width = 735
          Height = 325
          Selected.Strings = (
            'PATRO'#9'19'#9'Patrocinadora'
            'SITPATRO'#9'15'#9'Situação'
            'MATRICULA'#9'13'#9'Matrícula'
            'CLASSIFICACAO'#9'11'#9'Identificação'
            'NOME'#9'40'#9'Nome'
            'NUMDOCUMENTO'#9'18'#9'CPF'
            'INSCRICAONUMERO'#9'10'#9'Inscrição'
            'IDSITPART'#9'10'#9'IDSITPART'
            'DESCRICAO'#9'60'#9'DESCRICAO'
            'EMAIL'#9'100'#9'EMAIL'
            'PLANO'#9'50'#9'PLANO'
            'IDPLANOPREV'#9'10'#9'IDPLANOPREV'
            'SEQPROPOSTA'#9'10'#9'SEQPROPOSTA')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          OnTitleButtonClick = dbgResultadoTitleButtonClick
          OnDblClick = dbgResultadoDblClick
          OnKeyDown = dbgResultadoKeyDown
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 355
    Width = 745
    Height = 33
    inherited tb97Fundo: TToolbar97
      Left = 322
      DockPos = 322
      inherited sep1: TToolbarSep97
        Left = 249
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 166
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [3]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 168
        Height = 27
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 251
        Height = 27
      end
      object bbtnBusca: TBitBtn
        Left = 85
        Top = 0
        Width = 81
        Height = 27
        Caption = '&Busca'
        Default = True
        TabOrder = 2
        OnClick = bbtnBuscaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        NumGlyphs = 2
      end
      object bbtnParticipante: TBitBtn
        Left = 2
        Top = 0
        Width = 81
        Height = 27
        Caption = '&OK'
        Enabled = False
        TabOrder = 3
        OnClick = bbtnElegivelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 64
    Top = 517
  end
end
