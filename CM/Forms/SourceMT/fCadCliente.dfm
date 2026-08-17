inherited frmCadCliente: TfrmCadCliente
  Left = 256
  Top = 44
  Caption = 'Cadastro de Cliente'
  ClientHeight = 581
  ClientWidth = 800
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 495
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 798
      Height = 388
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados do Cliente'
        'Tipos de Recebimento'
        'Impostos Agregados'
        'Tipos de Cliente')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'GrdContaBancaria_Padrao'
        ''
        ''
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 700
        Height = 329
        ActivePage = TbsDadosCliente
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 692
            Height = 301
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 692
            Height = 301
            inherited pnlItemsDoc: TPanel
              Height = 299
            end
            inherited pnlFoto: TPanel
              Width = 202
              Height = 299
              inherited BvlImagem: TBevel
                Height = 268
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 268
                Width = 202
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 200
                Height = 268
              end
            end
            inherited lstDocumentos: TListView
              Height = 299
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 692
            Height = 301
            inherited grpTipoEnd: TGroupBox
              Left = 495
              Height = 301
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 692
            Height = 301
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited SplContatos_Padrao: TSplitter
            Left = 463
            Height = 301
          end
          inherited Panel1: TPanel
            Width = 463
            Height = 301
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 463
            Height = 301
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 466
            Height = 301
            inherited GrdExibeContatos_Padrao: TwwDBGrid
              Height = 280
            end
          end
        end
        inherited tbsContato: TTabSheet
          inherited SplTelefones_Padrao: TSplitter
            Left = 490
            Height = 301
          end
          inherited Panel2: TPanel
            Width = 490
            Height = 301
          end
          inherited dbgContato: TwwDBGrid
            Width = 490
            Height = 301
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 493
            Height = 301
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 280
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 692
            Height = 301
          end
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 692
            Height = 301
          end
        end
        object TbsDadosCliente: TTabSheet
          Caption = 'Dados do Cliente'
          ImageIndex = 5
          object TbsGeral: TPageControl
            Left = 0
            Top = 0
            Width = 692
            Height = 301
            ActivePage = TbsContabil
            Align = alClient
            TabOrder = 0
            object TbsDados: TTabSheet
              Caption = 'Dados Gerais'
              object Label2: TLabel
                Left = 15
                Top = 46
                Width = 124
                Height = 13
                Caption = 'Cód. Correspondente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedCodigoCli: TwwDBEdit
                Left = 15
                Top = 61
                Width = 130
                Height = 21
                DataField = 'CODCLIENTE'
                DataSource = dsSubTipo
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object DBRadioGroup2: TDBRadioGroup
                Left = 150
                Top = 49
                Width = 77
                Height = 75
                Caption = ' Status '
                DataField = 'FLGSTATUS'
                DataSource = DsEmpresaCliente
                Items.Strings = (
                  'Ativo'
                  'Inativo')
                TabOrder = 1
                Values.Strings = (
                  'A'
                  'I')
              end
            end
            object TbsContabil: TTabSheet
              Caption = 'Integração Contábil'
              object CContabil: TCMProcuraMaskContabil
                Left = 5
                Top = 1
                Width = 227
                Height = 217
                Caption = ' Conta do Cliente'
                TabOrder = 0
                MostraMensagens = True
                MostraDescricao = True
                DataSource = DsEmpresaCliente
                DataField = 'CONTACCLIENTE'
                Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
                Mensagens.NaoExiste = 'Conta Contábil não existe'
                Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
                Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = True
                AceitaTipoConta = SoAnalitica
                Plano = 0
                Status = scSoAtiva
              end
              object CContabilCredito: TCMProcuraMaskContabil
                Left = 236
                Top = 115
                Width = 233
                Height = 103
                Caption = ' Conta a Crédito  '
                TabOrder = 1
                MostraMensagens = True
                MostraDescricao = True
                DataSource = DsEmpresaCliente
                DataField = 'CONTACRECEITA'
                Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
                Mensagens.NaoExiste = 'Conta Contábil não existe'
                Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
                Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = True
                AceitaTipoConta = SoAnalitica
                Plano = 0
                Status = scSoAtiva
              end
              object CContabilAdiantamento: TCMProcuraMaskContabil
                Left = 236
                Top = 2
                Width = 233
                Height = 107
                Caption = 'Conta de Adiantamento'
                TabOrder = 2
                MostraMensagens = True
                MostraDescricao = True
                DataSource = DsEmpresaCliente
                DataField = 'CONTACADIANTAMENTO'
                Mensagens.EmBranco = 'Conta de Adiantamento não pode estar em branco'
                Mensagens.NaoExiste = 'Conta de Adiantamento não existe'
                Mensagens.Sintetica = 'Conta de Adiantamento não pode ser sintética'
                Mensagens.Analitica = 'Conta de Adiantamento não pode ser analítica'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = True
                AceitaTipoConta = SoAnalitica
                Plano = 0
                Status = scSoAtiva
              end
              object Panel5: TPanel
                Left = 9
                Top = 71
                Width = 217
                Height = 135
                BevelOuter = bvNone
                TabOrder = 3
                object Label23: TLabel
                  Left = 5
                  Top = -1
                  Width = 55
                  Height = 13
                  Caption = 'Subconta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label26: TLabel
                  Left = 5
                  Top = 44
                  Width = 92
                  Height = 13
                  Caption = 'Centro de Custo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label4: TLabel
                  Left = 5
                  Top = 89
                  Width = 108
                  Height = 13
                  Caption = 'Atividade / Projeto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object CmpSubConta: TCMProcura
                  Left = 5
                  Top = 14
                  Width = 209
                  Height = 27
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  MostraMensagens = True
                  Mensagens.EmBranco = 'Sub-Conta não pode estar em branco'
                  Mensagens.NaoExiste = 'Sub-Conta não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  DataSource = DsEmpresaCliente
                  DataField = 'CODSUBCONTA'
                  LookupChave = 'CODSUBCONTA'
                  LookupDescricao = 'NOMESUBCONTA'
                  MontaSelect = MsSubConta
                  LookupTabela = 'SUBCONTA'
                  DataBaseName = 'BaseDados'
                  ReadOnly = False
                end
                object CmpCentroCusto: TCMProcura
                  Left = 5
                  Top = 59
                  Width = 210
                  Height = 27
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  MostraMensagens = True
                  Mensagens.EmBranco = 'Centro de Custo não pode estar em branco'
                  Mensagens.NaoExiste = 'Centro de Custo não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  OnApertouBotao = CmpCentroCustoApertouBotao
                  DataSource = DsEmpresaCliente
                  DataField = 'CODCENTROCUSTO'
                  LookupChave = 'CODCENTROCUSTO'
                  LookupDescricao = 'NOME'
                  MontaSelect = MsCentroCusto
                  LookupTabela = 'CENTCUST'
                  DataBaseName = 'BaseDados'
                  ReadOnly = False
                end
                object CmpAtivProj: TCMProcura
                  Left = 5
                  Top = 105
                  Width = 210
                  Height = 27
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  MostraMensagens = True
                  Mensagens.EmBranco = 'Atividade / Projeto não pode estar em branco'
                  Mensagens.NaoExiste = 'Atividade / Projeto não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  DataSource = DsEmpresaCliente
                  DataField = 'UNIDNEGOC'
                  LookupChave = 'UNIDNEGOC'
                  LookupDescricao = 'NOME'
                  MontaSelect = MsAtividadeProjeto
                  LookupTabela = 'UNIDNEGOCIO'
                  DataBaseName = 'BaseDados'
                  ReadOnly = False
                end
              end
            end
            object TbsObservacoes_Padrao: TTabSheet
              Caption = 'Observações'
              ImageIndex = 2
              object MemObs: TDBMemo
                Left = 8
                Top = 5
                Width = 577
                Height = 220
                DataField = 'OBSCLIENTE'
                DataSource = DsEmpresaCliente
                ScrollBars = ssBoth
                TabOrder = 0
              end
            end
          end
        end
        object TbsTipoReceb: TTabSheet
          Caption = 'Tipos de Recebimento'
          ImageIndex = 6
          object BtnDelTipoReceb: TSpeedButton
            Left = 356
            Top = 100
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnDelTipoRecebClick
          end
          object BtnAddTipoReceb: TSpeedButton
            Left = 356
            Top = 60
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnAddTipoRecebClick
          end
          object PnlTipoRecebCli: TPanel
            Left = 386
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos de Recebimento do Cliente'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object GrdTipoRecebCli: TwwDBGrid
            Left = 386
            Top = 35
            Width = 343
            Height = 150
            Selected.Strings = (
              'CODTIPRECDES'#9'10'#9'Código'
              'ANASINT'#9'1'#9'T'
              'DESCRICAO'#9'35'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsTipoRecebCli
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = GrdTipoRecebCliCalcCellColors
            IndicatorColor = icBlack
          end
          object PnlTipoReceb: TPanel
            Left = 7
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos de Recebimentos'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object GrdTipoReceb: TwwDBGrid
            Left = 7
            Top = 35
            Width = 343
            Height = 150
            Selected.Strings = (
              'CODTIPRECDES'#9'10'#9'Código'
              'ANASINT'#9'1'#9'T'
              'DESCRICAO'#9'35'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsTipoReceb
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 3
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = GrdTipoRecebCalcCellColors
            IndicatorColor = icBlack
          end
        end
        object TbsImpAgreg: TTabSheet
          Caption = 'Impostos Agregados'
          ImageIndex = 7
          object BtnAddImpAgreg: TSpeedButton
            Left = 356
            Top = 60
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnAddImpAgregClick
          end
          object BtnDelImpAgreg: TSpeedButton
            Left = 356
            Top = 100
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnDelImpAgregClick
          end
          object PnlImpAgregCli: TPanel
            Left = 386
            Top = 7
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Impostos Agregados Ao Cliente Fornecedor'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object GrdImpAgreg: TwwDBGrid
            Left = 7
            Top = 35
            Width = 343
            Height = 150
            Selected.Strings = (
              'DESCCUSTAGREG'#9'25'#9'Nome'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsImAgreg
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object PnlImpAgreg: TPanel
            Left = 8
            Top = 8
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Impostos Agregados'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object GrdImpAgregCli: TwwDBGrid
            Left = 386
            Top = 34
            Width = 343
            Height = 150
            Selected.Strings = (
              'DESCCUSTAGREG'#9'25'#9'Nome')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsImAgregCli
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 3
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
        object TbsTiposCliente: TTabSheet
          Caption = 'Tipos de Cliente'
          ImageIndex = 8
          object BtnDelTipos: TSpeedButton
            Left = 356
            Top = 100
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnDelTiposClick
          end
          object BtnAddTipos: TSpeedButton
            Left = 356
            Top = 60
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnAddTiposClick
          end
          object GrdTiposCli: TwwDBGrid
            Left = 386
            Top = 36
            Width = 343
            Height = 150
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsTiposCli
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object GrdTipos: TwwDBGrid
            Left = 7
            Top = 36
            Width = 343
            Height = 150
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Tipo Cliente')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsTipos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
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
          object PnlTipos: TPanel
            Left = 8
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos de Cliente'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object PnlTiposCli: TPanel
            Left = 386
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos do Cliente'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      inherited Dock973: TDock97
        Width = 790
      end
      inherited Dock974: TDock97
        Left = 704
        Height = 329
      end
    end
    inherited pnlMestre: TPanel
      Width = 798
    end
  end
  inherited Dock972: TDock97
    Width = 800
  end
  inherited Dock971: TDock97
    Top = 542
    Width = 800
    inherited tb97Fundo: TToolbar97
      Left = 610
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 441
    end
  end
  inherited ds: TwwDataSource
    Top = 573
  end
  inherited Cds: TCMClientDataSet
    Top = 527
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Cliente'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO'
      'CLIENTEPESS.CODCLIENTE'
      'PESSOA.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'Razão Social'
      'Número do Documento'
      'Código do Cliente'
      'Identificador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'CLIENTEPESS'
      'EMPRESACLIENTE')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=CLIENTEPESS.IDPESSOA'
      'PESSOA.IDPESSOA=EMPRESACLIENTE.IDFORCLI')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '18'
      '10'
      '10')
  end
  inherited dsSubTipo: TwwDataSource
    Left = 676
    Top = 573
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 305
    Top = 573
  end
  inherited ImlDocumentos: TImageList
    Left = 713
    Top = 4
  end
  inherited dsTelefone: TwwDataSource
    Left = 217
    Top = 573
  end
  inherited dsEndereco: TwwDataSource
    Left = 169
    Top = 573
  end
  inherited dsContato: TwwDataSource
    Left = 263
    Top = 573
  end
  inherited dsTelContato: TwwDataSource
    Left = 495
    Top = 573
  end
  inherited dsDocumento: TwwDataSource
    Left = 74
    Top = 573
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 583
    Top = 573
  end
  inherited dsImagem: TwwDataSource
    Left = 538
    Top = 573
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 631
    Top = 573
  end
  inherited DsNaturalidade: TwwDataSource
    Top = 573
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 74
    Top = 527
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 121
    Top = 527
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 167
    Top = 527
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 213
    Top = 527
  end
  inherited CdsContato: TCMClientDataSet
    Left = 260
    Top = 527
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 492
    Top = 527
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 538
    Top = 527
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 584
    Top = 527
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 631
    Top = 527
  end
  inherited CdsSubTipo: TCMClientDataSet
    AfterOpen = CdsSubTipoAfterOpen
    Left = 677
    Top = 527
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 306
    Top = 527
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 353
    Top = 527
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Top = 527
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 445
    Top = 527
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 121
    Top = 626
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 74
    Top = 626
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 170
    Top = 626
  end
  object CdsEmpresaCliente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsEmpresaClienteAfterOpen
    BeforePost = CdsEmpresaClienteBeforePost
    Left = 219
    Top = 626
  end
  object DsEmpresaCliente: TwwDataSource
    AutoEdit = False
    DataSet = CdsEmpresaCliente
    Left = 266
    Top = 627
  end
  object MsClasFisCliFor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Classificação Fiscal'
    Colunas.Strings = (
      'CLASFISCLIFOR.DESCCLASFISCLIFOR'
      'CLASFISCLIFOR.CODREDUZIDO'
      'CLASFISCLIFOR.FLGTIPOFATURA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Código Reduzido'
      'Tipo Fatura')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CLASFISCLIFOR')
    CamposChave.Strings = (
      'CLASFISCLIFOR.IDCLASFISCLIFOR')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '3'
      '2')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 959
    Top = 356
  end
  object MsTipoCliente: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Tipo de Cliente'
    Colunas.Strings = (
      'TIPOCLIENTE.DESCRICAO'
      'TIPOCLIENTE.CODREDUZIDO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Código Reduzido')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOCLIENTE')
    CamposChave.Strings = (
      'TIPOCLIENTE.IDTIPOCLIENTE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '3')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 959
    Top = 306
  end
  object MsSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Sub Conta'
    Colunas.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
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
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 959
    Top = 404
  end
  object MsCentroCusto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Custo'
    Colunas.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'CENTCUST.CODCORRESP')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Correspondente')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST'
      'CONTASXCC')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 959
    Top = 452
  end
  object MsAtividadeProjeto: TMontaSelect
    Template.IdConsulta = 0
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME'
      'UNIDNEGOCIO.UNIDNEGOC')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Identificador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC')
    Filtro.Strings = (
      'UNIDNEGOCIO.UNETIPO = '#39'A'#39' AND UNIDNEGOCIO.ATIVO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '25'
      '10')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 183
    Top = 84
  end
  object CdsTipoReceb: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODTIPRECDES;ANASINT'
    Params = <>
    Left = 592
    Top = 268
  end
  object CdsTipoRecebCli: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODTIPRECDES;ANASINT'
    Params = <>
    Left = 784
    Top = 268
  end
  object CdsImAgreg: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCCUSTAGREG'
    Params = <>
    Left = 640
    Top = 268
  end
  object CdsImAgregCli: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCCUSTAGREG'
    Params = <>
    Left = 824
    Top = 268
  end
  object CdsTipos: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCRICAO'
    Params = <>
    Left = 688
    Top = 268
  end
  object CdsTiposCli: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCRICAO'
    Params = <>
    Left = 864
    Top = 268
  end
  object DsTipoReceb: TwwDataSource
    DataSet = CdsTipoReceb
    Left = 592
    Top = 316
  end
  object DsImAgreg: TwwDataSource
    DataSet = CdsImAgreg
    Left = 640
    Top = 316
  end
  object DsTipos: TwwDataSource
    DataSet = CdsTipos
    Left = 688
    Top = 316
  end
  object DsTipoRecebCli: TwwDataSource
    DataSet = CdsTipoRecebCli
    Left = 784
    Top = 316
  end
  object DsImAgregCli: TwwDataSource
    DataSet = CdsImAgregCli
    Left = 824
    Top = 316
  end
  object DsTiposCli: TwwDataSource
    DataSet = CdsTiposCli
    Left = 864
    Top = 316
  end
end
