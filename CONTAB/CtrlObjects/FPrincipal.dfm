inherited frmPrincipal: TfrmPrincipal
  Left = 207
  Top = 102
  Caption = 'Contabilidade'
  ClientHeight = 389
  ClientWidth = 738
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 738
    inherited tb97Atalho: TToolbar97
      inherited ToolBarsep973: TToolbarSep97
        Blank = False
      end
    end
    object Toolbar971: TToolbar97
      Left = 216
      Top = 0
      Caption = 'Atalhos'
      CloseButton = False
      DefaultDock = Dock97Top
      DockableTo = [dpTop, dpBottom]
      DockPos = 216
      TabOrder = 1
      object tbtnAtuAnal: TToolbarButton97
        Left = 23
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Atualiza Saldo das Contas Analíticas'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555500000055000000000000005500000057777777777777705500000057F8
          8888888888705500000057F808B0B0B8B8705500000057FB0B808B8B8B705500
          000057F80000B8B8B8705500000057FB0B808B828B705500000057F8B008B822
          28705500000057FB8B8B822222705500000057FFFFFF222722205500000057B8
          B8B8B255522255000000557B8B8B755555222500000055577777555555522200
          0000555555555555555522000000555555555555555555000000}
        HelpContext = 10018
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AtualizaSaldoAnaltica1Click
      end
      object tbtnLancamentos: TToolbarButton97
        Left = 154
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Lançamentos'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555500000055557000000005555500000055557BBBBBBB0555550000005555
          7777777705555500000055555555555555CC55000000555555555555555CC500
          00005700000000005555CC00000057BFB7BF7FB055C5CC00000057FBF7FB7BF0
          5CC5CC00000057BFB7BF7FB7CCCCCC00000057FBF7FB7BFCCCCCC500000057BF
          B7BF7FB7CCCC5500000057FBF7FB7BF05CC55500000057777777777055C55500
          0000555555555555555555000000555555555555555555000000}
        HelpContext = 10024
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuLancamentoClick
      end
      object ToolbarSep971: TToolbarSep97
        Left = 69
        Top = 0
        SizeHorz = 8
      end
      object tbtnAtuSin: TToolbarButton97
        Left = 46
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Atualiza Saldo das Contas Sintéticas'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555500000055000000000000005500000057777777777777705500000057F8
          8888888888705500000057F80008B0B8B8705500000057FB8B808B8B8B705500
          000057F8B008B8B8B8705500000057FB0B8B8B828B705500000057F8B008B822
          28705500000057FB8B8B822222705500000057FFFFFF222722205500000057B8
          B8B8B255522255000000557B8B8B755555222500000055577777555555522200
          0000555555555555555522000000555555555555555555000000}
        HelpContext = 10019
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuAtualizaSaldoClick
      end
      object tbtnRateio: TToolbarButton97
        Left = 200
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Planilhas de Rateio'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555500000057000000555700000000000057F8FBF05557F8FBF000000057B8
          BFB05057B8BFB000000057F8FBF05557F8FBF000000057777770555777777000
          000055555555555555555500000057000000000055505500000057BFB7BF7FB0
          55555500000057FBF7FB7BF055505500000057BFB7BF7FB055555500000057FB
          F7FB7BF055505500000057BFB7BF7FB055555500000057FBF7FB7BF050505500
          0000577777777770555555000000555555555555555555000000}
        HelpContext = 10026
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuRateioClick
      end
      object tbtnPrePronta: TToolbarButton97
        Left = 177
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Planilhas Pré-Prontas'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555000000555057000000000055000000555557BFB7BF7FB0550000005505
          57FBF7FB7BF055000000555557BFB7BF7FB055000000505557FBF7FB7BF05500
          0000555557BFB7BF7FB055000000570007FBF7FB7BF05500000057EFE7777777
          77705500000057FEF7FE7EF055555500000057EFE7EF7FE055505500000057FE
          F7FE7EF055555500000057EFE7EF7FE055055500000057FEF7FE7EF055555500
          0000577777777770505555000000555555555555555555000000}
        HelpContext = 10025
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuPreProntaClick
      end
      object tbtnAutomatica: TToolbarButton97
        Left = 223
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Planilhas Automáticas'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555550000005555557000000000050000005555557BFB7BF7FB050000005555
          557FBF7FB7BF050000005555557BFB7BF7FB050000005555557FBF7FB7BF0500
          000055550000FB7BF7FB0500000055070807007FB7BF05000000557888887087
          7777050000005778707800055555550000005788070887055555550000005778
          7078000555555500000055788888705555555500000055770807005555555500
          0000555577775555555555000000555555555555555555000000}
        HelpContext = 10027
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = Automtico1Click
      end
      object ToolbarSep972: TToolbarSep97
        Left = 246
        Top = 0
        SizeHorz = 8
      end
      object tbtnIntegraDia: TToolbarButton97
        Left = 77
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Integração por Dia'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000050000000000000000000000050FF8FF8FF8FF8FF0000000050FF
          8F222F8FF8FF0000000050888222228888880000000050FF2228222FF8FF0000
          000050FF82F8F222F8FF0000000050888888882228880000000050FF8FF8FF82
          22FF0000000050FF8FF8FF8F22FF000000005088888888888888000000005044
          4447777777770000000050444447777777770000000050000000000000000000
          0000555555555555555550000000555555555555555550000000}
        HelpContext = 10033
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = Dia1Click
      end
      object tbtnOrcamento: TToolbarButton97
        Left = 277
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Cadastro de Orçamento'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555333333333
          33555331111111111133511188888888811155788F8F6F8888055578F8F666F8
          8805557F8F6F6F6F88055578F8F868688805557FFF86668F88055578F86868F8
          8805557FFF6F6F6F88055578FFF666F888055557FF8F6F8F80555557FFF8F8F8
          F05555557FFFFF8F0555555557F8F8F755555555557777755555}
        HelpContext = 10068
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuOramentoClick
      end
      object ToolbarSep974: TToolbarSep97
        Left = 146
        Top = 0
        SizeHorz = 8
      end
      object tbtnIntegraPlanilha: TToolbarButton97
        Left = 100
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Integração por Planilhas'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000057000000000000000000000057FBFBFB7BFB7BFB0000000057BF
          BFBF7FBF7FBF0000000057FBFB222BFB7BFB0000000057B8B22222B878B80000
          000057FB222B222B7BFB0000000057BFB2BF72227FBF0000000057FBFBFB7B22
          2BFB0000000057B8B8B878B222B80000000057FBFBFB7BFB22FB0000000057BF
          BFBF7FBF7FBF0000000057FBFBFB7BFB7BFB0000000057777777777777770000
          0000555555555555555550000000555555555555555550000000}
        HelpContext = 10034
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = Planilha1Click
      end
      object tbtnEncerraPer: TToolbarButton97
        Left = 123
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Encerra Período'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000050000000000000000000000050FF8FF8FF8FF8FF0000000050FF
          8FF8FF8FF8FF0000000050888888888888880000000050FF8FF8FF8FF8FF0000
          000050FF8FF8FF8FF8FF0000000050888888888888880000000050FF8FF8FF71
          111F0000000050FF8FF8F8199991700000005088888881999999100000005044
          4447719FFFF91000000050444447719FFFF91000000050000000719999991000
          0000555555555719999170000000555555555551111550000000}
        HelpContext = 10037
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuEncerraPerodoClick
      end
      object ToolbarSep975: TToolbarSep97
        Left = 300
        Top = 0
        SizeHorz = 8
      end
      object tbtnConsultaLanc: TToolbarButton97
        Left = 308
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Consulta de Lançamentos'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888800000088888887000000000000000088888887BFB7BF7FB00000001888
          8887FBF7FB7BF000000011888887BFB7BF7FB000000011188887FBF7FB7BF000
          000081110000BFB7BF7FB00000008810E8E80BF7FB7BF0000000880E8E8E8077
          7777700000008808E8E8E088888888000000880E8E8E80888888880000008808
          E8E8E08888888800000088808E8E088888888800000088880000888888888800
          0000888888888888888888000000888888888888888888000000}
        HelpContext = 10077
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = Lanamentos1Click
      end
      object tbtnConsultaSaldo: TToolbarButton97
        Left = 331
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Consulta de Saldos'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888880000008888888888888888880000008888888888888488880000001888
          8888888844488800000011888888888484848800000011188888888884848800
          00008111000088884448880000008810E8E80884848888000000880E8E8E8084
          8484880000008808E8E8E088444888000000880E8E8E80888488880000008808
          E8E8E08888888800000088808E8E088888888800000088880000888888888800
          0000888888888888888888000000888888888888888888000000}
        HelpContext = 10078
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = Saldos1Click
      end
      object tbtnAtuMoeda: TToolbarButton97
        Left = 0
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Atualiza Moeda'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550000055
          555555000000555008888800555555000000557B8B8B8B8805555500000057B8
          B8B4B8B8805555000000578B8B444B8B8055550000007FB8B4B4B4B8B8055500
          00007F8B8B84848B8805550000007FB8B84448B2B805550000007F8B84848B22
          2805550000007FB8B4B4B22222755500000057FB8B44222B22255500000057F8
          B8B4B2B8B22255000000557FFB8B8B8B75222500000055577FFFFF7755522200
          0000555557777755555522000000555555555555555555000000}
        HelpContext = 10031
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = mnuAtualizaMoedaClick
      end
      object tbtnContas: TToolbarButton97
        Left = 254
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Cadastro de Plano de Contas'
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333700007
          3333330000003333337FBFB03003000000003330707BFBF03333330000003337
          337FB77733333300000033303337733333333300000033373333333333333300
          00003330337000073333330000003337337FBFB03003000000003330707BFBF0
          3333330000003337337FB7773333330000003330333773333333330000003337
          3333333333333300000037000073333333333300000037FBFB03003000333300
          000037BFBF03333333333300000037FB77733333333333000000337733333333
          333333000000333333333333333333000000}
        HelpContext = 10058
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = PlanodeContasNovo1Click
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 261
    Top = 79
    inherited pnlTextoFluxOper: TPanel
      Caption = 'pnlTextoFluxOper'
    end
    inherited Panel2: TPanel
      inherited tb97btnCancelar: TToolbarButton97
        Left = 323
      end
    end
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 369
    Width = 738
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlEmpresa_Padrao'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '310'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlUsuario_Padrao'
        Tag = 0
        Text = 'Usuario'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '140'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel0'
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '64'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel1'
        Style = psCapsLock
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '40'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel2'
        Style = psNumLock
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '40'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlDateTime'
        Style = psDateTime
        Tag = 0
        Text = '15/05/2006 13:26'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  object Button1: TButton [3]
    Left = 8
    Top = 80
    Width = 105
    Height = 25
    Caption = 'Planilha SPC'
    TabOrder = 3
    Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 59
    Top = 49
  end
  inherited mnu: TMainMenu
    Left = 89
    Top = 241
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuParametrosClick
        end
        object DiasBloqueadosporMdulo1: TMenuItem [1]
          Caption = '&Dias Bloqueados por Sistema'
          OnClick = DiasBloqueadosporMdulo1Click
        end
      end
      inherited mnuUtilitario: TMenuItem
        object Importar1: TMenuItem
          Caption = '&Importações'
          HelpContext = 10001
          object Lanamentos2: TMenuItem
            Caption = 'Lançamentos'
            HelpContext = 10002
            OnClick = Lanamentos2Click
          end
          object LanamentosModelo21: TMenuItem
            Caption = 'Lançamentos "EXCEL"'
            HelpContext = 10003
            OnClick = LanamentosModelo21Click
          end
          object LanamentosModelo31: TMenuItem
            Caption = 'Lançamentos "Folha RM"'
            Enabled = False
            HelpContext = 10004
            Visible = False
            OnClick = LanamentosModelo31Click
          end
          object mnuValoresOrcados1: TMenuItem
            Caption = '&Valores Orçados "EXCEL"'
            OnClick = mnuValoresOrcados1Click
          end
          object PlanodeContas1: TMenuItem
            Caption = '&Plano de Contas'
            HelpContext = 10006
            OnClick = PlanodeContas1Click
          end
          object SaldoAnterior1: TMenuItem
            Caption = '&Saldo Anterior'
            HelpContext = 10007
            OnClick = SaldoAnterior1Click
          end
          object ContaCorrespondente1: TMenuItem
            Caption = 'Conta Correspondente'
            HelpContext = 10008
            OnClick = ContaCorrespondente1Click
          end
          object Fidlio1: TMenuItem
            Caption = 'Fidélio'
            Enabled = False
            HelpContext = 10010
            Visible = False
            OnClick = Fidlio1Click
          end
          object SAF1: TMenuItem
            Caption = 'SA&F'
            Enabled = False
            HelpContext = 10011
            Visible = False
            OnClick = SAF1Click
          end
          object LanamentosFolhaDinamica1: TMenuItem
            Caption = 'Lançamentos "Folha Dinamica"'
            Enabled = False
            HelpContext = 10012
            Visible = False
            OnClick = LanamentosFolhaDinamica1Click
          end
          object LanamentosSRHPlus1: TMenuItem
            Caption = 'Lançamentos "SRH Plus"'
            Enabled = False
            HelpContext = 10013
            Visible = False
            object Eventos1: TMenuItem
              Caption = '&Cadastro de Eventos'
              Enabled = False
              HelpContext = 10014
              Visible = False
              OnClick = Eventos1Click
            end
            object Importao1: TMenuItem
              Caption = '&Importação'
              Enabled = False
              HelpContext = 10015
              Visible = False
              OnClick = Importao1Click
            end
          end
        end
        object Exportaes1: TMenuItem
          Caption = 'Exportações'
          HelpContext = 10016
          Visible = False
          object ExportaContabil: TMenuItem
            Caption = 'Exportação Contábil'
            OnClick = ExportaContabilClick
          end
          object ExclusodeExportaoContbil1: TMenuItem
            Caption = 'Exclusão de Exportação Contábil'
            OnClick = ExclusodeExportaoContbil1Click
          end
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object VerificaLanamentos1: TMenuItem
          Caption = '&Verifica Lançamentos'
          HelpContext = 10017
          OnClick = VerificaLanamentos1Click
        end
        object AtualizaSaldoAnaltica1: TMenuItem
          Caption = '&Atualiza Saldos das Contas Analíticas'
          HelpContext = 10018
          OnClick = AtualizaSaldoAnaltica1Click
        end
        object mnuAtualizaSaldo: TMenuItem
          Caption = 'Atualiza Saldo das Contas &Sintéticas'
          HelpContext = 10019
          OnClick = mnuAtualizaSaldoClick
        end
        object AtualizaCdigosReduzidos1: TMenuItem
          Caption = 'Atualiza Códigos &Reduzidos'
          HelpContext = 10020
          OnClick = AtualizaCdigosReduzidos1Click
        end
        object N16: TMenuItem
          Caption = '-'
        end
        object AtualizaNumeraodasPlanilhas1: TMenuItem
          Caption = 'Atualiza Numeração das &Planilhas'
          HelpContext = 10021
          OnClick = AtualizaNumeraodasPlanilhas1Click
        end
        object AtivarNumeraodePlanilhasPorSeqence1: TMenuItem
          Caption = 'Ativar Numeração de Planilhas Por Seqüence'
          OnClick = AtivarNumeraodePlanilhasPorSeqence1Click
        end
      end
      object N6: TMenuItem [8]
        Caption = '-'
      end
    end
    object mnuPlanilha: TMenuItem [1]
      Caption = 'P&lanilhas'
      HelpContext = 10023
      object mnuLancamento: TMenuItem
        Caption = '&Lançamentos'
        HelpContext = 10024
        OnClick = mnuLancamentoClick
      end
      object mnuPrePronta: TMenuItem
        Caption = '&Pré-pronta'
        HelpContext = 10025
        OnClick = mnuPreProntaClick
      end
      object mnuRateio: TMenuItem
        Caption = '&Rateio'
        HelpContext = 10026
        OnClick = mnuRateioClick
      end
      object Automtico1: TMenuItem
        Caption = '&Automático'
        HelpContext = 10027
        OnClick = Automtico1Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object AlteraodeData1: TMenuItem
        Caption = 'Alteração de &Data'
        HelpContext = 10028
        OnClick = AlteraodeData1Click
      end
      object ExclusodePlanilhasporFaixa1: TMenuItem
        Caption = '&Exclusão de Planilhas por Faixa'
        HelpContext = 10029
        OnClick = ExclusodePlanilhasporFaixa1Click
      end
    end
    object mnuProcessamentos: TMenuItem [2]
      Caption = '&Processamentos'
      HelpContext = 10030
      object mnuAtualizaMoeda: TMenuItem
        Caption = 'Atualiza &Moeda'
        HelpContext = 10031
        OnClick = mnuAtualizaMoedaClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuIntegra: TMenuItem
        Caption = '&Integração'
        HelpContext = 10032
        object Dia1: TMenuItem
          Caption = 'Por &Dia'
          HelpContext = 10033
          OnClick = Dia1Click
        end
        object Planilha1: TMenuItem
          Caption = 'Por &Planilha'
          HelpContext = 10034
          OnClick = Planilha1Click
        end
      end
      object VerificaPlanilhasemPreodosBloqueados1: TMenuItem
        Caption = 'Verifica Planilhas em Períodos Bloqueados'
        HelpContext = 10035
        OnClick = VerificaPlanilhasemPreodosBloqueados1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object mnuApuracaoP: TMenuItem
        Caption = '&Apuração de Resultados do Período'
        object mnuIncluiApur: TMenuItem
          Caption = 'Incluir'
          OnClick = mnuIncluiApurClick
        end
        object N18: TMenuItem
          Caption = '-'
        end
        object mnuExcluiApur: TMenuItem
          Caption = 'Excluir'
          OnClick = mnuExcluiApurClick
        end
      end
      object mnuProcRentabilidadeContabil: TMenuItem
        Caption = 'Rentabilidade Contábil'
        OnClick = mnuProcRentabilidadeContabilClick
      end
      object ConsisteRegras1: TMenuItem
        Caption = 'Consiste &Regras'
        HelpContext = 10036
        OnClick = ConsisteRegras1Click
      end
      object mnuEncerraPerodo: TMenuItem
        Caption = 'Encerra &Período'
        HelpContext = 10037
        OnClick = mnuEncerraPerodoClick
      end
      object GerararquivoSPCCAP1: TMenuItem
        Caption = '&Gerar arquivo SIPC-CAP'
        OnClick = GerararquivoSPCCAP1Click
        object SICCAP1: TMenuItem
          Caption = '&SIPC-CAP'
          OnClick = SICCAP1Click
        end
        object SICCAPModelo20041: TMenuItem
          Caption = 'SIPC-CAP &Modelo 2004'
          OnClick = SICCAPModelo20041Click
        end
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object mnuEncerraContasdeResultado: TMenuItem
        Caption = 'Encerra &Contas de Resultado'
        HelpContext = 10038
        OnClick = mnuEncerraContasdeResultadoClick
      end
      object LanamentodaMeiaNoite1: TMenuItem
        Caption = 'Apuração de Resultados do Exercício (Lançamento da Meia-Noite)'
        Enabled = False
        Visible = False
        OnClick = LanamentodaMeiaNoite1Click
      end
      object mnuEncerraExerccio: TMenuItem
        Caption = '&Encerra Exercício'
        HelpContext = 10039
        OnClick = mnuEncerraExerccioClick
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object GeraSaldoCalculadoporPerodo1: TMenuItem
        Caption = 'Gera &Saldo Calculado por Período'
        HelpContext = 10040
        OnClick = GeraSaldoCalculadoporPerodo1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object RateioporAtividadeProjeto1: TMenuItem
        Caption = 'Rateio por Ati&vidade/Projeto'
        Enabled = False
        HelpContext = 10041
        Visible = False
        object SaldoAnteior1: TMenuItem
          Caption = 'Saldo &Anterior'
          HelpContext = 10042
          OnClick = SaldoAnteior1Click
        end
        object GeraRateioporPerodo1: TMenuItem
          Caption = '&Gera Rateio por Período'
          HelpContext = 10043
          OnClick = GeraRateioporPerodo1Click
        end
        object GeraLanamentosdoRateio1: TMenuItem
          Caption = 'Gera &Lançamentos do Rateio'
          HelpContext = 10044
          OnClick = GeraLanamentosdoRateio1Click
        end
        object N14: TMenuItem
          Caption = '-'
        end
        object PercentuaisdoRateio1: TMenuItem
          Caption = '&Percentuais do Rateio Administrativo'
          HelpContext = 10045
          OnClick = PercentuaisdoRateio1Click
        end
        object GeraLanamentosdoRateioAdministrativo1: TMenuItem
          Caption = 'Gera Lançamentos do Rateio &Administrativo'
          HelpContext = 10046
          OnClick = GeraLanamentosdoRateioAdministrativo1Click
        end
      end
      object RateioporPrograma1: TMenuItem
        Caption = 'Rateio por &Programa'
        OnClick = RateioporPrograma1Click
      end
      object RateioporPlanoePatrocinadora2: TMenuItem
        Caption = 'Rateio por Plano e Patrocinadora'
        OnClick = RateioporPlanoePatrocinadora2Click
      end
      object SegregaoporPlanoePatrocinadora1: TMenuItem
        Caption = 'Segregação por Plano e Patrocinadora'
        object PercentuaisdoRateioAdministrativoporPlanoePatrocinadora1: TMenuItem
          Caption = 'Percentuais do Rateio Administrativo por Plano e Patrocinadora'
          OnClick = PercentuaisdoRateioAdministrativoporPlanoePatrocinadora1Click
        end
        object GeraLanamentosdoRateioAdministrativoporPlanoePatrocinadora1: TMenuItem
          Caption = 
            'Gera Lançamentos do Rateio Administrativo por Plano e Patrocinad' +
            'ora'
          OnClick = GeraLanamentosdoRateioAdministrativoporPlanoePatrocinadora1Click
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object GeraValordaCota1: TMenuItem
          Caption = 'Gera Valor da Cota '
          OnClick = GeraValordaCota1Click
        end
        object GeraosLanamentosdeSegregao1: TMenuItem
          Caption = 'Gera os Lançamentos de Segregação'
          OnClick = GeraosLanamentosdeSegregao1Click
        end
        object CadastrodeSaldodeCotas1: TMenuItem
          Caption = 'Cadastro de Saldo de Cotas'
          OnClick = CadastrodeSaldodeCotas1Click
        end
      end
      object mnuSegregacaoRecursos: TMenuItem
        Caption = 'Segregação de Recursos'
        object mnuProcessaSegregao: TMenuItem
          Caption = 'Processa Segregação'
          OnClick = mnuProcessaSegregaoClick
        end
        object mnuAjustePlanilhaDiverg: TMenuItem
          Caption = 'Ajuste de Planilhas Divergentes'
          OnClick = AjustedePlanilhasDivergentes1Click
        end
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object GeraodeLanamentosdoConsolidado1: TMenuItem
        Caption = 'Geração de Lançamentos do Consolidado'
        Enabled = False
        HelpContext = 10047
        Visible = False
        OnClick = GeraodeLanamentosdoConsolidado1Click
      end
      object DeParadoPlanodecontas1: TMenuItem
        Caption = 'De/Para do Plano de Contas'
        HelpContext = 10048
        object AgrupamentoeDesmembramentodeContas1: TMenuItem
          Caption = 'Agrupamento e Desmembramento de Contas'
          HelpContext = 10049
          OnClick = AgrupamentoeDesmembramentodeContas1Click
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object DeParadeContas1: TMenuItem
          Caption = 'De/Para de Contas Contábeis'
          HelpContext = 10051
          OnClick = DeParadeContas1Click
        end
        object AlterarPlanodeContas1: TMenuItem
          Caption = 'Alterar Plano de Contas'
          HelpContext = 10052
          OnClick = AlterarPlanodeContas1Click
        end
        object TabelasdaContabilidade1: TMenuItem
          Caption = 'Tabelas da Contabilidade'
          HelpContext = 10053
          OnClick = TabelasdaContabilidade1Click
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 10054
      object mnuQualificaodePlanos: TMenuItem
        Caption = '&Qualificação de Planos'
        HelpContext = 10055
        OnClick = mnuQualificaodePlanosClick
      end
      object mnuHistricoPadro: TMenuItem
        Caption = '&Histórico Padrão'
        HelpContext = 10056
        OnClick = mnuHistricoPadroClick
      end
      object mnuSubgrupos: TMenuItem
        Caption = '&Subgrupo de Contas'
        HelpContext = 10057
        OnClick = mnuSubgruposClick
      end
      object PlanodeContasNovo1: TMenuItem
        Caption = '&Plano de Contas'
        HelpContext = 10058
        OnClick = PlanodeContasNovo1Click
      end
      object mnuSubconta: TMenuItem
        Caption = 'Sub&conta/Auxiliar'
        HelpContext = 10059
        OnClick = mnuSubcontaClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuPerodosContbeis: TMenuItem
        Caption = 'Pe&ríodos Contábeis'
        HelpContext = 10060
        OnClick = mnuPerodosContbeisClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuTermosdoDirio: TMenuItem
        Caption = '&Termos do Diário'
        HelpContext = 10061
        OnClick = mnuTermosdoDirioClick
      end
      object mnuCadPlanilhas: TMenuItem
        Caption = 'P&lanilhas'
        HelpContext = 10062
        object mnuCadPrePronta: TMenuItem
          Caption = '&Pré-Pronta'
          HelpContext = 10063
          OnClick = mnuCadPreProntaClick
        end
        object mnuCadRateio: TMenuItem
          Caption = 'Rateio por &Centro de Custo'
          HelpContext = 10064
          OnClick = mnuCadRateioClick
        end
        object LanamentoAutomtico1: TMenuItem
          Caption = 'Lançamento &Automático'
          HelpContext = 10065
          OnClick = LanamentoAutomtico1Click
        end
        object RateioporPrograma2: TMenuItem
          Caption = 'Rateio por Pro&grama'
          OnClick = RateioporPrograma2Click
        end
        object RateioporPlanoePatrocinadora1: TMenuItem
          Caption = '&Rateio por Plano e Patrocinadora'
          OnClick = RateioporPlanoePatrocinadora1Click
        end
      end
      object mnuCadRentabilidadeContabil: TMenuItem
        Caption = 'Tipo de Rentabilidade Contábil'
        OnClick = mnuCadRentabilidadeContabilClick
      end
      object mnuRegras: TMenuItem
        Caption = '&Regras de Consistência de Balancetes'
        HelpContext = 10066
        OnClick = mnuRegrasClick
      end
      object MnuSegregaodeRecursos: TMenuItem
        Caption = 'Segregação de Recursos'
        object mnuCriterioSegregacao: TMenuItem
          Caption = 'Critério para Segregação'
          OnClick = mnuCriterioSegregacaoClick
        end
        object mnuCotacaoCriterio: TMenuItem
          Caption = 'Cotação do Critério'
          OnClick = mnuCotacaoCriterioClick
        end
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuSaldoAnterior: TMenuItem
        Caption = 'Saldo &Anterior'
        HelpContext = 10067
        OnClick = mnuSaldoAnteriorClick
      end
      object mnuOramento: TMenuItem
        Caption = '&Orçamento'
        HelpContext = 10068
        OnClick = mnuOramentoClick
      end
      object MovimentodosExercciosAnteriores1: TMenuItem
        Caption = '&Movimento dos Exercícios Anteriores e Contas Estatísticas'
        HelpContext = 10069
        OnClick = MovimentodosExercciosAnteriores1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuDemontrativo: TMenuItem
        Caption = '&Demonstrativo'
        HelpContext = 10070
        OnClick = mnuDemontrativoClick
      end
      object mnuElementosdoDemonstrativo: TMenuItem
        Caption = '&Elementos do Demonstrativo'
        HelpContext = 10071
        OnClick = mnuElementosdoDemonstrativoClick
      end
      object LinhasdoDemonstrativoColunado1: TMenuItem
        Caption = 'Linhas do Demonstrativo Colunado'
        HelpContext = 10072
        OnClick = LinhasdoDemonstrativoColunado1Click
      end
      object ColunasdoDemonstrativo1: TMenuItem
        Caption = 'Colunas do Demonstrativo'
        HelpContext = 10073
        OnClick = ColunasdoDemonstrativo1Click
      end
      object LayoutsdosDemonstrativos1: TMenuItem
        Caption = 'La&yout'#39's dos Demonstrativos'
        HelpContext = 10074
        OnClick = LayoutsdosDemonstrativos1Click
      end
      object ElementosdoBalanoPatrimonial1: TMenuItem
        Caption = 'Elementos do &Balanço Patrimonial'
        HelpContext = 10075
        OnClick = ElementosdoBalanoPatrimonial1Click
      end
      object FaixadeDatasdoPlanoContbil1: TMenuItem
        Caption = 'Faixa de Datas do Plano Contábil'
        OnClick = FaixadeDatasdoPlanoContbil1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited MnuLogdeOperaes_Padrao: TMenuItem
        HelpContext = 10076
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object Lanamentos1: TMenuItem
        Caption = '&Lançamentos'
        HelpContext = 10077
        OnClick = Lanamentos1Click
      end
      object Saldos1: TMenuItem
        Caption = '&Saldos'
        HelpContext = 10078
        OnClick = Saldos1Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnuFluxoFinanceiro: TMenuItem
        Caption = 'Fluxo Financeiro'
        OnClick = mnuFluxoFinanceiroClick
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 18
    Top = 38
  end
  inherited ImlPadrao: TImageList
    Left = 16
  end
  inherited AclPadrao: TActionList
    Left = 136
    Top = 264
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 560
    Top = 56
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{5E31C11E-B870-43DC-B52B-42C479D88582}'
    ServerName = 'CMContabSvr50.DtmContabSvr50'
    Left = 344
    Top = 256
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{5E31C11E-B870-43DC-B52B-42C479D88582}'
    ServerName = 'CMContabSvr50.DtmContabSvr50'
    Left = 296
    Top = 256
  end
  inherited Web: TWebConnection
    ServerGUID = '{5E31C11E-B870-43DC-B52B-42C479D88582}'
    ServerName = 'CMContabSvr50.DtmContabSvr50'
    Left = 400
    Top = 256
  end
  inherited CorreioCM: TCorreioCM
    Left = 85
    Top = 317
  end
  inherited ResourceManager: TCMResourceManager
    Top = 176
  end
end
