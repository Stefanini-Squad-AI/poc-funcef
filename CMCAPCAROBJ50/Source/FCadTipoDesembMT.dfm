inherited frmCadTipoDesembMT: TfrmCadTipoDesembMT
  Left = 234
  Top = 157
  Caption = 'Cadastro de Tipo de Desembolso'
  ClientHeight = 502
  ClientWidth = 690
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 319
    Height = 416
    Enabled = False
    object Label6: TLabel
      Left = 312
      Top = 248
      Width = 39
      Height = 13
      Caption = 'Label6'
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 317
      Height = 34
      Align = alTop
      BevelInner = bvLowered
      Color = clGray
      TabOrder = 0
      object LbLTipoDesemb: TLabel
        Left = 43
        Top = 6
        Width = 209
        Height = 22
        Caption = 'Tipos de Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object treeDesemb: TCMTreeViewMT
      Left = 1
      Top = 35
      Width = 317
      Height = 380
      PodeNavegar = True
      DataSource = DsCdsTodos
      CampoChave = 'CODTIPRECDES'
      CampoDescricao = 'DESCRICAO'
      CampoTipo = 'ANASINT'
      OnClick = treeDesembClick
      OnChange = treeDesembChange
      Align = alClient
    end
  end
  object pnlEdicao: TPanel [1]
    Left = 319
    Top = 47
    Width = 371
    Height = 416
    Align = alRight
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 3
    object pgc1: TPageControl
      Left = 5
      Top = 46
      Width = 361
      Height = 365
      ActivePage = TbsGeral
      Align = alClient
      TabOrder = 0
      object TbsGeral: TTabSheet
        Caption = 'Geral'
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 353
          Height = 337
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 0
          object LblTipoAvalia: TLabel
            Left = 9
            Top = 243
            Width = 104
            Height = 13
            Caption = 'Tipo de Avaliação'
          end
          object Label2: TLabel
            Left = 6
            Top = 0
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object Label3: TLabel
            Left = 117
            Top = 0
            Width = 58
            Height = 13
            Caption = 'Descrição'
            FocusControl = dbedDescricao
          end
          object Bevel2: TBevel
            Left = 6
            Top = 239
            Width = 341
            Height = 7
            Shape = bsTopLine
          end
          object Bevel3: TBevel
            Left = 6
            Top = 288
            Width = 341
            Height = 9
            Shape = bsTopLine
          end
          object lbldias: TLabel
            Left = 4
            Top = 36
            Width = 190
            Height = 13
            Caption = ' Nº  dias úteis para o vencimento'
          end
          object ChkObrigaOrc: TDBCheckBox
            Left = 9
            Top = 129
            Width = 297
            Height = 17
            Caption = 'Indica a obrigação de FDO'
            DataField = 'FLGOBRIGARESERVA'
            DataSource = ds
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox1: TDBCheckBox
            Left = 9
            Top = 147
            Width = 274
            Height = 17
            Caption = 'Calcula Imposto para documento associado'
            DataField = 'FLGCALCULAIMPOSTO'
            DataSource = ds
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object CkbEfet: TDBCheckBox
            Left = 9
            Top = 165
            Width = 336
            Height = 17
            Caption = 'Corresponde a Um Tipo de Desembolso Operacional'
            DataField = 'FLGINDICARECDES'
            DataSource = ds
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object CmbTipoAvalia: TCMDBLookupCombo
            Left = 9
            Top = 261
            Width = 334
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOAVALIACAO'#9'50'#9'Descrição')
            DataField = 'IDTIPOAVALIACAO'
            DataSource = ds
            LookupTable = CdsTipoAvalia
            LookupField = 'IDTIPOAVALIACAO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbedCod: TwwDBEdit
            Left = 6
            Top = 15
            Width = 102
            Height = 21
            DataField = 'CODTIPRECDES'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = dbedCodExit
          end
          object dbedDescricao: TDBEdit
            Left = 109
            Top = 15
            Width = 240
            Height = 21
            DataField = 'DESCRICAO'
            DataSource = ds
            TabOrder = 1
          end
          object pnAnaSint: TPanel
            Left = 8
            Top = 79
            Width = 341
            Height = 43
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 4
            object sbtnAnalitico: TSpeedButton
              Left = 31
              Top = 4
              Width = 130
              Height = 34
              GroupIndex = 1
              Down = True
              Caption = '&Analítico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
                0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
                0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
                0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
                0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
                0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
                5555557FFFFF7755555555500000005555555577777775555555555555555555
                5555555555555555555555555555555555555555555555555555}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbtnAnaliticoClick
            end
            object sbtnSintetico: TSpeedButton
              Left = 172
              Top = 4
              Width = 130
              Height = 34
              GroupIndex = 1
              Caption = 'Sin&tético'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                5555555555555555555555555555555555555555555555555555555555555555
                555555555555555555555555555555555555555FFFFFFFFFF555550000000000
                55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
                B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
                000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
                555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
                55555575FFF75555555555700007555555555557777555555555555555555555
                5555555555555555555555555555555555555555555555555555}
              NumGlyphs = 2
              ParentFont = False
              OnClick = sbtnSinteticoClick
            end
          end
          object wwDBGrid1: TwwDBGrid
            Left = 17
            Top = 296
            Width = 333
            Height = 88
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsTipoRdCorresp
            KeyOptions = [dgAllowInsert]
            TabOrder = 9
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
            object wwDBGrid1IButton: TwwIButton
              Left = 0
              Top = 0
              Width = 13
              Height = 22
              AllowAllUp = True
            end
          end
          object dbchkAtivo: TDBCheckBox
            Left = 298
            Top = 54
            Width = 53
            Height = 17
            Caption = 'Ativo'
            DataField = 'ATIVO'
            DataSource = ds
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object wwDBSpinEdit7: TwwDBSpinEdit
            Left = 8
            Top = 49
            Width = 82
            Height = 21
            Increment = 1
            DataField = 'NUMDIASVENCTO'
            DataSource = ds
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object DBObrCotas: TDBCheckBox
            Left = 9
            Top = 183
            Width = 336
            Height = 17
            Caption = 'Obriga Quantidade de Cotas no Desembolso'
            DataField = 'FLGOBRQTDECOTAS'
            DataSource = ds
            TabOrder = 10
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbchkFLGFINANCHABITACIONAL: TDBCheckBox
            Left = 9
            Top = 201
            Width = 336
            Height = 17
            Caption = 'Uso exclusivo do Financiamento Habitacional'
            DataField = 'FLGFINANCHABITACIONAL'
            DataSource = ds
            TabOrder = 11
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object TbContabilizacao: TTabSheet
        Caption = 'Contabilização'
        object qrpContaContabil: TGroupBox
          Left = 0
          Top = 1
          Width = 352
          Height = 313
          Caption = 'Preencher para Integração com a Contabilidade'
          TabOrder = 0
          object Label1: TLabel
            Left = 24
            Top = 267
            Width = 248
            Height = 13
            Caption = 'Histórico Padrão Para Lançamento Contábil'
          end
          object CContabilPass: TCMProcuraMaskContabil
            Left = 8
            Top = 139
            Width = 337
            Height = 48
            Caption = ' Conta Crédito  '
            TabOrder = 0
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'PLACONTACREDITO'
            Mensagens.EmBranco = 'não pode estar em branco'
            Mensagens.NaoExiste = 'não existe'
            Mensagens.Sintetica = 'não pode ser sintética'
            Mensagens.Analitica = 'não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
          end
          object CContabil: TCMProcuraMaskContabil
            Left = 8
            Top = 17
            Width = 337
            Height = 48
            Caption = ' Conta Contábil '
            TabOrder = 1
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'PLACONTA'
            Mensagens.EmBranco = 'não pode estar em branco'
            Mensagens.NaoExiste = 'não existe'
            Mensagens.Sintetica = 'não pode ser sintética'
            Mensagens.Analitica = 'não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
          end
          object CMDBLookupCombo1: TCMDBLookupCombo
            Left = 16
            Top = 283
            Width = 305
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'HITDESCR1'#9'200'#9'Histórico')
            DataField = 'HITCODHIST'
            DataSource = ds
            LookupTable = CdsHistorico
            LookupField = 'HITCODHIST'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object GrpConta: TGroupBox
            Left = 9
            Top = 77
            Width = 337
            Height = 49
            Caption = ' Sub-Conta Contábil '
            TabOrder = 3
            object CMProcura1: TCMProcura
              Left = 6
              Top = 14
              Width = 325
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MostraMensagens = True
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              DataSource = ds
              DataField = 'CODSUBCONTA'
              LookupChave = 'CODSUBCONTA'
              LookupDescricao = 'NOMESUBCONTA'
              MontaSelect = MontaSubConta
              LookupTabela = 'SubConta'
              DataBaseName = 'BaseDados'
              ReadOnly = False
            end
          end
          object GrpContaPass: TGroupBox
            Left = 9
            Top = 200
            Width = 337
            Height = 49
            Caption = ' Sub-Conta Crédito '
            TabOrder = 4
            object CMProcura2: TCMProcura
              Left = 6
              Top = 14
              Width = 325
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MostraMensagens = True
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              DataSource = ds
              DataField = 'CODSUBCONTACRE'
              LookupChave = 'CODSUBCONTA'
              LookupDescricao = 'NOMESUBCONTA'
              MontaSelect = MontaSubContaCredito
              LookupTabela = 'SubConta'
              DataBaseName = 'BaseDados'
              ReadOnly = False
            end
          end
        end
      end
      object TbAlteradores: TTabSheet
        Caption = 'Alteradores'
        ImageIndex = 2
        OnEnter = TbAlteradoresEnter
        OnShow = TbAlteradoresShow
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 353
          Height = 337
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label5: TLabel
            Left = 112
            Top = 91
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object Label4: TLabel
            Left = 1
            Top = 91
            Width = 100
            Height = 13
            Caption = 'Ordem de cálculo'
          end
          object Label7: TLabel
            Left = 80
            Top = 192
            Width = 56
            Height = 13
            Caption = 'descricao'
          end
          object Label8: TLabel
            Left = 80
            Top = 496
            Width = 62
            Height = 13
            Caption = 'Percentual'
            FocusControl = dbedtPercentual
          end
          object btn1: TBitBtn
            Left = 8
            Top = 266
            Width = 145
            Height = 33
            Caption = 'Excluir Alteradores'
            TabOrder = 0
            OnClick = btn1Click
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
              840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
              0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF000000840000008400000084000000840000008400FF000000FF000000FFFF
              FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
              84000000FF000000FF000000FF000000FF000000FF0000008400FFFFFF00FFFF
              FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF000000FF000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF0000008400FF00
              0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000FF000000
              FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
              FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF000000FF000000
              FF000000FF00FF00FF00FFFFFF00FFFFFF000000FF000000FF0000008400FF00
              0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
              FF000000FF00FFFFFF00FFFFFF00FF00FF000000FF000000FF0000008400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF000000FF000000
              FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
              FF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF000000
              FF000000FF000000FF000000FF000000FF000000FF0000008400848484008484
              840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF000000FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
          object wwdg1: TwwDBGrid
            Left = 2
            Top = 128
            Width = 346
            Height = 135
            Selected.Strings = (
              'DESCRICAO'#9'33'#9'Descrição'#9'F'
              'PERCENTUAL'#9'10'#9'Percentual'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            OnRowChanged = wwdg1RowChanged
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsTipoCreDesembxAlterador
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap, dgMultiSelect]
            ParentFont = False
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
            object wwdg1IButton: TwwIButton
              Left = 0
              Top = 0
              Width = 13
              Height = 22
              AllowAllUp = True
            end
          end
          object edtORDEM: TwwDBSpinEdit
            Left = 1
            Top = 105
            Width = 105
            Height = 21
            Increment = 1
            Value = 1
            DataField = 'ORDEM'
            DataSource = dsTipoCreDesembxAlterador
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object edtPorcentagem: TDBRealEdit
            Left = 112
            Top = 104
            Width = 89
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            MaxLength = 6
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCENTUAL'
            DataSource = dsTipoCreDesembxAlterador
          end
          object grp_tpImposto: TGroupBox
            Left = 2
            Top = 47
            Width = 351
            Height = 37
            Caption = 'Tipo de Imposto'
            TabOrder = 4
            object rb1: TRadioButton
              Left = 15
              Top = 16
              Width = 56
              Height = 17
              Caption = 'IRRF'
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object rb2: TRadioButton
              Left = 84
              Top = 15
              Width = 133
              Height = 18
              Caption = 'Contribuição Social'
              TabOrder = 1
            end
            object rb3: TRadioButton
              Left = 239
              Top = 16
              Width = 58
              Height = 17
              Caption = 'INSS'
              TabOrder = 2
            end
          end
          object grp1: TGroupBox
            Left = 2
            Top = 2
            Width = 349
            Height = 46
            Align = alTop
            Caption = 'Alterador'
            TabOrder = 5
            object cmpAltCODALTERADOR: TCMProcura
              Left = 8
              Top = 14
              Width = 338
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MostraMensagens = True
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              OnApertouBotao = cmpAltCODALTERADORApertouBotao
              OnValidaDados = cmpAltCODALTERADORValidaDados
              DataSource = dsTipoCreDesembxAlterador
              DataField = 'CODALTERADOR'
              LookupChave = 'CODALTERADOR'
              LookupDescricao = 'DESCRICAO'
              MontaSelect = MontaTipoAlteradores
              LookupTabela = 'TIPOALTERADOR'
              DataBaseName = 'BASEDADOS'
              ReadOnly = False
            end
          end
          object dbedtPercentual: TDBEdit
            Left = 80
            Top = 640
            Width = 74
            Height = 21
            DataField = 'Percentual'
            DataSource = dsTipoCreDesembxAlterador
            TabOrder = 6
          end
        end
      end
    end
    object rgAtivoInativo: TRadioGroup
      Left = 5
      Top = 5
      Width = 361
      Height = 41
      Align = alTop
      Caption = 'Visualização dos Tipos de Desembolso'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Ativo'
        'Inativo'
        'Todos')
      TabOrder = 1
      OnClick = rgAtivoInativoClick
    end
  end
  inherited Dock972: TDock97
    Width = 690
    inherited Toolbar971: TToolbar97
      object SpbImportar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Copiar'
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFFFFF333FFFFF3330000000033300000333377777777F337777
          7FF330EFEFEF03307333703337F3FFFF7F37733377F330F4444E033333333033
          37F777737F333333F7F33099999903333330703337F333337F33333777FF309F
          FFF903333330000337F333337F33333777733099999903333330003337F3FF3F
          7F333337773330F44E0003333330033337F7737773333337733330EFEF003333
          3330333337FFFF7733333337333330000003333333333333377777733333FFFF
          FFFF3333333333300000000333333F3333377777777F333303333330EFEFEF03
          33337F333337F3FFFF7F333003333330F4444E0333377F333337F777737F3300
          03333330EFEFEF0333777F333337F3FFFF7F300003333330F4444E0337777F33
          3337F777737F330703333330EFEFEF03337773333337F3FF3F7F330333333330
          F44E0003337FF333FF37F7737773330733370330EFEF00333377FFF77337FFFF
          7733333000003330000003333337777733377777733333333333333333333333
          33333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = SpbImportarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 463
    Width = 690
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        Tag = 999999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 157
      DockPos = 157
      inherited bbtnCancelar: TBitBtn
        Tag = 999999
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 103
    TargetsData = (
      1
      2
      (
        ''
        'Items'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 31
    Top = 155
  end
  inherited ImlPadrao: TImageList
    Left = 320
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 120
    Top = 106
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = CdsAfterOpen
    Left = 84
    Top = 154
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'TIPORECEBDESEMB.CODCORRESP'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.ATIVO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Código Correspondente'
      'Rec\Pag'
      'Ativo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPORECEBDESEMB')
    CamposChave.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '35'
      '30'
      '1'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 333
    Top = 396
  end
  object CdsSubContaCre: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 204
    Top = 295
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 204
    Top = 247
  end
  object CdsHistorico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 236
    Top = 199
  end
  object CdsTipoAvalia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 204
    Top = 151
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 204
    Top = 103
  end
  object DsTipoRdCorresp: TwwDataSource
    DataSet = CdsTipoRdCorresp
    Left = 30
    Top = 200
  end
  object CdsTipoRdCorresp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsTipoRdCorrespAfterInsert
    BeforeDelete = CdsTipoRdCorrespBeforeDelete
    Left = 134
    Top = 200
  end
  object CdsTodos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsTodosAfterScroll
    Left = 136
    Top = 153
  end
  object DsCdsTodos: TwwDataSource
    DataSet = CdsTodos
    Left = 31
    Top = 251
  end
  object MontaSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SUBCONTA.NOMESUBCONTA'
      'SUBCONTA.CODSUBCONTA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Descrição'
      'Código Sub Conta')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 451
    Top = 397
  end
  object MontaSubContaCredito: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SUBCONTA.NOMESUBCONTA'
      'SUBCONTA.CODSUBCONTA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Descrição'
      'Código Sub Conta')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 387
    Top = 413
  end
  object MontaTipoAlteradores: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Tipos de Alteradores'
    Colunas.Strings = (
      'TIPOALTERADOR.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Alterador')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOALTERADOR')
    CamposChave.Strings = (
      'TIPOALTERADOR.CODALTERADOR')
    Filtro.Strings = (
      'TIPOALTERADOR.RECPAG = '#39'P'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '51')
    OperComparador.Strings = (
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 520
    Top = 415
  end
  object cdsTipoCreDesembxAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtstprvdr1'
    Left = 184
    Top = 351
  end
  object dsTipoCreDesembxAlterador: TDataSource
    DataSet = cdsTipoCreDesembxAlterador
    Left = 99
    Top = 333
  end
end
