inherited FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 105
  Caption = 'Sistema de Cotas de Investimentos'
  ClientHeight = 392
  ClientWidth = 784
  Scaled = False
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 784
    inherited tb97Atalho: TToolbar97
      inherited sbtnListaMensagens: TToolbarButton97
        Left = 171
      end
      inherited sbtnEnviaMensagens: TToolbarButton97
        Left = 193
      end
      inherited btnExecEtapa: TToolbarButton97
        Visible = False
      end
      object BtCalculadoraWindows: TToolbarButton97
        Left = 148
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Executa a Calculadora do Windows'
        Glyph.Data = {
          EE000000424DEE0000000000000076000000280000000F0000000F0000000100
          0400000000007800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDD0DDD000000000DDD0DD08888888880DD0DD0FF8F8F8F80DD0DD0F00000008
          0DD0DD0FF8F8F8F80DD0DD0F000000080DD0DD0FF8F8F8F80DD0DD0F00000008
          0DD0DD0FF8F8F8F80DD0DD0F000000080DD0DD0F000000080DD0DD0FFFFFFFF8
          0DD0DDD000000000DDD0DDDDDDDDDDDDDDD0}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = BtCalculadoraWindowsClick
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 385
    Top = 58
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 372
    Width = 784
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel0'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel1'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel2'
        Style = psDateTime
        Tag = 0
        Text = '12/02/2008 13:24'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 36
  end
  inherited mnu: TMainMenu
    Left = 176
    Top = 168
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        Visible = False
        object N26: TMenuItem
          Caption = '-'
        end
        object IndiceAtuarial1: TMenuItem
          Caption = 'Indice &Atuarial '
        end
        object N27: TMenuItem
          Caption = '-'
        end
        object CadastraFeriadoInvestimento1: TMenuItem
          Caption = 'Cadastra &Feriado Investimento'
        end
        object CadastraCotaespPerodo1: TMenuItem
          Caption = 'Cadastra Cotações p/ Período'
        end
        object CadastraCotaespPerodo2: TMenuItem
          Caption = 'Cadastra Cotações Indexadas'
        end
        object N30: TMenuItem
          Caption = '-'
        end
        object Utilitrio21: TMenuItem
          Caption = 'Acerto no Histórico'
        end
      end
      inherited mnuIdiomas: TMenuItem
        Visible = False
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      object MnuCarteira: TMenuItem
        Caption = '&Carteira'
        OnClick = MnuCarteiraClick
      end
      object MnuEventoCaixaCota: TMenuItem
        Caption = '&Evento Caixa / Cota'
        OnClick = MnuEventoCaixaCotaClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object MnuCarteiraXEvento: TMenuItem
        Caption = 'Carteira &X Evento'
        OnClick = MnuCarteiraXEventoClick
      end
    end
    object MnuOperacao: TMenuItem [2]
      Caption = 'Operação'
      object MnuLancamentoCaixa: TMenuItem
        Caption = 'Lançamento de &Caixa'
        OnClick = MnuLancamentoCaixaClick
      end
      object MnuLancamentoCota: TMenuItem
        Caption = 'Lançamento de C&ota'
        OnClick = MnuLancamentoCotaClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MnuLanctoDep: TMenuItem
        Caption = 'Lançamento de &Depósito'
        OnClick = MnuLanctoDepClick
      end
      object MnuLanctoRet: TMenuItem
        Caption = 'Lançamento de &Retirada'
        OnClick = MnuLanctoRetClick
      end
    end
    object mnuProcessos: TMenuItem [3]
      Caption = '&Processos'
      object MnuApuracaoCaixa: TMenuItem
        Caption = 'Apuração de &Caixa'
        OnClick = MnuApuracaoCaixaClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object MnuApuracaoCota: TMenuItem
        Caption = 'Apuração de C&ota'
        OnClick = MnuApuracaoCotaClick
      end
    end
    inherited Edit1: TMenuItem [4]
      Visible = False
    end
    inherited mnuConsulta: TMenuItem
      object MnuConsCadastros: TMenuItem [0]
        Caption = '&Cadastros'
        object MnuConsCartParam: TMenuItem
          Caption = 'Carteira - Parâmetros'
          OnClick = MnuConsCartParamClick
        end
        object MnuConsEvCaixaCota: TMenuItem
          Caption = 'Eventos de Caixa / Cota'
          OnClick = MnuConsEvCaixaCotaClick
        end
        object MnuConsCartXEvento: TMenuItem
          Caption = 'Carteira x Evento'
          OnClick = MnuConsCartXEventoClick
        end
        object TMenuItem
          Visible = False
        end
      end
      object MnuConsOperacoes: TMenuItem [1]
        Caption = 'O&perações'
        object MnuConsLancCaixa: TMenuItem
          Caption = 'Lancamentos do Caixa'
          OnClick = MnuConsLancCaixaClick
        end
        object MnuConsLancCota: TMenuItem
          Caption = 'Lancamentos da Cota'
          OnClick = MnuConsLancCotaClick
        end
        object MnuConsLancDepRet: TMenuItem
          Caption = 'Lançamento Depósito/Retirada'
          OnClick = MnuConsLancDepRetClick
        end
        object MnuConsEvolucaoPatr: TMenuItem
          Caption = 'Evolução Patrimonial'
          OnClick = MnuConsEvolucaoPatrClick
        end
      end
      object MnuApuracao: TMenuItem [2]
        Caption = 'Apuração'
        object MnuConsApuraCaixa: TMenuItem
          Caption = 'Caixa'
          OnClick = MnuConsApuraCaixaClick
        end
        object MnuConsApuraCota: TMenuItem
          Caption = 'Cotas'
          OnClick = MnuConsApuraCotaClick
        end
      end
      object N1: TMenuItem [3]
        Caption = '-'
        Hint = '_'
      end
      inherited Grficos2: TMenuItem
        Caption = 'Grá&ficos'
      end
      inherited MnuConsPart_Padrao: TMenuItem
        Caption = 'Par&ticipante'
      end
    end
    inherited mnuRAD: TMenuItem
      Visible = False
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 59
    Top = 36
  end
  inherited ImlPadrao: TImageList
    Left = 224
    Top = 248
  end
  inherited AclPadrao: TActionList
    Left = 224
    Top = 200
  end
  inherited AppPadrao: TCMApplicationEvents
    Left = 296
    Top = 248
  end
  inherited CorreioCM: TCorreioCM
    Left = 90
    Top = 36
  end
  object Timer: TTimer
    Enabled = False
    Interval = 10000
    Left = 192
    Top = 40
  end
  object QryParamImport: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 344
    Top = 295
  end
end
