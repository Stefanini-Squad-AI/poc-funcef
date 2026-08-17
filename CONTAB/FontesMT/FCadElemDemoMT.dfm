inherited frmCadElemDemoMT: TfrmCadElemDemoMT
  Left = 128
  Top = 121
  Caption = 'Cadastro de Elementos do Demonstrativo'
  ClientHeight = 468
  ClientWidth = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 650
    Height = 382
    inherited pnlMestre: TPanel
      Width = 648
      Height = 156
      object Label4: TLabel
        Left = 16
        Top = 8
        Width = 82
        Height = 13
        Caption = 'Demonstrativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFormaRecPag: TLabel
        Left = 16
        Top = 48
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label9: TLabel
        Left = 544
        Top = 48
        Width = 56
        Height = 13
        Caption = 'No. Linha'
      end
      object Label12: TLabel
        Left = 400
        Top = 48
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label8: TLabel
        Left = 225
        Top = 88
        Width = 65
        Height = 13
        Caption = 'Indentação'
      end
      object Label2: TLabel
        Left = 16
        Top = 88
        Width = 167
        Height = 13
        Caption = 'Tipo do Separador das linhas'
      end
      object dblkDemo: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 337
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DEMDESCDEMONSTRAT'#9'60'#9'Descrição')
        DataField = 'IDDEMONSTRATIVO'
        DataSource = ds
        LookupTable = CdsDemonstrativo
        LookupField = 'IDDEMONSTRATIVO'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkDemoCloseUp
        OnExit = dblkDemoExit
      end
      object rdgTipo: TDBRadioGroup
        Left = 368
        Top = 6
        Width = 257
        Height = 39
        Caption = 'Tipo'
        Columns = 3
        DataField = 'ELETIPOELEM'
        DataSource = ds
        Items.Strings = (
          'Conta'
          'Somatório'
          'Título')
        TabOrder = 1
        Values.Strings = (
          'C'
          'S'
          'T')
        OnChange = rdgTipoChange
        OnClick = rdgTipoClick
      end
      object dbeDesc: TDBEdit
        Left = 16
        Top = 64
        Width = 369
        Height = 21
        DataField = 'ELEDESCELEM'
        DataSource = ds
        TabOrder = 2
      end
      object dbeCodigo: TDBEdit
        Left = 400
        Top = 64
        Width = 129
        Height = 21
        DataField = 'ELECODIGO'
        DataSource = ds
        TabOrder = 3
      end
      object dbrLinha: TDBRealEdit
        Left = 544
        Top = 64
        Width = 81
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        ReadOnly = True
        TabOrder = 4
        WordWrap = False
        IntDigits = 11
        DecDigits = 0
        NumberFormat = fFixed
        Signal = False
        DataField = 'ELEORDEMLINHA'
        DataSource = ds
      end
      object gbAnaVert: TGroupBox
        Left = 332
        Top = 88
        Width = 303
        Height = 65
        Caption = ' Elementos do Demonstrativo para Análise Vertical '
        TabOrder = 5
        object Label10: TLabel
          Left = 9
          Top = 16
          Width = 62
          Height = 13
          Caption = 'Percentual'
        end
        object Label13: TLabel
          Left = 156
          Top = 16
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object dblkDemo100: TwwDBLookupCombo
          Left = 9
          Top = 30
          Width = 137
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ELEDESCELEM'#9'60'#9'Descrição')
          DataField = 'IDELEMANAVERTICAL'
          DataSource = ds
          LookupTable = CdsPercentual
          LookupField = 'IDELEMDEMONSTRAT'
          Style = csDropDownList
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkDemo1001: TwwDBLookupCombo
          Left = 156
          Top = 30
          Width = 137
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ELEDESCELEM'#9'60'#9'Descrição')
          DataField = 'IDELEMANAVERT1'
          DataSource = ds
          LookupTable = CdsValor
          LookupField = 'IDELEMDEMONSTRAT'
          Style = csDropDownList
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object dbcbIndentacao: TwwDBComboBox
        Left = 225
        Top = 104
        Width = 97
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'FLGINDENTACAO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Nível 1'#9'1'
          '..Nível 2'#9'2'
          '....Nível 3'#9'3'
          '......Nível 4'#9'4'
          '........Nível 5'#9'5')
        Sorted = False
        TabOrder = 6
        UnboundDataType = wwDefault
      end
      object dbcbSeparador: TwwDBComboBox
        Left = 16
        Top = 104
        Width = 201
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'FLGTIPOLINHA'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Com espaçamento entre as linhas'#9'E'
          'Desenha uma linha Fina'#9'F'
          'Desenha uma linha Grossa'#9'G'
          'Desenha uma linha Dupla'#9'D'
          'Sem espaçamento entre as linhas'#9'N'
          'Não imprime a linha com os valores'#9'X')
        Sorted = False
        TabOrder = 7
        UnboundDataType = wwDefault
      end
      object dbckAcumulado: TDBCheckBox
        Left = 16
        Top = 130
        Width = 305
        Height = 17
        Caption = 'Imprime sempre o Valor Acumulado'
        DataField = 'FLGACUMULADO'
        DataSource = ds
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 157
      Width = 648
      Height = 224
      Tabs.Strings = (
        'Conta'
        'Somatório'
        'Configuração')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdSomatorio'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 550
        Height = 165
        inherited tbsDet: TTabSheet
          Caption = 'Conta'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 542
            Height = 137
            Selected.Strings = (
              'PLACONTA'#9'18'#9'Conta Contábil'#9'F'
              'CODSUBCONTA'#9'10'#9'Sub-Conta'#9'F'
              'CODCENTROCUSTO'#9'10'#9'Centro de Custo'#9'F'
              'UNIDNEGOC'#9'10'#9'Ativ./Projeto'#9'F')
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 542
            Height = 137
            object Label5: TLabel
              Left = 225
              Top = 3
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label7: TLabel
              Left = 225
              Top = 50
              Width = 100
              Height = 13
              Caption = 'Atividade/Projeto'
            end
            object Label6: TLabel
              Left = 10
              Top = 55
              Width = 60
              Height = 13
              Caption = 'Sub-Conta'
            end
            object mskAtivProj: TMaskEdit
              Left = 225
              Top = 64
              Width = 177
              Height = 21
              TabOrder = 0
              OnExit = mskAtivProjExit
            end
            object btnAtivProj: TBitBtn
              Left = 401
              Top = 63
              Width = 25
              Height = 21
              TabOrder = 1
              OnClick = btnAtivProjClick
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
              NumGlyphs = 2
            end
            object mskSubConta: TMaskEdit
              Left = 9
              Top = 68
              Width = 177
              Height = 21
              TabOrder = 2
              OnExit = mskSubContaExit
            end
            object btnSubConta: TBitBtn
              Left = 186
              Top = 68
              Width = 25
              Height = 21
              TabOrder = 3
              OnClick = btnSubContaClick
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
              NumGlyphs = 2
            end
            object cmpConta: TCMProcuraMaskContabil
              Left = 8
              Top = 3
              Width = 200
              Height = 48
              Caption = 'Conta'
              TabOrder = 4
              OnExit = cmpContaExit
              MostraMensagens = True
              MostraDescricao = False
              DataSource = dsDet
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scAmbas
            end
            object dblkCCusto: TwwDBLookupCombo
              Left = 225
              Top = 17
              Width = 201
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = CdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines]
              DropDownCount = 5
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object mskUnidNegoc: TMaskEdit
              Left = 256
              Top = 64
              Width = 17
              Height = 21
              Color = clAqua
              TabOrder = 6
              Visible = False
            end
            object pnlPlanoPatroC: TPanel
              Left = 2
              Top = 90
              Width = 487
              Height = 40
              BevelOuter = bvNone
              TabOrder = 7
              object lblPlanoPrevC: TLabel
                Left = 8
                Top = 0
                Width = 33
                Height = 13
                Caption = 'Plano'
              end
              object lblPatroC: TLabel
                Left = 223
                Top = 0
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object dblcPlanoPrevC: TwwDBLookupCombo
                Left = 8
                Top = 16
                Width = 201
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Nome')
                DataField = 'IDPLANOPREV'
                DataSource = dsDet
                LookupTable = CdsPlanoPrev
                LookupField = 'IDPLANOPREV'
                Options = [loColLines]
                DropDownCount = 5
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dblcPatroC: TwwDBLookupCombo
                Left = 223
                Top = 16
                Width = 201
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Nome')
                DataField = 'IDPATRO'
                DataSource = dsDet
                LookupTable = CdsPatro
                LookupField = 'IDPESSOA'
                Options = [loColLines]
                DropDownCount = 5
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
          end
        end
        object tbsSomatorio: TTabSheet
          Caption = 'Somatório'
          ImageIndex = 1
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 542
            Height = 137
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 72
              Top = 8
              Width = 156
              Height = 13
              Caption = 'Elemento do Demonstrativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object sbtMais: TSpeedButton
              Left = 360
              Top = 23
              Width = 25
              Height = 22
              GroupIndex = 1
              Down = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76020000424D7602000000000000760000002800000040000000100000000100
                0400000000000002000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888888888877778
                88888888888FFFF8888888888887777888888888888777788888888888000078
                88888888887777F88888888888000078888888888800007888888888880FF078
                88888888887F87F888888888880FF07888888888880CC07888888888880FF078
                88888888887F87F888888888880FF07888888888880CC07888888887770FF077
                7778888FFF7F87FFFFF88887770FF07777788887770CC07777788800000FF000
                007888777778877777F88800000FF00000788800000CC0000078880FFFFFFFFF
                F078887F8888888887F8880FFFFFFFFFF078880CCCCCCCCCC078880FFFFFFFFF
                F078887FFFFF88FFF7F8880FFFFFFFFFF078880CCCCCCCCCC0788800000FF000
                00888877777F877777888800000FF00000888800000CC00000888888880FF078
                88888888887F87F888888888880FF07888888888880CC07888888888880FF078
                88888888887F87F888888888880FF07888888888880CC07888888888880FF078
                88888888887FF7F888888888880FF07888888888880CC0788888888888000088
                8888888888777788888888888800008888888888880000888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888}
              NumGlyphs = 4
              ParentFont = False
            end
            object Label11: TLabel
              Left = 360
              Top = 7
              Width = 56
              Height = 13
              Caption = 'Operação'
            end
            object sbtMenos: TSpeedButton
              Left = 384
              Top = 23
              Width = 25
              Height = 23
              GroupIndex = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76020000424D7602000000000000760000002800000040000000100000000100
                0400000000000002000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888777777777
                7778888FFFFFFFFFFFF888877777777777788887777777777778880000000000
                007888777777777777F888000000000000788800000000000078880FFFFFFFFF
                F078887F8888888887F8880FFFFFFFFFF078880CCCCCCCCCC078880FFFFFFFFF
                F078887FFFFFFFFFF7F8880FFFFFFFFFF078880CCCCCCCCCC078880000000000
                0088887777777777778888000000000000888800000000000088888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888}
              NumGlyphs = 4
              ParentFont = False
            end
            object sbtVezes: TSpeedButton
              Left = 408
              Top = 23
              Width = 25
              Height = 23
              GroupIndex = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76020000424D7602000000000000760000002800000040000000100000000100
                0400000000000002000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                888888888F88888F888888888888888888888888888888888888888707888807
                8888888878F88878F888888707888807888888870788880788888870F07880F0
                78888887878F87878F888870F07880F078888870C07880C07888880FFF070FFF
                07888878F87878887888880FFF070FFF0788880CCC070CCC07888880FFF0FFF0
                788888878F87888788888880FFF0FFF078888880CCC0CCC0788888880FFFFF07
                8888888878F88878888888880FFFFF07888888880CCCCC078888888880FFF078
                888888888788878F8888888880FFF0788888888880CCC078888888880FFFFF07
                888888887888F878F88888880FFFFF07888888880CCCCC0788888880FFF0FFF0
                7888888788878F878F888880FFF0FFF078888880CCC0CCC07888880FFF080FFF
                08888878F87878F87888880FFF080FFF0888880CCC080CCC08888880F08880F0
                888888878788878788888880F08880F088888880C08880C08888888808888808
                8888888878888878888888880888880888888888088888088888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888}
              NumGlyphs = 4
              ParentFont = False
            end
            object sbtDiv: TSpeedButton
              Left = 432
              Top = 23
              Width = 25
              Height = 23
              GroupIndex = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76020000424D7602000000000000760000002800000040000000100000000100
                0400000000000002000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888887788
                888888888888FF88888888888888778888888888888877888888888888800778
                88888888888778F88888888888800778888888888880077888888888880FF078
                88888888887F87F888888888880FF07888888888880CC07888888888880FF088
                888888888878F78888888888880FF08888888888880CC0888888888888800888
                8888888888877888888888888880088888888888888008888888888777777777
                7778888FFFFFFFFFFFF888877777777777788887777777777778880000000000
                007888777777777777F888000000000000788800000000000078880FFFFFFFFF
                F078887F8888888887F8880FFFFFFFFFF078880CCCCCCCCCC078880FFFFFFFFF
                F078887FFFFFFFFFF7F8880FFFFFFFFFF078880CCCCCCCCCC078880000000000
                0088887777777777778888000000000000888800000000000088888888887788
                888888888888FF88888888888888778888888888888877888888888888800778
                88888888888778F88888888888800778888888888880077888888888880FF078
                88888888887F87F888888888880FF07888888888880CC07888888888880FF088
                888888888878F78888888888880FF08888888888880CC0888888888888800888
                8888888888877888888888888880088888888888888008888888888888888888
                8888888888888888888888888888888888888888888888888888}
              NumGlyphs = 4
              ParentFont = False
            end
            object sbtPercent: TSpeedButton
              Left = 456
              Top = 23
              Width = 25
              Height = 23
              GroupIndex = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76020000424D7602000000000000760000002800000040000000100000000100
                0400000000000002000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888887
                788888888F88888FF88888888888888778888888888888877888888707888800
                7788888878F888778F88888707888800778888870788880077888870F07880FF
                07888887878F87F87F888870F07880FF07888870C07880CC0788880FFF0780FF
                08888878F878F78F7888880FFF0780FF0888880CCC0780CC08888880FFF08800
                888888878F878F7788888880FFF0880088888880CCC08800888888880FFF0888
                8888888878F878F8888888880FFF0888888888880CCC08888888888880FFF078
                88888888878F878F8888888880FFF0788888888880CCC07888888888780FFF07
                88888888FF78F878F8888888780FFF0788888888780CCC07888888800780FFF0
                7888888778F78F878F8888800780FFF0788888800780CCC07888880FF0780FFF
                0888887F87F878F87888880FF0780FFF0888880CC0780CCC0888880FF08880F0
                88888878F78887878888880FF08880F08888880CC08880C08888888008888808
                8888888778888878888888800888880888888880088888088888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888}
              NumGlyphs = 4
              ParentFont = False
            end
            object Label14: TLabel
              Left = 72
              Top = 48
              Width = 54
              Height = 13
              Caption = 'Condição'
            end
            object Label15: TLabel
              Left = 296
              Top = 48
              Width = 83
              Height = 13
              Caption = 'Tipo Condição'
              Visible = False
            end
            object Label16: TLabel
              Left = 72
              Top = 88
              Width = 231
              Height = 13
              Caption = 'Elemento do Demonstrativo da Condição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label17: TLabel
              Left = 160
              Top = 48
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dblkElemDet: TwwDBLookupCombo
              Left = 72
              Top = 24
              Width = 273
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'ELEDESCELEM'#9'60'#9'Descrição')
              DataField = 'ELEMENTODEM'
              DataSource = dsDetSomatorio
              LookupTable = CdsDemoSoma
              LookupField = 'IDELEMDEMONSTRAT'
              Style = csDropDownList
              DropDownWidth = 8
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbcboCondicao: TwwDBComboBox
              Left = 72
              Top = 64
              Width = 73
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = False
              DataField = 'ELECONDICAO'
              DataSource = dsDetSomatorio
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                '<='
                '<'
                '='
                '>'
                '>='
                '<>')
              Sorted = False
              TabOrder = 1
              UnboundDataType = wwDefault
              OnCloseUp = dbcboCondicaoCloseUp
            end
            object dbcboTipo: TwwDBComboBox
              Left = 296
              Top = 64
              Width = 185
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Valor'#9'V'
                'Elemento'#9'E')
              Sorted = False
              TabOrder = 2
              UnboundDataType = wwDefault
              Visible = False
              OnCloseUp = dbcboTipoCloseUp
            end
            object dblkElementoCondicao: TwwDBLookupCombo
              Left = 72
              Top = 104
              Width = 409
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'ELEDESCELEM'#9'60'#9'Descrição')
              LookupTable = CdsDemoCond
              LookupField = 'IDELEMDEMONSTRAT'
              Style = csDropDownList
              DropDownWidth = 8
              Enabled = False
              ParentFont = False
              TabOrder = 4
              Visible = False
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbrValor: TDBRealEdit
              Left = 160
              Top = 64
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'ELEVALORCOND'
              DataSource = dsDetSomatorio
            end
          end
          object dbgrdSomatorio: TwwDBGrid
            Left = 0
            Top = 0
            Width = 542
            Height = 137
            Selected.Strings = (
              'ELEDESCELEM'#9'31'#9'Elementos'
              'Operacao'#9'10'#9'Operação'
              'Condicao'#9'100'#9'Condição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDetSomatorio
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
            IndicatorColor = icBlack
          end
        end
        object tbsConfiguracao: TTabSheet
          Caption = 'Configuração'
          ImageIndex = 2
          object Label3: TLabel
            Left = 16
            Top = 88
            Width = 101
            Height = 13
            Caption = 'Posição do Traço'
          end
          object dbrgTipoNegativo: TDBRadioGroup
            Left = 16
            Top = 17
            Width = 201
            Height = 64
            Caption = 'Tipo de Negativo'
            DataField = 'FLGTIPONEGATIVO'
            DataSource = ds
            Items.Strings = (
              'Com Sinal de &Menos'
              'Com &Parentese'
              '&Sem Negativo')
            TabOrder = 0
            Values.Strings = (
              'M'
              'P'
              'N')
          end
          object dbrgNatureza: TDBRadioGroup
            Left = 226
            Top = 17
            Width = 127
            Height = 64
            Caption = 'Natureza da Linha'
            DataField = 'FLGNATUREZA'
            DataSource = ds
            Items.Strings = (
              '&Devedora'
              '&Credora')
            TabOrder = 1
            Values.Strings = (
              'D'
              'C')
          end
          object dbckLinhaMonetaria: TDBCheckBox
            Left = 368
            Top = 20
            Width = 129
            Height = 17
            Caption = 'Linha Monetária'
            DataField = 'FLGMONETARIA'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbckSaltaPagina: TDBCheckBox
            Left = 368
            Top = 44
            Width = 129
            Height = 17
            Caption = 'Salta Página'
            DataField = 'FLGSALTAPAGINA'
            DataSource = ds
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbckNegrito: TDBCheckBox
            Left = 368
            Top = 67
            Width = 129
            Height = 17
            Caption = 'Negrito'
            DataField = 'FLGNEGRITO'
            DataSource = ds
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbckDecimais: TDBCheckBox
            Left = 367
            Top = 91
            Width = 129
            Height = 17
            Caption = 'Imprime Decimais'
            DataField = 'FLGDECIMAIS'
            DataSource = ds
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dblcTraco: TwwDBComboBox
            Left = 16
            Top = 104
            Width = 337
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'FLGTRACO'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Traço Acima do Valor'#9'VA'
              'Traço Acima da Descrição'#9'TA'
              'Traço Acima Completo'#9'CA'
              'Traço Abaixo do Valor'#9'VS'
              'Traço Abaixo da Descrição'#9'TS'
              'Traço Abaixo Completo'#9'CS')
            Sorted = False
            TabOrder = 6
            UnboundDataType = wwDefault
          end
        end
      end
      inherited Dock973: TDock97
        Width = 640
      end
      inherited Dock974: TDock97
        Left = 554
        Height = 165
        inherited tb97Detalhe: TToolbar97
          inherited bbtnCancelarDet: TBitBtn
            Tag = 999
          end
          inherited bbtnVoltarDet: TBitBtn
            Tag = 999
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 650
    inherited Toolbar971: TToolbar97
      object sbtnCopiar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Copiar'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555500000055557000000005555500000055557BBBBBBB0555550000005555
          7777777705555500000055555555555555CC55000000555555555555555CC500
          00005700000000005555CC00000057BFB7BF7FB055C5CC00000057FBF7FB7BF0
          5CC5CC00000057BFB7BF7FB7CCCCCC00000057FBF7FB7BFCCCCCC500000057BF
          B7BF7FB7CCCC5500000057FBF7FB7BF05CC55500000057777777777055C55500
          0000555555555555555555000000555555555555555555000000}
        ImageIndex = 3
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnCopiarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 429
    Width = 650
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        Tag = 999
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 58
    Top = 431
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 302
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 8
    Top = 431
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 360
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 492
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ELEMDEMONSTRATIVO.ELEDESCELEM'
      'DEMONSTRATIVO.DEMDESCDEMONSTRAT'
      'ELEMDEMONSTRATIVO.ELEORDEMLINHA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Descrição'
      'Demonstrativo'
      'Ordem de Impressão')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ELEMDEMONSTRATIVO'
      'DEMONSTRATIVO')
    CamposChave.Strings = (
      'ELEMDEMONSTRATIVO.IDELEMDEMONSTRAT')
    Filtro.Strings = (
      
        'ELEMDEMONSTRATIVO.IDDEMONSTRATIVO = DEMONSTRATIVO.IDDEMONSTRATIV' +
        'O')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '10')
    Left = 432
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 316
    Top = 218
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDetConta
    Left = 366
    Top = 226
  end
  object MontaSelectSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome da Sub-Conta')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 496
    Top = 336
  end
  object MontaSelectAtivProj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.IDPESSOA'
      'UNIDNEGOCIO.UNECODIGO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '25')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 496
    Top = 376
  end
  object CdsDemonstrativo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 63
  end
  object CdsPercentual: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 373
    Top = 172
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 368
  end
  object CdsValor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 537
    Top = 172
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 125
    Top = 383
  end
  object dsDetSomatorio: TwwDataSource
    DataSet = CdsDetSomatorio
    Left = 469
    Top = 287
  end
  object CdsDetSomatorio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 255
  end
  object CdsDetConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 250
    Top = 225
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 261
    Top = 391
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 336
  end
  object CdsDemoSoma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 157
    Top = 224
  end
  object CdsDemoCond: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 375
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 197
    Top = 391
  end
end
