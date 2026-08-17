inherited frmCadIntegracaoPREV: TfrmCadIntegracaoPREV
  Left = 360
  Top = 197
  HelpContext = 160137
  Caption = 
    'Parametrização de Integração Contábil / Financeira de Contribuiç' +
    'ões e Benefícios'
  ClientHeight = 698
  ClientWidth = 1264
  FormStyle = fsNormal
  Visible = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1264
    Height = 659
    object pnlIntegracao: TPanel
      Left = 1
      Top = 72
      Width = 1262
      Height = 586
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object pnlIntegDireita: TPanel
        Left = 281
        Top = 1
        Width = 980
        Height = 584
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lblDescSelecao: TLabel
          Left = 0
          Top = 0
          Width = 980
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Item Selecionado ...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pgctrlIntegraContrib: TPageControl
          Left = 0
          Top = 16
          Width = 980
          Height = 568
          ActivePage = tbsContribContabil
          Align = alClient
          HotTrack = True
          Images = imList
          TabOrder = 0
          object tbsContribContabil: TTabSheet
            Caption = 'Integração Contábil'
            object pgctrlIntegraContribContabil: TPageControl
              Left = 0
              Top = 0
              Width = 972
              Height = 539
              ActivePage = tbsContabilGeral
              Align = alClient
              TabOrder = 0
              object tbsContabilGeral: TTabSheet
                Caption = 'Geral'
                object GroupBox4: TGroupBox
                  Left = 4
                  Top = 102
                  Width = 483
                  Height = 88
                  TabOrder = 0
                  object Label43: TLabel
                    Left = 8
                    Top = 10
                    Width = 55
                    Height = 13
                    Caption = 'Subconta'
                  end
                  object lblEntidadeContabil: TLabel
                    Left = 8
                    Top = 45
                    Width = 166
                    Height = 13
                    Caption = 'Entidade Contábil/Financeira'
                  end
                  object dblkSubconta: TwwDBLookupCombo
                    Left = 8
                    Top = 22
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
                  object dblkpcmbPlanPrevContab: TwwDBLookupCombo
                    Left = 8
                    Top = 57
                    Width = 381
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'50'#9'Entidade Contábil/Financeira')
                    LookupField = 'IDPLANPREVCONTAB'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                  end
                end
                object grpCreContab: TGroupBox
                  Left = 4
                  Top = 11
                  Width = 483
                  Height = 88
                  Caption = ' Conta de Receita'
                  TabOrder = 1
                  object spdContaContabil1: TSpeedButton
                    Left = 231
                    Top = 28
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
                    OnClick = spdContaContabil1Click
                  end
                  object lbConta1: TLabel
                    Left = 11
                    Top = 15
                    Width = 84
                    Height = 13
                    Caption = 'Conta Contábil'
                  end
                  object edContaContabil1: TMaskEdit
                    Left = 11
                    Top = 28
                    Width = 218
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edContaContabil1Exit
                  end
                  object grbGrConta1: TGroupBox
                    Left = 11
                    Top = 50
                    Width = 464
                    Height = 32
                    Caption = 'Descrição da Conta'
                    TabOrder = 1
                    object lbDescricaoConta1: TLabel
                      Left = 6
                      Top = 14
                      Width = 230
                      Height = 13
                      AutoSize = False
                      Caption = 'lbDescricaoConta1'
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
              object tbsContabAtivo: TTabSheet
                Caption = 'Contas de Ativo'
                ImageIndex = 2
                object lblPlaContaD: TLabel
                  Left = 4
                  Top = 2
                  Width = 197
                  Height = 13
                  Caption = 'Conta Contábil para Débito - Folha'
                end
                object lblPlaContaDBanco: TLabel
                  Left = 4
                  Top = 137
                  Width = 228
                  Height = 13
                  Caption = 'Conta Contábil para Débito - Cob.Banco'
                end
                object Label56: TLabel
                  Left = 4
                  Top = 204
                  Width = 242
                  Height = 13
                  Caption = 'Conta Contábil para Débito - Ação Judicial'
                end
                object Label53: TLabel
                  Left = 4
                  Top = 69
                  Width = 251
                  Height = 13
                  Caption = 'Conta Contábil para Débito - Folha Atrasado'
                end
                object spdContaContabil: TSpeedButton
                  Left = 224
                  Top = 15
                  Width = 20
                  Height = 21
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
                  OnClick = spdContaContabilClick
                end
                object spdFolhaAtrasada: TSpeedButton
                  Left = 224
                  Top = 82
                  Width = 20
                  Height = 21
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
                  OnClick = spdFolhaAtrasadaClick
                end
                object sbtnPlaContaDBanco: TSpeedButton
                  Left = 224
                  Top = 150
                  Width = 20
                  Height = 21
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
                  OnClick = sbtnPlaContaDBancoClick
                end
                object spdFolhaJudicial: TSpeedButton
                  Left = 224
                  Top = 217
                  Width = 20
                  Height = 21
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
                  OnClick = spdFolhaJudicialClick
                end
                object lblTitPLACONTACADT13: TLabel
                  Left = 4
                  Top = 274
                  Width = 397
                  Height = 13
                  Caption = 
                    'Conta Contábil para Crédito - Desconto sobre Adiantamento de Abo' +
                    'no'
                end
                object sbtnPLACONTACADT13: TSpeedButton
                  Left = 224
                  Top = 287
                  Width = 20
                  Height = 21
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
                  OnClick = sbtnPLACONTACADT13Click
                end
                object edContaContabil: TMaskEdit
                  Left = 4
                  Top = 15
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnExit = edContaContabilExit
                end
                object GroupBox1: TGroupBox
                  Left = 4
                  Top = 37
                  Width = 464
                  Height = 32
                  Caption = 'Descrição da Conta'
                  TabOrder = 1
                  object lbDescricaoConta: TLabel
                    Left = 6
                    Top = 14
                    Width = 230
                    Height = 12
                    AutoSize = False
                    Caption = 'lblDescricaoConta'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object edPlaContaDBanco: TMaskEdit
                  Left = 4
                  Top = 150
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnExit = edPlaContaDBancoExit
                end
                object grpPlaContaDBanco: TGroupBox
                  Left = 4
                  Top = 172
                  Width = 464
                  Height = 32
                  Caption = 'Descrição da Conta'
                  TabOrder = 3
                  object lblDescricaoPlaContaDBanco: TLabel
                    Left = 6
                    Top = 14
                    Width = 230
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
                object edContaContabilAcaoJudicial: TMaskEdit
                  Left = 4
                  Top = 217
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = edContaContabilAcaoJudicialExit
                end
                object GroupBox36: TGroupBox
                  Left = 4
                  Top = 240
                  Width = 464
                  Height = 32
                  Caption = 'Descrição da Conta'
                  TabOrder = 5
                  object lblDescricaoContaAcaoJudicial: TLabel
                    Left = 6
                    Top = 14
                    Width = 230
                    Height = 12
                    AutoSize = False
                    Caption = 'lblDescricaoContaAcaoJudicial'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object edContaContabilFolhaAtrasado: TMaskEdit
                  Left = 4
                  Top = 82
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                  OnExit = edContaContabilFolhaAtrasadoExit
                end
                object GroupBox34: TGroupBox
                  Left = 4
                  Top = 105
                  Width = 464
                  Height = 32
                  Caption = 'Descrição da Conta'
                  TabOrder = 7
                  object lblDescricaoContaFolhaAtrasado: TLabel
                    Left = 6
                    Top = 14
                    Width = 230
                    Height = 12
                    AutoSize = False
                    Caption = 'lblDescricaoContaFolhaAtrasado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object edPLACONTACADT13: TMaskEdit
                  Left = 4
                  Top = 287
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 8
                  OnExit = edPLACONTACADT13Exit
                end
                object grpPLACONTACADT13: TGroupBox
                  Left = 4
                  Top = 310
                  Width = 464
                  Height = 32
                  Caption = 'Descrição da Conta'
                  TabOrder = 9
                  object lblDescPLACONTACADT13: TLabel
                    Left = 6
                    Top = 14
                    Width = 230
                    Height = 12
                    AutoSize = False
                    Caption = 'lblDescPLACONTACADT13'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
              end
              object tbsContabilProvisao: TTabSheet
                Caption = 'Contas de Provisão'
                ImageIndex = 1
                object pgctrlContabProvisao: TPageControl
                  Left = 0
                  Top = 0
                  Width = 964
                  Height = 511
                  ActivePage = tsProvNormal
                  Align = alClient
                  TabOrder = 0
                  object tsProvNormal: TTabSheet
                    Caption = 'Para Abono'
                    object grpDebProvisao: TGroupBox
                      Left = 3
                      Top = -2
                      Width = 478
                      Height = 104
                      Caption = 'Conta a Débito'
                      TabOrder = 0
                      object spdContaContabilProvisD: TSpeedButton
                        Left = 229
                        Top = 30
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
                        OnClick = spdContaContabilProvisDClick
                      end
                      object Label10: TLabel
                        Left = 9
                        Top = 18
                        Width = 50
                        Height = 13
                        Caption = 'Provisão'
                      end
                      object edContaContabilProvisD: TMaskEdit
                        Left = 9
                        Top = 30
                        Width = 218
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnExit = edContaContabilProvisDExit
                      end
                      object GroupBox18: TGroupBox
                        Left = 9
                        Top = 50
                        Width = 464
                        Height = 28
                        Caption = 'Descrição da Conta'
                        TabOrder = 1
                        object lbDescricaoContaProvisD: TLabel
                          Left = 11
                          Top = 12
                          Width = 350
                          Height = 13
                          AutoSize = False
                          Caption = 'lbDescricaoContaProvisD'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                        end
                      end
                    end
                    object grpCreProvisao: TGroupBox
                      Left = 3
                      Top = 107
                      Width = 478
                      Height = 104
                      Caption = 'Conta a Crédito'
                      TabOrder = 1
                      object spdContaContabilProvisC: TSpeedButton
                        Left = 229
                        Top = 30
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
                        OnClick = spdContaContabilProvisCClick
                      end
                      object Label20: TLabel
                        Left = 9
                        Top = 18
                        Width = 50
                        Height = 13
                        Caption = 'Provisão'
                      end
                      object edContaContabilProvisC: TMaskEdit
                        Left = 9
                        Top = 30
                        Width = 218
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnExit = edContaContabilProvisCExit
                      end
                      object GroupBox22: TGroupBox
                        Left = 9
                        Top = 50
                        Width = 464
                        Height = 28
                        Caption = 'Descrição da Conta'
                        TabOrder = 1
                        object lbDescricaoContaProvisC: TLabel
                          Left = 8
                          Top = 12
                          Width = 353
                          Height = 13
                          AutoSize = False
                          Caption = 'lbDescricaoContaProvisC'
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
                  object tsProvBenefProv: TTabSheet
                    Caption = 'Para Benefício Provisório'
                    ImageIndex = 1
                    object grpDebProvisaoP: TGroupBox
                      Left = 3
                      Top = -2
                      Width = 478
                      Height = 104
                      Caption = 'Conta a Débito'
                      TabOrder = 0
                      object spdContaContabilProvisPD: TSpeedButton
                        Left = 229
                        Top = 30
                        Width = 21
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
                        OnClick = spdContaContabilProvisPDClick
                      end
                      object Label54: TLabel
                        Left = 9
                        Top = 18
                        Width = 50
                        Height = 13
                        Caption = 'Provisão'
                      end
                      object edContaContabilProvisPD: TMaskEdit
                        Left = 8
                        Top = 30
                        Width = 218
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnExit = edContaContabilProvisPDExit
                      end
                      object GroupBox37: TGroupBox
                        Left = 8
                        Top = 50
                        Width = 464
                        Height = 28
                        Caption = 'Descrição da Conta'
                        TabOrder = 1
                        object lbDescricaoContaProvisPD: TLabel
                          Left = 11
                          Top = 12
                          Width = 350
                          Height = 13
                          AutoSize = False
                          Caption = 'lbDescricaoContaProvisPD'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                        end
                      end
                    end
                    object grpCreProvisaoP: TGroupBox
                      Left = 3
                      Top = 107
                      Width = 478
                      Height = 104
                      Caption = 'Conta a Crédito'
                      TabOrder = 1
                      object spdContaContabilProvisPC: TSpeedButton
                        Left = 231
                        Top = 30
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
                        OnClick = spdContaContabilProvisPCClick
                      end
                      object Label58: TLabel
                        Left = 9
                        Top = 18
                        Width = 50
                        Height = 13
                        Caption = 'Provisão'
                      end
                      object edContaContabilProvisPC: TMaskEdit
                        Left = 9
                        Top = 30
                        Width = 218
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnExit = edContaContabilProvisPCExit
                      end
                      object GroupBox40: TGroupBox
                        Left = 9
                        Top = 50
                        Width = 464
                        Height = 28
                        Caption = 'Descrição da Conta'
                        TabOrder = 1
                        object lbDescricaoContaProvisPC: TLabel
                          Left = 8
                          Top = 12
                          Width = 353
                          Height = 13
                          AutoSize = False
                          Caption = 'lbDescricaoContaProvisPC'
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
              end
              object tbsContaDevol: TTabSheet
                Caption = 'Contas de Devolução'
                ImageIndex = 3
                object grpContaDevol: TGroupBox
                  Left = 4
                  Top = 11
                  Width = 478
                  Height = 92
                  Caption = 'Conta a Crédito p/devolução via Banco'
                  TabOrder = 0
                  object spdContaDevol: TSpeedButton
                    Left = 226
                    Top = 27
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
                  object Label42: TLabel
                    Left = 8
                    Top = 13
                    Width = 84
                    Height = 13
                    Caption = 'Conta Contábil'
                  end
                  object edContaContabilDevol: TMaskEdit
                    Left = 8
                    Top = 27
                    Width = 218
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    Text = 'edContaContabilDevol'
                    OnExit = edContaContabilDevolExit
                  end
                  object GroupBox24: TGroupBox
                    Left = 8
                    Top = 50
                    Width = 464
                    Height = 39
                    Caption = 'Descrição da Conta'
                    TabOrder = 1
                    object lbDescricaoContaDevol: TLabel
                      Left = 6
                      Top = 17
                      Width = 235
                      Height = 13
                      AutoSize = False
                      Caption = 'lbDescricaoContaDevol'
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
                  Left = 4
                  Top = 107
                  Width = 478
                  Height = 100
                  Caption = 'Conta a Crédito p/devolução via Interface com as Patrocinadoras'
                  TabOrder = 1
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
                  object Label45: TLabel
                    Left = 9
                    Top = 16
                    Width = 84
                    Height = 13
                    Caption = 'Conta Contábil'
                  end
                  object edContaContabilDevolPatro: TMaskEdit
                    Left = 9
                    Top = 30
                    Width = 218
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    Text = 'edContaContabilDevolPatro'
                    OnExit = edContaContabilDevolPatroExit
                  end
                  object GroupBox26: TGroupBox
                    Left = 9
                    Top = 54
                    Width = 464
                    Height = 39
                    Caption = 'Descrição da Conta'
                    TabOrder = 1
                    object lbDescricaoContaDevolPatro: TLabel
                      Left = 6
                      Top = 17
                      Width = 235
                      Height = 13
                      AutoSize = False
                      Caption = 'lbDescricaoContaDevolPatro'
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
              object tbsContaProvPerdas: TTabSheet
                Caption = 'Contas de Provisão para Perdas'
                ImageIndex = 4
                object grpContaProvPerdaD: TGroupBox
                  Left = 3
                  Top = 104
                  Width = 478
                  Height = 104
                  Caption = 'Conta a Débito'
                  TabOrder = 0
                  object spdContaProvPerdaD: TSpeedButton
                    Left = 229
                    Top = 30
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
                    OnClick = spdContaProvPerdaDClick
                  end
                  object Label41: TLabel
                    Left = 9
                    Top = 18
                    Width = 50
                    Height = 13
                    Caption = 'Provisão'
                  end
                  object edContaProvPerdaD: TMaskEdit
                    Left = 9
                    Top = 30
                    Width = 218
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edContaProvPerdaDExit
                  end
                  object GroupBox55: TGroupBox
                    Left = 9
                    Top = 50
                    Width = 464
                    Height = 28
                    Caption = 'Descrição da Conta'
                    TabOrder = 1
                    object lbDescricaoContaProvPerdaD: TLabel
                      Left = 11
                      Top = 12
                      Width = 350
                      Height = 13
                      AutoSize = False
                      Caption = 'lbDescricaoContaProvisD'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                  end
                end
                object grpContaProvPerdaC: TGroupBox
                  Left = 3
                  Top = 213
                  Width = 478
                  Height = 104
                  Caption = 'Conta a Crédito'
                  TabOrder = 1
                  object spdContaProvPerdaC: TSpeedButton
                    Left = 229
                    Top = 30
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
                    OnClick = spdContaProvPerdaCClick
                  end
                  object Label51: TLabel
                    Left = 9
                    Top = 18
                    Width = 50
                    Height = 13
                    Caption = 'Provisão'
                  end
                  object edContaProvPerdaC: TMaskEdit
                    Left = 9
                    Top = 30
                    Width = 218
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edContaProvPerdaCExit
                  end
                  object GroupBox57: TGroupBox
                    Left = 9
                    Top = 50
                    Width = 464
                    Height = 28
                    Caption = 'Descrição da Conta'
                    TabOrder = 1
                    object lbDescricaoContaProvPerdaC: TLabel
                      Left = 8
                      Top = 12
                      Width = 353
                      Height = 13
                      AutoSize = False
                      Caption = 'lbDescricaoContaProvisC'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                  end
                end
                object grpContaProvPerda: TGroupBox
                  Left = 3
                  Top = -2
                  Width = 478
                  Height = 104
                  Caption = 'Provisão para Perdas'
                  TabOrder = 2
                  object spdContaProvPerda: TSpeedButton
                    Left = 229
                    Top = 30
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
                    OnClick = spdContaProvPerdaClick
                  end
                  object Label59: TLabel
                    Left = 9
                    Top = 18
                    Width = 50
                    Height = 13
                    Caption = 'Provisão'
                  end
                  object edContaProvPerda: TMaskEdit
                    Left = 9
                    Top = 30
                    Width = 218
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edContaProvPerdaExit
                  end
                  object GroupBox59: TGroupBox
                    Left = 9
                    Top = 50
                    Width = 464
                    Height = 28
                    Caption = 'Descrição da Conta'
                    TabOrder = 1
                    object lbDescricaoContaProvPerda: TLabel
                      Left = 11
                      Top = 12
                      Width = 350
                      Height = 13
                      AutoSize = False
                      Caption = 'lbDescricaoContaProvisD'
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
          end
          object tbsContribFinanceira: TTabSheet
            Caption = 'Integração Financeira'
            ImageIndex = 1
            object pgctrlContribFinanc: TPageControl
              Left = 0
              Top = 0
              Width = 972
              Height = 539
              ActivePage = tbsContribGeral
              Align = alClient
              TabOrder = 0
              object tbsContribGeral: TTabSheet
                Caption = 'Geral'
                ImageIndex = 2
                object GroupBox9: TGroupBox
                  Left = 3
                  Top = 3
                  Width = 478
                  Height = 190
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
                    Top = 51
                    Width = 220
                    Height = 13
                    Caption = 'Contas/Caixas x Forma de Pagamento '
                  end
                  object lblcentrespon: TLabel
                    Left = 7
                    Top = 93
                    Width = 160
                    Height = 13
                    Caption = 'Centro de Responsabilidade'
                  end
                  object Label9: TLabel
                    Left = 7
                    Top = 133
                    Width = 92
                    Height = 13
                    Caption = 'Centro de Custo'
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
                    Top = 64
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
                    Top = 107
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
                  object dblkpcmbContribCCusto: TwwDBLookupCombo
                    Left = 7
                    Top = 147
                    Width = 381
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'30'#9'Centro de Custo'#9'F'
                      'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
                    LookupTable = dtmIntegraCAPCAR.qryCCusto
                    LookupField = 'CODCENTROCUSTO'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                  end
                end
              end
              object tbsContribCobranca: TTabSheet
                Caption = 'Cobrança'
                object GroupBox8: TGroupBox
                  Left = 5
                  Top = 1
                  Width = 431
                  Height = 74
                  Caption = 
                    'Para Rateio no Contas a Receber (utilizado na Cobrança via Banco' +
                    ')'
                  TabOrder = 0
                  object lblTpReceb: TLabel
                    Left = 6
                    Top = 15
                    Width = 122
                    Height = 13
                    Caption = 'Tipo de Recebimento'
                  end
                  object sbtnTpReceb1: TSpeedButton
                    Left = 353
                    Top = 32
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
                    OnClick = sbtnTpReceb1Click
                  end
                  object edTpReceb1: TEdit
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
                  end
                end
                object GroupBox10: TGroupBox
                  Left = 5
                  Top = 82
                  Width = 431
                  Height = 74
                  Caption = 'Para Rateio no Contas a Pagar (utilizado na Cobrança via Folha)'
                  TabOrder = 1
                  object Label12: TLabel
                    Left = 6
                    Top = 18
                    Width = 116
                    Height = 13
                    Caption = 'Tipo de Desembolso'
                  end
                  object sbtnTpDesemb1: TSpeedButton
                    Left = 354
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
                    OnClick = sbtnTpDesemb1Click
                  end
                  object edTpDesemb1: TEdit
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
                    OnExit = edTpDesemb1Exit
                  end
                end
              end
              object tbsDevolucao: TTabSheet
                Caption = 'Devolução'
                ImageIndex = 1
                object GroupBox11: TGroupBox
                  Left = 2
                  Top = 4
                  Width = 463
                  Height = 74
                  Caption = 
                    'Para Rateio no Contas a Pagar (utilizado na Devolução via Folha ' +
                    'ou Banco)'
                  TabOrder = 0
                  object Label13: TLabel
                    Left = 6
                    Top = 18
                    Width = 116
                    Height = 13
                    Caption = 'Tipo de Desembolso'
                  end
                  object sbtnTpDesemb2: TSpeedButton
                    Left = 354
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
                    OnClick = sbtnTpDesemb2Click
                  end
                  object edTpDesemb2: TEdit
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
                    OnExit = edTpDesemb1Exit
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 2
                  Top = 92
                  Width = 463
                  Height = 74
                  Caption = 
                    'Para Rateio no Contas a Receber (utilizado na Devolução via Folh' +
                    'a ou Banco)'
                  TabOrder = 1
                  object Label29: TLabel
                    Left = 6
                    Top = 18
                    Width = 116
                    Height = 13
                    Caption = 'Tipo de Desembolso'
                  end
                  object sbtnTpDesemb21: TSpeedButton
                    Left = 354
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
                    OnClick = sbtnTpDesemb21Click
                  end
                  object edTpReceb2: TEdit
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
                    OnExit = edTpDesemb1Exit
                  end
                end
              end
              object tbsIntegGeralFinancProvisao: TTabSheet
                Caption = 'Provisão'
                ImageIndex = 3
                object GroupBox35: TGroupBox
                  Left = 5
                  Top = 12
                  Width = 405
                  Height = 49
                  Caption = ' Tipo de Desembolso para Provisão de Abono Anual de Benefício '
                  TabOrder = 0
                  object sbtnTpDesemb3: TSpeedButton
                    Left = 362
                    Top = 21
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
                    OnClick = sbtnTpDesemb3Click
                  end
                  object edTpDesemb3: TEdit
                    Left = 15
                    Top = 20
                    Width = 345
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edTpDesemb1Exit
                  end
                end
                object GroupBox42: TGroupBox
                  Left = 5
                  Top = 69
                  Width = 405
                  Height = 49
                  Caption = ' Tipo de Desembolso para Provisão de Benefício Provisório '
                  TabOrder = 1
                  object sbtnTpDesemb4: TSpeedButton
                    Left = 362
                    Top = 21
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
                    OnClick = sbtnTpDesemb4Click
                  end
                  object edTpDesemb4: TEdit
                    Left = 15
                    Top = 20
                    Width = 345
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edTpDesemb1Exit
                  end
                end
              end
              object tbsPGA: TTabSheet
                Caption = 'PGA'
                ImageIndex = 4
                object GroupBox16: TGroupBox
                  Left = 5
                  Top = 12
                  Width = 422
                  Height = 140
                  Caption = 'Documento Pai a Receber'
                  TabOrder = 0
                  object GroupBox44: TGroupBox
                    Left = 8
                    Top = 22
                    Width = 405
                    Height = 49
                    Caption = 'Tipo de Desembolso PGA a Pagar'
                    TabOrder = 0
                    object SpeedButton1: TSpeedButton
                      Left = 362
                      Top = 20
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
                      OnClick = SpeedButton1Click
                    end
                    object edTpDesemb8: TEdit
                      Left = 15
                      Top = 20
                      Width = 345
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      OnExit = edTpDesemb1Exit
                    end
                  end
                  object GroupBox45: TGroupBox
                    Left = 8
                    Top = 76
                    Width = 405
                    Height = 49
                    Caption = 'Tipo de Recebimento PGA a Receber'
                    TabOrder = 1
                    object SpeedButton2: TSpeedButton
                      Left = 362
                      Top = 19
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
                      OnClick = SpeedButton2Click
                    end
                    object edTpReceb5: TEdit
                      Left = 15
                      Top = 20
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
                end
                object GroupBox43: TGroupBox
                  Left = 5
                  Top = 158
                  Width = 422
                  Height = 140
                  Caption = 'Documento Pai a Pagar'
                  TabOrder = 1
                  object GroupBox46: TGroupBox
                    Left = 8
                    Top = 22
                    Width = 405
                    Height = 49
                    Caption = 'Tipo de Desembolso PGA a Pagar'
                    TabOrder = 0
                    object SpeedButton3: TSpeedButton
                      Left = 362
                      Top = 20
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
                      OnClick = SpeedButton3Click
                    end
                    object edTpDesemb9: TEdit
                      Left = 15
                      Top = 20
                      Width = 345
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      OnExit = edTpDesemb1Exit
                    end
                  end
                  object GroupBox53: TGroupBox
                    Left = 8
                    Top = 76
                    Width = 405
                    Height = 49
                    Caption = 'Tipo de Recebimento PGA a Receber'
                    TabOrder = 1
                    object SpeedButton4: TSpeedButton
                      Left = 362
                      Top = 19
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
                      OnClick = SpeedButton4Click
                    end
                    object edTpReceb6: TEdit
                      Left = 15
                      Top = 20
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
                end
              end
              object tbsEmAtraso: TTabSheet
                Caption = 'Em Atraso'
                ImageIndex = 5
                object GroupBox54: TGroupBox
                  Left = 5
                  Top = 1
                  Width = 431
                  Height = 74
                  Caption = 
                    'Para Rateio no Contas a Receber (utilizado na Cobrança via Banco' +
                    ')'
                  TabOrder = 0
                  object lblTpRecebEmAtraso: TLabel
                    Left = 6
                    Top = 15
                    Width = 122
                    Height = 13
                    Caption = 'Tipo de Recebimento'
                  end
                  object sbtnTpRecebEmAtraso: TSpeedButton
                    Left = 353
                    Top = 32
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
                    OnClick = sbtnTpRecebEmAtrasoClick
                  end
                  object edTpRecebEmAtraso: TEdit
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
                  end
                end
                object GroupBox56: TGroupBox
                  Left = 5
                  Top = 82
                  Width = 431
                  Height = 74
                  Caption = 'Para Rateio no Contas a Pagar (utilizado na Cobrança via Folha)'
                  TabOrder = 1
                  object lblTpDesembEmAtraso: TLabel
                    Left = 6
                    Top = 18
                    Width = 116
                    Height = 13
                    Caption = 'Tipo de Desembolso'
                  end
                  object sbtnTpDesembEmAtraso: TSpeedButton
                    Left = 354
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
                    OnClick = sbtnTpDesembEmAtrasoClick
                  end
                  object edTpDesembEmAtraso: TEdit
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
                    OnExit = edTpDesemb1Exit
                  end
                end
              end
            end
          end
        end
        object pgctrlIntegraInfGerais: TPageControl
          Left = 0
          Top = 16
          Width = 980
          Height = 568
          ActivePage = tbsIntegraInfGeraisContab
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HotTrack = True
          Images = imList
          ParentFont = False
          TabOrder = 1
          object tbsIntegraInfGeraisContab: TTabSheet
            Caption = 'Integração Contábil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            object pgctrlInfGeraiContab: TPageControl
              Left = 0
              Top = 0
              Width = 972
              Height = 539
              ActivePage = tbsInfGeraisContabExercAnterior
              Align = alClient
              TabOrder = 0
              object tbsInfGeraisContabExercAnterior: TTabSheet
                Caption = 'Contas para Tratar Exercício Anterior'
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
                    Left = 237
                    Top = 30
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
                  object edContaAnulaReceita: TMaskEdit
                    Left = 16
                    Top = 29
                    Width = 218
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edContaAnulaReceitaExit
                  end
                  object GroupBox29: TGroupBox
                    Left = 18
                    Top = 50
                    Width = 382
                    Height = 39
                    Caption = 'Descrição da Conta'
                    TabOrder = 1
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
                end
                object GroupBox28: TGroupBox
                  Left = 9
                  Top = 150
                  Width = 442
                  Height = 145
                  Caption = 'Conta a crédito para anulação de Despesa de exercício anterior'
                  TabOrder = 1
                  object Label50: TLabel
                    Left = 16
                    Top = 16
                    Width = 84
                    Height = 13
                    Caption = 'Conta Contábil'
                  end
                  object spdContaAnulaDesp: TSpeedButton
                    Left = 237
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
                  object edContaAnulaDespesa: TMaskEdit
                    Left = 16
                    Top = 30
                    Width = 218
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edContaAnulaDespesaExit
                  end
                  object GroupBox31: TGroupBox
                    Left = 18
                    Top = 54
                    Width = 382
                    Height = 39
                    Caption = 'Descrição da Conta'
                    TabOrder = 1
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
                end
              end
              object tbsInfGeraisContabTipoOper: TTabSheet
                Caption = 'Tipos de Operação'
                ImageIndex = 1
                object lbGrupo: TLabel
                  Left = 17
                  Top = 18
                  Width = 208
                  Height = 13
                  Caption = 'Envio de Cobrança de Contribuições'
                end
                object Label5: TLabel
                  Left = 17
                  Top = 63
                  Width = 265
                  Height = 13
                  Caption = 'Recebimento de Contribuições Previdenciárias'
                end
                object Label15: TLabel
                  Left = 17
                  Top = 108
                  Width = 254
                  Height = 13
                  Caption = 'Tratamento de Divergência de Contribuições'
                end
                object Label17: TLabel
                  Left = 17
                  Top = 152
                  Width = 139
                  Height = 13
                  Caption = 'Alimentação de Reserva'
                end
                object Label18: TLabel
                  Left = 17
                  Top = 197
                  Width = 115
                  Height = 13
                  Caption = 'Folha de Benefícios'
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
                object dblkTipoperreserva: TwwDBLookupCombo
                  Left = 17
                  Top = 166
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
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkTipOperFlhBen: TwwDBLookupCombo
                  Left = 17
                  Top = 210
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
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
              object tbsContasDespesa: TTabSheet
                Caption = 'Contas de Despesa'
                ImageIndex = 2
                object Label30: TLabel
                  Left = 5
                  Top = 1
                  Width = 132
                  Height = 13
                  Caption = 'Conta Contábil - Abono'
                end
                object sbtnCCAbono: TSpeedButton
                  Left = 230
                  Top = 16
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
                  OnClick = sbtnCCAbonoClick
                end
                object Label44: TLabel
                  Left = 5
                  Top = 75
                  Width = 207
                  Height = 13
                  Caption = 'Conta Contábil - Correção Monetária'
                end
                object sbtnCCCorrMon: TSpeedButton
                  Left = 230
                  Top = 96
                  Width = 20
                  Height = 19
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
                  OnClick = sbtnCCCorrMonClick
                end
                object edCCAbono: TMaskEdit
                  Left = 5
                  Top = 17
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnExit = edCCAbonoExit
                end
                object grp2: TGroupBox
                  Left = 5
                  Top = 38
                  Width = 382
                  Height = 35
                  Caption = 'Descrição da Conta'
                  TabOrder = 1
                  object lblContaContabAbono: TLabel
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
                object edCCCorrMon: TMaskEdit
                  Left = 5
                  Top = 94
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnExit = edCCCorrMonExit
                end
                object grp1: TGroupBox
                  Left = 5
                  Top = 119
                  Width = 382
                  Height = 35
                  Caption = 'Descrição da Conta'
                  TabOrder = 3
                  object lblContaContabCorrMon: TLabel
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
              end
            end
          end
          object tbsIntegraInfGeraisFinanc: TTabSheet
            Caption = 'Integração Financeira'
            ImageIndex = 1
            object pgctrlInfGeraisFinanc: TPageControl
              Left = 0
              Top = 0
              Width = 972
              Height = 539
              ActivePage = tbsInfGeraisFinancTipoCliente
              Align = alClient
              TabOrder = 0
              object tbsInfGeraisFinancTipoDoc: TTabSheet
                Caption = 'Tipos de Documento'
                object GroupBox6: TGroupBox
                  Left = 6
                  Top = 15
                  Width = 220
                  Height = 88
                  Caption = 'Contas a Pagar - Folha Benefício'
                  TabOrder = 0
                  object Label19: TLabel
                    Left = 6
                    Top = 15
                    Width = 124
                    Height = 13
                    Caption = 'via arquivo eletrônico'
                  end
                  object Label22: TLabel
                    Left = 6
                    Top = 48
                    Width = 142
                    Height = 13
                    Caption = 'via documento individual'
                  end
                  object dblkTipDocCAPFolhele: TwwDBLookupCombo
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
                  object dblkTipDocCAPFolhind: TwwDBLookupCombo
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
                object GroupBox17: TGroupBox
                  Left = 6
                  Top = 104
                  Width = 220
                  Height = 89
                  Caption = 'Contas a Pagar - Envio'
                  TabOrder = 1
                  object Label25: TLabel
                    Left = 6
                    Top = 15
                    Width = 107
                    Height = 13
                    Caption = 'via pagto bancário'
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
                object GroupBox33: TGroupBox
                  Left = 6
                  Top = 194
                  Width = 220
                  Height = 57
                  Caption = 'Contas a Pagar - Convênio'
                  TabOrder = 2
                  object Label6: TLabel
                    Left = 6
                    Top = 15
                    Width = 130
                    Height = 13
                    Caption = 'via Folha de Benefício'
                  end
                  object dblkTipoDocConvFolha: TwwDBLookupCombo
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
                end
                object GroupBox20: TGroupBox
                  Left = 237
                  Top = 104
                  Width = 220
                  Height = 89
                  Caption = 'Contas a Receber - Recebimento'
                  TabOrder = 3
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
                object GroupBox12: TGroupBox
                  Left = 237
                  Top = 15
                  Width = 220
                  Height = 88
                  Caption = 'Contas a Receber - Folha Benefício'
                  TabOrder = 4
                  object Label23: TLabel
                    Left = 6
                    Top = 15
                    Width = 124
                    Height = 13
                    Caption = 'via arquivo eletrônico'
                  end
                  object Label24: TLabel
                    Left = 6
                    Top = 48
                    Width = 142
                    Height = 13
                    Caption = 'via documento individual'
                  end
                  object dblkTipDocCARFolhele: TwwDBLookupCombo
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
                  object dblkTipDocCARFolhind: TwwDBLookupCombo
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
              end
              object tbsInfGeraisFinancTipoCliente: TTabSheet
                Caption = 'Tipos de Cliente / Favorecido'
                ImageIndex = 1
                object GroupBox7: TGroupBox
                  Left = 8
                  Top = 8
                  Width = 217
                  Height = 273
                  Caption = 'Tipo de Cliente para:'
                  TabOrder = 0
                  object Label31: TLabel
                    Left = 6
                    Top = 26
                    Width = 80
                    Height = 13
                    Caption = 'Patrocinadora'
                  end
                  object Label32: TLabel
                    Left = 6
                    Top = 67
                    Width = 36
                    Height = 13
                    Caption = 'Ativos'
                  end
                  object Label33: TLabel
                    Left = 6
                    Top = 108
                    Width = 52
                    Height = 13
                    Caption = 'Mantidos'
                  end
                  object Label34: TLabel
                    Left = 6
                    Top = 149
                    Width = 57
                    Height = 13
                    Caption = 'Assistidos'
                  end
                  object Label35: TLabel
                    Left = 6
                    Top = 190
                    Width = 89
                    Height = 13
                    Caption = 'Mantido Parcial'
                  end
                  object dblkTipCliPatro: TwwDBLookupCombo
                    Left = 6
                    Top = 39
                    Width = 205
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'40'#9'Descrição'
                      'IDTIPOCLIENTE'#9'10'#9'Código')
                    LookupTable = qryTipoCli
                    LookupField = 'IDTIPOCLIENTE'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkTipCliAtivos: TwwDBLookupCombo
                    Left = 6
                    Top = 81
                    Width = 205
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'40'#9'Descrição'
                      'IDTIPOCLIENTE'#9'10'#9'Código')
                    LookupTable = qryTipoCli
                    LookupField = 'IDTIPOCLIENTE'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkTipCliMantidos: TwwDBLookupCombo
                    Left = 6
                    Top = 123
                    Width = 205
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'40'#9'Descrição'
                      'IDTIPOCLIENTE'#9'10'#9'Código')
                    LookupTable = qryTipoCli
                    LookupField = 'IDTIPOCLIENTE'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkTipCliAssistidos: TwwDBLookupCombo
                    Left = 6
                    Top = 165
                    Width = 205
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'40'#9'Descrição'
                      'IDTIPOCLIENTE'#9'10'#9'Código')
                    LookupTable = qryTipoCli
                    LookupField = 'IDTIPOCLIENTE'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkTipCliMantParc: TwwDBLookupCombo
                    Left = 6
                    Top = 207
                    Width = 205
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'40'#9'Descrição'
                      'IDTIPOCLIENTE'#9'10'#9'Código')
                    LookupTable = qryTipoCli
                    LookupField = 'IDTIPOCLIENTE'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
                object GroupBox2: TGroupBox
                  Left = 232
                  Top = 8
                  Width = 217
                  Height = 273
                  Caption = 'Tipo de Favorecido para:'
                  TabOrder = 1
                  object Label36: TLabel
                    Left = 6
                    Top = 26
                    Width = 80
                    Height = 13
                    Caption = 'Patrocinadora'
                  end
                  object Label37: TLabel
                    Left = 6
                    Top = 67
                    Width = 36
                    Height = 13
                    Caption = 'Ativos'
                  end
                  object Label38: TLabel
                    Left = 6
                    Top = 108
                    Width = 52
                    Height = 13
                    Caption = 'Mantidos'
                  end
                  object Label39: TLabel
                    Left = 6
                    Top = 149
                    Width = 57
                    Height = 13
                    Caption = 'Assistidos'
                  end
                  object Label40: TLabel
                    Left = 6
                    Top = 190
                    Width = 89
                    Height = 13
                    Caption = 'Mantido Parcial'
                  end
                  object dblkTipFavPatro: TwwDBLookupCombo
                    Left = 6
                    Top = 39
                    Width = 205
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRAMOFORNECEDOR'#9'30'#9'Descrição'
                      'IDRAMOFORNECEDOR'#9'10'#9'Código')
                    LookupTable = qryTipoFav
                    LookupField = 'IDRAMOFORNECEDOR'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkTipFavAtivos: TwwDBLookupCombo
                    Left = 6
                    Top = 81
                    Width = 205
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRAMOFORNECEDOR'#9'30'#9'Descrição'
                      'IDRAMOFORNECEDOR'#9'10'#9'Código')
                    LookupTable = qryTipoFav
                    LookupField = 'IDRAMOFORNECEDOR'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkTipFavMantidos: TwwDBLookupCombo
                    Left = 6
                    Top = 123
                    Width = 205
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRAMOFORNECEDOR'#9'30'#9'Descrição'
                      'IDRAMOFORNECEDOR'#9'10'#9'Código')
                    LookupTable = qryTipoFav
                    LookupField = 'IDRAMOFORNECEDOR'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkTipFavAssistidos: TwwDBLookupCombo
                    Left = 6
                    Top = 165
                    Width = 205
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRAMOFORNECEDOR'#9'30'#9'Descrição'
                      'IDRAMOFORNECEDOR'#9'10'#9'Código')
                    LookupTable = qryTipoFav
                    LookupField = 'IDRAMOFORNECEDOR'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkTipFavMantParc: TwwDBLookupCombo
                    Left = 6
                    Top = 207
                    Width = 205
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRAMOFORNECEDOR'#9'30'#9'Descrição'
                      'IDRAMOFORNECEDOR'#9'10'#9'Código')
                    LookupTable = qryTipoFav
                    LookupField = 'IDRAMOFORNECEDOR'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
              end
            end
          end
        end
        object pgctrlIntegraBenef: TPageControl
          Left = 0
          Top = 16
          Width = 980
          Height = 568
          ActivePage = TabSheet8
          Align = alClient
          HotTrack = True
          Images = imList
          TabOrder = 2
          object tbsBenefContabil: TTabSheet
            Caption = 'Integração Contábil'
            object pgctrlBenefContabil: TPageControl
              Left = 0
              Top = 0
              Width = 972
              Height = 539
              ActivePage = tbsBenefContabilGeral
              Align = alClient
              TabOrder = 0
              object tbsBenefContabilGeral: TTabSheet
                Caption = 'Geral'
                object GroupBox3: TGroupBox
                  Left = 4
                  Top = 18
                  Width = 445
                  Height = 88
                  TabOrder = 0
                  object Label4: TLabel
                    Left = 8
                    Top = 10
                    Width = 55
                    Height = 13
                    Caption = 'Subconta'
                  end
                  object Label7: TLabel
                    Left = 8
                    Top = 45
                    Width = 166
                    Height = 13
                    Caption = 'Entidade Contábil/Financeira'
                  end
                  object dblkSubcontaBenef: TwwDBLookupCombo
                    Left = 8
                    Top = 22
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
                  object dblkpcmbPlanPrevContabBenef: TwwDBLookupCombo
                    Left = 8
                    Top = 57
                    Width = 381
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'50'#9'Entidade Contábil/Financeira')
                    LookupField = 'IDPLANPREVCONTAB'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                  end
                end
                object grpPlaContaDBenefGeral: TGroupBox
                  Left = 4
                  Top = 117
                  Width = 483
                  Height = 85
                  Caption = 
                    ' Conta de Despesa Padrão (válida para todos os benefícios sem co' +
                    'nta específica)'
                  TabOrder = 1
                  object Label16: TLabel
                    Left = 12
                    Top = 14
                    Width = 127
                    Height = 13
                    Caption = 'Conta Contábil - Folha'
                  end
                  object sbtnPlaContaDBenefGERAL: TSpeedButton
                    Left = 229
                    Top = 27
                    Width = 20
                    Height = 21
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
                    OnClick = sbtnPlaContaDBenefGERALClick
                  end
                  object edPlaContaDBenefGERAL: TMaskEdit
                    Left = 12
                    Top = 27
                    Width = 218
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edPlaContaDBenefGERALExit
                  end
                  object GroupBox13: TGroupBox
                    Left = 10
                    Top = 49
                    Width = 464
                    Height = 32
                    Caption = 'Descrição da Conta'
                    TabOrder = 1
                    object lblPlaContaDBenefGERAL: TLabel
                      Left = 9
                      Top = 14
                      Width = 230
                      Height = 12
                      AutoSize = False
                      Caption = 'lblPlaContaDBenefGERAL'
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
              object tbsBenefContabilDespesa: TTabSheet
                Caption = 'Contas de Despesa'
                ImageIndex = 2
                object Label11: TLabel
                  Left = 4
                  Top = -2
                  Width = 127
                  Height = 13
                  Caption = 'Conta Contábil - Folha'
                end
                object Label21: TLabel
                  Left = 4
                  Top = 61
                  Width = 152
                  Height = 13
                  Caption = 'Conta de Líquido da Folha'
                end
                object sbtnPlaContaDBenef: TSpeedButton
                  Left = 224
                  Top = 10
                  Width = 20
                  Height = 21
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
                  OnClick = sbtnPlaContaDBenefClick
                end
                object sbtnPlaContaCBenef: TSpeedButton
                  Left = 223
                  Top = 73
                  Width = 20
                  Height = 21
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
                  OnClick = sbtnPlaContaCBenefClick
                end
                object Label14: TLabel
                  Left = 4
                  Top = 126
                  Width = 172
                  Height = 13
                  Caption = 'Conta Contábil - Ação Judicial'
                end
                object sbtnPLACTAACJUD: TSpeedButton
                  Left = 224
                  Top = 138
                  Width = 20
                  Height = 21
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
                  OnClick = sbtnPLACTAACJUDClick
                end
                object lblTitPLACONTADADT13: TLabel
                  Left = 4
                  Top = 254
                  Width = 267
                  Height = 13
                  Caption = 'Conta Contábil - Adiantamento de Abono Anual'
                end
                object sbtnPLACONTADADT13: TSpeedButton
                  Left = 224
                  Top = 267
                  Width = 20
                  Height = 21
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
                  OnClick = sbtnPLACONTADADT13Click
                end
                object lblTitContaContabilDevol: TLabel
                  Left = 5
                  Top = 189
                  Width = 240
                  Height = 13
                  Caption = 'Conta Contábil - Devolução de Benefícios'
                end
                object sbtnPlaContaDevol: TSpeedButton
                  Left = 225
                  Top = 201
                  Width = 20
                  Height = 21
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
                  OnClick = sbtnPlaContaDevolClick
                end
                object edPlaContaDBenef: TMaskEdit
                  Left = 4
                  Top = 10
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnExit = edPlaContaDBenefExit
                end
                object GroupBox14: TGroupBox
                  Left = 4
                  Top = 32
                  Width = 464
                  Height = 29
                  Caption = 'Descrição da Conta'
                  TabOrder = 1
                  object lblPlaContaDBenef: TLabel
                    Left = 6
                    Top = 13
                    Width = 230
                    Height = 12
                    AutoSize = False
                    Caption = 'lblPlaContaDBenef'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object edPlaContaCBenef: TMaskEdit
                  Left = 4
                  Top = 73
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnExit = edPlaContaCBenefExit
                end
                object GroupBox19: TGroupBox
                  Left = 4
                  Top = 95
                  Width = 464
                  Height = 30
                  Caption = 'Descrição da Conta'
                  TabOrder = 3
                  object lblPlaContaCBenef: TLabel
                    Left = 6
                    Top = 14
                    Width = 230
                    Height = 12
                    AutoSize = False
                    Caption = 'lblPlaContaCBenef'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object edPLACTAACJUD: TMaskEdit
                  Left = 4
                  Top = 138
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = edPLACTAACJUDExit
                end
                object GroupBox15: TGroupBox
                  Left = 4
                  Top = 159
                  Width = 464
                  Height = 29
                  Caption = 'Descrição da Conta'
                  TabOrder = 5
                  object lblPLACTAACJUD: TLabel
                    Left = 6
                    Top = 14
                    Width = 230
                    Height = 13
                    AutoSize = False
                    Caption = 'lblPLACTAACJUD'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object edPLACONTADADT13: TMaskEdit
                  Left = 4
                  Top = 267
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                  OnExit = edPLACONTADADT13Exit
                end
                object grpPLACONTADADT13: TGroupBox
                  Left = 4
                  Top = 289
                  Width = 464
                  Height = 32
                  Caption = 'Descrição da Conta'
                  TabOrder = 7
                  object lblPLACONTADADT13: TLabel
                    Left = 6
                    Top = 14
                    Width = 230
                    Height = 13
                    AutoSize = False
                    Caption = 'lblPLACONTADADT13'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object edPlaContaDevol: TMaskEdit
                  Left = 5
                  Top = 201
                  Width = 218
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 8
                  OnExit = edPlaContaDevolExit
                end
                object grpPlaContaDevol: TGroupBox
                  Left = 4
                  Top = 223
                  Width = 464
                  Height = 29
                  Caption = 'Descrição da Conta'
                  TabOrder = 9
                  object lblPlaContaDevol: TLabel
                    Left = 6
                    Top = 14
                    Width = 230
                    Height = 13
                    AutoSize = False
                    Caption = 'lblPlaContaDevol'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
              end
              object tbsBenefContabilProvisao: TTabSheet
                Caption = 'Contas de Provisão'
                ImageIndex = 1
                object pgctrlBenefContabilProvisao: TPageControl
                  Left = 0
                  Top = 0
                  Width = 964
                  Height = 511
                  ActivePage = tbsBenefContabilProvisaoAbono
                  Align = alClient
                  TabOrder = 0
                  object tbsBenefContabilProvisaoAbono: TTabSheet
                    Caption = 'Para Abono'
                    object GroupBox23: TGroupBox
                      Left = 3
                      Top = -2
                      Width = 478
                      Height = 104
                      Caption = 'Conta a Débito'
                      TabOrder = 0
                      object sbtnPLACONTADPROVIS: TSpeedButton
                        Left = 229
                        Top = 30
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
                        OnClick = sbtnPLACONTADPROVISClick
                      end
                      object Label47: TLabel
                        Left = 9
                        Top = 18
                        Width = 50
                        Height = 13
                        Caption = 'Provisão'
                      end
                      object edPLACONTADPROVIS: TMaskEdit
                        Left = 9
                        Top = 30
                        Width = 218
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnExit = edPLACONTADPROVISExit
                      end
                      object GroupBox25: TGroupBox
                        Left = 9
                        Top = 50
                        Width = 464
                        Height = 28
                        Caption = 'Descrição da Conta'
                        TabOrder = 1
                        object lblPLACONTADPROVIS: TLabel
                          Left = 11
                          Top = 12
                          Width = 350
                          Height = 13
                          AutoSize = False
                          Caption = 'lblPLACONTADPROVIS'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                        end
                      end
                    end
                    object GroupBox27: TGroupBox
                      Left = 3
                      Top = 107
                      Width = 478
                      Height = 104
                      Caption = 'Conta a Crédito'
                      TabOrder = 1
                      object sbtnPLACONTACPROVIS: TSpeedButton
                        Left = 229
                        Top = 30
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
                        OnClick = sbtnPLACONTACPROVISClick
                      end
                      object Label49: TLabel
                        Left = 9
                        Top = 18
                        Width = 50
                        Height = 13
                        Caption = 'Provisão'
                      end
                      object edPLACONTACPROVIS: TMaskEdit
                        Left = 9
                        Top = 30
                        Width = 218
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnExit = edPLACONTACPROVISExit
                      end
                      object GroupBox30: TGroupBox
                        Left = 9
                        Top = 50
                        Width = 464
                        Height = 28
                        Caption = 'Descrição da Conta'
                        TabOrder = 1
                        object lblPLACONTACPROVIS: TLabel
                          Left = 8
                          Top = 12
                          Width = 353
                          Height = 13
                          AutoSize = False
                          Caption = 'lbDescricaoContaProvisC'
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
                  object tbsBenefContabilProvisaoProvisorio: TTabSheet
                    Caption = 'Para Benefício Provisório'
                    ImageIndex = 1
                    object GroupBox32: TGroupBox
                      Left = 3
                      Top = -2
                      Width = 478
                      Height = 104
                      Caption = '  Formação de Saldo Dívida de Assistidos'
                      TabOrder = 0
                      object sbtnPLACONTADPROVADT: TSpeedButton
                        Left = 229
                        Top = 30
                        Width = 21
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
                        OnClick = sbtnPLACONTADPROVADTClick
                      end
                      object Label52: TLabel
                        Left = 9
                        Top = 18
                        Width = 38
                        Height = 13
                        Caption = 'Débito'
                      end
                      object edPLACONTADPROVADT: TMaskEdit
                        Left = 8
                        Top = 30
                        Width = 218
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnExit = edPLACONTADPROVADTExit
                      end
                      object GroupBox38: TGroupBox
                        Left = 8
                        Top = 50
                        Width = 464
                        Height = 28
                        Caption = 'Descrição da Conta'
                        TabOrder = 1
                        object lblPLACONTADPROVADT: TLabel
                          Left = 11
                          Top = 12
                          Width = 350
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
                    object GroupBox39: TGroupBox
                      Left = 3
                      Top = 107
                      Width = 478
                      Height = 104
                      Caption = 'Conta a Crédito'
                      TabOrder = 1
                      object sbtnlblPLACONTACPROVADT: TSpeedButton
                        Left = 231
                        Top = 30
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
                        OnClick = sbtnlblPLACONTACPROVADTClick
                      end
                      object Label57: TLabel
                        Left = 9
                        Top = 18
                        Width = 50
                        Height = 13
                        Caption = 'Provisão'
                      end
                      object edPLACONTACPROVADT: TMaskEdit
                        Left = 9
                        Top = 30
                        Width = 218
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnExit = edPLACONTACPROVADTExit
                      end
                      object GroupBox41: TGroupBox
                        Left = 9
                        Top = 50
                        Width = 464
                        Height = 28
                        Caption = 'Descrição da Conta'
                        TabOrder = 1
                        object lblPLACONTACPROVADT: TLabel
                          Left = 8
                          Top = 12
                          Width = 353
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
              end
            end
          end
          object TabSheet8: TTabSheet
            Caption = 'Integração Financeira'
            ImageIndex = 1
            object pgctrlBenefFinanceiro: TPageControl
              Left = 0
              Top = 0
              Width = 972
              Height = 539
              ActivePage = tbsBenefFinancGeral
              Align = alClient
              TabOrder = 0
              object tbsBenefFinancGeral: TTabSheet
                Caption = 'Geral'
                ImageIndex = 2
                object GroupBox47: TGroupBox
                  Left = 3
                  Top = 3
                  Width = 478
                  Height = 174
                  TabOrder = 0
                  object Label64: TLabel
                    Left = 7
                    Top = 8
                    Width = 108
                    Height = 13
                    Caption = 'Atividade / Projeto'
                  end
                  object Label65: TLabel
                    Left = 7
                    Top = 51
                    Width = 220
                    Height = 13
                    Caption = 'Contas/Caixas x Forma de Pagamento '
                  end
                  object Label66: TLabel
                    Left = 7
                    Top = 93
                    Width = 160
                    Height = 13
                    Caption = 'Centro de Responsabilidade'
                  end
                  object Label8: TLabel
                    Left = 7
                    Top = 133
                    Width = 92
                    Height = 13
                    Caption = 'Centro de Custo'
                  end
                  object lkcmbDescAtividadeBenef: TwwDBLookupCombo
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
                  object dblkpcmbPortFormaBenef: TwwDBLookupCombo
                    Left = 7
                    Top = 64
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
                  object cmbcentresponBenef: TwwDBLookupCombo
                    Left = 7
                    Top = 107
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
                  object dblkpcmbBenefCCusto: TwwDBLookupCombo
                    Left = 7
                    Top = 147
                    Width = 381
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'30'#9'Centro de Custo'#9'F'
                      'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
                    LookupTable = dtmIntegraCAPCAR.qryCCusto
                    LookupField = 'CODCENTROCUSTO'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                  end
                end
              end
              object tbsBenefFinancPagamento: TTabSheet
                Caption = 'Pagamento'
                object GroupBox48: TGroupBox
                  Left = 5
                  Top = 88
                  Width = 431
                  Height = 74
                  Caption = 'Para Rateio no Contas a Receber (descontos)'
                  TabOrder = 0
                  object Label67: TLabel
                    Left = 6
                    Top = 15
                    Width = 122
                    Height = 13
                    Caption = 'Tipo de Recebimento'
                  end
                  object sbtnCODTIPRECEBCAP: TSpeedButton
                    Left = 353
                    Top = 32
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
                    OnClick = sbtnCODTIPRECEBCAPClick
                  end
                  object edCODTIPRECEBCAP: TEdit
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
                    OnExit = edCODTIPRECEBCAPExit
                  end
                end
                object GroupBox49: TGroupBox
                  Left = 5
                  Top = 7
                  Width = 431
                  Height = 74
                  Caption = 'Para Rateio no Contas a Pagar '
                  TabOrder = 1
                  object Label68: TLabel
                    Left = 6
                    Top = 18
                    Width = 116
                    Height = 13
                    Caption = 'Tipo de Desembolso'
                  end
                  object sbtnCODTIPRECDESBenef: TSpeedButton
                    Left = 354
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
                    OnClick = sbtnCODTIPRECDESBenefClick
                  end
                  object edCODTIPRECDESBenef: TEdit
                    Left = 6
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
                    OnExit = edCODTIPRECDESBenefExit
                  end
                end
              end
              object tbsBenefFinancProvisao: TTabSheet
                Caption = 'Provisão'
                ImageIndex = 3
                object GroupBox51: TGroupBox
                  Left = 5
                  Top = 12
                  Width = 405
                  Height = 49
                  Caption = ' Tipo de Desembolso para Provisão de Abono Anual de Benefício '
                  TabOrder = 0
                  object sbtnCODTIPDESEMBPROV: TSpeedButton
                    Left = 362
                    Top = 21
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
                    OnClick = sbtnCODTIPDESEMBPROVClick
                  end
                  object edCODTIPDESEMBPROV: TEdit
                    Left = 15
                    Top = 20
                    Width = 345
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edCODTIPDESEMBPROVExit
                  end
                end
                object GroupBox52: TGroupBox
                  Left = 5
                  Top = 69
                  Width = 405
                  Height = 49
                  Caption = ' Tipo de Desembolso para Provisão de Benefício Provisório '
                  TabOrder = 1
                  object sbtnCODTIPRECDESADT: TSpeedButton
                    Left = 362
                    Top = 21
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
                    OnClick = sbtnCODTIPRECDESADTClick
                  end
                  object edCODTIPRECDESADT: TEdit
                    Left = 15
                    Top = 20
                    Width = 345
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnExit = edCODTIPRECDESADTExit
                  end
                end
              end
              object tbsBenefFinancDevolucao: TTabSheet
                Caption = 'Devolução'
                ImageIndex = 1
                object GroupBox50: TGroupBox
                  Left = 2
                  Top = 4
                  Width = 452
                  Height = 74
                  Caption = 'Para Rateio no Contas a Receber '
                  TabOrder = 0
                  object Label69: TLabel
                    Left = 6
                    Top = 18
                    Width = 122
                    Height = 13
                    Caption = 'Tipo de Recebimento'
                  end
                  object SpeedButton14: TSpeedButton
                    Left = 354
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
                    OnClick = SpeedButton14Click
                  end
                  object edCODTIPRECEBDEVOLBenef: TEdit
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
                    OnExit = edTpDesemb1Exit
                  end
                end
              end
            end
          end
        end
      end
      object pnlIntegEsquerda: TPanel
        Left = 1
        Top = 1
        Width = 280
        Height = 584
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 280
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Selecione um dos itens abaixo ...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbgrdGerais: TwwDBGrid
          Left = 0
          Top = 16
          Width = 280
          Height = 568
          Selected.Strings = (
            'FUNDACAO'#9'60'#9'FUNDACAO')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsGerais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgIndicator, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        end
        object dbgrdContrib: TwwDBGrid
          Left = 0
          Top = 16
          Width = 280
          Height = 568
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsContrib
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgIndicator, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = pmnu
          TabOrder = 0
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
        object dbgrdBenef: TwwDBGrid
          Left = 0
          Top = 16
          Width = 280
          Height = 568
          Selected.Strings = (
            'NOME'#9'60'#9'NOME'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgIndicator, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = pmnu
          TabOrder = 2
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
    end
    object pnlDividaBenef: TPanel
      Left = 1
      Top = 72
      Width = 1262
      Height = 586
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object pcDividaBenef: TPageControl
        Left = 5
        Top = 3
        Width = 1357
        Height = 589
        ActivePage = tsDivBenefFinanc
        TabOrder = 0
        object tsDivBenefContab: TTabSheet
          Caption = '    Integração Contábil     '
          object GroupBox58: TGroupBox
            Left = 9
            Top = 5
            Width = 1001
            Height = 129
            Caption = '  Formação de Saldo Dívida de Assistidos'
            TabOrder = 0
            object sbtnPLACONTADFORMASDODIV: TSpeedButton
              Left = 316
              Top = 19
              Width = 21
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
              OnClick = sbtnPLACONTADFORMASDODIVClick
            end
            object Label48: TLabel
              Left = 9
              Top = 24
              Width = 38
              Height = 13
              Caption = 'Débito'
            end
            object Label62: TLabel
              Left = 9
              Top = 51
              Width = 41
              Height = 13
              Caption = 'Crédito'
            end
            object sbtnPLACONTACFORMASDODIV: TSpeedButton
              Left = 316
              Top = 46
              Width = 21
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
              OnClick = sbtnPLACONTACFORMASDODIVClick
            end
            object Label72: TLabel
              Left = 9
              Top = 79
              Width = 86
              Height = 13
              Caption = 'Reversão Deb.'
            end
            object sbtnPLACONTADREVFORMASDODIV: TSpeedButton
              Left = 316
              Top = 74
              Width = 21
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
              OnClick = sbtnPLACONTADREVFORMASDODIVClick
            end
            object Label90: TLabel
              Left = 9
              Top = 108
              Width = 89
              Height = 13
              Caption = 'Reversão Cred.'
            end
            object sbtnPLACONTACREVFORMASDODIV: TSpeedButton
              Left = 316
              Top = 101
              Width = 21
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
              OnClick = sbtnPLACONTACREVFORMASDODIVClick
            end
            object edPLACONTADFORMASDODIV: TMaskEdit
              Left = 100
              Top = 19
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edPLACONTADFORMASDODIVExit
            end
            object GroupBox60: TGroupBox
              Left = 346
              Top = 13
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 4
              object lblPLACONTADFORMASDODIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
            object edPLACONTACFORMASDODIV: TMaskEdit
              Left = 100
              Top = 46
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnExit = edPLACONTACFORMASDODIVExit
            end
            object GroupBox62: TGroupBox
              Left = 346
              Top = 40
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 5
              object lblPLACONTACFORMASDODIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
            object edPLACONTADREVFORMASDODIV: TMaskEdit
              Left = 100
              Top = 74
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnExit = edPLACONTADREVFORMASDODIVExit
            end
            object GroupBox65: TGroupBox
              Left = 346
              Top = 68
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 6
              object lblPLACONTADREVFORMASDODIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
            object edPLACONTACREVFORMASDODIV: TMaskEdit
              Left = 100
              Top = 100
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnExit = edPLACONTACREVFORMASDODIVExit
            end
            object GroupBox76: TGroupBox
              Left = 346
              Top = 95
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 7
              object lblPLACONTACREVFORMASDODIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
          object GroupBox61: TGroupBox
            Left = 9
            Top = 141
            Width = 1001
            Height = 129
            Caption = ' Baixa Definitiva Dívida de Assistidos'
            TabOrder = 1
            object sbtnPLACONTADBAIXADIV: TSpeedButton
              Left = 316
              Top = 19
              Width = 21
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
              OnClick = sbtnPLACONTADBAIXADIVClick
            end
            object Label60: TLabel
              Left = 9
              Top = 24
              Width = 38
              Height = 13
              Caption = 'Débito'
            end
            object Label61: TLabel
              Left = 9
              Top = 51
              Width = 41
              Height = 13
              Caption = 'Crédito'
            end
            object sbtnPLACONTACBAIXADIV: TSpeedButton
              Left = 316
              Top = 46
              Width = 21
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
              OnClick = sbtnPLACONTACBAIXADIVClick
            end
            object Label70: TLabel
              Left = 9
              Top = 79
              Width = 86
              Height = 13
              Caption = 'Reversão Deb.'
            end
            object sbtnPLACONTADREVBAIXADIV: TSpeedButton
              Left = 316
              Top = 74
              Width = 21
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
              OnClick = sbtnPLACONTADREVBAIXADIVClick
            end
            object Label88: TLabel
              Left = 9
              Top = 108
              Width = 89
              Height = 13
              Caption = 'Reversão Cred.'
            end
            object sbtnPLACONTACREVBAIXADIV: TSpeedButton
              Left = 316
              Top = 103
              Width = 21
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
              OnClick = sbtnPLACONTACREVBAIXADIVClick
            end
            object edPLACONTADBAIXADIV: TMaskEdit
              Left = 100
              Top = 19
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edPLACONTADBAIXADIVExit
            end
            object GroupBox63: TGroupBox
              Left = 346
              Top = 13
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 4
              object lblPLACONTADBAIXADIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
            object edPLACONTACBAIXADIV: TMaskEdit
              Left = 100
              Top = 46
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnExit = edPLACONTACBAIXADIVExit
            end
            object GroupBox64: TGroupBox
              Left = 346
              Top = 40
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 5
              object lblPLACONTACBAIXADIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
            object edPLACONTADREVBAIXADIV: TMaskEdit
              Left = 100
              Top = 74
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnExit = edPLACONTADREVBAIXADIVExit
            end
            object GroupBox66: TGroupBox
              Left = 346
              Top = 68
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 6
              object lblPLACONTADREVBAIXADIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
            object edPLACONTACREVBAIXADIV: TMaskEdit
              Left = 100
              Top = 103
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnExit = edPLACONTACREVBAIXADIVExit
            end
            object GroupBox75: TGroupBox
              Left = 346
              Top = 97
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 7
              object lblPLACONTACREVBAIXADIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
          object GroupBox67: TGroupBox
            Left = 9
            Top = 276
            Width = 1001
            Height = 131
            Caption = ' Formação Provisão para Perdas '
            TabOrder = 2
            object sbtnPLACONTADPROVDIV: TSpeedButton
              Left = 316
              Top = 20
              Width = 21
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
              OnClick = sbtnPLACONTADPROVDIVClick
            end
            object Label76: TLabel
              Left = 9
              Top = 25
              Width = 38
              Height = 13
              Caption = 'Débito'
            end
            object Label77: TLabel
              Left = 9
              Top = 52
              Width = 41
              Height = 13
              Caption = 'Crédito'
            end
            object sbtnPLACONTACPROVDIV: TSpeedButton
              Left = 316
              Top = 47
              Width = 21
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
              OnClick = sbtnPLACONTACPROVDIVClick
            end
            object Label78: TLabel
              Left = 9
              Top = 80
              Width = 86
              Height = 13
              Caption = 'Reversão Deb.'
            end
            object sbtnPLACONTADREVPROVDIV: TSpeedButton
              Left = 316
              Top = 75
              Width = 21
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
              OnClick = sbtnPLACONTADREVPROVDIVClick
            end
            object Label84: TLabel
              Left = 9
              Top = 107
              Width = 89
              Height = 13
              Caption = 'Reversão Cred.'
            end
            object sbtnPLACONTACREVPROVDIV: TSpeedButton
              Left = 316
              Top = 102
              Width = 21
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
              OnClick = sbtnPLACONTACREVPROVDIVClick
            end
            object edPLACONTADPROVDIV: TMaskEdit
              Left = 100
              Top = 20
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edPLACONTADPROVDIVExit
            end
            object GroupBox68: TGroupBox
              Left = 346
              Top = 14
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 4
              object lblPLACONTADPROVDIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
            object edPLACONTACPROVDIV: TMaskEdit
              Left = 100
              Top = 47
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnExit = edPLACONTACPROVDIVExit
            end
            object GroupBox69: TGroupBox
              Left = 346
              Top = 41
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 5
              object lblPLACONTACPROVDIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
            object edPLACONTADREVPROVDIV: TMaskEdit
              Left = 100
              Top = 75
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnExit = edPLACONTADREVPROVDIVExit
            end
            object GroupBox70: TGroupBox
              Left = 346
              Top = 69
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 6
              object lblPLACONTADREVPROVDIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
            object edPLACONTACREVPROVDIV: TMaskEdit
              Left = 100
              Top = 102
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnExit = edPLACONTACREVPROVDIVExit
            end
            object GroupBox74: TGroupBox
              Left = 346
              Top = 96
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 7
              object lblPLACONTACREVPROVDIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
          object GroupBox71: TGroupBox
            Left = 9
            Top = 414
            Width = 1001
            Height = 75
            Caption = ' Atualização/Reajustes (anuais) Dívida de Assistidos'
            TabOrder = 3
            object sbtnPLACONTADATUREAJDIV: TSpeedButton
              Left = 316
              Top = 19
              Width = 21
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
              OnClick = sbtnPLACONTADATUREAJDIVClick
            end
            object Label82: TLabel
              Left = 9
              Top = 24
              Width = 38
              Height = 13
              Caption = 'Débito'
            end
            object Label83: TLabel
              Left = 9
              Top = 52
              Width = 41
              Height = 13
              Caption = 'Crédito'
            end
            object sbtnPLACONTACATUREAJDIV: TSpeedButton
              Left = 316
              Top = 47
              Width = 21
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
              OnClick = sbtnPLACONTACATUREAJDIVClick
            end
            object edPLACONTADATUREAJDIV: TMaskEdit
              Left = 100
              Top = 19
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edPLACONTADATUREAJDIVExit
            end
            object GroupBox72: TGroupBox
              Left = 346
              Top = 13
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 2
              object lblPLACONTADATUREAJDIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
            object edPLACONTACATUREAJDIV: TMaskEdit
              Left = 100
              Top = 47
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnExit = edPLACONTACATUREAJDIVExit
            end
            object GroupBox73: TGroupBox
              Left = 346
              Top = 41
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 3
              object lblPLACONTACATUREAJDIV: TLabel
                Left = 63
                Top = 12
                Width = 350
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
          object GroupBox77: TGroupBox
            Left = 9
            Top = 490
            Width = 1001
            Height = 50
            Caption = ' Recebimento via Boleto'
            TabOrder = 4
            object btnPLACONTACBOLETO: TSpeedButton
              Left = 316
              Top = 19
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
              OnClick = btnPLACONTACBOLETOClick
            end
            object Label55: TLabel
              Left = 9
              Top = 24
              Width = 78
              Height = 13
              Caption = 'Conta Crédito'
            end
            object edPLACONTACBOLETO: TMaskEdit
              Left = 100
              Top = 19
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edPLACONTACBOLETOExit
            end
            object GroupBox78: TGroupBox
              Left = 346
              Top = 13
              Width = 464
              Height = 28
              Caption = 'Descrição da Conta'
              TabOrder = 1
              object lblPLACONTACBOLETO: TLabel
                Left = 63
                Top = 12
                Width = 353
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
        object tsDivBenefFinanc: TTabSheet
          Caption = '  Integração Financeira   '
          ImageIndex = 1
          object GroupBox80: TGroupBox
            Left = 10
            Top = 19
            Width = 422
            Height = 153
            Caption = 'Para Rateio no Contas a Receber '
            TabOrder = 0
            object Label79: TLabel
              Left = 6
              Top = 106
              Width = 122
              Height = 13
              Caption = 'Tipo de Recebimento'
            end
            object sbtnTipoReembDivida: TSpeedButton
              Left = 370
              Top = 120
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
              OnClick = sbtnTipoReembDividaClick
            end
            object Label74: TLabel
              Left = 7
              Top = 22
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object Label75: TLabel
              Left = 7
              Top = 62
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object dblkpTipoReembDivida: TEdit
              Tag = 8
              Left = 7
              Top = 120
              Width = 361
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edTpDesemb1Exit
            end
            object dblkpCentresponDivida: TwwDBLookupCombo
              Left = 7
              Top = 36
              Width = 387
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
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkpCentcustoDivida: TwwDBLookupCombo
              Left = 7
              Top = 76
              Width = 387
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Centro de Custo'#9'F'
                'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
              LookupTable = dtmIntegraCAPCAR.qryCCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object gbRubAcerto: TGroupBox
            Left = 10
            Top = 187
            Width = 422
            Height = 142
            Caption = ' Recebimento de Boletos '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object btnRubBaixaBol: TSpeedButton
              Left = 370
              Top = 47
              Width = 19
              Height = 19
              Glyph.Data = {
                36010000424D3601000000000000760000002800000011000000100000000100
                040000000000C0000000C40E0000C40E00001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777770000000777777700F077777700000007777700FFF077777700000007770
                0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                000077707E7E0777777770000000777700007777777770000000}
              OnClick = btnRubBaixaBolClick
            end
            object Label71: TLabel
              Left = 10
              Top = 30
              Width = 227
              Height = 13
              Caption = 'Rubrica para Baixa de Parcela na Folha'
            end
            object lblAltBaixaDoc: TLabel
              Left = 6
              Top = 83
              Width = 202
              Height = 13
              Caption = 'Alterador para Baixa de Documento'
            end
            object dblkpRubBaixaBol: TwwDBLookupCombo
              Left = 7
              Top = 46
              Width = 361
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'130'#9'DESCRICAO'#9'F'
                'CODPROVDESC'#9'15'#9'CODPROVDESC'#9'F')
              LookupTable = qryProventos
              LookupField = 'IDPROVENTO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkpAltBaixaBol: TwwDBLookupCombo
              Left = 7
              Top = 99
              Width = 387
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'130'#9'Rubrica')
              LookupTable = qryAltBaixa
              LookupField = 'CODALTERADOR'
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
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 1262
      Height = 71
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 12
        Width = 59
        Height = 13
        Caption = 'Visualizar '
      end
      object Label2: TLabel
        Left = 24
        Top = 54
        Width = 5
        Height = 13
      end
      object lblPara: TLabel
        Left = 12
        Top = 45
        Width = 26
        Height = 13
        Caption = 'para'
      end
      object sbtnSelPessoa: TSpeedButton
        Left = 451
        Top = 44
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
          BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
          BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
          BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
          BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
          EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
          EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
          EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
          EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
        NumGlyphs = 2
        OnClick = sbtnSelPessoaClick
      end
      object sbtnSelBeneficio: TSpeedButton
        Left = 480
        Top = 37
        Width = 151
        Height = 28
        Caption = 'Benefícios'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = sbtnSelBeneficioClick
      end
      object sbtnSelContribuicao: TSpeedButton
        Left = 480
        Top = 7
        Width = 151
        Height = 28
        Caption = 'Contribuições'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333FFF333333333333000333333333
          3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
          3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
          0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
          BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
          33337777773FF733333333333300033333333333337773333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = sbtnSelContribuicaoClick
      end
      object sbtnSelContribuicao13: TSpeedButton
        Left = 634
        Top = 7
        Width = 151
        Height = 28
        Caption = 'Contribuições 13o.'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333FFF333333333333000333333333
          3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
          3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
          0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
          BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
          33337777773FF733333333333300033333333333337773333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = sbtnSelContribuicao13Click
      end
      object sbtnSelBeneficio13: TSpeedButton
        Left = 634
        Top = 37
        Width = 151
        Height = 28
        Caption = 'Abono Anual Benef.'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = sbtnSelBeneficio13Click
      end
      object sbtnSelDivBenef: TSpeedButton
        Left = 794
        Top = 37
        Width = 151
        Height = 28
        Caption = 'Dívida de Benefício'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = sbtnSelDivBenefClick
      end
      object edPessoa: TEdit
        Left = 72
        Top = 45
        Width = 376
        Height = 21
        TabOrder = 3
      end
      object dblkpcmbPlano: TwwDBLookupCombo
        Left = 72
        Top = 45
        Width = 376
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'#9'F')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbPlanoCloseUp
      end
      object dblkpcmbPatroPlano: TwwDBLookupCombo
        Left = 72
        Top = 45
        Width = 376
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAOGERAL'#9'110'#9'DESCRICAOGERAL'#9'F')
        LookupTable = qryPatroPlano
        LookupField = 'CODIGOGERAL'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbPatroPlanoCloseUp
      end
      object dblkpcmbNivelIntegracao: TwwDBLookupCombo
        Left = 72
        Top = 12
        Width = 376
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
        LookupTable = qryNivelIntegracao
        LookupField = 'DESCRICAO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbNivelIntegracaoCloseUp
      end
    end
  end
  inherited Dock971: TDock97
    Top = 659
    Width = 1264
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  object treeTpPaga: TCMTreeView [2]
    Left = 743
    Top = 273
    Width = 404
    Height = 94
    PodeNavegar = True
    Mascara = '99.99.99'
    DataSource = dsTpPaga
    CampoChave = QryTpPagaCODTIPRECDES
    CampoDescricao = QryTpPagaDESCRICAO
    CampoTipo = QryTpPagaANASINT
    OnDblClick = treeTpPagaDblClick
    OnExit = treeTpPagaExit
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Visible = False
  end
  object treeContaContabil: TCMTreeView [3]
    Left = 741
    Top = 302
    Width = 388
    Height = 89
    PodeNavegar = True
    DataSource = dsContaContabil
    CampoChave = qrycontacontabilPLACONTA
    CampoDescricao = qrycontacontabilPLANOME
    CampoTipo = qrycontacontabilPLATIPO
    OnDblClick = treeContaContabilDblClick
    OnExit = treeContaContabilExit
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Visible = False
  end
  object treeTpReceb: TCMTreeView [4]
    Left = 739
    Top = 333
    Width = 402
    Height = 98
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 12
    Top = 466
    TargetsData = (
      1
      2
      (
        ''
        'Items'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qryNivelIntegracao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1 AS NIVEL, '#39'Informações Gerais'#39' AS DESCRICAO FROM DUAL U' +
        'NION'
      
        'SELECT 2 AS NIVEL, '#39'Parametrização por Plano'#39' AS DESCRICAO FROM ' +
        'DUAL UNION'
      
        'SELECT 3 AS NIVEL, '#39'Parametrização por Patrocinadora x Plano'#39' AS' +
        ' DESCRICAO FROM DUAL UNION'
      
        'SELECT 4 AS NIVEL, '#39'Parametrização por Pessoa (Exceções)'#39' AS DES' +
        'CRICAO FROM DUAL'
      ' ')
    ValidateWithMask = True
    Left = 39
    Top = 74
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME,'
      '       /*115304*/'
      '       PLACONTACDIVSALDO,'
      '       PLACONTADDIVSALDO,'
      '       PLACONTACDIVSLDREV,'
      '       PLACONTADDIVSLDREV,'
      '       PLACONTACDIVBAIXA,'
      '       PLACONTADDIVBAIXA,'
      '       PLACONTACDIVBAIXAREV,'
      '       PLACONTADDIVBAIXAREV,'
      '       PLACONTACDIVPROVISAO,'
      '       PLACONTADDIVPROVISAO,'
      '       PLACONTACDIVPROVREV,'
      '       PLACONTADDIVPROVREV,'
      '       PLACONTACDIVATUREAJ,'
      '       PLACONTADDIVATUREAJ,'
      '       /*136150*/'
      '       PLACONTACBOLETO,'
      '       CODCENTROCUSTODIVIDA,'
      '       CODCENTRORESPONDIVIDA,'
      '       CODTIPRECDESDIVIDA,'
      '       CODALTERADORBAIXA,'
      '       IDRUBRICARECBOLDIVIDA'
      '  FROM PLANPREV ORDER BY NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 112
    Top = 58
  end
  object qryPatroPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PL.IDPLANOPREV, PL.NOME PLANO, PLP.IDPESSJUR, P.NOME AS P' +
        'ATRO,'
      
        '       TO_CHAR(PLP.IDPESSJUR)||TO_CHAR(PLP.IDPLANOPREV) AS CODIG' +
        'OGERAL,'
      
        '       LTRIM(RTRIM(P.NOME))||'#39' - Plano : '#39'||LTRIM(RTRIM(PL.NOME)' +
        ') AS DESCRICAOGERAL'
      'FROM   PESSOA P, PLANPREVPATRO PLP, PLANPREV PL'
      'WHERE  P.IDPESSOA = PLP.IDPESSJUR'
      'AND    PL.IDPLANOPREV = PLP.IDPLANOPREV'
      'ORDER BY P.NOME, PL.NOME'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 26
  end
  object qryContribPlano: TwwQuery
    BeforeScroll = qryContribPlanoBeforeScroll
    AfterScroll = qryContribPlanoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CP.IDPLANOPREV,'
      '       CP.IDCONTRIBUICAO,'
      '       CP.FLGCOBRADECTERC,'
      '       C.NOME,'
      
        '       DECODE(:FLG13,0, CP.PLACONTAC,         CP.PLACONTAC13)   ' +
        '    AS PLACONTAC,'
      
        '       DECODE(:FLG13,0, CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOC' +
        '13) AS CODCENTROCUSTOC,'
      
        '       DECODE(:FLG13,0, CP.PLACONTADBANCO,    CP.PLACONTADBANCO1' +
        '3)  AS PLACONTADBANCO,'
      
        '       DECODE(:FLG13,0, CP.CODCENTROCUSTOD,   CP.CODCENTROCUSTOD' +
        '13) AS CODCENTROCUSTOD,'
      
        '       DECODE(:FLG13,0, CP.CODSUBCONTA,       CP.CODSUBCONTA13) ' +
        '    AS CODSUBCONTA,'
      
        '       DECODE(:FLG13,0, CP.CODPORTFORMA,      CP.CODPORTFORMA13)' +
        '    AS CODPORTFORMA,'
      
        '       DECODE(:FLG13,0, CP.CODTIPRECDES,      CP.CODTIPRECDES13)' +
        '    AS CODTIPRECDES,'
      
        '       DECODE(:FLG13,0, CP.CODCENTRORESPON,   CP.CODCENTRORESPON' +
        '13) AS CODCENTRORESPON,'
      
        '       DECODE(:FLG13,0, CP.UNIDNEGOC,         CP.UNIDNEGOC13)   ' +
        '    AS UNIDNEGOC,'
      
        '       DECODE(:FLG13,0, CP.IDPLANPREVCONTAB,  CP.IDPLANPREVCONTA' +
        'B)  AS IDPLANPREVCONTAB,'
      
        '       DECODE(:FLG13,0, CP.PLACONTAD,         CP.PLACONTAD13)   ' +
        '    AS PLACONTAD,'
      
        '       DECODE(:FLG13,0, CP.PLACONTAOUTROMES,  CP.PLACTAOUTROMES1' +
        '3)  AS PLACONTAOUTROMES,'
      
        '       DECODE(:FLG13,0, CP.PLACTAACJUD,       CP.PLACTAACJUD13) ' +
        '    AS PLACTAACJUD,'
      '       CP.PLACONTACADT13,'
      
        '       DECODE(:FLG13,0, CP.PLACONTADPROVIS,   CP.PLACONTADPROVIS' +
        '13) AS PLACONTADPROVIS,'
      
        '       DECODE(:FLG13,0, CP.PLACONTACPROVIS,   CP.PLACONTACPROVIS' +
        '13) AS PLACONTACPROVIS,'
      
        '       DECODE(:FLG13,0, CP.PLACONTADPROVADT,  CP.PLACTDPROVADT13' +
        ')   AS PLACONTADPROVADT,'
      
        '       DECODE(:FLG13,0, CP.PLACONTACPROVADT,  CP.PLACTCPROVADT13' +
        ')   AS PLACONTACPROVADT,'
      
        '       DECODE(:FLG13,0, CP.PLACONTADEVOLPAT,  CP.PLACTDEVOLPAT13' +
        ')   AS PLACONTADEVOLPAT,'
      
        '       DECODE(:FLG13,0, CP.PLACONTADEVOL,     CP.PLACONTADEVOL13' +
        ')   AS PLACONTADEVOL,'
      
        '       DECODE(:FLG13,0, CP.CODTIPDESEMBCAR,   CP.CODTIPDESEMB13)' +
        '    AS CODTIPDESEMBCAR,'
      
        '       DECODE(:FLG13,0, CP.CODTIPDESEMBDEVOL, CP.CODDESEMBDEV13)' +
        '    AS CODTIPDESEMBDEVOL,'
      
        '       DECODE(:FLG13,0, CP.CODTIPDESEMBPROV,  CP.CODDESEMBPROV13' +
        ')   AS CODTIPDESEMBPROV,'
      
        '       DECODE(:FLG13,0, CP.CODTIPRECDESADT,   CP.CODTIPRECADT13)' +
        '    AS CODTIPRECDESADT,'
      
        '       DECODE(:FLG13,0, CP.PLANO,             CP.PLANO13)       ' +
        '    AS PLANO,'
      
        '       DECODE(:FLG13,0, CP.RECPAG,            CP.RECPAG13)      ' +
        '    AS RECPAG,'
      
        '       DECODE(:FLG13,0, CP.RECPAG,            CP.RECPAG13)      ' +
        '    AS RECPAG,'
      
        '       DECODE(:FLG13,0, CP.RECPAGDESEMBPROV,  CP.RECPAGDESEMBPRO' +
        'V)  AS RECPAGDESEMBPROV,'
      
        '       DECODE(:FLG13,0, CP.RECPAGADT,         CP.RECPAGADT)     ' +
        '    AS RECPAGADT,'
      
        '       DECODE(:FLG13,0, CP.RECPAGDEVOL,       CP.RECPAGDEVOL)   ' +
        '    AS RECPAGDEVOL,'
      
        '       DECODE(:FLG13,0, CP.CODTIPRECEBDEV,    CP.CODTIPRECEBDEV1' +
        '3)  AS CODTIPRECEBDEV,'
      '       CP.CODTIPRECEBDEV13,'
      '       CP.PLACONTAC13,'
      '       CP.CODCENTROCUSTOC13,'
      '       CP.PLACONTADBANCO13,'
      '       CP.CODCENTROCUSTOD13,'
      '       CP.CODSUBCONTA13,'
      '       CP.CODPORTFORMA13,'
      '       CP.CODTIPRECDES13,'
      '       CP.CODCENTRORESPON13,'
      '       CP.UNIDNEGOC13,'
      '       CP.IDPLANPREVCONTAB,'
      '       CP.PLACONTAD13,'
      '       CP.PLACTAOUTROMES13,'
      '       CP.PLACTAACJUD13,'
      '       CP.PLACONTADPROVIS13,'
      '       CP.PLACONTACPROVIS13,'
      '       CP.PLACTDPROVADT13,'
      '       CP.PLACTCPROVADT13,'
      '       CP.PLACTDEVOLPAT13,'
      '       CP.PLACONTADEVOL13,'
      '       CP.CODTIPDESEMB13,'
      '       CP.CODDESEMBDEV13,'
      '       CP.CODDESEMBPROV13,'
      '       CP.CODTIPRECADT13,'
      '       CP.PLANO13,'
      '       CP.RECPAG13,'
      '       CP.RECPAG13,'
      '       CP.CODCENTROCUSTOD,'
      '       CP.IDEMPRESA'
      'FROM   CONTPREV CP, CONTRIBUICAO C'
      'WHERE  CP.IDPLANOPREV   = :IDPLANOPREV'
      'AND    C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      
        'AND    ((CP.FLGCOBRADECTERC = :FLGCOBRADECTERC1) OR (CP.FLGCOBRA' +
        'DECTERC = :FLGCOBRADECTERC2) )'
      'ORDER BY C.NOME'
      ''
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 151
    Top = 238
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '33'
      end
      item
        DataType = ftInteger
        Name = 'FLGCOBRADECTERC1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOBRADECTERC2'
        ParamType = ptUnknown
      end>
  end
  object dsContrib: TwwDataSource
    AutoEdit = False
    DataSet = qryContribPlano
    Left = 80
    Top = 239
  end
  object qryContribPatroPlano: TwwQuery
    BeforeScroll = qryContribPatroPlanoBeforeScroll
    AfterScroll = qryContribPatroPlanoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CPP.IDPESSJUR,'
      '       CPP.IDPLANOPREV,'
      '       CPP.IDCONTRIBUICAO,'
      '       CP.FLGCOBRADECTERC,'
      '       C.NOME,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTAC,         CPP.PLACONTAC13) ' +
        '      AS PLACONTAC,'
      
        '       DECODE(:FLG13,0, CPP.CODCENTROCUSTOC,   CPP.CODCENTROCUST' +
        'OC13) AS CODCENTROCUSTOC,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADBANCO,    CPP.PLACONTADBANC' +
        'O13)  AS PLACONTADBANCO,'
      
        '       DECODE(:FLG13,0, CPP.CODCENTROCUSTOD,   CPP.CODCENTROCUST' +
        'OD13) AS CODCENTROCUSTOD,'
      
        '       DECODE(:FLG13,0, CPP.CODSUBCONTA,       CPP.CODSUBCONTA13' +
        ')     AS CODSUBCONTA,'
      
        '       DECODE(:FLG13,0, CPP.CODPORTFORMA,      CPP.CODPORTFORMA1' +
        '3)    AS CODPORTFORMA,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPRECDES,      CPP.CODTIPRECDES1' +
        '3)    AS CODTIPRECDES,'
      
        '       DECODE(:FLG13,0, CPP.CODCENTRORESPON,   CPP.CODCENTRORESP' +
        'ON13) AS CODCENTRORESPON,'
      
        '       DECODE(:FLG13,0, CPP.UNIDNEGOC,         CPP.UNIDNEGOC13) ' +
        '      AS UNIDNEGOC,'
      
        '       DECODE(:FLG13,0, CPP.IDPLANPREVCONTAB,  CPP.IDPLANPREVCON' +
        'TAB)  AS IDPLANPREVCONTAB,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTAD,         CPP.PLACONTAD13) ' +
        '      AS PLACONTAD,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTAOUTROMES,  CPP.PLACTAOUTROME' +
        'S13)  AS PLACONTAOUTROMES,'
      
        '       DECODE(:FLG13,0, CPP.PLACTAACJUD,       CPP.PLACTAACJUD13' +
        ')     AS PLACTAACJUD,'
      '       CPP.PLACONTACADT13,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADPROVIS,   CPP.PLACONTADPROV' +
        'IS13) AS PLACONTADPROVIS,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTACPROVIS,   CPP.PLACONTACPROV' +
        'IS13) AS PLACONTACPROVIS,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADPROVADT,  CPP.PLACTDPROVADT' +
        '13)   AS PLACONTADPROVADT,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTACPROVADT,  CPP.PLACTCPROVADT' +
        '13)   AS PLACONTACPROVADT,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADEVOLPAT,  CPP.PLACTDEVOLPAT' +
        '13)   AS PLACONTADEVOLPAT,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADEVOL,     CPP.PLACONTADEVOL' +
        '13)   AS PLACONTADEVOL,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPDESEMBCAR,   CPP.CODTIPDESEMB1' +
        '3)    AS CODTIPDESEMBCAR,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPDESEMBDEVOL, CPP.CODDESEMBDEV1' +
        '3)    AS CODTIPDESEMBDEVOL,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPDESEMBPROV,  CPP.CODDESEMBPROV' +
        '13)   AS CODTIPDESEMBPROV,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPRECDESADT,   CPP.CODTIPRECADT1' +
        '3)    AS CODTIPRECDESADT,'
      
        '       DECODE(:FLG13,0, CPP.PLANO,             CPP.PLANO13)     ' +
        '      AS PLANO,'
      
        '       DECODE(:FLG13,0, CPP.RECPAG,            CPP.RECPAG13)    ' +
        '      AS RECPAG,'
      
        '       DECODE(:FLG13,0, CPP.RECPAG,            CPP.RECPAG13)    ' +
        '      AS RECPAG,'
      
        '       DECODE(:FLG13,0, CPP.RECPAGDESEMBPROV,  CPP.RECPAGDESEMBP' +
        'ROV)  AS RECPAGDESEMBPROV,'
      
        '       DECODE(:FLG13,0, CPP.RECPAGADT,         CPP.RECPAGADT)   ' +
        '      AS RECPAGADT,'
      
        '       DECODE(:FLG13,0, CPP.RECPAGDEVOL,       CPP.RECPAGDEVOL) ' +
        '      AS RECPAGDEVOL,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPRECEBDEV,    CPP.CODTIPRECEBDE' +
        'V13)  AS CODTIPRECEBDEV,'
      '       CPP.CODTIPRECEBDEV13,'
      '       CPP.PLACONTAC13,'
      '       CPP.CODCENTROCUSTOC13,'
      '       CPP.PLACONTADBANCO13,'
      '       CPP.CODCENTROCUSTOD13,'
      '       CPP.CODSUBCONTA13,'
      '       CPP.CODPORTFORMA13,'
      '       CPP.CODTIPRECDES13,'
      '       CPP.CODCENTRORESPON13,'
      '       CPP.UNIDNEGOC13,'
      '       CPP.IDPLANPREVCONTAB,'
      '       CPP.PLACONTAD13,'
      '       CPP.PLACTAOUTROMES13,'
      '       CPP.PLACTAACJUD13,'
      '       CPP.PLACONTADPROVIS13,'
      '       CPP.PLACONTACPROVIS13,'
      '       CPP.PLACTDPROVADT13,'
      '       CPP.PLACTCPROVADT13,'
      '       CPP.PLACTDEVOLPAT13,'
      '       CPP.PLACONTADEVOL13,'
      '       CPP.CODTIPDESEMB13,'
      '       CPP.CODDESEMBDEV13,'
      '       CPP.CODDESEMBPROV13,'
      '       CPP.CODTIPRECADT13,'
      '       CPP.PLANO13,'
      '       CPP.RECPAG13,'
      '       CPP.RECPAG13,'
      '       CPP.CODCENTROCUSTOD,'
      '       CPP.IDEMPRESA,'
      '       CPP.CODTIPREDDESPGAPAGAR,'
      '       CPP.CODTIPREDDESPGARECEBER,'
      '       CPP.RECPAGPGAPAGAR,'
      '       CPP.RECPAGPGARECEBER,'
      '       CPP.CODTIPREDDESPGADEVOLPAGAR,'
      '       CPP.CODTIPREDDESPGADEVOLRECEBER,'
      '       CPP.RECPAGPGADEVOLPAGAR,'
      '       CPP.RECPAGPGADEVOLRECEBER,'
      '       --Inicio - Helio - SOL Nº 253577/17819 PPM Nº 1104948'
      '       PLACONTACREVERSAO,'
      '       PLACONTADREVERSAO,'
      '       PLACONTAPROVPERDA,'
      '       PLACONTACREVERSAO13,'
      '       PLACONTADREVERSAO13,'
      '       PLACONTAPROVPERDA13,'
      '       CODTIPORECEBATRASO,'
      '       CODTIPODESEMATRASO,'
      '       CODTIPORECEBATRASO13,'
      '       CODTIPODESEMATRASO13'
      '       --Fim - Helio - SOL Nº 253577/17819 PPM Nº 1104948'
      'FROM   CONTPLANPATRO CPP, CONTPREV CP, CONTRIBUICAO C'
      'WHERE  CPP.IDPESSJUR     = :IDPESSJUR'
      'AND    CPP.IDPLANOPREV   = :IDPLANOPREV'
      'AND    CP.IDPLANOPREV    = CPP.IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO'
      'AND    C.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO'
      
        'AND    ((CP.FLGCOBRADECTERC = :FLGCOBRADECTERC1) OR (CP.FLGCOBRA' +
        'DECTERC = :FLGCOBRADECTERC2) )'
      'ORDER BY C.NOME'
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
      ' ')
    ValidateWithMask = True
    Left = 230
    Top = 230
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOBRADECTERC1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOBRADECTERC2'
        ParamType = ptUnknown
      end>
  end
  object qryteste: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES, DESCRICAO, ANASINT'
      'FROM   TIPORECEBDESEMB'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'AND    RECPAG = '#39'P'#39)
    ValidateWithMask = True
    Left = 762
    Top = 484
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qrytesteCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object qrytesteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qrytesteANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
  end
  object dsTpPaga: TwwDataSource
    DataSet = QryTpPaga
    Left = 15
    Top = 168
  end
  object dsContaContabil: TwwDataSource
    DataSet = qrycontacontabil
    Left = 104
    Top = 168
  end
  object qryteste3: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 708
    Top = 478
    object qryteste3PLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryteste3PLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryteste3PLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
  end
  object dsTpReceb: TwwDataSource
    DataSet = qryTpReceb
    Left = 152
    Top = 168
  end
  object qryteste2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES, DESCRICAO, ANASINT'
      'FROM   TIPORECEBDESEMB'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'AND    RECPAG = '#39'R'#39
      'AND   ATIVO = '#39'S'#39
      ' ')
    ValidateWithMask = True
    Left = 733
    Top = 471
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryteste2CODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object qryteste2DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryteste2ANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV ORDER BY NOME')
    ValidateWithMask = True
    Left = 226
    Top = 66
  end
  object qryContribPessoa: TwwQuery
    BeforeScroll = qryContribPessoaBeforeScroll
    AfterScroll = qryContribPessoaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CPP.IDPESSJUR,'
      '       CPP.IDPLANOPREV,'
      '       CPP.IDPESSOA,'
      '       CPP.SEQPROPOSTA,'
      '       CPP.IDCONTRIBUICAO,'
      '       CP.FLGCOBRADECTERC,'
      '       C.NOME,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTAC,         CPP.PLACONTAC13) ' +
        '      AS PLACONTAC,'
      
        '       DECODE(:FLG13,0, CPP.CODCENTROCUSTOC,   CPP.CODCENTROCUST' +
        'OC13) AS CODCENTROCUSTOC,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADBANCO,    CPP.PLACONTADBANC' +
        'O13)  AS PLACONTADBANCO,'
      
        '       DECODE(:FLG13,0, CPP.CODCENTROCUSTOD,   CPP.CODCENTROCUST' +
        'OD13) AS CODCENTROCUSTOD,'
      
        '       DECODE(:FLG13,0, CPP.CODSUBCONTA,       CPP.CODSUBCONTA13' +
        ')     AS CODSUBCONTA,'
      
        '       DECODE(:FLG13,0, CPP.CODPORTFORMA,      CPP.CODPORTFORMA1' +
        '3)    AS CODPORTFORMA,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPRECDES,      CPP.CODTIPRECDES1' +
        '3)    AS CODTIPRECDES,'
      
        '       DECODE(:FLG13,0, CPP.CODCENTRORESPON,   CPP.CODCENTRORESP' +
        'ON13) AS CODCENTRORESPON,'
      
        '       DECODE(:FLG13,0, CPP.UNIDNEGOC,         CPP.UNIDNEGOC13) ' +
        '      AS UNIDNEGOC,'
      
        '       DECODE(:FLG13,0, CPP.IDPLANPREVCONTAB,  CPP.IDPLANPREVCON' +
        'TAB)  AS IDPLANPREVCONTAB,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTAD,         CPP.PLACONTAD13) ' +
        '      AS PLACONTAD,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTAOUTROMES,  CPP.PLACTAOUTROME' +
        'S13)  AS PLACONTAOUTROMES,'
      
        '       DECODE(:FLG13,0, CPP.PLACTAACJUD,       CPP.PLACTAACJUD13' +
        ')     AS PLACTAACJUD,'
      '       CPP.PLACONTACADT13,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADPROVIS,   CPP.PLACONTADPROV' +
        'IS13) AS PLACONTADPROVIS,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTACPROVIS,   CPP.PLACONTACPROV' +
        'IS13) AS PLACONTACPROVIS,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADPROVADT,  CPP.PLACTDPROVADT' +
        '13)   AS PLACONTADPROVADT,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTACPROVADT,  CPP.PLACTCPROVADT' +
        '13)   AS PLACONTACPROVADT,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADEVOLPAT,  CPP.PLACTDEVOLPAT' +
        '13)   AS PLACONTADEVOLPAT,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADEVOL,     CPP.PLACONTADEVOL' +
        '13)   AS PLACONTADEVOL,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPDESEMBCAR,   CPP.CODTIPDESEMB1' +
        '3)    AS CODTIPDESEMBCAR,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPDESEMBDEVOL, CPP.CODDESEMBDEV1' +
        '3)    AS CODTIPDESEMBDEVOL,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPDESEMBPROV,  CPP.CODDESEMBPROV' +
        '13)   AS CODTIPDESEMBPROV,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPRECDESADT,   CPP.CODTIPRECADT1' +
        '3)    AS CODTIPRECDESADT,'
      
        '       DECODE(:FLG13,0, CPP.PLANO,             CPP.PLANO13)     ' +
        '      AS PLANO,'
      
        '       DECODE(:FLG13,0, CPP.RECPAG,            CPP.RECPAG13)    ' +
        '      AS RECPAG,'
      
        '       DECODE(:FLG13,0, CPP.RECPAG,            CPP.RECPAG13)    ' +
        '      AS RECPAG,'
      
        '       DECODE(:FLG13,0, CPP.RECPAGDESEMBPROV,  CPP.RECPAGDESEMBP' +
        'ROV)  AS RECPAGDESEMBPROV,'
      
        '       DECODE(:FLG13,0, CPP.RECPAGADT,         CPP.RECPAGADT)   ' +
        '      AS RECPAGADT,'
      
        '       DECODE(:FLG13,0, CPP.RECPAGDEVOL,       CPP.RECPAGDEVOL) ' +
        '      AS RECPAGDEVOL,'
      
        '       DECODE(:FLG13,0, CP.CODTIPRECEBDEV,    CP.CODTIPRECEBDEV1' +
        '3)    AS CODTIPRECEBDEV,'
      '       CP.CODTIPRECEBDEV13,'
      '       CP.PLACONTAC13,'
      '       CP.CODCENTROCUSTOC13,'
      '       CP.PLACONTADBANCO13,'
      '       CP.CODCENTROCUSTOD13,'
      '       CP.CODSUBCONTA13,'
      '       CP.CODPORTFORMA13,'
      '       CP.CODTIPRECDES13,'
      '       CP.CODCENTRORESPON13,'
      '       CP.UNIDNEGOC13,'
      '       CP.IDPLANPREVCONTAB,  '
      '       CP.PLACONTAD13,       '
      '       CP.PLACTAOUTROMES13,  '
      '       CP.PLACTAACJUD13,     '
      '       CP.PLACONTADPROVIS13, '
      '       CP.PLACONTACPROVIS13, '
      '       CP.PLACTDPROVADT13,   '
      '       CP.PLACTCPROVADT13,   '
      '       CP.PLACTDEVOLPAT13,   '
      '       CP.PLACONTADEVOL13,'
      '       CP.CODTIPDESEMB13,    '
      '       CP.CODDESEMBDEV13,    '
      '       CP.CODDESEMBPROV13,   '
      '       CP.CODTIPRECADT13,'
      '       CP.PLANO13,'
      '       CP.RECPAG13,'
      '       CP.RECPAG13,'
      '       CPP.CODCENTROCUSTOD,'
      '       CPP.IDEMPRESA'
      'FROM   CONTRIBPREVPARTP CPP, CONTPREV CP, CONTRIBUICAO C'
      'WHERE  CPP.IDPESSJUR     = :IDPESSJUR'
      'AND    CPP.IDPLANOPREV   = :IDPLANOPREV'
      'AND    CPP.IDPESSOA      = :IDPESSOA'
      'AND    CPP.SEQPROPOSTA   = :SEQPROPOSTA'
      'AND    CP.IDPLANOPREV    = CPP.IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO'
      'AND    C.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO'
      
        'AND    ((CP.FLGCOBRADECTERC = :FLGCOBRADECTERC1) OR (CP.FLGCOBRA' +
        'DECTERC = :FLGCOBRADECTERC2) )'
      'ORDER BY C.NOME'
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
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 199
    Top = 274
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOBRADECTERC1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOBRADECTERC2'
        ParamType = ptUnknown
      end>
  end
  object MontaSelectPessoa: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Pessoa'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'DEPENTIT.MATRICULA'
      'PESSOA2.NOME'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula Participante'
      'Matrícula Beneficiário'
      'Pessoa a Selecionar (Participante/Beneficiário)'
      'Participante Titular'
      'N° de Inscrição'
      'Data de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA'
      'DEPENTIT'
      'PESSOA PESSOA2')
    CamposChave.Strings = (
      'PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV'
      'DEPENTIT.IDTITULAR'
      'PARTPREVPLAN.SEQPROPOSTA'
      'DEPENTIT.IDPESSOA'
      'ELEGPATRO.MATRICULA'
      'PESSOA2.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA             = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA          = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR         = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV    = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA              = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC         = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART      = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA             = PESSOAFISICA.IDPESSOA'
      'DEPENTIT.IDTITULAR(+)       = PARTPREVPLAN.IDPESSOA'
      'PESSOA2.IDPESSOA(+)         = DEPENTIT.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '30'
      '30'
      '10'
      '15'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 33
    Top = 330
  end
  object qryTipoCli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOCLIENTE,DESCRICAO '
      'FROM TIPOCLIENTE')
    ValidateWithMask = True
    Left = 234
    Top = 168
  end
  object qryTipoFav: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRAMOFORNECEDOR,DESCRAMOFORNECEDOR '
      'FROM RAMOFORNECEDOR')
    ValidateWithMask = True
    Left = 234
    Top = 152
  end
  object dsGerais: TwwDataSource
    AutoEdit = False
    DataSet = qryGerais
    Left = 15
    Top = 246
  end
  object qryGerais: TwwQuery
    AfterScroll = qryGeraisAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.IDPESSOA, P.NOME AS FUNDACAO,'
      '       PARAM.TIPOPERENVIO,'
      '       PARAM.TIPOPERCOBRANCA,'
      '       PARAM.TIPOPERDIVERG,'
      '       PARAM.TIPOPERRESERVA,'
      '       PARAM.TIPOPERFLHBEN,'
      '       PARAM.TPDOCPFLHBENELET,'
      '       PARAM.TPDOCPFLHBENINDIV,'
      '       PARAM.TPDOCRFLHBENELET,'
      '       PARAM.TPDOCRFLHBENINDIV,'
      '       PARAM.TPDOCPENVIOBANCO,'
      '       PARAM.TPDOCPENVIOPATRO,'
      '       PARAM.TPDOCRRECBANCO,'
      '       PARAM.TPDOCRRECPATRO,'
      '       PARAM.TIPOCLIPATRO,'
      '       PARAM.TIPOCLIATIVOS,'
      '       PARAM.TIPOCLIMANTIDOS,'
      '       PARAM.TIPOCLIMANTIDOS,'
      '       PARAM.TIPOCLIASSISTIDOS,'
      '       PARAM.TIPOCLIMANTPARC,'
      '       PARAM.TIPOFAVPATRO,'
      '       PARAM.TIPOFAVATIVOS,'
      '       PARAM.TIPOFAVMANTIDOS,'
      '       PARAM.TIPOFAVMANTIDOS,'
      '       PARAM.TIPOFAVASSISTIDOS,'
      '       PARAM.TIPOFAVMANTPARC,'
      '       PARAM.PLARECUPRECEXANT,'
      '       PARAM.PLARECUPDESPEXANT,'
      '       PARAM.TPDOCPCONVENIO,'
      '       PARAM.PLACONTACORRECAO,'
      '       PARAM.PLACONTAABONO'
      'FROM   PESSOA P, FUNDACAO F, PARAMAPREV PARAM'
      'WHERE  P.IDPESSOA       = F.IDPESSOA'
      'AND    F.IDPESSOA       = :IDFUNDACAO'
      'AND    PARAM.IDFUNDACAO = F.IDPESSOA'
      'ORDER BY P.NOME'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 15
    Top = 230
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object imList: TImageList
    Left = 781
    Top = 65
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000C6C6C6000000FF000000FF000000FF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000008484000000000000FFFF0000FFFF000084840000848400000000000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000084
      84000000000000FFFF0000FFFF000000000000FFFF000084840000FFFF000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000084
      84000084840000FFFF0000FFFF0000FFFF0000FFFF0000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF000084840000FFFF0000FFFF000084840000FFFF0000FFFF000084
      840000FFFF000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000084840000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF0000848400008484000084840000FFFF0000FFFF000000000000FF
      FF00008484000084840000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000000FFFF000084
      84000084840000848400008484000084840000FFFF0000FFFF0000FFFF000084
      840000FFFF000084840000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00008484000084840000848400008484000084840000848400008484000084
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000FFFF000000000000FFFF000000000000C6C6
      C6000000000000000000000000000000000000000000000000000000000000FF
      FF00008484000084840000FFFF000084840000848400008484000084840000FF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C6000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00008484000084840000FFFF000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C007FE0F00000000C007F00700000000
      C007E00300000000C007C00100000000C007C00100000000C007800000000000
      C007800000000000C007800000000000C007800000000000C007800000000000
      C007800100000000C007C00100000000C007C00300000000C007E00700000000
      C007F00F00000000C007FC1F0000000000000000000000000000000000000000
      000000000000}
  end
  object qryContribNucleo: TwwQuery
    BeforeScroll = qryContribNucleoBeforeScroll
    AfterScroll = qryContribNucleoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CPP.IDNUCLEOFAMILIAR,'
      '       CPP.IDCONTRIBUICAO,'
      '       CP.FLGCOBRADECTERC,'
      '       C.NOME,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTAC,         CPP.PLACONTAC13) ' +
        '      AS PLACONTAC,'
      
        '       DECODE(:FLG13,0, CPP.CODCENTROCUSTOC,   CPP.CODCENTROCUST' +
        'OC13) AS CODCENTROCUSTOC,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADBANCO,    CPP.PLACONTADBANC' +
        'O13)  AS PLACONTADBANCO,'
      
        '       DECODE(:FLG13,0, CPP.CODCENTROCUSTOD,   CPP.CODCENTROCUST' +
        'OD13) AS CODCENTROCUSTOD,'
      
        '       DECODE(:FLG13,0, CPP.CODSUBCONTA,       CPP.CODSUBCONTA13' +
        ')     AS CODSUBCONTA,'
      
        '       DECODE(:FLG13,0, CPP.CODPORTFORMA,      CPP.CODPORTFORMA1' +
        '3)    AS CODPORTFORMA,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPRECDES,      CPP.CODTIPRECDES1' +
        '3)    AS CODTIPRECDES,'
      
        '       DECODE(:FLG13,0, CPP.CODCENTRORESPON,   CPP.CODCENTRORESP' +
        'ON13) AS CODCENTRORESPON,'
      
        '       DECODE(:FLG13,0, CPP.UNIDNEGOC,         CPP.UNIDNEGOC13) ' +
        '      AS UNIDNEGOC,'
      
        '       DECODE(:FLG13,0, CPP.IDPLANPREVCONTAB,  CPP.IDPLANPREVCON' +
        'TAB)  AS IDPLANPREVCONTAB,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTAD,         CPP.PLACONTAD13) ' +
        '      AS PLACONTAD,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTAOUTROMES,  CPP.PLACTAOUTROME' +
        'S13)  AS PLACONTAOUTROMES,'
      
        '       DECODE(:FLG13,0, CPP.PLACTAACJUD,       CPP.PLACTAACJUD13' +
        ')     AS PLACTAACJUD,'
      '       CPP.PLACONTACADT13,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADPROVIS,   CPP.PLACONTADPROV' +
        'IS13) AS PLACONTADPROVIS,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTACPROVIS,   CPP.PLACONTACPROV' +
        'IS13) AS PLACONTACPROVIS,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADPROVADT,  CPP.PLACTDPROVADT' +
        '13)   AS PLACONTADPROVADT,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTACPROVADT,  CPP.PLACTCPROVADT' +
        '13)   AS PLACONTACPROVADT,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADEVOLPAT,  CPP.PLACTDEVOLPAT' +
        '13)   AS PLACONTADEVOLPAT,'
      
        '       DECODE(:FLG13,0, CPP.PLACONTADEVOL,     CPP.PLACONTADEVOL' +
        '13)   AS PLACONTADEVOL,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPDESEMBCAR,   CPP.CODTIPDESEMB1' +
        '3)    AS CODTIPDESEMBCAR,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPDESEMBDEVOL, CPP.CODDESEMBDEV1' +
        '3)    AS CODTIPDESEMBDEVOL,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPDESEMBPROV,  CPP.CODDESEMBPROV' +
        '13)   AS CODTIPDESEMBPROV,'
      
        '       DECODE(:FLG13,0, CPP.CODTIPRECDESADT,   CPP.CODTIPRECADT1' +
        '3)    AS CODTIPRECDESADT,'
      
        '       DECODE(:FLG13,0, CPP.PLANO,             CPP.PLANO13)     ' +
        '      AS PLANO,'
      
        '       DECODE(:FLG13,0, CPP.RECPAG,            CPP.RECPAG13)    ' +
        '      AS RECPAG,'
      
        '       DECODE(:FLG13,0, CPP.RECPAG,            CPP.RECPAG13)    ' +
        '      AS RECPAG,'
      
        '       DECODE(:FLG13,0, CPP.RECPAGDESEMBPROV,  CPP.RECPAGDESEMBP' +
        'ROV)  AS RECPAGDESEMBPROV,'
      
        '       DECODE(:FLG13,0, CPP.RECPAGADT,         CPP.RECPAGADT)   ' +
        '      AS RECPAGADT,'
      
        '       DECODE(:FLG13,0, CPP.RECPAGDEVOL,       CPP.RECPAGDEVOL) ' +
        '      AS RECPAGDEVOL,'
      '       CP.PLACONTAC13,'
      '       CP.CODCENTROCUSTOC13,'
      '       CP.PLACONTADBANCO13,'
      '       CP.CODCENTROCUSTOD13,'
      '       CP.CODSUBCONTA13,'
      '       CP.CODPORTFORMA13,'
      '       CP.CODTIPRECDES13,'
      '       CP.CODCENTRORESPON13,'
      '       CP.UNIDNEGOC13,'
      '       CP.IDPLANPREVCONTAB,'
      '       CP.PLACONTAD13,'
      '       CP.PLACTAOUTROMES13,'
      '       CP.PLACTAACJUD13,'
      '       CP.PLACONTADPROVIS13,'
      '       CP.PLACONTACPROVIS13,'
      '       CP.PLACTDPROVADT13,'
      '       CP.PLACTCPROVADT13,'
      '       CP.PLACTDEVOLPAT13,'
      '       CP.PLACONTADEVOL13,'
      '       CP.CODTIPDESEMB13,'
      '       CP.CODDESEMBDEV13,'
      '       CP.CODDESEMBPROV13,'
      '       CP.CODTIPRECADT13,'
      '       CP.PLANO13,'
      '       CP.RECPAG13,'
      '       CP.RECPAG13,'
      '       CPP.CODCENTROCUSTOD,'
      '       CPP.IDEMPRESA'
      'FROM   CONTRIBPREVNUCLEO CPP, CONTPREV CP, CONTRIBUICAO C'
      'WHERE  CPP.IDNUCLEOFAMILIAR = :IDNUCLEOFAMILIAR'
      'AND    CP.IDPLANOPREV       = CPP.IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO    = CPP.IDCONTRIBUICAO'
      'AND    C.IDCONTRIBUICAO     = CPP.IDCONTRIBUICAO'
      
        'AND    ((CP.FLGCOBRADECTERC = :FLGCOBRADECTERC1) OR (CP.FLGCOBRA' +
        'DECTERC = :FLGCOBRADECTERC2) )'
      'ORDER BY C.NOME'
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
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 230
    Top = 290
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDNUCLEOFAMILIAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOBRADECTERC1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOBRADECTERC2'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaNucleo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BTIT.IDNUCLEOFAMILIAR'
      'FROM   BFCIARIOTITPLAN BTIT'
      'WHERE  IDPESSJUR   = :IDPESSJUR'
      'AND    IDPLANOPREV = :IDPLANOPREV'
      'AND    IDTITULAR   = :IDTITULAR'
      'AND    IDPESSOA    = :IDPESSOA'
      'AND    SEQPROPOSTA = :SEQPROPOSTA')
    ValidateWithMask = True
    Left = 237
    Top = 410
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object dsBenef: TwwDataSource
    AutoEdit = False
    DataSet = qryBenefPlano
    Left = 72
    Top = 348
  end
  object qryBenefPlano: TwwQuery
    BeforeScroll = qryBenefPlanoBeforeScroll
    AfterScroll = qryBenefPlanoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BP.IDPLANOPREV,'
      '       BP.IDBENEFICIO,'
      '       BP.FLGPOSSUIABONO,'
      '       B.NOME,'
      
        '       DECODE(:FLG13,0, BP.CODSUBCONTA,            BP.CODSUBCONT' +
        'AABN)    AS CODSUBCONTA,'
      '       BP.IDPLANPREVCONTAB,'
      
        '       DECODE(:FLG13,0, BP.PLACONTAC,              BP.PLACONTACA' +
        'BN)      AS PLACONTAC,'
      
        '       DECODE(:FLG13,0, BP.PLACONTAD,              BP.PLACONTADA' +
        'BN)      AS PLACONTAD,'
      
        '       DECODE(:FLG13,0, BP.PLACTAACJUD,            BP.PLACTAACJU' +
        'D13)     AS PLACTAACJUD,'
      '       BP.PLACONTADEVOL,'
      '       BP.PLACONTADADT13,'
      '       BP.PLACONTADPROVIS,'
      '       BP.PLACONTACPROVIS,'
      '       BP.PLACONTADPROVADT,'
      '       BP.PLACONTACPROVADT,'
      
        '       DECODE(:FLG13,0, BP.UNIDNEGOC,              BP.UNIDNEGOCA' +
        'BN)      AS UNIDNEGOC,'
      
        '       DECODE(:FLG13,0, BP.CODPORTFORMA,           BP.CODPORTFOR' +
        'MAABN)   AS CODPORTFORMA,'
      
        '       DECODE(:FLG13,0, BP.CODCENTRORESPON,        BP.CODCENTROR' +
        'ESPONA ) AS CODCENTRORESPON,'
      
        '       DECODE(:FLG13,0, BP.CODTIPRECDES,           BP.CODTIPRECD' +
        'ESABN)   AS CODTIPRECDES,'
      
        '       DECODE(:FLG13,0, BP.CODTIPRECEBCAP,         BP.CODTIPRECE' +
        'BCAP13)  AS CODTIPRECEBCAP,'
      '       BP.CODTIPDESEMBPROV,'
      '       BP.CODTIPRECDESADT,'
      '       BP.CODCENTROCUSTOD,'
      '       BP.IDEMPRESA,'
      
        '       DECODE(:FLG13,0, BP.CODTIPRECEBDEVOL,       BP.CODRECEBCA' +
        'PABN)    AS CODTIPRECEBDEVOL,'
      '       BP.IDEMPRESAPROP,'
      '       BP.IDEMPRESAPROPABN,'
      '       BP.IDEMPRESADESEMB,'
      '       BP.PLANO,'
      '       BP.RECPAG,'
      '       BP.RECPAGDESEMB'
      'FROM   BENEFPLANPREV BP, BENEFICIO B'
      'WHERE  BP.IDPLANOPREV   = :IDPLANOPREV'
      'AND    B.IDBENEFICIO    = BP.IDBENEFICIO'
      
        'AND    ((BP.FLGPOSSUIABONO = :FLGPOSSUIABONO1) OR (BP.FLGPOSSUIA' +
        'BONO = :FLGPOSSUIABONO2) )'
      'ORDER BY B.NOME'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 140
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 33
      end
      item
        DataType = ftInteger
        Name = 'FLGPOSSUIABONO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGPOSSUIABONO2'
        ParamType = ptUnknown
      end>
  end
  object qryBenefPlanPatro: TwwQuery
    BeforeScroll = qryBenefPlanoBeforeScroll
    AfterScroll = qryBenefPlanoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BPL.IDPESSJUR,'
      '       BPL.IDPLANOPREV,'
      '       BPL.IDBENEFICIO,'
      '       BP.FLGPOSSUIABONO,'
      '       B.NOME,'
      
        '       DECODE(:FLG13,0, BPL.CODSUBCONTA,            BPL.CODSUBCO' +
        'NTAABN)    AS CODSUBCONTA,'
      '       BPL.IDPLANPREVCONTAB,'
      
        '       DECODE(:FLG13,0, BPL.PLACONTAC,              BPL.PLACONTA' +
        'CABN)      AS PLACONTAC,'
      
        '       DECODE(:FLG13,0, BPL.PLACONTAD,              BPL.PLACONTA' +
        'DABN)      AS PLACONTAD,'
      
        '       DECODE(:FLG13,0, BPL.PLACTAACJUD,            BPL.PLACTAAC' +
        'JUD13)     AS PLACTAACJUD,'
      '       BPL.PLACONTADEVOL,'
      '       BPL.PLACONTADADT13,'
      '       BPL.PLACONTADPROVIS,'
      '       BPL.PLACONTACPROVIS,'
      '       BPL.PLACONTADPROVADT,'
      '       BPL.PLACONTACPROVADT,'
      
        '       DECODE(:FLG13,0, BPL.UNIDNEGOC,              BPL.UNIDNEGO' +
        'CABN)      AS UNIDNEGOC,'
      
        '       DECODE(:FLG13,0, BPL.CODPORTFORMA,           BPL.CODPORTF' +
        'ORMAABN)   AS CODPORTFORMA,'
      
        '       DECODE(:FLG13,0, BPL.CODCENTRORESPON,        BPL.CODCENTR' +
        'ORESPONA ) AS CODCENTRORESPON,'
      
        '       DECODE(:FLG13,0, BPL.CODTIPRECDES,           BPL.CODTIPRE' +
        'CDESABN)   AS CODTIPRECDES,'
      
        '       DECODE(:FLG13,0, BPL.CODTIPRECEBCAP,         BPL.CODTIPRE' +
        'CEBCAP13)  AS CODTIPRECEBCAP,'
      '       BPL.CODTIPDESEMBPROV,'
      '       BPL.CODTIPRECDESADT,'
      '       BPL.CODCENTROCUSTOD,'
      '       BPL.IDEMPRESA,'
      
        '       DECODE(:FLG13,0, BPL.CODTIPRECEBDEVOL,       BPL.CODRECEB' +
        'CAPABN)    AS CODTIPRECEBDEVOL,'
      '       BPL.IDEMPRESAPROP,'
      '       BPL.IDEMPRESAPROPABN,'
      '       BPL.IDEMPRESADESEMB,'
      '       BPL.PLANO,'
      '       BPL.RECPAG,'
      '       BPL.RECPAGDESEMB'
      'FROM   BENEFPLANPATRO BPL, BENEFPLANPREV BP, BENEFICIO B'
      'WHERE  BPL.IDPESSJUR    = :IDPESSJUR'
      'AND    BPL.IDPLANOPREV  = :IDPLANOPREV'
      'AND    BP.IDPLANOPREV   = BPL.IDPLANOPREV'
      'AND    BP.IDBENEFICIO   = BPL.IDBENEFICIO'
      'AND    B.IDBENEFICIO    = BP.IDBENEFICIO'
      
        'AND    ((BP.FLGPOSSUIABONO = :FLGPOSSUIABONO1) OR (BP.FLGPOSSUIA' +
        'BONO = :FLGPOSSUIABONO2) )'
      'ORDER BY B.NOME'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 206
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 33
      end
      item
        DataType = ftInteger
        Name = 'FLGPOSSUIABONO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGPOSSUIABONO2'
        ParamType = ptUnknown
      end>
  end
  object qryBenefBfciario: TwwQuery
    BeforeScroll = qryBenefPlanoBeforeScroll
    AfterScroll = qryBenefPlanoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BPL.IDPESSJUR,'
      '       BPL.IDPLANOPREV,'
      '       BPL.IDPESSOA,'
      '       BPL.IDBENEFICIO,'
      '       BP.FLGPOSSUIABONO,'
      '       B.NOME,'
      
        '       DECODE(:FLG13,0, BPL.CODSUBCONTA,            BPL.CODSUBCO' +
        'NTAABN)    AS CODSUBCONTA,'
      '       BPL.IDPLANPREVCONTAB,'
      
        '       DECODE(:FLG13,0, BPL.PLACONTAC,              BPL.PLACONTA' +
        'CABN)      AS PLACONTAC,'
      
        '       DECODE(:FLG13,0, BPL.PLACONTAD,              BPL.PLACONTA' +
        'DABN)      AS PLACONTAD,'
      
        '       DECODE(:FLG13,0, BPL.PLACTAACJUD,            BPL.PLACTAAC' +
        'JUD13)     AS PLACTAACJUD,'
      '       BP.PLACONTADEVOL,'
      '       BPL.PLACONTADADT13,'
      '       BPL.PLACONTADPROVIS,'
      '       BPL.PLACONTACPROVIS,'
      '       BPL.PLACONTADPROVADT,'
      '       BPL.PLACONTACPROVADT,'
      
        '       DECODE(:FLG13,0, BPL.UNIDNEGOC,              BPL.UNIDNEGO' +
        'CABN)      AS UNIDNEGOC,'
      
        '       DECODE(:FLG13,0, BPL.CODPORTFORMA,           BPL.CODPORTF' +
        'ORMAABN)   AS CODPORTFORMA,'
      
        '       DECODE(:FLG13,0, BPL.CODCENTRORESPON,        BPL.CODCENTR' +
        'ORESPONA ) AS CODCENTRORESPON,'
      
        '       DECODE(:FLG13,0, BPL.CODTIPRECDES,           BPL.CODTIPRE' +
        'CDESABN)   AS CODTIPRECDES,'
      
        '       DECODE(:FLG13,0, BPL.CODTIPRECEBCAP,         BPL.CODTIPRE' +
        'CEBCAP13)  AS CODTIPRECEBCAP,'
      '       BPL.CODTIPDESEMBPROV,'
      '       BPL.CODTIPRECDESADT,'
      '       BPL.CODCENTROCUSTOD,'
      '       BPL.IDEMPRESA,'
      
        '       DECODE(:FLG13,0, BPL.CODTIPRECEBDEVOL,       BPL.CODRECEB' +
        'CAPABN)    AS CODTIPRECEBDEVOL,'
      '       BPL.IDEMPRESAPROP,'
      '       BPL.IDEMPRESAPROPABN,'
      '       BPL.IDEMPRESADESEMB,'
      '       BPL.PLANO,'
      '       BPL.RECPAG,'
      '       BPL.RECPAGDESEMB'
      'FROM   BENEFBFCIARIO BPL, BENEFPLANPREV BP, BENEFICIO B'
      'WHERE  BPL.IDPESSJUR    = :IDPESSJUR'
      'AND    BPL.IDPLANOPREV  = :IDPLANOPREV'
      'AND    BPL.IDPESSOA     = :IDPESSOA'
      'AND    BP.IDPLANOPREV   = BPL.IDPLANOPREV'
      'AND    BP.IDBENEFICIO   = BPL.IDBENEFICIO'
      'AND    B.IDBENEFICIO    = BP.IDBENEFICIO'
      
        'AND    ((BP.FLGPOSSUIABONO = :FLGPOSSUIABONO1) OR (BP.FLGPOSSUIA' +
        'BONO = :FLGPOSSUIABONO2) )'
      'ORDER BY B.NOME'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 197
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLG13'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 33
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGPOSSUIABONO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGPOSSUIABONO2'
        ParamType = ptUnknown
      end>
  end
  object pmnu: TPopupMenu
    Left = 117
    Top = 431
    object mnuCopiaItem: TMenuItem
      Caption = 'Copiar Parametrização de Outro &Item deste Plano'
      OnClick = mnuCopiaItemClick
    end
    object mnuCopiaPlano: TMenuItem
      Caption = 'Copiar Parametrização de &Todo outro Plano'
      OnClick = mnuCopiaPlanoClick
    end
  end
  object QryTpPaga: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES, DESCRICAO, ANASINT'
      'FROM   TIPORECEBDESEMB'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'AND    RECPAG = '#39'P'#39)
    ValidateWithMask = True
    Left = 19
    Top = 147
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object QryTpPagaCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object QryTpPagaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object QryTpPagaANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.ANASINT'
      FixedChar = True
      Size = 1
    end
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV ORDER BY NOME')
    ValidateWithMask = True
    Left = 83
    Top = 411
  end
  object qryTpReceb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES, DESCRICAO, ANASINT'
      'FROM   TIPORECEBDESEMB'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'AND    RECPAG = '#39'R'#39
      'AND   ATIVO = '#39'S'#39)
    ValidateWithMask = True
    Left = 155
    Top = 147
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryTpRecebCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryTpRecebDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTpRecebANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.ANASINT'
      FixedChar = True
      Size = 1
    end
  end
  object qrycontacontabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST'
      '                                   FROM   PLANOCONTA'
      '                                   WHERE  PLANO = 30')
    ValidateWithMask = True
    Left = 115
    Top = 155
    object qrycontacontabilPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.PLANOCONTA.PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qrycontacontabilPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'BASEDADOS.PLANOCONTA.PLANOME'
      Size = 40
    end
    object qrycontacontabilPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'BASEDADOS.PLANOCONTA.PLATIPO'
      FixedChar = True
      Size = 1
    end
    object qrycontacontabilPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Origin = 'BASEDADOS.PLANOCONTA.PLACCUST'
      FixedChar = True
      Size = 1
    end
  end
  object qryPlanPrevPatro: TwwQuery
    AfterScroll = qryPlanPrevPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPESSJUR, IDPLANOPREV, PLACONTALIQFLHBEN FROM PLANPREVPA' +
        'TRO'
      'WHERE IDPLANOPREV = :IDPLANOPREV'
      'AND   IDPESSJUR   = :IDPESSJUR  ')
    ValidateWithMask = True
    Left = 134
    Top = 380
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 33
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryProventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, DESCRICAO, CODPROVDESC'
      'FROM   PROVDESC'
      'WHERE  (FLGDESCONTO = 0)'
      '  AND (FLGTPRUBRICA LIKE '#39'%B%'#39') AND'
      '  (FLGESTADORUB <> 2)'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 954
    Top = 145
  end
  object qryAltBaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR, DESCRICAO, IDEMPRESA,'
      
        '       DECODE(RECPAG,'#39'R'#39', '#39'Contas a Receber'#39', '#39'Contas a Pagar'#39') ' +
        'AS TIPO'
      'FROM   TIPOALTERADOR'
      'WHERE RECPAG = '#39'R'#39
      'ORDER BY RECPAG, DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 950
    Top = 202
  end
  object MsProvento: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGDESCONTO = 0'
      'PROVDESC.FLGTPRUBRICA LIKE '#39'%B%'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
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
    Left = 959
    Top = 109
  end
end
