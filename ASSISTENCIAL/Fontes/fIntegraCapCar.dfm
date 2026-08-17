inherited frmIntegraCAPCAR: TfrmIntegraCAPCAR
  Left = 0
  Top = 38
  Caption = 'Integração com BackOffice'
  ClientHeight = 522
  ClientWidth = 800
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 483
    object pnlLeft: TPanel
      Left = 1
      Top = 1
      Width = 293
      Height = 481
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object redGeral: TRichEdit
        Left = 0
        Top = 0
        Width = 293
        Height = 481
        Align = alClient
        Enabled = False
        Lines.Strings = (
          'Esta tela destina-se a parametrização da'
          'Integração Contábil/Financeira'
          'dos Sistemas de Administração'
          'Previdenciária e da Folha de Benefícios, '
          'contemplando a interface com as '
          'Patrocinadoras.'
          ''
          'As orelhas apresentadas variam de acordo '
          'com o ítem escolhido na árvore de ítens.'
          'São seguintes as orelhas possíveis:'
          '  . Informações Globais: parâmetros '
          'genéricos necessários para a integração'
          'contábil e financeira (CAP/CAR)'
          ''
          '  . Contabilidade: indicação das contas'
          'contábeis e dos centros de custos (qdo'
          'obrigatórios)'
          ''
          '  . Contas a Pagar: indicação dos parâmetros'
          'necessários para criação de um Contas a '
          'Pagar.'
          ''
          '  . Contas a Receber: indicação dos parâmetros'
          'necessários para criação de um Contas a '
          'Pagar.'
          ''
          '  . IRRF: indicação do favorecido do recolhimento'
          'do IRRF.'
          ''
          '  . Atualização: parametrização contábil para'
          'as correções das reservas.'
          ''
          '  . Provisão: parametrização contábil para as '
          'provisões das reservas.'
          ''
          '  . Devolução: indicação dos parâmetros '
          'necessários para criação de um Contas a '
          'Pagar ou a Receber quando de uma devolução.')
        ReadOnly = True
        TabOrder = 3
      end
      object redPatro: TRichEdit
        Left = 0
        Top = 0
        Width = 293
        Height = 481
        Align = alClient
        Enabled = False
        Lines.Strings = (
          'Patrocinadora'
          '  Informações Globais'
          '  . Grupo de Lançamentos : utilizado no registro '
          '   contábil do Contas a Receber das '
          '   contribuições relativas a Patrocinadora e dos '
          '   Participantes'
          ''
          '  . Atividade/Projeto: utilizado tanto no registro'
          '   contábil quanto no rateio do documento '
          '   gerado no Contas a Receber'
          ''
          '  . Contas Caixas x Forma de Recebimento:'
          '    indica o padrão a ser utilizado como '
          '    forma de recebimento no Contas a Receber'
          '    relativo a Patrocinadora.(opcional)'
          ''
          '  . Centro de Responsabilidade: utilizado para'
          '    o rateio do documento criado no Contas a'
          '    Receber relativo a Patrocinadora.'
          ''
          '  Contabilidade'
          '  . Conta de Líquido da Folha de Benefício: '
          '    conta para criação do Contas a Pagar com'
          '    o líquido da Folha de Benefício.')
        ReadOnly = True
        TabOrder = 1
      end
      object trvGrupos: TTreeView
        Left = 0
        Top = 0
        Width = 293
        Height = 481
        Align = alClient
        Images = imGrupos
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnChange = trvGruposChange
        OnCollapsing = trvGruposCollapsing
        OnExpanding = trvGruposExpanding
        OnExpanded = trvGruposExpanded
      end
      object anMudaGrupos: TAnimate
        Left = 75
        Top = 128
        Width = 151
        Height = 140
        Active = False
        AutoSize = False
        Color = clSilver
        CommonAVI = aviFindFolder
        ParentColor = False
        StopFrame = 29
        Visible = False
      end
    end
    object pnlRight: TPanel
      Left = 297
      Top = 5
      Width = 480
      Height = 434
      BevelOuter = bvNone
      TabOrder = 1
      object pnlDirTopo: TPanel
        Left = 0
        Top = 0
        Width = 480
        Height = 97
        Align = alTop
        TabOrder = 1
        object lblPatro: TLabel
          Left = 11
          Top = 43
          Width = 326
          Height = 16
          AutoSize = False
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPlano: TLabel
          Left = 11
          Top = 26
          Width = 365
          Height = 16
          AutoSize = False
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblOpcao: TLabel
          Left = 11
          Top = 78
          Width = 38
          Height = 13
          Caption = 'Opção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblParticipante: TLabel
          Left = 11
          Top = 61
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
        object stxtTitulo: TStaticText
          Left = 11
          Top = 3
          Width = 100
          Height = 20
          Caption = 'Integração de'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object bbtnProcurar: TBitBtn
          Left = 343
          Top = 46
          Width = 88
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
          TabOrder = 1
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
      end
      object pgctrlIntegracao: TPageControl
        Left = 0
        Top = 97
        Width = 480
        Height = 337
        ActivePage = tbsOutros
        Align = alClient
        TabOrder = 0
        object tbsOutros: TTabSheet
          Caption = 'Informações Globais'
          object pnlFundoOutros: TPanel
            Left = 0
            Top = 0
            Width = 472
            Height = 309
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object pnlGlobCAPCAR: TPanel
              Left = 6
              Top = 36
              Width = 400
              Height = 157
              BevelOuter = bvLowered
              TabOrder = 0
              object lbAtividade: TLabel
                Left = 7
                Top = 8
                Width = 108
                Height = 13
                Caption = 'Atividade / Projeto'
              end
              object lblFormaRecPag: TLabel
                Left = 7
                Top = 53
                Width = 220
                Height = 13
                Caption = 'Contas/Caixas x Forma de Pagamento '
              end
              object lblcentrespon: TLabel
                Left = 8
                Top = 102
                Width = 160
                Height = 13
                Caption = 'Centro de Responsabilidade'
              end
              object lkcmbDescAtividade: TwwDBLookupCombo
                Left = 7
                Top = 23
                Width = 381
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'25'#9'Descrição')
                LookupTable = dtmIntegraCAPCAR.qryAtividade
                LookupField = 'UNIDNEGOC'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object dblkpcmbPortForma: TwwDBLookupCombo
                Left = 7
                Top = 69
                Width = 381
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Descrição')
                LookupTable = dtmIntegraCAPCAR.qryformapag
                LookupField = 'CODPORTFORMA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object cmbcentrespon: TwwDBLookupCombo
                Left = 7
                Top = 119
                Width = 381
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Centro de Responsabilidade')
                LookupTable = dtmIntegraCAPCAR.qrycentrespon
                LookupField = 'CODCENTRORESPON'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
            object StaticText1: TStaticText
              Left = 6
              Top = 6
              Width = 211
              Height = 24
              Caption = 'Contas a Pagar / Receber'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 1
            end
            object StaticText2: TStaticText
              Left = 8
              Top = 195
              Width = 114
              Height = 24
              Caption = 'Contabilidade'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 2
            end
            object Panel1: TPanel
              Left = 6
              Top = 225
              Width = 400
              Height = 64
              BevelOuter = bvLowered
              Caption = 'Panel1'
              TabOrder = 3
              object Label43: TLabel
                Left = 8
                Top = 5
                Width = 55
                Height = 13
                Caption = 'Subconta'
              end
              object dblkSubconta: TwwDBLookupCombo
                Left = 8
                Top = 20
                Width = 381
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMESUBCONTA'#9'60'#9'Descrição')
                LookupTable = dtmIntegraCAPCAR.qrySubConta
                LookupField = 'CODSUBCONTA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
          end
        end
        object tbsContab: TTabSheet
          Caption = 'Contabilidade'
          object pnlFundoContab: TPanel
            Left = 0
            Top = 0
            Width = 472
            Height = 309
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object grpDebContab: TGroupBox
              Left = 1
              Top = 6
              Width = 470
              Height = 177
              Align = alBottom
              Caption = 'Conta Contábil para Débito'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object spdContaDebito1: TSpeedButton
                Left = 136
                Top = 31
                Width = 20
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                  33333333373F33333333333330B03333333333337F7F33333333333330F03333
                  333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                  333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                  333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                  3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                  33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                  33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                  03333337777777F7F33333330000000003333337777777773333}
                NumGlyphs = 2
                ParentFont = False
                OnClick = spdContaDebito1Click
              end
              object Label2: TLabel
                Left = 12
                Top = 18
                Width = 83
                Height = 13
                Caption = 'Participante Ativo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label3: TLabel
                Left = 12
                Top = 114
                Width = 76
                Height = 13
                Caption = 'Centro de Custo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label4: TLabel
                Left = 12
                Top = 66
                Width = 141
                Height = 13
                Caption = 'Participante Auto Patrocinado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object spdContaDebito2: TSpeedButton
                Left = 136
                Top = 81
                Width = 20
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                  33333333373F33333333333330B03333333333337F7F33333333333330F03333
                  333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                  333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                  333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                  3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                  33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                  33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                  03333337777777F7F33333330000000003333337777777773333}
                NumGlyphs = 2
                ParentFont = False
                OnClick = spdContaDebito2Click
              end
              object edContaDebito1: TMaskEdit
                Left = 12
                Top = 31
                Width = 123
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnExit = edContaDebito1Exit
              end
              object cmbCCusto: TwwDBLookupCombo
                Left = 12
                Top = 127
                Width = 145
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO'
                  'NOME'#9'30'#9'NOME')
                LookupTable = dtmIntegraCAPCAR.qryCCusto
                LookupField = 'NOME'
                Enabled = False
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = cmbCCustoCloseUp
              end
              object GroupBox4: TGroupBox
                Left = 162
                Top = 24
                Width = 277
                Height = 31
                Caption = 'Descrição da Conta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                object lbDescContaDebito1: TLabel
                  Left = 8
                  Top = 14
                  Width = 261
                  Height = 13
                  AutoSize = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object GroupBox3: TGroupBox
                Left = 163
                Top = 120
                Width = 275
                Height = 31
                Caption = 'Descrição do Centro de Custo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                object lbDescricaoCCusto: TLabel
                  Left = 8
                  Top = 12
                  Width = 261
                  Height = 13
                  AutoSize = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object edContaDebito2: TMaskEdit
                Left = 12
                Top = 80
                Width = 123
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                OnExit = edContaDebito2Exit
              end
              object GroupBox6: TGroupBox
                Left = 162
                Top = 72
                Width = 276
                Height = 31
                Caption = 'Descrição da Conta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                object lbDescContaDebito2: TLabel
                  Left = 8
                  Top = 14
                  Width = 261
                  Height = 13
                  AutoSize = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
              end
            end
            object grpCreContab: TGroupBox
              Left = 1
              Top = 183
              Width = 470
              Height = 125
              Align = alBottom
              Caption = 'Conta Contábil para Crédito'
              TabOrder = 1
              object spdContaCredito1: TSpeedButton
                Left = 136
                Top = 33
                Width = 19
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                  33333333373F33333333333330B03333333333337F7F33333333333330F03333
                  333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                  333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                  333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                  3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                  33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                  33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                  03333337777777F7F33333330000000003333337777777773333}
                NumGlyphs = 2
                ParentFont = False
                OnClick = spdContaCredito1Click
              end
              object lbCcusto1: TLabel
                Left = 12
                Top = 62
                Width = 76
                Height = 13
                Caption = 'Centro de Custo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object lbConta1: TLabel
                Left = 12
                Top = 18
                Width = 69
                Height = 13
                Caption = 'Conta Contábil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label9: TLabel
                Left = 11
                Top = 52
                Width = 21
                Height = 13
                Caption = '-----'
              end
              object edContaCredito1: TMaskEdit
                Left = 12
                Top = 32
                Width = 123
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnExit = edContaCredito1Exit
              end
              object cmbCCusto1: TwwDBLookupCombo
                Left = 12
                Top = 76
                Width = 145
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO'
                  'NOME'#9'30'#9'NOME')
                LookupTable = dtmIntegraCAPCAR.qryCCusto1
                LookupField = 'NOME'
                Enabled = False
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = cmbCCusto1CloseUp
              end
              object grbGrConta1: TGroupBox
                Left = 163
                Top = 26
                Width = 275
                Height = 31
                Caption = 'Descrição da Conta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                object lbDescContaCredito1: TLabel
                  Left = 8
                  Top = 13
                  Width = 261
                  Height = 13
                  AutoSize = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object grbGrCcusto1: TGroupBox
                Left = 162
                Top = 70
                Width = 275
                Height = 31
                Caption = 'Descrição do Centro de Custo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                object lbDescricaoCCusto1: TLabel
                  Left = 8
                  Top = 13
                  Width = 261
                  Height = 13
                  AutoSize = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
              end
            end
          end
        end
        object tbsPagar: TTabSheet
          Caption = 'Contas a Pagar '
          object pnlFundoCAPCAR: TPanel
            Left = 0
            Top = 0
            Width = 472
            Height = 309
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object Label10: TLabel
              Left = 203
              Top = 56
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label6: TLabel
              Left = 18
              Top = 55
              Width = 157
              Height = 13
              Caption = 'Conta Contábil para Crédito'
            end
            object SpeedButton1: TSpeedButton
              Left = 158
              Top = 69
              Width = 20
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = SpeedButton1Click
            end
            object Label11: TLabel
              Left = 18
              Top = 93
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object spdTpPaga: TSpeedButton
              Left = 398
              Top = 30
              Width = 22
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdTpPagaClick
            end
            object lbTpPaga: TLabel
              Left = 18
              Top = 15
              Width = 116
              Height = 13
              Caption = 'Tipo de Desembolso'
            end
            object Label12: TLabel
              Left = 18
              Top = 130
              Width = 108
              Height = 13
              Caption = 'Atividade / Projeto'
            end
            object Label13: TLabel
              Left = 18
              Top = 170
              Width = 54
              Height = 13
              Caption = 'Programa'
            end
            object Label5: TLabel
              Left = 18
              Top = 212
              Width = 65
              Height = 13
              Caption = 'Fornecedor'
            end
            object dblkCCDevolCAP: TwwDBLookupCombo
              Left = 203
              Top = 69
              Width = 217
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME'#9'F')
              LookupTable = dtmIntegraCAPCAR.qryCCusto
              LookupField = 'CODCENTROCUSTO'
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbCCustoCloseUp
            end
            object MskEdCCCAP: TMaskEdit
              Left = 19
              Top = 68
              Width = 137
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DblkCresposCAP: TwwDBLookupCombo
              Left = 19
              Top = 107
              Width = 402
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Centro de Responsabilidade')
              LookupTable = dtmIntegraCAPCAR.qrycentrespon
              LookupField = 'CODCENTRORESPON'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object edTpPaga: TEdit
              Left = 19
              Top = 29
              Width = 376
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnExit = edTpPagaExit
            end
            object dblkAtivProjCAP: TwwDBLookupCombo
              Left = 19
              Top = 145
              Width = 402
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição')
              LookupTable = dtmIntegraCAPCAR.qryAtividade
              LookupField = 'UNIDNEGOC'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblkAtivProjCAPCloseUp
            end
            object dblkProgramaCAP: TwwDBLookupCombo
              Left = 19
              Top = 185
              Width = 402
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'Programa'#9'F')
              LookupTable = dtmIntegraCAPCAR.qryPrograma
              LookupField = 'CODPROGRAMA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object DblkFornecedor: TwwDBLookupCombo
              Left = 19
              Top = 228
              Width = 402
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'#9'F')
              LookupTable = dtmIntegraCAPCAR.qryEmpresaProp
              LookupField = 'IDFORCLI'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
          end
        end
        object tbsReceber: TTabSheet
          Caption = 'Contas a Receber'
          object pnlFundoCRecebe: TPanel
            Left = 0
            Top = 0
            Width = 472
            Height = 309
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object GroupBox8: TGroupBox
              Left = 5
              Top = 1
              Width = 395
              Height = 74
              Caption = 'Para rateio de Documentos no Contas a Receber'
              TabOrder = 0
              object lblTpReceb: TLabel
                Left = 6
                Top = 15
                Width = 122
                Height = 13
                Caption = 'Tipo de Recebimento'
              end
              object spdTpReceb: TSpeedButton
                Left = 353
                Top = 29
                Width = 22
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                  33333333373F33333333333330B03333333333337F7F33333333333330F03333
                  333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                  333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                  333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                  3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                  33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                  33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                  03333337777777F7F33333330000000003333337777777773333}
                NumGlyphs = 2
                ParentFont = False
                OnClick = spdTpRecebClick
              end
              object edTpReceb: TEdit
                Left = 7
                Top = 29
                Width = 345
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnExit = edTpRecebExit
              end
            end
            object grpAltJuros: TGroupBox
              Left = 6
              Top = 168
              Width = 394
              Height = 100
              TabOrder = 1
              Visible = False
              object Label7: TLabel
                Left = 6
                Top = 9
                Width = 104
                Height = 13
                Caption = 'Alterador de Juros'
              end
              object Label8: TLabel
                Left = 6
                Top = 57
                Width = 125
                Height = 13
                Caption = 'Alterador de Correção'
              end
              object dblkpcmbAltJurosCAR: TwwDBLookupCombo
                Left = 6
                Top = 24
                Width = 367
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Alterador')
                LookupTable = dtmIntegraCAPCAR.qryAlterador
                LookupField = 'CODALTERADOR'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object dblkpcmbAltCorrecaoCAR: TwwDBLookupCombo
                Left = 6
                Top = 72
                Width = 367
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Alterador')
                LookupTable = dtmIntegraCAPCAR.qryAlterador
                LookupField = 'CODALTERADOR'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
            object grpDescontoCAR: TGroupBox
              Left = 5
              Top = 82
              Width = 395
              Height = 74
              Caption = 'Para rateio de Documentos no Contas a Pagar (descontos)'
              TabOrder = 2
              object Label29: TLabel
                Left = 6
                Top = 18
                Width = 116
                Height = 13
                Caption = 'Tipo de Desembolso'
              end
              object spdDesembCAR: TSpeedButton
                Left = 351
                Top = 33
                Width = 22
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                  33333333373F33333333333330B03333333333337F7F33333333333330F03333
                  333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                  333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                  333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                  3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                  33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                  33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                  03333337777777F7F33333330000000003333337777777773333}
                NumGlyphs = 2
                ParentFont = False
                OnClick = spdTpPagaClick
              end
              object edDesembCAR: TEdit
                Left = 7
                Top = 32
                Width = 345
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnExit = edTpRecebExit
              end
            end
          end
        end
        object tbsDevol: TTabSheet
          Caption = 'Devolução'
          object grpDevReceb: TGroupBox
            Left = 5
            Top = 2
            Width = 385
            Height = 44
            Caption = 'Tipo de Recebimento'
            TabOrder = 0
            object spdDevReceb: TSpeedButton
              Left = 353
              Top = 15
              Width = 22
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdDevRecebClick
            end
            object edRecebimento: TEdit
              Left = 7
              Top = 15
              Width = 345
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object grpDevDesemb: TGroupBox
            Left = 6
            Top = 47
            Width = 385
            Height = 44
            Caption = 'Tipo de Desembolso'
            TabOrder = 1
            object spdDevDesemb: TSpeedButton
              Left = 353
              Top = 16
              Width = 22
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdTpPagaClick
            end
            object edDesembolso: TEdit
              Left = 7
              Top = 16
              Width = 345
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object grpContaDevol: TGroupBox
            Left = 2
            Top = 95
            Width = 468
            Height = 92
            Caption = 'Conta a Crédito p/devolução via Banco'
            TabOrder = 2
            object spdContaDevol: TSpeedButton
              Left = 227
              Top = 25
              Width = 19
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdContaDevolClick
            end
            object Label41: TLabel
              Left = 257
              Top = 11
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label42: TLabel
              Left = 7
              Top = 11
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object edContaContabilDevol: TMaskEdit
              Left = 5
              Top = 25
              Width = 221
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edContaCredito1Exit
            end
            object dblkCCDevol: TwwDBLookupCombo
              Left = 254
              Top = 25
              Width = 209
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO'
                'NOME'#9'30'#9'NOME')
              LookupTable = dtmIntegraCAPCAR.qryCCusto1
              LookupField = 'NOME'
              Enabled = False
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbCCusto1CloseUp
            end
            object GroupBox24: TGroupBox
              Left = 6
              Top = 48
              Width = 244
              Height = 39
              Caption = 'Descrição da Conta'
              TabOrder = 2
              object lbDescricaoContaDevol: TLabel
                Left = 6
                Top = 17
                Width = 235
                Height = 13
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object GroupBox25: TGroupBox
              Left = 255
              Top = 48
              Width = 209
              Height = 39
              Caption = 'Descrição do Centro de Custo'
              TabOrder = 3
              object lbDescricaoCCustoDevol: TLabel
                Left = 6
                Top = 17
                Width = 197
                Height = 13
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object grpContaDevolPatro: TGroupBox
            Left = 2
            Top = 191
            Width = 468
            Height = 100
            Caption = 'Conta a Crédito p/devolução via Interface com as Patrocinadoras'
            TabOrder = 3
            object spdContaDevolpatro: TSpeedButton
              Left = 227
              Top = 30
              Width = 19
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdContaDevolpatroClick
            end
            object Label44: TLabel
              Left = 256
              Top = 16
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label45: TLabel
              Left = 7
              Top = 16
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object edContaContabilDevolPatro: TMaskEdit
              Left = 5
              Top = 30
              Width = 221
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edContaCredito1Exit
            end
            object dblkCCDevolPatro: TwwDBLookupCombo
              Left = 253
              Top = 30
              Width = 211
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO'
                'NOME'#9'30'#9'NOME')
              LookupTable = dtmIntegraCAPCAR.qryCCusto1
              LookupField = 'NOME'
              Enabled = False
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbCCusto1CloseUp
            end
            object GroupBox26: TGroupBox
              Left = 6
              Top = 54
              Width = 244
              Height = 39
              Caption = 'Descrição da Conta'
              TabOrder = 2
              object lbDescricaoContaDevolPatro: TLabel
                Left = 6
                Top = 17
                Width = 235
                Height = 13
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object GroupBox27: TGroupBox
              Left = 255
              Top = 54
              Width = 209
              Height = 39
              Caption = 'Descrição do Centro de Custo'
              TabOrder = 3
              object lbDescricaoCCustoDevolPatro: TLabel
                Left = 6
                Top = 17
                Width = 197
                Height = 13
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
          end
        end
        object tbsTipoper: TTabSheet
          Caption = 'Tipo Operação'
          object pnlTipoper: TPanel
            Left = 0
            Top = 0
            Width = 472
            Height = 309
            Align = alClient
            TabOrder = 0
            object GroupBox1: TGroupBox
              Left = 1
              Top = 1
              Width = 470
              Height = 307
              Align = alClient
              Caption = 'Tipos de Operação para os Lançamentos Contábeis de:'
              TabOrder = 0
              object lbGrupo: TLabel
                Left = 17
                Top = 18
                Width = 109
                Height = 13
                Caption = 'Envio de Cobrança'
              end
              object Label1: TLabel
                Left = 17
                Top = 63
                Width = 75
                Height = 13
                Caption = 'Recebimento'
              end
              object Label15: TLabel
                Left = 17
                Top = 108
                Width = 155
                Height = 13
                Caption = 'Tratamento de Divergência'
              end
              object dblkTipoperenvio: TwwDBLookupCombo
                Left = 17
                Top = 33
                Width = 375
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'TIPDESCRICAO'#9'25'#9'Descrição')
                LookupTable = dtmIntegraCAPCAR.qrytipooper
                LookupField = 'TIPCODIGO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkTipopercobranca: TwwDBLookupCombo
                Left = 17
                Top = 77
                Width = 375
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'TIPDESCRICAO'#9'25'#9'Descrição')
                LookupTable = dtmIntegraCAPCAR.qrytipooper
                LookupField = 'TIPCODIGO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkTipoperdiverg: TwwDBLookupCombo
                Left = 17
                Top = 122
                Width = 375
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'TIPDESCRICAO'#9'25'#9'Descrição')
                LookupTable = dtmIntegraCAPCAR.qrytipooper
                LookupField = 'TIPCODIGO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
          end
        end
        object tbsTipoDoc: TTabSheet
          Caption = 'Tipo de Documento'
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 472
            Height = 309
            Align = alClient
            Caption = 'Tipos de Documentos para geração de CAP/CAR para:'
            TabOrder = 0
            object GroupBox20: TGroupBox
              Left = 234
              Top = 16
              Width = 220
              Height = 89
              Caption = 'Contas a Receber - Recebimento'
              TabOrder = 0
              object Label27: TLabel
                Left = 9
                Top = 15
                Width = 128
                Height = 13
                Caption = 'via cobrança bancária'
              end
              object Label28: TLabel
                Left = 9
                Top = 48
                Width = 174
                Height = 13
                Caption = 'via recebimento Patrocinadora'
              end
              object dblkTipDocCARRecbanco: TwwDBLookupCombo
                Left = 6
                Top = 27
                Width = 205
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Descrição')
                LookupTable = dtmIntegraCAPCAR.qryTipoDocCAR
                LookupField = 'CODTIPDOC'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkTipDocCARRecpatro: TwwDBLookupCombo
                Left = 6
                Top = 60
                Width = 205
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Descrição')
                LookupTable = dtmIntegraCAPCAR.qryTipoDocCAR
                LookupField = 'CODTIPDOC'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
            object GroupBox17: TGroupBox
              Left = 6
              Top = 17
              Width = 220
              Height = 89
              Caption = 'Contas a Pagar - Envio'
              TabOrder = 1
              object Label25: TLabel
                Left = 6
                Top = 15
                Width = 128
                Height = 13
                Caption = 'via cobrança bancária'
              end
              object Label26: TLabel
                Left = 6
                Top = 48
                Width = 136
                Height = 13
                Caption = 'via envio Patrocinadora'
              end
              object dblkTipDocCAPenvbanco: TwwDBLookupCombo
                Left = 6
                Top = 27
                Width = 205
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Descrição')
                LookupTable = dtmIntegraCAPCAR.qryTipoDocCAP
                LookupField = 'CODTIPDOC'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkTipDocCAPenvPatro: TwwDBLookupCombo
                Left = 6
                Top = 60
                Width = 205
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Descrição')
                LookupTable = dtmIntegraCAPCAR.qryTipoDocCAP
                LookupField = 'CODTIPDOC'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
          end
        end
        object tbsParamContab: TTabSheet
          Caption = 'Parâmetros Contábeis'
          object GroupBox21: TGroupBox
            Left = 9
            Top = 3
            Width = 442
            Height = 136
            Caption = 'Conta a débito para anulação de Receita de exercício anterior'
            TabOrder = 0
            object Label46: TLabel
              Left = 16
              Top = 13
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object spdContaAnulaRec: TSpeedButton
              Left = 140
              Top = 27
              Width = 20
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdContaAnulaRecClick
            end
            object Label47: TLabel
              Left = 183
              Top = 13
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object edContaAnulaReceita: TMaskEdit
              Left = 16
              Top = 26
              Width = 123
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object cmbCustoAnulaReceita: TwwDBLookupCombo
              Left = 183
              Top = 26
              Width = 217
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO'
                'NOME'#9'30'#9'NOME')
              LookupTable = dtmIntegraCAPCAR.qryCCusto
              LookupField = 'NOME'
              Enabled = False
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbCCustoCloseUp
            end
            object GroupBox29: TGroupBox
              Left = 18
              Top = 50
              Width = 382
              Height = 39
              Caption = 'Descrição da Conta'
              TabOrder = 2
              object lblDescricaoContaAnulaReceita: TLabel
                Left = 6
                Top = 17
                Width = 349
                Height = 13
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object GroupBox30: TGroupBox
              Left = 18
              Top = 90
              Width = 382
              Height = 39
              Caption = 'Descrição do Centro de Custo'
              TabOrder = 3
              object lbDescricaoCCustoAnulaReceita: TLabel
                Left = 9
                Top = 17
                Width = 343
                Height = 13
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object GroupBox28: TGroupBox
            Left = 9
            Top = 149
            Width = 442
            Height = 145
            Caption = 
              'NÃO TEM DESPESA (está invisível)Conta a crédito para anulação de' +
              ' Despesa de exercício anterior'
            TabOrder = 1
            Visible = False
            object Label50: TLabel
              Left = 16
              Top = 16
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object spdContaAnulaDesp: TSpeedButton
              Left = 141
              Top = 30
              Width = 19
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdContaAnulaDespClick
            end
            object Label51: TLabel
              Left = 183
              Top = 16
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object edContaAnulaDespesa: TMaskEdit
              Left = 16
              Top = 30
              Width = 123
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object cmbCustoAnulaDespesa: TwwDBLookupCombo
              Left = 183
              Top = 30
              Width = 217
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO'
                'NOME'#9'30'#9'NOME')
              LookupTable = dtmIntegraCAPCAR.qryCCusto1
              LookupField = 'NOME'
              Enabled = False
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbCCusto1CloseUp
            end
            object GroupBox31: TGroupBox
              Left = 18
              Top = 54
              Width = 382
              Height = 39
              Caption = 'Descrição da Conta'
              TabOrder = 2
              object lbDescricaoContaAnulaDespesa: TLabel
                Left = 6
                Top = 17
                Width = 352
                Height = 13
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object GroupBox32: TGroupBox
              Left = 18
              Top = 98
              Width = 382
              Height = 39
              Caption = 'Descrição do Centro de Custo'
              TabOrder = 3
              object lbDescricaoCCustoAnulaDespesa: TLabel
                Left = 6
                Top = 17
                Width = 355
                Height = 13
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
          end
        end
      end
      object treeContaContabil: TCMTreeView
        Left = 28
        Top = 128
        Width = 445
        Height = 167
        PodeNavegar = True
        DataSource = dsContaContabil
        CampoChave = qryContaContabilPLACONTA
        CampoDescricao = qryContaContabilPLANOME
        CampoTipo = qryContaContabilPLATIPO
        OnDblClick = treeContaContabilDblClick
        OnExit = treeContaContabilExit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Visible = False
      end
      object treeTpPaga: TCMTreeView
        Left = 464
        Top = 307
        Width = 370
        Height = 101
        PodeNavegar = True
        Mascara = '99.99.99'
        DataSource = dsTpPaga
        CampoChave = qryTpPagaCODTIPRECDES
        CampoDescricao = qryTpPagaDESCRICAO
        CampoTipo = qryTpPagaANASINT
        OnDblClick = treeTpPagaDblClick
        OnExit = treeTpPagaExit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Visible = False
      end
      object treeTpReceb: TCMTreeView
        Left = 441
        Top = 364
        Width = 371
        Height = 153
        PodeNavegar = True
        Mascara = '99.99.99'
        DataSource = dsTpReceb
        CampoChave = qryTpRecebCODTIPRECDES
        CampoDescricao = qryTpRecebDESCRICAO
        CampoTipo = qryTpRecebANASINT
        OnDblClick = treeTpRecebDblClick
        OnExit = treeTpRecebExit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 483
    Width = 800
    inherited tb97Fundo: TToolbar97
      Left = 571
      DockPos = 571
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 402
      DockPos = 402
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    object Button1: TButton
      Left = 8
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Sobre'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object lstAuxID: TListBox [2]
    Left = 147
    Top = 360
    Width = 124
    Height = 40
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
  object lstAuxTipo: TListBox [3]
    Left = 150
    Top = 318
    Width = 121
    Height = 40
    ItemHeight = 13
    TabOrder = 3
    Visible = False
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
  object MontaSel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA '
      'PESSOA.NOME '
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME'
      'PESSOA.NUMDOCUMENTO ')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora'
      'CPF')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PLANPREV'
      'PESSOA PATRO')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSJUR '
      'ELEGPATRO.IDPESSOA '
      'PESSOA.IDPESSOA '
      'PARTPREVPLAN.IDPESSOA '
      'PARTPREVPLAN.IDPLANOPREV '
      'PLANPREV.IDPLANOPREV ')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PLANPREV.TPPLANOPREV = '#39'F'#39
      'PARTPREVPLAN.IDPESSJUR = PATRO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '10'
      '60'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 85
    Top = 397
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 197
    Top = 399
  end
  object imGrupos: TImageList
    Left = 18
    Top = 385
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF00FFFFFF000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF000000000084848400FFFFFF0084008400FFFF
      FF00FFFFFF000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000840084000000FF000000
      FF000000FF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000000000000000FF000000FF000000
      FF000000FF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000FF000000FF008400
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000000000000000000000000000848484008484840000000000FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000008484840000000000FFFFFF00FFFFFF008484
      0000FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000084848400FFFFFF00FFFFFF0084840000FF000000FF00
      0000FF000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000FFFFFF00FF000000FF0000008484
      0000FF000000FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FF00
      000084840000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000000000FFFFFF0084840000FFFF
      FF00FFFFFF000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF0000FFFFFFFF008F0000
      FFFFFFFF00030000E007FFFF00000000C007C00F00800000C007800700800000
      C007800300810000C007800100010000C007800104010000C007800F00010000
      C00F800F04000000E07F801FFE000000E07FC0FFB0000000FFFFC0FFB9030000
      FFFFFFFFC50F0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object qryContaContabil: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 240
    Top = 428
    object qryContaContabilPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryContaContabilPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaContabilPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
  end
  object dsContaContabil: TwwDataSource
    DataSet = qryContaContabil
    Left = 39
    Top = 255
  end
  object dsTpReceb: TwwDataSource
    DataSet = qryTpReceb
    Left = 85
    Top = 319
  end
  object qryTpReceb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES, DESCRICAO, ANASINT'
      'FROM   TIPORECEBDESEMB'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'AND    RECPAG = '#39'R'#39
      'AND    ATIVO = '#39'S'#39
      ''
      ' ')
    ValidateWithMask = True
    Left = 215
    Top = 332
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryTpRecebCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object qryTpRecebDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTpRecebANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
  end
  object dsTpPaga: TwwDataSource
    DataSet = qryTpPaga
    Left = 85
    Top = 301
  end
  object qryTpPaga: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES, DESCRICAO, ANASINT'
      'FROM   TIPORECEBDESEMB'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'AND    RECPAG = '#39'P'#39
      'AND    ATIVO = '#39'S'#39
      ' ')
    ValidateWithMask = True
    Left = 151
    Top = 309
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryTpPagaCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object qryTpPagaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTpPagaANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
  end
  object MontaSelectIRRF: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Favorecido')
    Tabelas.Strings = (
      'FORNSERV'
      'PESSOA')
    CamposChave.Strings = (
      'FORNSERV.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'FORNSERV.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 526
    Top = 18
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDSITPART,DESCRICAO,FLGINTERNO'
      'from sitpart'
      'order by descricao')
    ValidateWithMask = True
    Left = 232
    Top = 275
  end
  object qryCContabil: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 205
    Top = 29
  end
  object qryPatroParamASS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CDCRESPONASS,'
      '  CCUSTOASS,'
      '  ATIVPROJETOASS,'
      '  TIPODESEMBASS,'
      '  CCCREDITOASS,'
      '  CCDEBITOASS,'
      '  CODPROGRAMAASS,'
      '  IDFORCLIASS'
      'FROM PATRO'
      'WHERE IDPESSOA = :IDPESSOA AND'
      '      IDFUNDACAO = :IDFUNDACAO')
    ValidateWithMask = True
    Left = 449
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptInput
      end>
  end
end
