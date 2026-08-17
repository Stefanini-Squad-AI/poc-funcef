inherited frmCadProduto: TfrmCadProduto
  Left = 17
  Top = 47
  Caption = 'Cadastro Padrão para os Produtos'
  ClientHeight = 457
  ClientWidth = 695
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 695
    Height = 371
    inherited pnlMestre: TPanel
      Width = 693
      Height = 176
      Caption = ','
      object grpProduto: TGroupBox
        Left = 6
        Top = 3
        Width = 337
        Height = 106
        TabOrder = 0
        object Label8: TLabel
          Left = 9
          Top = 10
          Width = 44
          Height = 13
          Caption = 'Código '
        end
        object Label9: TLabel
          Left = 98
          Top = 10
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object GbProduto: TGroupBox
          Left = 8
          Top = 47
          Width = 320
          Height = 49
          Caption = 'Grupo do Produto'
          TabOrder = 2
          object dblkcmbGrupo: TwwDBLookupCombo
            Left = 9
            Top = 18
            Width = 301
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCGRUPOPROD'#9'30'#9'Descrição'
              'CODGRUPOPROD'#9'10'#9'Código')
            DataField = 'CODGRUPOPROD'
            DataSource = ds
            LookupTable = qryGrupoProd
            LookupField = 'CODGRUPOPROD'
            Options = [loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = dblkcmbGrupoCloseUp
          end
        end
        object edDescProd: TwwDBEdit
          Left = 98
          Top = 24
          Width = 229
          Height = 21
          DataField = 'DESCPROD'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edCodProd: TwwDBEdit
          Left = 9
          Top = 24
          Width = 79
          Height = 21
          DataField = 'CODPRODUTO'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = edCodProdExit
        end
      end
      object pnlBloquear: TPanel
        Left = 349
        Top = 8
        Width = 327
        Height = 101
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object SbBloqueado: TSpeedButton
          Left = 11
          Top = 12
          Width = 91
          Height = 24
          GroupIndex = 1
          Caption = 'Bloqueado'
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600040404009C9C84005C5C04006C6C4400CCCCC4005C5C240094944C00B4B4
            A4007C7C2400343404007C7C5C00E4E4E40094946C0074740C00B4B484005C5C
            34004C4C1C0084844400CCCCA4004C4C04005C5C1400A4A46C00E4E4CC006C6C
            2400F4F4F400B4B49400ACAC94007474540094945C007C7C34006C6C34001C1C
            0400DCDCD400C4C4B400444414008C8C6C0094947C0084845400CCCCB4004C4C
            14006C6C1400ACAC84006C6C0C007C7C4400DCDCC400C4C4A400444404008C8C
            5C00F4F4E40074741400A4A47C00C4C49C00A4A464008C8C3C005C5C0C005C5C
            2C009494740084844C004C4C0C005C5C1C00E4E4DC006C6C2C00B4B49C009494
            64007C7C3C006C6C3C00CCCCBC0014140400A4A48C0074744C00D4D4CC00BCBC
            AC003C3C0C0084846400ECECEC0084840400B4B48C0064643C0054542400A4A4
            7400FCFCFC002C2C04000C0C0400A4A484006464040074744400D4D4C4006464
            240094945400BCBCA4007C7C2C003C3C040084845C00ECECE4009C9C6C007C7C
            0C006464340054541C008C8C4400CCCCAC005454040064641400E4E4D4007474
            2400FCFCF400BCBC9400ACAC9C007C7C54009C9C5C0084843400747434002424
            04009C9C7C008C8C5400D4D4B400545414006C6C1C00ACAC8C007C7C4C00DCDC
            CC00C4C4AC00ACAC7C0064640C0064642C009C9C74008C8C4C0054540C006464
            1C00ECECDC0074742C00BCBC9C009C9C640084843C0074743C00D4D4BC00BCBC
            8C00ACAC740044440C008C8C6400F4F4EC0074741C007F7F7F00E0E0E00015C3
            EB00058ACB000404AA000CA3CB00054885008EC3DC00054BC90065B0D3000568
            CB000EA7E6001084E80008E2FC000844520052C4E8000E64E7004684FB000DB8
            E70094E3F800406CF6000E94E800041944000E79E80007DAE900CFE4EC003BBC
            E4000468840064868C003FA5F30004B2CC000444FC0050D4F800B41E04000466
            7B0006A0BB008CCDE7000BC4F9000584FC000594FC000412CC0005A8FC005CA9
            FC000574FC000484AC0004B8FC004494FA00BDD3E5006352FC00CAF6FC000498
            CC008FB6D3000525280044AAC9000468AA000477CA000564FC00052E45000443
            64004DC4FC009CF2FC000B55E6002FC4F8000448AB0064B9DA006FD4F2008CD7
            EC0008A7D80045B4DA002D88F8002DD4FB002C78F9002A98F60004062400B0E4
            F600437AFA004492A400042C6800055ACB002A88EB0023B9E80048B4FB00042A
            8C0021A9EA0073C4E2001C34CC0026A8F8000695D7005888FC0030C4EB0050E3
            FC002A97EC00A3311B0071656100745E5C00F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303F8F80303030303030303030303030303030303FF03030303030303030303
            0303030303FC0404F80303030303FCF80303030303030303F8F8FF0303030303
            03FF03030303030303FC040404F8030303FC0404F8030303030303F8FF03F8FF
            030303FFF8F8FF030303030303FC04040404F803FC04040404F80303030303F8
            FF0303F8FF03FFF80303F8FF030303030303FC04040404F80404040404F80303
            030303F8FF030303F8FFF803030303F8FF030303030303FC0404040404040404
            F803030303030303F8FF030303F803030303FFF80303030303030303FC040404
            040404F8030303030303030303F8FF030303030303FFF8030303030303030303
            030404040404F80303030303030303030303F8FF0303030303F8030303030303
            0303030303FC04040404F8030303030303030303030303F8FF030303F8030303
            0303030303030303FC0404040404F8030303030303030303030303F803030303
            F8FF030303030303030303FC040404F8040404F803030303030303030303F803
            03030303F8FF0303030303030303FC040404F803FC040404F803030303030303
            03F8030303F8FF0303F8FF03030303030303FC0404F8030303FC040404F80303
            03030303F8FF0303F803F8FF0303F8FF03030303030303FC040303030303FC04
            0404030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
            030303FC04FC03030303030303F8F80303030303F8FFFFFFF803030303030303
            03030303030303030303030303030303030303030303030303F8F8F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
          OnClick = SbBloqueadoClick
        end
        object SbLivre: TSpeedButton
          Left = 11
          Top = 45
          Width = 91
          Height = 24
          GroupIndex = 1
          Down = True
          Caption = 'Livre'
          Glyph.Data = {
            42010000424D4201000000000000760000002800000011000000110000000100
            040000000000CC00000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888000000080000000000088888000000080FFFFFFFFF088888000000080FF
            FFFFFFF088888000000080FFFFFF4FF088888000000080FFFFF444F088888000
            000080FFFF4444F088888000000080FFF444444088888000000080F4444FF440
            88888000000080F444FFFF4488888000000080FFFFFFFFF448888000000080FF
            FFFF000044888000000080FFFFFF088084488000000080FFFFFF080888448000
            000080FFFFFF0088888880000000800000000888888880000000888888888888
            888880000000}
          OnClick = SbLivreClick
        end
        object RgBloq: TDBRadioGroup
          Left = 112
          Top = 7
          Width = 203
          Height = 64
          Caption = 'Bloqueado para'
          Columns = 2
          DataField = 'FLGBLOQUEADO'
          DataSource = ds
          Items.Strings = (
            '&Compra'
            '&Requisição'
            '&Ambos')
          TabOrder = 0
          Values.Strings = (
            'C'
            'R'
            'A')
        end
        object chkVariavel: TDBCheckBox
          Left = 11
          Top = 77
          Width = 281
          Height = 17
          Caption = 'Produto possui descrição variável'
          DataField = 'FLGVARIAVEL'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object Panel3: TPanel
        Left = 484
        Top = 115
        Width = 191
        Height = 53
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 4
        object chkLoteValidade: TDBCheckBox
          Left = 16
          Top = 3
          Width = 133
          Height = 17
          Caption = 'Controla &Validade'
          DataField = 'LOTEVALIDADE'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'T'
          ValueUnchecked = 'F'
        end
        object chkEstocavel: TDBCheckBox
          Left = 16
          Top = 19
          Width = 133
          Height = 17
          Caption = '&Estocável'
          DataField = 'ITEMESTOCAVEL'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object ChkAtivo: TDBCheckBox
          Left = 16
          Top = 34
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'FLGATIVO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object grpMedidas: TGroupBox
        Left = 6
        Top = 110
        Width = 337
        Height = 57
        Caption = 'Unidades de Medida'
        TabOrder = 2
        object Label4: TLabel
          Left = 12
          Top = 14
          Width = 71
          Height = 13
          Caption = 'Custo Médio'
        end
        object Label5: TLabel
          Left = 123
          Top = 14
          Width = 87
          Height = 13
          Caption = 'Menor Unidade'
        end
        object Label24: TLabel
          Left = 231
          Top = 14
          Width = 43
          Height = 13
          Caption = 'Compra'
        end
        object dblkCmbUnCompra: TwwDBLookupCombo
          Left = 231
          Top = 27
          Width = 94
          Height = 21
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODMEDIDA'#9'4'#9'Código'
            'DESCMEDIDA'#9'25'#9'Descrição')
          DataField = 'CODMEDANALISE'
          DataSource = ds
          LookupTable = qryUnidadeMed
          LookupField = 'CodMedida'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblkCmbUnCompraExit
        end
        object dblkCmbMenorUnid: TwwDBLookupCombo
          Left = 123
          Top = 27
          Width = 94
          Height = 21
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODMEDIDA'#9'4'#9'Unidade'
            'DESCMEDIDA'#9'25'#9'Descrição')
          DataField = 'CODMENORMED'
          DataSource = ds
          LookupTable = qryUnidadeMed
          LookupField = 'CodMedida'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblkCmbMenorUnidExit
        end
        object dblkCmbUnPrMed: TwwDBLookupCombo
          Left = 12
          Top = 27
          Width = 94
          Height = 21
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODMEDIDA'#9'4'#9'Unidade'#9'No'
            'DESCMEDIDA'#9'25'#9'Descrição'#9'No')
          DataField = 'CODMEDCUSTO'
          DataSource = ds
          LookupTable = qryUnidadeMed
          LookupField = 'CodMedida'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = dblkCmbUnPrMedEnter
          OnExit = dblkCmbUnPrMedExit
        end
      end
      object rgrpFinalidade: TDBRadioGroup
        Left = 349
        Top = 110
        Width = 130
        Height = 58
        Caption = 'Finalidade'
        DataField = 'CONSUMOREVENDA'
        DataSource = ds
        Items.Strings = (
          '&Revenda'
          '&Consumo')
        TabOrder = 3
        Values.Strings = (
          'R'
          'C')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 177
      Width = 693
      Height = 193
      Tabs.Strings = (
        'Unidades de Medida'
        'Contabilização'
        'Descrição Detalhada'
        'Escrita Fiscal'
        'Impostos')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgContab'
        ''
        ''
        'dbGrdImposto')
      inherited pgctrlDetalhe: TPageControl
        Width = 595
        Height = 134
        ActivePage = tbsDescricao
        inherited tbsDet: TTabSheet
          Caption = 'Unidades de Medida'
          inherited dbgrdDet: TwwDBGrid
            Width = 587
            Height = 106
            Selected.Strings = (
              'CODMEDIDA'#9'4'#9'Unidade'
              'FATOR'#9'10'#9'Fator de Conversão'
              'CODMENORMED'#9'4'#9'Menor Unidade')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 587
            Height = 106
            object lblUnidade: TLabel
              Left = 120
              Top = 12
              Width = 48
              Height = 13
              Caption = 'Unidade'
            end
            object lblFator: TLabel
              Left = 228
              Top = 9
              Width = 112
              Height = 13
              Caption = 'Fator de Conversão'
            end
            object lblMenorUn: TLabel
              Left = 378
              Top = 9
              Width = 87
              Height = 13
              Caption = 'Menor Unidade'
            end
            object dblcUnidade: TwwDBLookupCombo
              Left = 120
              Top = 24
              Width = 94
              Height = 21
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODMEDIDA'#9'4'#9'Código'
                'DESCMEDIDA'#9'25'#9'Descrição')
              DataField = 'CODMEDIDA'
              DataSource = dsDet
              LookupTable = qryUnidadeMed
              LookupField = 'CodMedida'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrFator: TDBRealEdit
              Left = 228
              Top = 24
              Width = 136
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'FATOR'
              DataSource = dsDet
            end
            object dbeMenorUn: TwwDBEdit
              Left = 378
              Top = 24
              Width = 97
              Height = 21
              Color = clSilver
              DataField = 'CODMENORMED'
              DataSource = ds
              Enabled = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsContab: TTabSheet
          Caption = 'Contabilização'
          object dbgContab: TwwDBGrid
            Left = 0
            Top = 0
            Width = 587
            Height = 106
            Selected.Strings = (
              'CODCENTROCUSTO'#9'10'#9'Centro de Custo'
              'CONTAENTRADA'#9'18'#9'Conta de Entrada'
              'CONTASAIDA'#9'18'#9'Conta de Saida'
              'SUBCONTAENTRADA'#9'10'#9'SubConta de Entrada'
              'SUBCONTASAIDA'#9'10'#9'SubConta de Saida'
              'UNIDNEGOC'#9'10'#9'Atividade/Projeto')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContab
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object pnlContab: TPanel
            Left = 0
            Top = 0
            Width = 587
            Height = 106
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblCCusto: TLabel
              Left = 282
              Top = 23
              Width = 92
              Height = 13
              Caption = 'Centro do Custo'
            end
            object lblAtividade: TLabel
              Left = 282
              Top = 65
              Width = 112
              Height = 13
              Caption = 'Atividade (Projetos)'
            end
            object lblSubConta: TLabel
              Left = 202
              Top = 10
              Width = 60
              Height = 13
              Caption = 'Sub-Conta'
            end
            object Label2: TLabel
              Left = 202
              Top = 66
              Width = 60
              Height = 13
              Caption = 'Sub-Conta'
            end
            object Label1: TLabel
              Left = 434
              Top = 23
              Width = 73
              Height = 13
              Caption = 'Almoxarifado'
            end
            object dblcCCusto: TwwDBLookupCombo
              Left = 282
              Top = 37
              Width = 143
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME'
                'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsContab
              LookupTable = qryCCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcAtividade: TwwDBLookupCombo
              Left = 281
              Top = 79
              Width = 295
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNIDNEGOC'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = dsContab
              LookupTable = qryUnidNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loTitles]
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object cbValeGrupo: TCheckBox
              Left = 282
              Top = 4
              Width = 256
              Height = 17
              Caption = 'Contabilização válida para todo o Grupo'
              TabOrder = 6
            end
            object edContaEntrada: TCMProcuraMaskContabil
              Left = 9
              Top = 1
              Width = 185
              Height = 48
              Caption = ' Conta de Entrada '
              TabOrder = 0
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsContab
              DataField = 'CONTAENTRADA'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              Mensagens.Sintetica = 'Chave não pode ser sintética'
              Mensagens.Analitica = 'Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object dblcSubContaEntrada: TwwDBLookupCombo
              Left = 201
              Top = 26
              Width = 73
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODSUBCONTA'#9'10'#9'CODSUBCONTA'
                'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
              DataField = 'SUBCONTAENTRADA'
              DataSource = dsContab
              LookupTable = qrySubConta
              LookupField = 'CODSUBCONTA'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblcSubContaSaida: TwwDBLookupCombo
              Left = 202
              Top = 80
              Width = 73
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODSUBCONTA'#9'10'#9'CODSUBCONTA'
                'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
              DataField = 'SUBCONTASAIDA'
              DataSource = dsContab
              LookupTable = qrySubConta
              LookupField = 'CODSUBCONTA'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object edContaSaida: TCMProcuraMaskContabil
              Left = 10
              Top = 54
              Width = 185
              Height = 47
              Caption = ' Conta de Saída '
              TabOrder = 2
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsContab
              DataField = 'CONTASAIDA'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              Mensagens.Sintetica = 'Chave não pode ser sintética'
              Mensagens.Analitica = 'Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object dblcAlmoxa: TwwDBLookupCombo
              Left = 434
              Top = 37
              Width = 143
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCALMOX'#9'40'#9'Descrição')
              DataField = 'CODALMOXARIFADO'
              DataSource = dsContab
              LookupTable = qryAlmoxa
              LookupField = 'CODALMOXARIFADO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object tbsDescricao: TTabSheet
          Caption = 'Descrição Detalhada'
          object dbmDescricaoDet: TDBRichEdit
            Left = 0
            Top = 0
            Width = 587
            Height = 106
            Align = alClient
            DataField = 'DESCRCOMPL'
            DataSource = ds
            HideScrollBars = False
            MaxLength = 500
            PlainText = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object tbsImpostos: TTabSheet
          Caption = 'Escrita Fiscal'
          object Label10: TLabel
            Left = 8
            Top = 16
            Width = 109
            Height = 13
            Caption = 'Situação Tributária'
          end
          object dbrgIsentoOutros: TDBRadioGroup
            Left = 273
            Top = 12
            Width = 106
            Height = 76
            DataField = 'ISENTOOUTROS'
            DataSource = ds
            Items.Strings = (
              '&Isento'
              '&Outros')
            TabOrder = 0
            Values.Strings = (
              'I'
              'O')
          end
          object gbCodigoFiscal: TGroupBox
            Left = 387
            Top = 12
            Width = 148
            Height = 76
            Caption = 'Código Fiscal Padrão'
            TabOrder = 1
            object Label3: TLabel
              Left = 45
              Top = 24
              Width = 13
              Height = 13
              Caption = 'X.'
            end
            object lblExplica: TLabel
              Left = 15
              Top = 57
              Width = 116
              Height = 13
              Caption = 'X. = Origem da Nota'
            end
            object dblcClasFisc: TCMDBLookupCombo
              Left = 59
              Top = 19
              Width = 52
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODFISC'#9'2'#9'Código')
              DataField = 'CODFISCALPADRAO'
              DataSource = ds
              LookupTable = qryCalsFisc
              LookupField = 'CODFISC'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object dblcSittrib: TCMDBLookupCombo
            Left = 8
            Top = 32
            Width = 257
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCSITUACAOTRIB'#9'45'#9'Descrição'#9'F')
            DataField = 'SITUACAOTRIB'
            DataSource = ds
            LookupTable = qrySitTrib
            LookupField = 'SITUACAOTRIB'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object tbsImposto: TTabSheet
          Caption = 'Impostos'
          object dbgrdImposto: TwwDBGrid
            Left = 0
            Top = 0
            Width = 587
            Height = 106
            Selected.Strings = (
              'CODTIPOCUSTAGREG'#9'10'#9'Código'
              'DESCCUSTAGREG'#9'25'#9'Descrição'
              'PERCIMPOSTO'#9'10'#9'Percentual'
              'PERCBASEIMP'#9'10'#9'Base de Cálculo'
              'CODESTADO'#9'3'#9'Estado')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsImposto
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
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
          object pnlImposto: TPanel
            Left = 0
            Top = 0
            Width = 587
            Height = 106
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lbTipoAgre: TLabel
              Left = 12
              Top = 4
              Width = 45
              Height = 13
              Caption = 'Imposto'
            end
            object lblEstado: TLabel
              Left = 289
              Top = 4
              Width = 40
              Height = 13
              Caption = 'Estado'
            end
            object Label6: TLabel
              Left = 10
              Top = 48
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object lblPerc: TLabel
              Left = 133
              Top = 65
              Width = 16
              Height = 20
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 181
              Top = 48
              Width = 90
              Height = 13
              Caption = 'Base de Cáculo'
            end
            object dblcTipoAgre: TwwDBLookupCombo
              Left = 9
              Top = 18
              Width = 232
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCUSTAGREG'#9'25'#9'Descrição'
                'CODTIPOCUSTAGREG'#9'10'#9'Código')
              DataField = 'CODTIPOCUSTAGREG'
              DataSource = dsImposto
              LookupTable = qryTipoAgre
              LookupField = 'CODTIPOCUSTAGREG'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcEstado: TwwDBLookupCombo
              Left = 289
              Top = 18
              Width = 232
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODESTADO'#9'3'#9'U.F.'
                'NOMEESTADO'#9'30'#9'Nome'
                'IDPAIS'#9'10'#9'Código do País')
              DataField = 'CODESTADO'
              DataSource = dsImposto
              LookupTable = qryEstado
              LookupField = 'CODESTADO'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbPercentual: TDBRealEdit
              Left = 9
              Top = 61
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCIMPOSTO'
              DataSource = dsImposto
            end
            object dbedBase: TDBRealEdit
              Left = 180
              Top = 61
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '     0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCBASEIMP'
              DataSource = dsImposto
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 685
      end
      inherited Dock974: TDock97
        Left = 599
        Height = 134
      end
    end
  end
  inherited Dock972: TDock97
    Width = 695
  end
  inherited Dock971: TDock97
    Top = 418
    Width = 695
    inherited tb97Fundo: TToolbar97
      Left = 523
      DockPos = 715
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 354
      DockPos = 546
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRichEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 160
    Top = 71
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 5
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PRODUTO'
      'set'
      '  CODGRUPOPROD = :CODGRUPOPROD,'
      '  CODMEDCUSTO = :CODMEDCUSTO,'
      '  DESCPROD = :DESCPROD,'
      '  CODMEDANALISE = :CODMEDANALISE,'
      '  CLASSCONTABIL = :CLASSCONTABIL,'
      '  CONSUMOREVENDA = :CONSUMOREVENDA,'
      '  CREDITOIMPOSTO = :CREDITOIMPOSTO,'
      '  LOTEVALIDADE = :LOTEVALIDADE,'
      '  TEMCORTAM = :TEMCORTAM,'
      '  ITEMESTOCAVEL = :ITEMESTOCAVEL,'
      '  DESCRCOMPL = :DESCRCOMPL,'
      '  CODMENORMED = :CODMENORMED,'
      '  ISENTOOUTROS = :ISENTOOUTROS,'
      '  CODFISCALPADRAO = :CODFISCALPADRAO'
      'where'
      '  CODPRODUTO = :OLD_CODPRODUTO')
    InsertSQL.Strings = (
      'insert into PRODUTO'
      
        '  (CODPRODUTO, CODGRUPOPROD, CODMEDCUSTO, DESCPROD, CODMEDANALIS' +
        'E, CLASSCONTABIL, '
      
        '   CONSUMOREVENDA, CREDITOIMPOSTO, LOTEVALIDADE, TEMCORTAM, ITEM' +
        'ESTOCAVEL, '
      '   DESCRCOMPL, CODMENORMED, ISENTOOUTROS, CODFISCALPADRAO)'
      'values'
      
        '  (:CODPRODUTO, :CODGRUPOPROD, :CODMEDCUSTO, :DESCPROD, :CODMEDA' +
        'NALISE, '
      
        '   :CLASSCONTABIL, :CONSUMOREVENDA, :CREDITOIMPOSTO, :LOTEVALIDA' +
        'DE, :TEMCORTAM, '
      
        '   :ITEMESTOCAVEL, :DESCRCOMPL, :CODMENORMED, :ISENTOOUTROS, :CO' +
        'DFISCALPADRAO)')
    DeleteSQL.Strings = (
      'delete from PRODUTO'
      'where'
      '  CODPRODUTO = :OLD_CODPRODUTO')
    Left = 324
    Top = 11
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PRODUTO.CODPRODUTO'
      'PRODUTO.DESCPROD'
      'PRODUTO.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Produto'
      'Descrição do Produto'
      'Código do Grupo'
      'Descrição do Grupo')
    Tabelas.Strings = (
      'PRODUTO'
      'GRUPPROD'
      'ARTIGO')
    CamposChave.Strings = (
      'PRODUTO.CODPRODUTO')
    Filtro.Strings = (
      'PRODUTO.CODGRUPOPROD = GRUPPROD.CODGRUPOPROD'
      'PRODUTO.CODPRODUTO = ARTIGO.CODARTIGO')
    Left = 423
    Top = 5
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 430
    Top = 66
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '             P.CODPRODUTO,'
      '             P.CODGRUPOPROD,'
      '             P.CODMEDCUSTO,'
      '             P.DESCPROD,'
      '             P.CODMEDANALISE,'
      '             P.CLASSCONTABIL,'
      '             P.CONSUMOREVENDA,'
      '             P.CREDITOIMPOSTO,'
      '             P.LOTEVALIDADE,'
      '             P.TEMCORTAM,'
      '             P.ITEMESTOCAVEL,'
      '             P.DESCRCOMPL,'
      '             P.CODMENORMED,'
      '             P.ISENTOOUTROS,'
      '             P.CODFISCALPADRAO,'
      '             P.FLGVARIAVEL,'
      '             P.SITUACAOTRIB,'
      '              A.CODARTIGO, '
      '              A.CODPRODUTO,'
      '              A.CODCOR,                        '
      '              A.CODTAMANHO,                    '
      '              A.CODTIPOARTIGO,                 '
      '              A.EXISTEFT,                      '
      '              A.FLGBLOQUEADO,'
      '              A.FLGATIVO'
      'FROM '
      '      PRODUTO P, '
      '      ARTIGO A '
      'WHERE '
      '           (RTRIM(P.CODPRODUTO) =  :pPROD)'
      '  AND  (P.CODPRODUTO = A.CODPRODUTO)'
      ''
      ' ')
    Left = 361
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'pPROD'
        ParamType = ptUnknown
      end>
    object qryCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Origin = '"CM.PRODUTO".CODPRODUTO'
      Size = 6
    end
    object qryCODGRUPOPROD: TStringField
      FieldName = 'CODGRUPOPROD'
      Origin = '"CM.PRODUTO".CODGRUPOPROD'
      Size = 10
    end
    object qryCODMEDCUSTO: TStringField
      FieldName = 'CODMEDCUSTO'
      Origin = '"CM.PRODUTO".CODMEDCUSTO'
      Size = 4
    end
    object qryDESCPROD: TStringField
      FieldName = 'DESCPROD'
      Origin = '"CM.PRODUTO".DESCPROD'
      Size = 40
    end
    object qryCODMEDANALISE: TStringField
      FieldName = 'CODMEDANALISE'
      Origin = '"CM.PRODUTO".CODMEDANALISE'
      Size = 4
    end
    object qryCLASSCONTABIL: TStringField
      FieldName = 'CLASSCONTABIL'
      Origin = '"CM.PRODUTO".CLASSCONTABIL'
      Size = 1
    end
    object qryCONSUMOREVENDA: TStringField
      FieldName = 'CONSUMOREVENDA'
      Origin = '"CM.PRODUTO".CONSUMOREVENDA'
      Size = 1
    end
    object qryCREDITOIMPOSTO: TStringField
      FieldName = 'CREDITOIMPOSTO'
      Origin = '"CM.PRODUTO".CREDITOIMPOSTO'
      Size = 1
    end
    object qryLOTEVALIDADE: TStringField
      FieldName = 'LOTEVALIDADE'
      Origin = '"CM.PRODUTO".LOTEVALIDADE'
      Size = 1
    end
    object qryTEMCORTAM: TStringField
      FieldName = 'TEMCORTAM'
      Origin = '"CM.PRODUTO".TEMCORTAM'
      Size = 1
    end
    object qryITEMESTOCAVEL: TStringField
      FieldName = 'ITEMESTOCAVEL'
      Origin = '"CM.PRODUTO".ITEMESTOCAVEL'
      Size = 1
    end
    object qryDESCRCOMPL: TMemoField
      FieldName = 'DESCRCOMPL'
      Origin = '"CM.PRODUTO".DESCRCOMPL'
      BlobType = ftMemo
      Size = 500
    end
    object qryCODMENORMED: TStringField
      FieldName = 'CODMENORMED'
      Origin = '"CM.PRODUTO".CODMENORMED'
      Size = 4
    end
    object qryISENTOOUTROS: TStringField
      FieldName = 'ISENTOOUTROS'
      Origin = '"CM.PRODUTO".ISENTOOUTROS'
      Size = 1
    end
    object qryCODFISCALPADRAO: TStringField
      FieldName = 'CODFISCALPADRAO'
      Origin = '"CM.PRODUTO".CODFISCALPADRAO'
      Size = 2
    end
    object qryCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = '"CM.ARTIGO".CODARTIGO'
      Size = 14
    end
    object qryCODPRODUTO_1: TStringField
      FieldName = 'CODPRODUTO_1'
      Origin = '"CM.ARTIGO".CODPRODUTO'
      Size = 6
    end
    object qryCODCOR: TStringField
      FieldName = 'CODCOR'
      Origin = '"CM.ARTIGO".CODCOR'
      Size = 5
    end
    object qryCODTAMANHO: TStringField
      FieldName = 'CODTAMANHO'
      Origin = '"CM.ARTIGO".CODTAMANHO'
      Size = 3
    end
    object qryCODTIPOARTIGO: TStringField
      FieldName = 'CODTIPOARTIGO'
      Origin = '"CM.ARTIGO".CODTIPOARTIGO'
      Size = 1
    end
    object qryEXISTEFT: TStringField
      FieldName = 'EXISTEFT'
      Origin = '"CM.ARTIGO".EXISTEFT'
      Size = 1
    end
    object qryFLGBLOQUEADO: TStringField
      FieldName = 'FLGBLOQUEADO'
      Origin = '"CM.ARTIGO".FLGBLOQUEADO'
      Size = 1
    end
    object qryFLGVARIAVEL: TStringField
      FieldName = 'FLGVARIAVEL'
      Size = 1
    end
    object qrySITUACAOTRIB: TFloatField
      FieldName = 'SITUACAOTRIB'
    end
    object qryFLGATIVO: TStringField
      FieldName = 'FLGATIVO'
      FixedChar = True
      Size = 1
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object dsContab: TwwDataSource
    AutoEdit = False
    DataSet = qryContab
    Left = 157
    Top = 122
  end
  object qryGrupoProd: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         DESCGRUPOPROD,'
      '         CODGRUPOPROD'
      'FROM '
      '         GRUPPROD '
      'WHERE '
      '      (STATUSGRUPO = '#39'A'#39') '
      'ORDER BY DESCGRUPOPROD')
    ValidateWithMask = True
    Left = 493
    Top = 4
  end
  object qryUnidadeMed: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      '            CODMEDIDA,'
      '     DESCMEDIDA '
      'FROM '
      '      UNMEDIDA '
      'ORDER BY CODMEDIDA')
    ValidateWithMask = True
    Left = 576
    Top = 5
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    C.CODPRODUTO,                     '
      '    C.CODMEDIDA,                      '
      '    C.FATOR,                                 '
      '           P.CODMENORMED '
      'FROM '
      '          CONVER C,'
      '          PRODUTO P '
      'WHERE '
      '            (RTRIM(P.CODPRODUTO) = :pPROD)'
      '   AND (P.CODPRODUTO = C.CODPRODUTO)')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 166
    Top = 287
    ParamData = <
      item
        DataType = ftString
        Name = 'pPROD'
        ParamType = ptUnknown
      end>
    object qryDetCODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'CONVER.CODMEDIDA'
      Size = 4
    end
    object qryDetFATOR: TFloatField
      DisplayLabel = 'Fator de Conversão'
      DisplayWidth = 10
      FieldName = 'FATOR'
    end
    object qryDetCODMENORMED: TStringField
      DisplayLabel = 'Menor Unidade'
      DisplayWidth = 4
      FieldName = 'CODMENORMED'
      Origin = '"CM.PRODUTO".CODMENORMED'
      Size = 4
    end
    object qryDetCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Origin = 'CONVER.CODPRODUTO'
      Visible = False
      Size = 6
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONVER'
      'set'
      '  CODMEDIDA = :CODMEDIDA,'
      '  FATOR = :FATOR'
      'where'
      '    RTRIM(CODPRODUTO) = :OLD_CODPRODUTO and'
      '  RTRIM(CODMEDIDA) = :OLD_CODMEDIDA')
    InsertSQL.Strings = (
      'insert into CONVER'
      '  (CODPRODUTO, CODMEDIDA, FATOR)'
      'values'
      '  (:CODPRODUTO, :CODMEDIDA, :FATOR)')
    DeleteSQL.Strings = (
      'delete from CONVER'
      'where'
      '  RTRIM(CODPRODUTO) = :OLD_CODPRODUTO and'
      '  RTRIM(CODMEDIDA) = :OLD_CODMEDIDA')
    Left = 210
    Top = 71
  end
  object updContab: TUpdateSQL
    ModifySQL.Strings = (
      'update ARTXCONTAXCC'
      'set'
      '  IDARTXCONTAXCC = :IDARTXCONTAXCC,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLANO = :PLANO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  CONTAENTRADA = :CONTAENTRADA,'
      '  SUBCONTAENTRADA = :SUBCONTAENTRADA,'
      '  CONTASAIDA = :CONTASAIDA,'
      '  SUBCONTASAIDA = :SUBCONTASAIDA,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO')
    InsertSQL.Strings = (
      'insert into ARTXCONTAXCC'
      
        '  (CODARTIGO, IDARTXCONTAXCC, IDPESSOA, PLANO, UNIDNEGOC, IDEMPR' +
        'ESA, CODCENTROCUSTO, '
      
        '   CONTAENTRADA, SUBCONTAENTRADA, CONTASAIDA, SUBCONTASAIDA, COD' +
        'ALMOXARIFADO)'
      'values'
      
        '  (:CODARTIGO, :IDARTXCONTAXCC, :IDPESSOA, :PLANO, :UNIDNEGOC, :' +
        'IDEMPRESA, '
      
        '   :CODCENTROCUSTO, :CONTAENTRADA, :SUBCONTAENTRADA, :CONTASAIDA' +
        ', :SUBCONTASAIDA, '
      '   :CODALMOXARIFADO)')
    DeleteSQL.Strings = (
      'delete from ARTXCONTAXCC'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO')
    Left = 213
    Top = 122
  end
  object qryContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     CODARTIGO,  '
      '     IDARTXCONTAXCC,'
      '     IDPESSOA,      '
      '     PLANO,         '
      '     UNIDNEGOC,     '
      '     IDEMPRESA,     '
      '     CODCENTROCUSTO,'
      '     CONTAENTRADA,  '
      '     SUBCONTAENTRADA,'
      '     CONTASAIDA,    '
      '     SUBCONTASAIDA,  '
      '     CODGRUPOPROD,'
      '     CODALMOXARIFADO '
      ' FROM '
      '        ARTXCONTAXCC ')
    UpdateObject = updContab
    ValidateWithMask = True
    Left = 271
    Top = 258
    object qryContabCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'ARTXCONTAXCC.CODCENTROCUSTO'
      Size = 10
    end
    object qryContabCONTAENTRADA: TStringField
      DisplayLabel = 'Conta de Entrada'
      DisplayWidth = 18
      FieldName = 'CONTAENTRADA'
      Origin = 'ARTXCONTAXCC.CONTAENTRADA'
      Size = 18
    end
    object qryContabCONTASAIDA: TStringField
      DisplayLabel = 'Conta de Saida'
      DisplayWidth = 18
      FieldName = 'CONTASAIDA'
      Origin = 'ARTXCONTAXCC.CONTASAIDA'
      Size = 18
    end
    object qryContabSUBCONTAENTRADA: TFloatField
      DisplayLabel = 'SubConta de Entrada'
      DisplayWidth = 10
      FieldName = 'SUBCONTAENTRADA'
      Origin = 'ARTXCONTAXCC.SUBCONTAENTRADA'
    end
    object qryContabSUBCONTASAIDA: TFloatField
      DisplayLabel = 'SubConta de Saida'
      DisplayWidth = 10
      FieldName = 'SUBCONTASAIDA'
      Origin = 'ARTXCONTAXCC.SUBCONTASAIDA'
    end
    object qryContabUNIDNEGOC: TFloatField
      DisplayLabel = 'Atividade/Projeto'
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'ARTXCONTAXCC.UNIDNEGOC'
    end
    object qryContabCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'ARTXCONTAXCC.CODARTIGO'
      Visible = False
      Size = 14
    end
    object qryContabIDARTXCONTAXCC: TFloatField
      FieldName = 'IDARTXCONTAXCC'
      Origin = 'ARTXCONTAXCC.IDARTXCONTAXCC'
      Visible = False
    end
    object qryContabIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ARTXCONTAXCC.IDPESSOA'
      Visible = False
    end
    object qryContabPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'ARTXCONTAXCC.PLANO'
      Visible = False
    end
    object qryContabIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'ARTXCONTAXCC.IDEMPRESA'
      Visible = False
    end
    object qryContabCODGRUPOPROD: TStringField
      FieldName = 'CODGRUPOPROD'
      Origin = 'ARTXCONTAXCC.CODGRUPOPROD'
      Visible = False
      Size = 10
    end
    object qryContabCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
      Origin = 'ARTXCONTAXCC.CODALMOXARIFADO'
    end
  end
  object qryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '        UNIDNEGOC,'
      '        NOME '
      'FROM '
      '        UNIDNEGOCIO '
      'WHERE '
      '        (IDPESSOA = :pIDPESS)'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 642
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
  object qryCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       CODCENTROCUSTO,'
      '       NOME '
      'FROM '
      '       CENTCUST '
      'WHERE '
      '            (STATUSGRUPOCDC = '#39'A'#39')'
      '   AND (ATIVO = '#39'S'#39' )'
      '   AND  (IDEMPRESA = :pIDPESS)'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 273
    Top = 82
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '        NOMESUBCONTA,'
      '        CODSUBCONTA '
      'FROM'
      '        SUBCONTA '
      'WHERE '
      '        (IDPESSOA = :pIDPESS) '
      'ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 274
    Top = 411
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 478
    Top = 400
  end
  object qryImposto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select'
      '    I.CodProduto,'
      '    I.CodTipoCustAgreg,'
      '    I.CodEstado,'
      '    I.IdPais,'
      '    I.IdPessoa,'
      '    I.PercImposto,'
      '    i.PercBaseImp,'
      '    T.DescCustAgreg'
      'From'
      '    ImpostosxProdutos I,'
      '    TipoAgre T'
      'Where'
      '        ( Rtrim(I.CodProduto) = :pCodProd )'
      ' And ( I.IdPessoa = :pIdPess )'
      ' And (I.CodTipoCustAgreg = T.CodTipoCustAgreg) ')
    UpdateObject = updImposto
    ValidateWithMask = True
    Left = 542
    Top = 345
    ParamData = <
      item
        DataType = ftString
        Name = 'pCodProd'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPess'
        ParamType = ptUnknown
      end>
    object qryImpostoCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Size = 6
    end
    object qryImpostoCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
    end
    object qryImpostoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryImpostoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryImpostoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryImpostoPERCIMPOSTO: TFloatField
      FieldName = 'PERCIMPOSTO'
    end
    object qryImpostoPERCBASEIMP: TFloatField
      FieldName = 'PERCBASEIMP'
    end
    object qryImpostoDESCCUSTAGREG: TStringField
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
  end
  object dsImposto: TwwDataSource
    DataSet = qryImposto
    Left = 557
    Top = 282
  end
  object updImposto: TUpdateSQL
    ModifySQL.Strings = (
      'update ImpostosxProdutos'
      'set'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG,'
      '  CODESTADO = :CODESTADO,'
      '  IDPAIS = :IDPAIS,'
      '  IDPESSOA = :IDPESSOA,'
      '  PERCIMPOSTO = :PERCIMPOSTO,'
      '  PERCBASEIMP = :PERCBASEIMP'
      'where'
      '  rtrim(CODPRODUTO) = rtrim(:OLD_CODPRODUTO) and'
      '  rtrim(CODTIPOCUSTAGREG) = rtrim(:OLD_CODTIPOCUSTAGREG) and'
      '  rtrim(CODESTADO) = rtrim(:OLD_CODESTADO) and'
      '  IDPAIS = :OLD_IDPAIS and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into ImpostosxProdutos'
      
        '  (CODPRODUTO, CODTIPOCUSTAGREG, CODESTADO, IDPAIS, IDPESSOA, PE' +
        'RCIMPOSTO, '
      '   PERCBASEIMP)'
      'values'
      
        '  (:CODPRODUTO, :CODTIPOCUSTAGREG, :CODESTADO, :IDPAIS, :IDPESSO' +
        'A, :PERCIMPOSTO, '
      '   :PERCBASEIMP)')
    DeleteSQL.Strings = (
      'delete from ImpostosxProdutos'
      'where'
      '  rtrim(CODPRODUTO) = rtrim(:OLD_CODPRODUTO) and'
      '  rtrim(CODTIPOCUSTAGREG) = rtrim(:OLD_CODTIPOCUSTAGREG) and'
      '  rtrim(CODESTADO) = rtrim(:OLD_CODESTADO) and'
      '  IDPAIS = :OLD_IDPAIS and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 576
    Top = 250
  end
  object qryTipoAgre: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select '
      '     CodTipoCustAgreg,'
      '     DescCustAgreg'
      'From'
      '     TipoAgre')
    ValidateWithMask = True
    Left = 571
    Top = 405
  end
  object dsTipoAgre: TwwDataSource
    DataSet = qryTipoAgre
    Left = 494
    Top = 243
  end
  object qryEstado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select '
      '     CodEstado,'
      '     NomeEstado,'
      '     IdPais'
      'From'
      '     Estado')
    ValidateWithMask = True
    Left = 407
    Top = 329
  end
  object dsEstado: TwwDataSource
    DataSet = qryEstado
    Left = 407
    Top = 240
  end
  object qryCalsFisc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '              SUBSTR(CODFISCAL,2,2) AS CODFISC'
      'FROM'
      '   CLASFISC'
      'ORDER BY 1')
    ValidateWithMask = True
    Left = 314
    Top = 328
  end
  object qryAlmoxa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '        CODALMOXARIFADO,'
      '        DESCALMOX'
      'FROM'
      '        ALMOX'
      'WHERE'
      '        (IDPESSOA = :pIDPESS)'
      'ORDER BY DESCALMOX')
    ValidateWithMask = True
    Left = 634
    Top = 75
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
  object qrySitTrib: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SITUACAOTRIB,DESCSITUACAOTRIB'
      'FROM SITUACAOTRIBTABB'
      'ORDER BY 2 '
      ' ')
    ValidateWithMask = True
    Left = 322
    Top = 232
    object qrySitTribDESCSITUACAOTRIB: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 45
      FieldName = 'DESCSITUACAOTRIB'
      Origin = 'BASEDADOS.SITUACAOTRIBTABB.DESCSITUACAOTRIB'
      Size = 45
    end
    object qrySitTribSITUACAOTRIB: TFloatField
      DisplayWidth = 10
      FieldName = 'SITUACAOTRIB'
      Origin = 'BASEDADOS.SITUACAOTRIBTABB.SITUACAOTRIB'
      Visible = False
    end
  end
end
