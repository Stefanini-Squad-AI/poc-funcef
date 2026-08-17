inherited FrmCadContaContab: TFrmCadContaContab
  Left = 154
  Top = 110
  BorderStyle = bsSingle
  Caption = 'Integração Contábil / Financeira'
  ClientHeight = 507
  ClientWidth = 1025
  PixelsPerInch = 96
  TextHeight = 13
  object Label19: TLabel [0]
    Left = 265
    Top = 221
    Width = 39
    Height = 13
    Caption = 'Regra '
    Visible = False
  end
  object Label21: TLabel [1]
    Left = 401
    Top = 94
    Width = 80
    Height = 13
    Caption = 'Tipo de Titulo'
  end
  inherited pnlFundo: TPanel
    Top = 47
    Width = 1025
    Height = 421
    object PageControl1: TPageControl
      Left = 1
      Top = 129
      Width = 1023
      Height = 291
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Informações Contábeis '
        TabVisible = False
        object GrdDetalhe: TwwDBGrid
          Left = 0
          Top = 31
          Width = 1015
          Height = 252
          Selected.Strings = (
            'DATAVIGENCIA'#9'15'#9'Vigência'#9'F'
            'DESCSEGMENTACAO'#9'38'#9'Segmentação de Mercado'#9'F'
            'HISTLANCINVEST'#9'60'#9'Histórico do Lancamento '#9'F'
            'DESCTIPOOPERACAO'#9'60'#9'Tipo de Operação'#9'F'
            'DESCCARTINVEST'#9'60'#9'Carteira de Investimentos'#9'F'
            'CODTIPTITULO'#9'30'#9'Tipo de ação'#9'F'
            'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento'#9'F'
            'DESCITEMRENFIX'#9'40'#9'Item de Renda Fixa'#9'F'
            'DESCCLASSETIT'#9'30'#9'Classe do Título'#9'F'
            'DESCTIPOFUNDOINV'#9'60'#9'Tipo de Fundo'#9'F'
            'PLANPRVCONTABPATRO'#9'60'#9'Plano/Patrocinadora'#9'F'
            'DESCTIPODESPINV'#9'40'#9'Tipo de Rubrica'#9'F'
            'DESCINVESTIMENTO'#9'40'#9'Investimento'#9'F'
            'NOMEUSUARIO'#9'30'#9'Usuário'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = DsDetalhe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
          object GrdDetalheIButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 22
            AllowAllUp = True
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 31
          Width = 1015
          Height = 250
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel2: TPanel
            Left = 1
            Top = 1
            Width = 1013
            Height = 248
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object Panel3: TPanel
              Left = 919
              Top = 1
              Width = 93
              Height = 246
              Align = alRight
              TabOrder = 0
              object Dock978: TDock97
                Left = 7
                Top = 1
                Width = 85
                Height = 244
                AllowDrag = False
                BoundLines = [blLeft]
                Position = dpRight
                object Toolbar975: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97Detalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtOkDet: TBitBtn
                    Left = 0
                    Top = 0
                    Width = 80
                    Height = 27
                    Caption = '&OK'
                    Default = True
                    TabOrder = 0
                    OnClick = BtOkDetClick
                    Glyph.Data = {
                      BE060000424DBE06000000000000360400002800000024000000120000000100
                      0800000000008802000000000000000000000001000000010000000000000000
                      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                      A600000000000000000000000000000000000000000000000000000000000000
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
                      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      03030303030303030303030303030303030303030303FF030303030303030303
                      03030303030303040403030303030303030303030303030303F8F8FF03030303
                      03030303030303030303040202040303030303030303030303030303F80303F8
                      FF030303030303030303030303040202020204030303030303030303030303F8
                      03030303F8FF0303030303030303030304020202020202040303030303030303
                      0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                      0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                      040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                      03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                      FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                      0303030303030303030303FA0202020403030303030303030303030303F8FF03
                      03F8FF03030303030303030303030303FA020202040303030303030303030303
                      0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                      03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                      030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                      0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                      03030303FA0202030303030303030303030303030303F8FFF803030303030303
                      030303030303030303FA0303030303030303030303030303030303F803030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      0303}
                    NumGlyphs = 2
                  end
                  object BtCancDet: TBitBtn
                    Left = 0
                    Top = 27
                    Width = 80
                    Height = 27
                    Cancel = True
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BtCancDetClick
                    Glyph.Data = {
                      BE060000424DBE06000000000000360400002800000024000000120000000100
                      0800000000008802000000000000000000000001000000010000000000000000
                      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                      A600000000000000000000000000000000000000000000000000000000000000
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
                      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      0303F8F80303030303030303030303030303030303FF03030303030303030303
                      0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                      03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                      030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                      FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                      030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                      F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                      010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                      030101010101F80303030303030303030303F8FF0303030303F8030303030303
                      0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                      0303030303030303F90101010101F8030303030303030303030303F803030303
                      F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                      03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                      03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                      03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                      0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                      030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                      03030303030303030303030303030303030303030303030303F8F8F803030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      0303}
                    NumGlyphs = 2
                  end
                  object BtVoltaDet: TBitBtn
                    Left = 0
                    Top = 54
                    Width = 80
                    Height = 27
                    Cancel = True
                    Caption = '&Voltar'
                    TabOrder = 2
                    OnClick = BtCancDetClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                      FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                      C8807FF7777777777FF700000000000000007777777777777777333333333333
                      3333333333333333333333333333333333333333333333333333}
                    NumGlyphs = 2
                  end
                end
              end
            end
            object Panel4: TPanel
              Left = 1
              Top = 1
              Width = 918
              Height = 246
              Align = alClient
              Caption = 'Panel4'
              TabOrder = 1
              object PageControl2: TPageControl
                Left = 1
                Top = 95
                Width = 916
                Height = 150
                ActivePage = TabSheet2
                Align = alClient
                HotTrack = True
                TabOrder = 0
                object TabSheet2: TTabSheet
                  Caption = 'Contabilidade'
                  object Bevel4: TBevel
                    Left = 0
                    Top = 0
                    Width = 908
                    Height = 122
                    Align = alClient
                  end
                  object PageControl3: TPageControl
                    Left = 0
                    Top = 0
                    Width = 908
                    Height = 122
                    ActivePage = TabSheet4
                    Align = alClient
                    HotTrack = True
                    TabOrder = 0
                    object TabSheet4: TTabSheet
                      Caption = 'Débito'
                      object Bevel1: TBevel
                        Left = 0
                        Top = 0
                        Width = 900
                        Height = 94
                        Align = alClient
                      end
                      object Label3: TLabel
                        Left = 5
                        Top = 5
                        Width = 84
                        Height = 13
                        Caption = 'Conta Contábil'
                      end
                      object BtCCDebito: TSpeedButton
                        Left = 157
                        Top = 19
                        Width = 21
                        Height = 22
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -24
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
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
                        ParentFont = False
                        OnClick = BtCCDebitoClick
                      end
                      object Label8: TLabel
                        Left = 270
                        Top = 42
                        Width = 54
                        Height = 13
                        Caption = 'Atividade'
                      end
                      object LbSubConta: TLabel
                        Left = 5
                        Top = 42
                        Width = 55
                        Height = 13
                        Caption = 'Subconta'
                      end
                      object edContaContabilD: TMaskEdit
                        Left = 5
                        Top = 19
                        Width = 150
                        Height = 21
                        Color = clBtnFace
                        Enabled = False
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        OnChange = edContaContabilDChange
                      end
                      object lbDescricaoContaD: TPanel
                        Left = 184
                        Top = 19
                        Width = 450
                        Height = 21
                        Alignment = taLeftJustify
                        BevelOuter = bvLowered
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 1
                      end
                      object DbLkcBuscaAtividadeD: TwwDBLookupCombo
                        Left = 270
                        Top = 56
                        Width = 365
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOME'#9'40'#9'Nome '
                          'UNIDNEGOC'#9'10'#9'Código')
                        DataField = 'UNIDNEGOC'
                        DataSource = DsDetalhe
                        LookupTable = QryBuscaAtividade
                        LookupField = 'UNIDNEGOC'
                        Options = [loColLines, loRowLines, loTitles]
                        TabOrder = 3
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = False
                        ShowMatchText = True
                      end
                      object DbLkcSubContaD: TwwDBLookupCombo
                        Left = 5
                        Top = 56
                        Width = 257
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMESUBCONTA'#9'40'#9'Sub-Conta')
                        DataField = 'CODSUBCONTAD'
                        DataSource = DsDetalhe
                        LookupTable = QrySubConta
                        LookupField = 'CODSUBCONTA'
                        Options = [loColLines, loRowLines, loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = False
                      end
                    end
                    object TabSheet5: TTabSheet
                      Caption = 'Crédito '
                      object Bevel2: TBevel
                        Left = 0
                        Top = 0
                        Width = 900
                        Height = 94
                        Align = alClient
                      end
                      object Label10: TLabel
                        Left = 5
                        Top = 5
                        Width = 84
                        Height = 13
                        Caption = 'Conta Contábil'
                      end
                      object Label6: TLabel
                        Left = 270
                        Top = 42
                        Width = 54
                        Height = 13
                        Caption = 'Atividade'
                      end
                      object Label12: TLabel
                        Left = 5
                        Top = 42
                        Width = 55
                        Height = 13
                        Caption = 'Subconta'
                      end
                      object BtCCCredito: TSpeedButton
                        Left = 157
                        Top = 19
                        Width = 21
                        Height = 22
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -24
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
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
                        ParentFont = False
                        OnClick = BtCCCreditoClick
                      end
                      object edContaContabil: TMaskEdit
                        Left = 5
                        Top = 19
                        Width = 150
                        Height = 21
                        Color = clBtnFace
                        Enabled = False
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 0
                        OnChange = edContaContabilChange
                      end
                      object lbDescricaoConta: TPanel
                        Left = 184
                        Top = 19
                        Width = 450
                        Height = 21
                        Alignment = taLeftJustify
                        BevelOuter = bvLowered
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 1
                      end
                      object DbLkcBuscaAtividade: TwwDBLookupCombo
                        Left = 270
                        Top = 56
                        Width = 365
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOME'#9'40'#9'Nome '
                          'UNIDNEGOC'#9'10'#9'Código')
                        DataField = 'UNIDNEGOC'
                        DataSource = DsDetalhe
                        LookupTable = QryBuscaAtividade
                        LookupField = 'UNIDNEGOC'
                        Options = [loColLines, loRowLines, loTitles]
                        Enabled = False
                        TabOrder = 3
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = False
                        ShowMatchText = True
                      end
                      object DbLkcSubConta: TwwDBLookupCombo
                        Left = 5
                        Top = 56
                        Width = 257
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMESUBCONTA'#9'40'#9'Sub-Conta')
                        DataField = 'CODSUBCONTAC'
                        DataSource = DsDetalhe
                        LookupTable = QrySubConta
                        LookupField = 'CODSUBCONTA'
                        Options = [loColLines, loRowLines, loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = False
                        ShowMatchText = True
                      end
                    end
                  end
                end
                object TabSheet3: TTabSheet
                  Caption = 'Contas a Pagar e Receber'
                  object Bevel3: TBevel
                    Left = 0
                    Top = 0
                    Width = 908
                    Height = 122
                    Align = alClient
                  end
                  object Label13: TLabel
                    Left = 286
                    Top = 7
                    Width = 122
                    Height = 13
                    Caption = 'Tipo do Recebimento'
                  end
                  object Label9: TLabel
                    Left = 286
                    Top = 46
                    Width = 164
                    Height = 13
                    Caption = 'Centro de Responsabilidade '
                  end
                  object Label11: TLabel
                    Left = 285
                    Top = 85
                    Width = 92
                    Height = 13
                    Caption = 'Centro de Custo'
                  end
                  object DBcboTipoRecebimento: TwwDBLookupCombo
                    Left = 286
                    Top = 22
                    Width = 357
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'40'#9'Tipo de Recebimento'#9'F')
                    DataField = 'CODTIPRECDES'
                    DataSource = DsDetalhe
                    LookupTable = QryTipoRecebDesem
                    LookupField = 'CODTIPRECDES'
                    Options = [loColLines, loRowLines, loTitles]
                    Style = csDropDownList
                    DropDownCount = 4
                    DropDownWidth = 8
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dbRGTipoLancamento: TDBRadioGroup
                    Left = 13
                    Top = 11
                    Width = 257
                    Height = 111
                    Caption = ' Tipo de Lançamento '
                    DataField = 'RECPAG'
                    DataSource = DsDetalhe
                    Enabled = False
                    Items.Strings = (
                      'Recebimento '
                      'Desembolso')
                    TabOrder = 0
                    Values.Strings = (
                      'R'
                      'P')
                    OnChange = dbRGTipoLancamentoChange
                  end
                  object DbLkcCentRespon: TwwDBLookupCombo
                    Left = 286
                    Top = 61
                    Width = 357
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'40'#9'Nome'
                      'CODCENTRORESPON'#9'10'#9'Código')
                    DataField = 'CODCENTRORESPON'
                    DataSource = DsDetalhe
                    LookupTable = QryBuscaCentRespon
                    LookupField = 'CODCENTRORESPON'
                    Options = [loColLines, loRowLines, loTitles]
                    Style = csDropDownList
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object DbCmbCCusto: TwwDBLookupCombo
                    Left = 285
                    Top = 99
                    Width = 358
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'40'#9'Nome do Centro de Custo'
                      'CODCENTROCUSTO'#9'10'#9'Código')
                    DataField = 'CENCUSTCINVEST'
                    DataSource = DsDetalhe
                    LookupTable = QryCCusto
                    LookupField = 'CODCENTROCUSTO'
                    Options = [loColLines, loRowLines, loTitles]
                    ParentFont = False
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                    ShowMatchText = True
                  end
                end
              end
              object Panel5: TPanel
                Left = 1
                Top = 1
                Width = 916
                Height = 94
                Align = alTop
                TabOrder = 1
                object Label14: TLabel
                  Left = 9
                  Top = 42
                  Width = 103
                  Height = 13
                  Caption = 'Tipo Lançamento '
                end
                object Label1: TLabel
                  Left = 9
                  Top = 6
                  Width = 146
                  Height = 13
                  Caption = 'Histórico do Lançamento '
                end
                object Label20: TLabel
                  Left = 272
                  Top = 42
                  Width = 153
                  Height = 13
                  Caption = 'Tipo de Operação Contábil'
                end
                object DbLkTipoOperacao: TwwDBLookupCombo
                  Left = 272
                  Top = 56
                  Width = 372
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO'#9'F')
                  DataField = 'TIPCODIGO'
                  DataSource = DsDetalhe
                  LookupTable = QryTipoPer
                  LookupField = 'TIPCODIGO'
                  Style = csDropDownList
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                end
                object DbLkcTipoLancamento: TwwDBComboBox
                  Left = 9
                  Top = 56
                  Width = 256
                  Height = 21
                  ShowButton = True
                  Style = csDropDownList
                  MapList = True
                  AllowClearKey = False
                  AutoDropDown = True
                  ShowMatchText = True
                  DataField = 'FLGPAGRECNAO'
                  DataSource = DsDetalhe
                  DropDownCount = 8
                  ItemHeight = 0
                  Items.Strings = (
                    'Contas a Pagar'#9'P'
                    'Contas a Receber '#9'R'
                    'Nenhum'#9'N')
                  Sorted = False
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  OnChange = DbLkcTipoLancamentoChange
                end
                object dbeHistoricolancto: TDBEdit
                  Left = 9
                  Top = 19
                  Width = 635
                  Height = 21
                  DataField = 'HISTLANCINVEST'
                  DataSource = DsDetalhe
                  TabOrder = 0
                end
              end
            end
          end
        end
        object Dock977: TDock97
          Left = 0
          Top = 0
          Width = 1015
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object Toolbar974: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object BtIncDet: TSpeedButton
              Left = 0
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Inserir novo registro|'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = BtIncDetClick
            end
            object BtAltDet: TSpeedButton
              Left = 25
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Alterar o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
                000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
                00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
                F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
                0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
                FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
                FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
                0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
                00333377737FFFFF773333303300000003333337337777777333}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = BtAltDetClick
            end
            object BtDelDet: TSpeedButton
              Left = 50
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Remover o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = BtDelDetClick
            end
          end
        end
      end
    end
    object PnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 1023
      Height = 128
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblItemDeRendaFixa: TLabel
        Left = 557
        Top = 50
        Width = 111
        Height = 13
        Caption = 'Item de Renda Fixa'
      end
      object lblClasseDoTitulo: TLabel
        Left = 264
        Top = 89
        Width = 94
        Height = 13
        Caption = 'Classe do Título'
      end
      object lblTipoDoTitulo: TLabel
        Left = 557
        Top = 49
        Width = 77
        Height = 13
        Caption = 'Tipo de Ação'
      end
      object Label2: TLabel
        Left = 6
        Top = 4
        Width = 124
        Height = 13
        Caption = 'Tipo de Investimento '
      end
      object Label17: TLabel
        Left = 557
        Top = 4
        Width = 145
        Height = 13
        Caption = 'Carteira de Investimentos'
      end
      object lblTipodeRubrica: TLabel
        Left = 264
        Top = 89
        Width = 92
        Height = 13
        Caption = 'Tipo de Rubrica'
      end
      object Label5: TLabel
        Left = 264
        Top = 4
        Width = 107
        Height = 13
        Caption = 'Tipo de Operação '
      end
      object lblInvestimento: TLabel
        Left = 6
        Top = 90
        Width = 73
        Height = 13
        Caption = 'Investimento'
        Visible = False
      end
      object lblPlanPatro: TLabel
        Left = 6
        Top = 48
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object lbltipofundo: TLabel
        Left = 557
        Top = 49
        Width = 83
        Height = 13
        Caption = 'Tipo de Fundo'
        Visible = False
      end
      object lblfundo: TLabel
        Left = 7
        Top = 89
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object lblDataVigencia: TLabel
        Left = 557
        Top = 89
        Width = 99
        Height = 13
        Caption = 'Data de Vigência'
      end
      object Label4: TLabel
        Left = 264
        Top = 48
        Width = 149
        Height = 13
        Caption = 'Segmentação de Mercado'
      end
      object DbLkcTipoDespesa: TwwDBLookupCombo
        Left = 264
        Top = 104
        Width = 282
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPODESPINV'#9'40'#9'Tipo de Rubrica')
        LookupTable = QryTipoDespesa
        LookupField = 'IDTIPODESPINVEST'
        Options = [loRowLines]
        TabOrder = 12
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = DbLkcTipoDespesaChange
      end
      object dblkClasseDoTitulo: TwwDBLookupCombo
        Left = 264
        Top = 104
        Width = 282
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSETIT'#9'30'#9'Classe do Título'#9'F')
        LookupTable = qryClasseDoTitulo
        LookupField = 'IDCLASSETIT'
        Options = [loRowLines]
        TabOrder = 11
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblkClasseDoTituloChange
        OnExit = dblkClasseDoTituloExit
      end
      object dblkItemRenFix: TwwDBLookupCombo
        Left = 557
        Top = 64
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCITEMRENFIX'#9'60'#9'Item de Renda Fixa'#9'F')
        LookupTable = qryItemRenfix
        LookupField = 'IDITEMRENFIX'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblkItemRenFixChange
      end
      object DbLkcTipoTitulo: TwwDBLookupCombo
        Left = 557
        Top = 64
        Width = 347
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTITULO'#9'40'#9'Tipo de Titulo'#9'F')
        LookupTable = QryTipoTitulo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loRowLines]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = DbLkcTipoTituloChange
        OnExit = DbLkcTipoTituloExit
      end
      object DbLkcInvestRenFix: TwwDBLookupCombo
        Left = 6
        Top = 104
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Investimento'#9'F')
        LookupTable = qryInvestRenFix
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = DbLkcInvestRenFixChange
      end
      object DbLkcInvestimento: TwwDBLookupCombo
        Left = 6
        Top = 104
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Investimento'#9'F')
        LookupTable = QryBuscaInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loRowLines]
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = DbLkcInvestimentoChange
      end
      object DbLkcTipoOperacao: TwwDBLookupCombo
        Left = 264
        Top = 19
        Width = 282
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO'#9'F')
        LookupTable = QryBuscaTipoOperacao
        LookupField = 'IDTIPOOPERACAO'
        Options = [loRowLines]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = DbLkcTipoOperacaoChange
      end
      object DbLkcCarteira: TwwDBLookupCombo
        Left = 557
        Top = 19
        Width = 347
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Carteira de Investimentos')
        LookupTable = QryCarteiraInvest
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loRowLines]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = DbLkcCarteiraChange
      end
      object DbLkcTipoInvestimento: TwwDBLookupCombo
        Left = 6
        Top = 19
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOINVEST'#9'40'#9'Tipo de Investimento ')
        LookupTable = QryBuscaTipoInvestimento
        LookupField = 'IDTIPOINVEST'
        Options = [loRowLines]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DbLkcTipoInvestimentoCloseUp
        OnExit = DbLkcTipoInvestimentoExit
      end
      object dblkcPlanoPatro: TwwDBLookupCombo
        Left = 7
        Top = 64
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patrocinadora'#9'F')
        LookupTable = qryPlanoPatro
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loRowLines]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblkcPlanoPatroChange
      end
      object dblcFundoInvest: TwwDBLookupCombo
        Left = 7
        Top = 104
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'60'#9'Fundo de Investimento'#9'F')
        LookupTable = QryBuscaFundoInvest
        LookupField = 'IDFUNDOINVEST'
        TabOrder = 10
        Visible = False
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcFundoInvestChange
      end
      object DbLkcDataVigencia: TwwDBLookupCombo
        Left = 557
        Top = 104
        Width = 114
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DATAVIGENCIA'#9'18'#9'DATAVIGENCIA'#9'F')
        LookupTable = qryVigencia
        LookupField = 'DATAVIGENCIA'
        Options = [loRowLines]
        TabOrder = 13
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = DbLkcDataVigenciaChange
      end
      object DbLkcSegmentacao: TwwDBLookupCombo
        Left = 264
        Top = 64
        Width = 282
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCSEGMENTACAO'#9'33'#9'DESCSEGMENTACAO'#9'F')
        LookupTable = qrySegmentacao
        LookupField = 'IDSEGMENTACAO'
        Options = [loRowLines]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = wwDBLookupCombo1Change
        OnExit = DbLkcSegmentacaoExit
      end
      object DbLkcTipoAcao: TwwDBLookupCombo
        Left = 557
        Top = 64
        Width = 347
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODTIPOACAO'#9'5'#9'CODTIPOACAO'#9'F')
        LookupTable = qryTipoAcao
        LookupField = 'CODTIPOACAO'
        Options = [loRowLines]
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = DbLkcTipoTituloChange
        OnExit = DbLkcTipoTituloExit
      end
    end
  end
  inherited Dock971: TDock97
    Top = 468
    Width = 1025
    inherited tb97Fundo: TToolbar97
      Left = 297
      DockPos = 297
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 128
      DockPos = 128
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
      end
    end
  end
  object Dock972: TDock97 [4]
    Left = 0
    Top = 0
    Width = 1025
    Height = 47
    AllowDrag = False
    Background.Data = {
      760F0000424D760F0000000000007600000028000000800000003C0000000100
      040000000000000F000000000000000000001000000000000000000000008080
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      777777777777171717777777777777177771777777777777777077F7FF7FFFF7
      77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
      777777777771717717777777777777777717777777777777777777777FFFFF7F
      7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
      77777777777777171777777777777777717777777777777777777777777FF7FF
      7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
      7777777777771771777777777777777771777777777777777777777777777FFF
      FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
      777777777777771777777777777777777777777777777777777777777777777F
      F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
      7777777777777777777777777777777777777777777777777777777777777771
      77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
      7777777777777177777777777777777777777777777777777777777777777777
      777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
      7777777777777777771777777777777777777777777777777777777777777777
      7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
      7777777777777717771777777777777777777777777777777777777777777777
      77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
      7777777777777771777777777777777777777777777777777777777777777777
      777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
      7777777777777777777777777777777777777777777777777777777777777777
      777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
      7777777777777777177777777777777777777777777777777777777777777777
      7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
      7777777777777777717777777777777777777777777777777777777777777777
      7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
      7777777777777777777771777777777777777777777777777777777777777777
      7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
      F7F7777777777777771777777777177777777777777777777777777777777777
      77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
      777F7F7777777777777177177771717777777777777777777777777777777777
      77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
      77777F7F77777777777717771777777777777777777777777777777777777777
      777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
      1777777777777777777771717717777177777777777777777777777777777777
      777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
      7777777777771777777777177771777777777777777777777777777777777777
      77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
      7777777777777777777771777777777777777777777777777777777777777777
      777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
      7777777777171777777717777777777777777777777777777777777777777777
      77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
      7777777777777177777771777777777777777777777777777777777777777777
      777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
      7777777777777777777771177777777777777777777777777777777777777777
      7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
      7777777777777777777777777777777777777777777777777777777777777777
      7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
      7777777777777777777771717777777777777777777777777777777777777777
      777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
      7777777777777777777777171777777777777777777777777777777777777777
      71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
      7777777777777777777777177777777777777777777777777777777777777717
      77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
      77777777777777777777777777777777777F7777777777777777777777777171
      7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
      771777777777777777777777777777777177F777777777777777777777777717
      171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
      7777777777777777777777777777777777777F77777777777777777777777777
      77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
      7177777177777777777777777777777777777FF7F77771777777777777777777
      1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
      7777777717777777777777777777777777777777777777777777777777777777
      717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
      7177777777777777777777777777777777771777777777777777777777777777
      77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
      777777F777777777777777777777777777777777717177717777777777777777
      77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
      171777F7F7777777777777177777777777777777777777777777777777777777
      777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
      7777777F77777777777777777777777777777777777777777777777777777777
      77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
      7717777F77777777777777717177777777777777777777777777777777777777
      7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
      777777777F777777777777777717777777777777777777777777777777777777
      777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
      7777777777777777777777771777777777777777777777777777777777777777
      77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
      7777777777777777777777777717177777777771777777777777777777777777
      7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
      7777777777777177777777777777777777777717177777777777777777777777
      77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
      7777777777717777777777777717177777777777777777777777777777777777
      777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
      777777777717171717777777777777777777777771777777777F777777777777
      777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
      77777777171777777777777777777777777777777777777777F7F77777777777
      77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
      7777777777171777777777777777777777777777777777777777777777777777
      777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
      7777777717177777777777777777777777777777777777777777777777777777
      77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
      7777777777171777777777777777777777777777777777777777777777777777
      7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
      77777777777777777F7F77777717777777777777777777777777777771777777
      7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
      77777777777777777F7F7F777777777777777777777777777777771777777777
      77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
      777777777777777777FFF77F7777717777777777777777777777777777177777
      77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
      77F7777777777777777777F77777777777777777777777777777777777777777
      77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
      F77777777777777777777777F7F7777777777777777777777777777777777777
      777777777717777777777777777777777777717777777777777F7F7F7F77F77F
      77F77777777F77777717777777F7777777777777777777777777777777777777
      77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
      7F77F77777777F77777717777777777777777777777777777777777777777777
      7777777777771777777777777777777777777777777777777F77F7F7F777F777
      F77F777777777777771771777777771777777777777777777777777777777777
      777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
      F7F7777777777777777717171777777777777777777777777777777777777777
      77777777777771777777777777777177777777777771777777777777F777F777
      7777777777777777777171717177771777777777777777777777777777777777
      77777777777777777777777777777777777777777777777777777F7F7F7F7777
      F77F77F777777777777771771717177777777777777777777777777777777777
      7777777777777777777777777777777777777777777177777777}
    BackgroundTransparent = True
    BoundLines = [blTop, blBottom]
    object fcLOperador: TfcLabel
      Left = 741
      Top = 10
      Width = 0
      Height = 0
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clGrayText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taRightJustify
      TextOptions.LineSpacing = 0
      TextOptions.OutlineColor = clGreen
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
      Transparent = True
    end
    object DBText1: TDBText
      Left = 761
      Top = 9
      Width = 7
      Height = 24
      Align = alRight
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'NOMEUSUARIO'
      DataSource = DsDetalhe
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 0
      TabOrder = 0
      object sbtnInserir: TToolbarButton97
        Left = 0
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        DropdownArrow = False
        Caption = '&Inserir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        Visible = False
      end
      object sbtnAlterar: TToolbarButton97
        Left = 60
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Alterar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        Visible = False
      end
      object sbtnProcurar: TToolbarButton97
        Left = 180
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Procurar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnProcurarClick
      end
      object sbtnApagar: TToolbarButton97
        Left = 120
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Excluir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        Visible = False
      end
      object sbtnImprimir: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Imprimir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnImprimirClick
      end
      object sbtnCopiar: TToolbarButton97
        Left = 307
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Copiar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
          00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
          0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
          00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
          03FF3777773337777333333333333333333F3333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnCopiarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 630
    Top = 1
  end
  object QryBuscaTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsBuscaTipoInvestimento
    SQL.Strings = (
      
        'SELECT IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO, DESCTIPOOPERACAO' +
        ','
      '       NATUREZAOPERACAO, TIPOCUSTODIA'
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOINVEST = :IDTIPOINVEST'
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 286
    Top = 227
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object QryBuscaTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaTipoOperacaoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object QryBuscaTipoOperacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object QryBuscaTipoOperacaoIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
      Visible = False
    end
    object QryBuscaTipoOperacaoNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryBuscaTipoOperacaoTIPOCUSTODIA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCUSTODIA'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOCUSTODIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryBuscaTipoInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST, DESCTIPOINVEST'
      'FROM'
      '   TIPOINVEST'
      'WHERE'
      '   ('
      '    ((:sTipoInvest = '#39'A'#39') AND(IDTIPOINVEST = 2)) OR'
      '    ((:sTipoInvest = '#39'V'#39') AND(IDTIPOINVEST = 2)) OR'
      '    ((:sTipoInvest = '#39'B'#39') AND(IDTIPOINVEST = 8)) OR'
      '    ((:sTipoInvest = '#39'F'#39') AND(IDTIPOINVEST = 1)) OR'
      '    ((:sTipoInvest = '#39'I'#39') AND (IDTIPOINVEST IN (5,6,7,9,10)))'
      '   )'
      'ORDER BY DESCTIPOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 124
    Top = 219
    ParamData = <
      item
        DataType = ftString
        Name = 'sTipoInvest'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sTipoInvest'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sTipoInvest'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sTipoInvest'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sTipoInvest'
        ParamType = ptUnknown
      end>
    object QryBuscaTipoInvestimentoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryBuscaTipoInvestimentoDESCTIPOINVEST: TStringField
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
  end
  object DsBuscaTipoInvestimento: TwwDataSource
    DataSet = QryBuscaTipoInvestimento
    Left = 152
    Top = 59
  end
  object QryCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT X.CODCENTROCUSTO, C.NOME'
      ''
      'FROM   CONTASXCC X, CENTCUST C, PARAMCONTAB P, EMPRESAPROP E'
      ''
      'WHERE ( X.PLANO = P.PLANO ) '
      '  AND ( X.IDEMPRESA = E.IDPESSOA )   '
      '  AND'#9'( C.CODCENTROCUSTO = X.CODCENTROCUSTO )'
      ''
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 610
    Top = 226
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 560
    Top = 1
  end
  object QryBuscaAtividade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC, NOME   '
      ''
      'FROM UNIDNEGOCIO '
      ''
      'WHERE IDPESSOA = :IDPESSOA'
      ''
      'ORDER BY NOME ')
    ValidateWithMask = True
    Left = 508
    Top = 362
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaCentRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTRORESPON, NOME'
      ''
      'FROM CENTRESPON '
      ''
      'WHERE IDPESSOA = :IDPESSOA'
      ''
      'ORDER BY NOME ')
    ValidateWithMask = True
    Left = 623
    Top = 374
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object DsDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = QryDetalhe
    OnStateChange = DsDetalheStateChange
    Left = 248
    Top = 181
  end
  object QryDetalhe: TwwQuery
    Active = True
    CachedUpdates = True
    AfterOpen = QryDetalheAfterOpen
    AfterScroll = QryDetalheAfterScroll
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT DISTINCT TRIM(DECODE(PA.IDUSUARIO, NULL, DECODE(US.NOMEUS' +
        'UARIO, NULL,PA.TRGUSERINCLUSAO , US.NOMEUSUARIO),'
      '                            UA.NOMEUSUARIO)) AS NOMEUSUARIO,'
      
        '       PA.IDPADRLANCCONT,  PA.IDTIPOINVEST,   PA.IDTIPOOPERACAO,' +
        '   PA.HISTLANCINVEST,'
      
        '       PA.IDEMPRESA,       PA.IDPESSOA,       PA.PLANO,         ' +
        '   PA.CONTADOPERFIN,'
      
        '       PA.CONTACOPERFIN,   PA.TIPLANCINVEST,  PA.CENCUSTDINVEST,' +
        '   PA.CENCUSTCINVEST,'
      
        '       PA.CODCENTRORESPON, PA.RECPAG,         PA.CODTIPRECDES,  ' +
        '   PA.CODSUBCONTAC,'
      
        '       PA.CODSUBCONTAD,    PA.FLGPAGRECNAO,   PA.IDFORCLI,      ' +
        '   PA.TIPMOVCARTINV,'
      
        '       PA.UNIDNEGOC,       PA.CODTIPTITULO,   PA.IDCARTEIRAINVES' +
        'T, PA.IDTIPODESPINVEST,'
      
        '       PA.TIPCODIGO,       PA.IDINVESTIMENTO, PA.IDCLASSETIT,   ' +
        '   PA.IDITEMRENFIX,'
      '       PA.TRGUSERINCLUSAO, PA.IDUSUARIO, PA.DATAVIGENCIA,'
      
        '       TP.DESCTIPOOPERACAO,CI.DESCCARTINVEST, IT.DESCITEMRENFIX,' +
        '   CT.DESCCLASSETIT,'
      
        '       TD.DESCTIPODESPINV, PA.IDPLANPREVCTBPATR, PL.PLANPRVCONTA' +
        'BPATRO,'
      
        '       INV.DESCINVESTIMENTO,FI.DESCFUNDOINVEST,FI.IDFUNDOINVEST,' +
        ' SE.IDSEGMENTACAO, SE.DESCSEGMENTACAO, PA.IDTIPOFUNDOINVEST, TF.' +
        'DESCTIPOFUNDOINV'
      ''
      
        'FROM   PADRLANCCONTINV PA, TIPOOPERACAO TP, CARTEIRAINVEST CI, I' +
        'TEMRENFIX IT,'
      
        '       CLASSETITRENFIX CT, TIPODESPINVEST TD, USUARIOSISTEMA US,' +
        ' USUARIOSISTEMA UA,'
      
        '       VWPLANPREVCTBPATR PL,INVESTIMENTO INV, FUNDOINVEST FI, SE' +
        'GMENTACAOMERCADO SE, TIPOFUNDOINVEST TF'
      'WHERE  (PA.IDTIPOINVEST     = :IDTIPOINVEST)'
      '   AND (TP.IDTIPOINVEST     = :IDTIPOINVEST)'
      
        '   AND ((:IDTIPOOPERACAO    IS NULL) OR (PA.IDTIPOOPERACAO    = ' +
        ':IDTIPOOPERACAO))'
      
        '   AND ((:IDTIPOFUNDOINVEST      IS NULL) OR (PA.IDTIPOFUNDOINVE' +
        'ST      = :IDTIPOFUNDOINVEST))'
      
        '   AND ((:IDCARTEIRAINVEST  IS NULL) OR (PA.IDCARTEIRAINVEST  = ' +
        ':IDCARTEIRAINVEST))'
      
        '   AND ((:IDTIPODESPINVEST  IS NULL) OR (PA.IDTIPODESPINVEST  = ' +
        ':IDTIPODESPINVEST))'
      
        '   AND ((:IDINVESTIMENTO    IS NULL) OR (PA.IDINVESTIMENTO    = ' +
        ':IDINVESTIMENTO))'
      
        '   AND ((:IDCLASSETIT       IS NULL) OR (PA.IDCLASSETIT       = ' +
        ':IDCLASSETIT))'
      
        '   AND ((:IDITEMRENFIX      IS NULL) OR (PA.IDITEMRENFIX      = ' +
        ':IDITEMRENFIX))'
      
        '   AND ((:IDPLANPREVCTBPATR IS NULL) OR (PA.IDPLANPREVCTBPATR = ' +
        ':IDPLANPREVCTBPATR))'
      
        '   AND ((:IDFUNDOINVEST     IS NULL) OR (PA.IDFUNDOINVEST = :IDF' +
        'UNDOINVEST))'
      
        '   AND ((:DATAVIGENCIA      IS NULL) OR (PA.DATAVIGENCIA = :DATA' +
        'VIGENCIA))'
      
        '   AND ((:IDSEGMENTACAO     IS NULL) OR (PA.IDSEGMENTACAO = :IDS' +
        'EGMENTACAO))'
      
        '   AND ((:IDTIPOFUNDOINVEST   IS NULL) OR (PA.IDTIPOFUNDOINVEST ' +
        '= :IDTIPOFUNDOINVEST))'
      
        '   AND ((:IDPADRLANCCONT IS NULL)    OR (PA.IDPADRLANCCONT = :ID' +
        'PADRLANCCONT))'
      
        '   AND ((:CODTIPTITULO IS NULL) OR (PA.CODTIPTITULO = :CODTIPTIT' +
        'ULO))'
      '   AND (PA.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO)'
      '   AND (PA.IDCARTEIRAINVEST   = CI.IDCARTEIRAINVEST(+))'
      '   AND (PA.IDITEMRENFIX       = IT.IDITEMRENFIX(+))'
      '   AND (PA.IDCLASSETIT        = CT.IDCLASSETIT(+))'
      '   AND (PA.IDTIPODESPINVEST   = TD.IDTIPODESPINVEST(+))'
      
        '   AND (US.IDUSUARIO(+)       = TO_NUMBER(DECODE(SUBSTR(PA.TRGUS' +
        'ERINCLUSAO,1,2),'#39'CM'#39',LTRIM(PA.TRGUSERINCLUSAO,'#39'CM'#39'),'#39#39')))'
      '   AND (UA.IDUSUARIO(+)       = PA.IDUSUARIO)'
      '   AND (PA.IDPLANPREVCTBPATR  = PL.IDPLANPREVCTBPATR(+))'
      '   AND (PA.IDINVESTIMENTO     = INV.IDINVESTIMENTO (+))'
      '   AND (PA.IDFUNDOINVEST      = FI.IDFUNDOINVEST (+))'
      '   AND (PA.IDSEGMENTACAO      = SE.IDSEGMENTACAO(+))'
      '   AND (PA.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST(+))'
      ''
      ''
      'ORDER BY PA.DATAVIGENCIA,SE.IDSEGMENTACAO,PA.HISTLANCINVEST'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDetalhe
    ValidateWithMask = True
    Left = 384
    Top = 333
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPODESPINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPODESPINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPADRLANCCONT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPADRLANCCONT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTIPTITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTIPTITULO'
        ParamType = ptUnknown
      end>
    object QryDetalheDATAVIGENCIA: TDateTimeField
      DisplayLabel = 'Vigência'
      DisplayWidth = 15
      FieldName = 'DATAVIGENCIA'
    end
    object QryDetalheDESCSEGMENTACAO: TStringField
      DisplayLabel = 'Segmentação de Mercado'
      DisplayWidth = 38
      FieldName = 'DESCSEGMENTACAO'
      Size = 35
    end
    object QryDetalheHISTLANCINVEST: TStringField
      DisplayLabel = 'Histórico do Lancamento '
      DisplayWidth = 60
      FieldName = 'HISTLANCINVEST'
      Size = 60
    end
    object QryDetalheDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryDetalheDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira de Investimentos'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object QryDetalheCODTIPTITULO: TStringField
      DisplayLabel = 'Tipo de ação'
      DisplayWidth = 30
      FieldName = 'CODTIPTITULO'
      Size = 5
    end
    object QryDetalheDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryDetalheDESCITEMRENFIX: TStringField
      DisplayLabel = 'Item de Renda Fixa'
      DisplayWidth = 40
      FieldName = 'DESCITEMRENFIX'
      Size = 60
    end
    object QryDetalheDESCCLASSETIT: TStringField
      DisplayLabel = 'Classe do Título'
      DisplayWidth = 30
      FieldName = 'DESCCLASSETIT'
      Size = 30
    end
    object QryDetalheDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Tipo de Fundo'
      DisplayWidth = 60
      FieldName = 'DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryDetalhePLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano/Patrocinadora'
      DisplayWidth = 60
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryDetalheDESCTIPODESPINV: TStringField
      DisplayLabel = 'Tipo de Rubrica'
      DisplayWidth = 40
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object QryDetalheDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryDetalheNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 30
      FieldName = 'NOMEUSUARIO'
    end
    object QryDetalheIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Visible = False
    end
    object QryDetalheIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryDetalheIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryDetalheIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object QryDetalheIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object QryDetalhePLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object QryDetalheCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Visible = False
      Size = 18
    end
    object QryDetalheCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Visible = False
      Size = 18
    end
    object QryDetalheCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Visible = False
      Size = 10
    end
    object QryDetalheCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Visible = False
      Size = 10
    end
    object QryDetalheFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Visible = False
      Size = 1
    end
    object QryDetalheCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Visible = False
      Size = 10
    end
    object QryDetalheRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      Size = 1
    end
    object QryDetalheCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object QryDetalheCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Visible = False
    end
    object QryDetalheCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Visible = False
    end
    object QryDetalheIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object QryDetalheTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Visible = False
      Size = 3
    end
    object QryDetalheTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Visible = False
      Size = 1
    end
    object QryDetalheUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object QryDetalheIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryDetalheIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Visible = False
    end
    object QryDetalheTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Visible = False
      Size = 2
    end
    object QryDetalheIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'PADRLANCCONTINV.IDINVESTIMENTO'
      Visible = False
    end
    object QryDetalheIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.PADRLANCCONTINV.IDCLASSETIT'
      Visible = False
    end
    object QryDetalheIDITEMRENFIX: TFloatField
      FieldName = 'IDITEMRENFIX'
      Origin = 'BASEDADOS.PADRLANCCONTINV.IDITEMRENFIX'
      Visible = False
    end
    object QryDetalheTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryDetalheIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Visible = False
    end
    object QryDetalheIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryDetalheIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryDetalheIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Visible = False
    end
    object QryDetalheIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
  end
  object QrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, CODSUBCONTA, NOMESUBCONTA'
      ''
      'FROM SUBCONTA'
      ''
      'WHERE ( IDPESSOA =:EMPRESAPROP )'
      ''
      'ORDER BY  NOMESUBCONTA')
    ValidateWithMask = True
    Left = 97
    Top = 370
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
  end
  object QryTipoRecebDesem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES, RECPAG, DESCRICAO'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '   ((ATIVO <> '#39'N'#39') OR (ATIVO IS NULL))'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 639
    Top = 300
    object QryTipoRecebDesemDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Recebimento'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object QryTipoRecebDesemCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object QryTipoRecebDesemRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object MontaSelectConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLAREDUZ'
      'PLANOCONTA.PLATIPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Reduzido'
      'Sintética/Analítica')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOCONTA')
    CamposChave.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLASUBCONTA'
      'PLANOCONTA.PLACCUST'
      'PLANOCONTA.PLATIPO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '50'
      '20'
      '1')
    OperComparador.Strings = (
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
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 86
    Top = 273
  end
  object QryCCustoD_Desuso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'X.CODCENTROCUSTO, C.NOME'
      ''
      'FROM'#9'CONTASXCC X, CENTCUST C'
      ''
      'WHERE '#9'(( X.PLANO =:PLANO ) '#9'       AND'
      '   '#9' ( RTRIM(X.PLACONTA) =:CONTA ) AND'
      '   '#9' ( X.IDEMPRESA =:EMPRESAPROP ))   AND'
      '   '#9'(( C.CODCENTROCUSTO = X.CODCENTROCUSTO ))'
      ''
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 728
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
  end
  object QryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 601
    Top = 1
  end
  object QryCarteiraInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARTEIRAINVEST, DESCCARTINVEST'
      'FROM CARTEIRAINVEST'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 726
    Top = 59
    object QryCarteiraInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
    end
    object QryCarteiraInvestDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
  end
  object QryTipoDespesa: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsBuscaTipoOperacao
    SQL.Strings = (
      'SELECT T.IDTIPODESPINVEST, T.DESCTIPODESPINV'
      'FROM TIPODESPINVEST T, DESPESASXTIPOOPER D'
      'WHERE D.IDTIPOOPERACAO   = :IDTIPOOPERACAO'
      '  AND T.IDTIPODESPINVEST = D.IDTIPODESPINVEST'
      ''
      'UNION'
      ''
      'SELECT T1.IDTIPODESPINVEST, T1.DESCTIPODESPINV'
      'FROM TIPODESPINVEST T1'
      'WHERE T1.IDTIPODESPINVEST < 0'
      ''
      'ORDER BY 2'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 718
    Top = 118
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object QryTipoDespesaIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
    object QryTipoDespesaDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
  end
  object DsBuscaTipoOperacao: TwwDataSource
    DataSet = QryBuscaTipoOperacao
    Left = 530
    Top = 283
  end
  object QryTipoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDTIPOFUNDOINVEST, '
      '  DESCTIPOFUNDOINV AS DESCTITULO,'
      '  IDSEGMENTACAO '
      'FROM '
      '  TIPOFUNDOINVEST'
      'WHERE '
      '  ((:IDTIPOINVEST IS NULL) OR (IDTIPOINVEST = :IDTIPOINVEST))'
      
        'AND ((:IDSEGMENTACAO IS NULL) OR (IDSEGMENTACAO =:IDSEGMENTACAO)' +
        ')')
    ValidateWithMask = True
    Left = 602
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end>
    object QryTipoTituloDESCTITULO: TStringField
      DisplayLabel = 'Tipo de Titulo'
      DisplayWidth = 40
      FieldName = 'DESCTITULO'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryTipoTituloIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PADRLANCCONTINV.HISTLANCINVEST'
      'TIPOINVEST.DESCTIPOINVEST'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'TIPOACAO.DESCTIPOACAO||TIPOTITRENFIXA.DESCTIPRENFIXA'
      'CARTEIRAINVEST.DESCCARTINVEST'
      'TIPODESPINVEST.DESCTIPODESPINV'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CLASSETITRENFIX.DESCCLASSETIT'
      'ITEMRENFIX.DESCITEMRENFIX'
      
        'DECODE(USUARIOSISTEMA.NOMEUSUARIO,'#39#39',PADRLANCCONTINV.TRGUSERINCL' +
        'USAO,USUARIOSISTEMA.NOMEUSUARIO)'
      'VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      'PADRLANCCONTINV.DATAVIGENCIA'
      'SEGMENTACAOMERCADO.DESCSEGMENTACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Histórico de Lançamento'
      'Tipo de Investimento'
      'Tipo de Operação'
      'Tipo de Titulo'
      'Carteira de Investimento'
      'Tipo de Rubrica'
      'Investimento'
      'Classe do Título'
      'Item de Renda Fixa'
      'Operador'
      'Plano/Patrocinadora'
      'Data de Vigência'
      'Segmentacao de Mercado')
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
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PADRLANCCONTINV'
      'TIPOINVEST'
      'TIPOOPERACAO'
      'TIPOACAO'
      'TIPOTITRENFIXA'
      'CARTEIRAINVEST'
      'TIPODESPINVEST'
      'INVESTIMENTO'
      'CLASSETITRENFIX'
      'ITEMRENFIX'
      'USUARIOSISTEMA'
      'VWPLANPREVCTBPATR'
      'SEGMENTACAOMERCADO')
    CamposChave.Strings = (
      'PADRLANCCONTINV.IDTIPOINVEST'
      'PADRLANCCONTINV.IDTIPOOPERACAO'
      'PADRLANCCONTINV.IDTIPOFUNDOINVEST'
      'PADRLANCCONTINV.IDCARTEIRAINVEST'
      'PADRLANCCONTINV.IDTIPODESPINVEST'
      'PADRLANCCONTINV.IDINVESTIMENTO'
      'PADRLANCCONTINV.IDCLASSETIT'
      'PADRLANCCONTINV.IDITEMRENFIX'
      'PADRLANCCONTINV.IDPLANPREVCTBPATR'
      'PADRLANCCONTINV.DATAVIGENCIA'
      'PADRLANCCONTINV.IDSEGMENTACAO'
      'PADRLANCCONTINV.IDPADRLANCCONT')
    Filtro.Strings = (
      'PADRLANCCONTINV.IDTIPOINVEST=TIPOINVEST.IDTIPOINVEST(+)'
      'PADRLANCCONTINV.IDTIPOOPERACAO=TIPOOPERACAO.IDTIPOOPERACAO(+)'
      'PADRLANCCONTINV.CODTIPTITULO=TIPOACAO.CODTIPOACAO(+)'
      'PADRLANCCONTINV.CODTIPTITULO=TIPOTITRENFIXA.CODTIPRENFIXA(+)'
      
        'PADRLANCCONTINV.IDCARTEIRAINVEST=CARTEIRAINVEST.IDCARTEIRAINVEST' +
        '(+)'
      
        'PADRLANCCONTINV.IDTIPODESPINVEST=TIPODESPINVEST.IDTIPODESPINVEST' +
        '(+)'
      'PADRLANCCONTINV.IDINVESTIMENTO=INVESTIMENTO.IDINVESTIMENTO(+)'
      'PADRLANCCONTINV.IDITEMRENFIX=ITEMRENFIX.IDITEMRENFIX(+)'
      'PADRLANCCONTINV.IDCLASSETIT = CLASSETITRENFIX.IDCLASSETIT(+)'
      
        'USUARIOSISTEMA.IDUSUARIO(+) = TO_NUMBER(DECODE(SUBSTR(PADRLANCCO' +
        'NTINV.TRGUSERINCLUSAO,1,2),'#39'CM'#39',LTRIM(PADRLANCCONTINV.TRGUSERINC' +
        'LUSAO,'#39'CM'#39'),'#39#39'))'
      
        'PADRLANCCONTINV.IDPLANPREVCTBPATR=VWPLANPREVCTBPATR.IDPLANPREVCT' +
        'BPATR(+)'
      
        'PADRLANCCONTINV.IDSEGMENTACAO=SEGMENTACAOMERCADO.IDSEGMENTACAO(+' +
        ')')
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
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '30'
      '40'
      '30'
      '40'
      '30'
      '30'
      '30'
      '60'
      '15'
      '113'
      '18'
      '10')
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
      ''
      ''
      '')
    Left = 440
    Top = 1
  end
  object QryBuscaInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT INV.IDINVESTIMENTO, INV.DESCINVESTIMENTO,'
      '       AC.CODTIPOACAO AS TIPOTITULO'
      'FROM INVESTIMENTO INV, ACAO AC'
      'WHERE (AC.CODTIPOACAO IS NOT NULL)'
      '  AND (INV.IDTIPOINVEST = 2)'
      
        '  AND ((:CODTIPTITULO  IS NULL) OR (AC.CODTIPOACAO = :CODTIPTITU' +
        'LO))'
      '  AND (INV.IDINVESTIMENTO = AC.IDACAO(+) )'
      ''
      'ORDER BY DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 119
    Top = 163
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPTITULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODTIPTITULO'
        ParamType = ptInput
      end>
    object QryBuscaInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryBuscaInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryBuscaInvestimentoTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Visible = False
      Size = 5
    end
  end
  object DsTipoTitulo: TwwDataSource
    DataSet = QryTipoTitulo
    Left = 728
    Top = 214
  end
  object qryClasseDoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCLASSETIT,DESCCLASSETIT'
      'FROM CLASSETITRENFIX'
      ''
      'ORDER BY DESCCLASSETIT')
    ValidateWithMask = True
    Left = 426
    Top = 166
    object qryClasseDoTituloDESCCLASSETIT: TStringField
      DisplayLabel = 'Classe do Título'
      DisplayWidth = 30
      FieldName = 'DESCCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.DESCCLASSETIT'
      Size = 30
    end
    object qryClasseDoTituloIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.IDCLASSETIT'
      Visible = False
    end
  end
  object qryItemRenfix: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDITEMRENFIX, DESCITEMRENFIX'
      'FROM ITEMRENFIX'
      ''
      'ORDER BY DESCITEMRENFIX')
    ValidateWithMask = True
    Left = 524
    Top = 222
    object qryItemRenfixDESCITEMRENFIX: TStringField
      DisplayLabel = 'Item de Renda Fixa'
      DisplayWidth = 60
      FieldName = 'DESCITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.DESCITEMRENFIX'
      Size = 60
    end
    object qryItemRenfixIDITEMRENFIX: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.IDITEMRENFIX'
      Visible = False
    end
  end
  object qryInvestRenFix: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT INV.IDINVESTIMENTO, INV.DESCINVESTIMENTO'
      'FROM   INVESTIMENTO INV'
      'WHERE  IDTIPOINVEST = 1'
      '  AND  ((:IDCLASSETIT IS NULL) OR (IDCLASSETIT = :IDCLASSETIT))'
      ''
      'ORDER BY DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 187
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end>
    object qryInvestRenFixDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestRenFixIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update PADRLANCCONTINV'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  HISTLANCINVEST = :HISTLANCINVEST,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLANO = :PLANO,'
      '  CONTADOPERFIN = :CONTADOPERFIN,'
      '  CONTACOPERFIN = :CONTACOPERFIN,'
      '  TIPLANCINVEST = :TIPLANCINVEST,'
      '  CENCUSTDINVEST = :CENCUSTDINVEST,'
      '  CENCUSTCINVEST = :CENCUSTCINVEST,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  CODSUBCONTAC = :CODSUBCONTAC,'
      '  CODSUBCONTAD = :CODSUBCONTAD,'
      '  FLGPAGRECNAO = :FLGPAGRECNAO,'
      '  IDFORCLI = :IDFORCLI,'
      '  TIPMOVCARTINV = :TIPMOVCARTINV,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCLASSETIT = :IDCLASSETIT,'
      '  IDITEMRENFIX = :IDITEMRENFIX,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAVIGENCIA = :DATAVIGENCIA,'
      '  IDSEGMENTACAO =:IDSEGMENTACAO,'
      '  IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST,'
      '  CODTIPTITULO =:CODTIPTITULO'
      'where'
      '  IDPADRLANCCONT = :OLD_IDPADRLANCCONT'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into PADRLANCCONTINV'
      
        '  (IDPADRLANCCONT,IDTIPOINVEST, IDTIPOOPERACAO, HISTLANCINVEST, ' +
        'IDEMPRESA,'
      'IDPESSOA, PLANO,'
      '   CONTADOPERFIN, CONTACOPERFIN, TIPLANCINVEST, CENCUSTDINVEST,'
      'CENCUSTCINVEST,'
      '   CODCENTRORESPON, RECPAG, CODTIPRECDES, CODSUBCONTAC,'
      'CODSUBCONTAD, FLGPAGRECNAO,'
      '   IDFORCLI, TIPMOVCARTINV, UNIDNEGOC,'
      'IDCARTEIRAINVEST,'
      '   IDTIPODESPINVEST, TIPCODIGO, IDINVESTIMENTO, IDCLASSETIT,'
      'IDITEMRENFIX,'
      
        '   IDUSUARIO,IDPLANPREVCTBPATR,IDFUNDOINVEST,DATAVIGENCIA, IDSEG' +
        'MENTACAO,'
      'IDTIPOFUNDOINVEST, CODTIPTITULO)'
      'values'
      
        '  (:IDPADRLANCCONT, :IDTIPOINVEST, :IDTIPOOPERACAO, :HISTLANCINV' +
        'EST, :IDEMPRESA,'
      ':IDPESSOA,'
      '   :PLANO, :CONTADOPERFIN, :CONTACOPERFIN, :TIPLANCINVEST,'
      ':CENCUSTDINVEST,'
      '   :CENCUSTCINVEST, :CODCENTRORESPON, :RECPAG, :CODTIPRECDES,'
      ':CODSUBCONTAC,'
      '   :CODSUBCONTAD, :FLGPAGRECNAO, :IDFORCLI, :TIPMOVCARTINV,'
      ':UNIDNEGOC, :IDCARTEIRAINVEST, :IDTIPODESPINVEST, :TIPCODIGO,'
      '   :IDINVESTIMENTO,'
      
        ':IDCLASSETIT, :IDITEMRENFIX, :IDUSUARIO, :IDPLANPREVCTBPATR,:IDF' +
        'UNDOINVEST,'
      
        '  :DATAVIGENCIA, :IDSEGMENTACAO, :IDTIPOFUNDOINVEST, :CODTIPTITU' +
        'LO)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from PADRLANCCONTINV'
      'where'
      '  IDPADRLANCCONT = :OLD_IDPADRLANCCONT')
    Left = 300
    Top = 333
  end
  object qryCopiaParametro: TwwQuery
    CachedUpdates = True
    AfterOpen = QryDetalheAfterOpen
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    RequestLive = True
    SQL.Strings = (
      'INSERT INTO PADRLANCCONTINV'
      
        '      (IDPADRLANCCONT,  IDTIPOINVEST,   IDTIPOOPERACAO,   HISTLA' +
        'NCINVEST,'
      
        '       IDEMPRESA,       IDPESSOA,       PLANO,            CONTAD' +
        'OPERFIN,'
      
        '       CONTACOPERFIN,   TIPLANCINVEST,  CENCUSTDINVEST,   CENCUS' +
        'TCINVEST,'
      
        '       CODCENTRORESPON, RECPAG,         CODTIPRECDES,     CODSUB' +
        'CONTAC,'
      
        '       CODSUBCONTAD,    FLGPAGRECNAO,   IDFORCLI,         TIPMOV' +
        'CARTINV,'
      
        '       UNIDNEGOC,       CODTIPTITULO,   IDCARTEIRAINVEST, IDTIPO' +
        'DESPINVEST,'
      
        '       TIPCODIGO,   IDINVESTIMENTO, IDCLASSETIT,  IDITEMRENFIX, ' +
        'DATAVIGENCIA, IDSEGMENTACAO)'
      'VALUES'
      
        '      (:IDPADRLANCCONT,  :IDTIPOINVEST,   :IDTIPOOPERACAO,   :HI' +
        'STLANCINVEST,'
      
        '       :IDEMPRESA,       :IDPESSOA,       :PLANO,            :CO' +
        'NTADOPERFIN,'
      
        '       :CONTACOPERFIN,   :TIPLANCINVEST,  :CENCUSTDINVEST,   :CE' +
        'NCUSTCINVEST,'
      
        '       :CODCENTRORESPON, :RECPAG,         :CODTIPRECDES,     :CO' +
        'DSUBCONTAC,'
      
        '       :CODSUBCONTAD,    :FLGPAGRECNAO,   :IDFORCLI,         :TI' +
        'PMOVCARTINV,'
      
        '       :UNIDNEGOC,       :CODTIPTITULO,   :IDCARTEIRAINVEST, :ID' +
        'TIPODESPINVEST,'
      
        '       :TIPCODIGO,   :IDINVESTIMENTO, :IDCLASSETIT,  :IDITEMRENF' +
        'IX, (SELECT MAX(DATAVIGENCIA) FROM VIGENCIAINVCONTAB'
      
        '                                                                ' +
        '     WHERE DATAVIGENCIA <> (:DATAVIGENCIA)), :IDSEGMENTACAO )'
      ''
      '')
    ValidateWithMask = True
    Left = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPADRLANCCONT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'HISTLANCINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTADOPERFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTACOPERFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPLANCINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CENCUSTDINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CENCUSTCINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTRORESPON'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTAC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGPAGRECNAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPMOVCARTINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTIPTITULO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPODESPINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object QryTipoPer: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPCODIGO, TIPDESCRICAO'
      ''
      'FROM TIPOPER'
      ''
      'ORDER BY TIPDESCRICAO')
    ValidateWithMask = True
    Left = 436
    Top = 242
    object QryTipoPerTIPDESCRICAO: TStringField
      DisplayWidth = 25
      FieldName = 'TIPDESCRICAO'
      Origin = 'TIPOPER.TIPDESCRICAO'
      Size = 25
    end
    object QryTipoPerTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'TIPOPER.TIPCODIGO'
      Visible = False
      Size = 2
    end
  end
  object qryPlanoPatro: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'PLANPRVCONTABPATRO, IDPLANPREVCTBPATR'
      'FROM VWPLANPREVCTBPATR ')
    ValidateWithMask = True
    Left = 28
    Top = 106
    object qryPlanoPatroPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.IDPLANPREVCTBPATR'
      Visible = False
    end
  end
  object QryBuscaFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFUNDOINVEST,DESCFUNDOINVEST '
      'FROM FUNDOINVEST FI, TIPOFUNDOINVEST TFI'
      'WHERE FI.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST'
      '      AND  TFI.IDTIPOINVEST = :IDTIPOINVEST'
      ''
      'ORDER BY DESCFUNDOINVEST ')
    ValidateWithMask = True
    Left = 327
    Top = 283
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object QryBuscaFundoInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryBuscaFundoInvestIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
  end
  object DtsBuscaFundoInvest: TDataSource
    DataSet = QryBuscaFundoInvest
    Left = 201
    Top = 314
  end
  object qryVigencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT pd.DATAVIGENCIA,'
      '       pd.PLANO PLANOCONTABIL,'
      
        '      (CASE WHEN pc.PLANO <= pd.PLANO THEN '#39'S'#39' ELSE '#39'N'#39' END) AS ' +
        'PERMITE'
      'FROM'
      
        '      (select distinct datavigencia, plano from padrlanccontinv ' +
        ') pd,'
      '      PARAMCONTAB pc'
      'order by pd.DATAVIGENCIA desc')
    ValidateWithMask = True
    Left = 369
    Top = 184
    object qryVigenciaDATAVIGENCIA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAVIGENCIA'
      Origin = 'BASEDADOS.VIGENCIA.DATAVIGENCIA'
    end
    object qryVigenciaPLANOCONTABIL: TFloatField
      FieldName = 'PLANOCONTABIL'
    end
    object qryVigenciaPERMITE: TStringField
      FieldName = 'PERMITE'
      FixedChar = True
      Size = 1
    end
  end
  object qrySegmentacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from segmentacaomercado')
    ValidateWithMask = True
    Left = 305
    Top = 385
    object qrySegmentacaoDESCSEGMENTACAO: TStringField
      DisplayWidth = 33
      FieldName = 'DESCSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.DESCSEGMENTACAO'
      Size = 100
    end
    object qrySegmentacaoIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDSEGMENTACAO'
      Visible = False
    end
  end
  object qryTipoAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPOACAO FROM TIPOACAO'
      'ORDER BY CODTIPOACAO')
    ValidateWithMask = True
    Left = 770
    Top = 176
    object qryTipoAcaoCODTIPOACAO: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPOACAO'
      Origin = 'BASEDADOS.TIPOACAO.CODTIPOACAO'
      Size = 5
    end
  end
end
