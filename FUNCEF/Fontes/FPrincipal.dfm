inherited frmPrincipal: TfrmPrincipal
  Left = 285
  Top = 130
  HelpContext = 3360005
  Caption = 'Funcef'
  ClientHeight = 389
  ClientWidth = 807
  HelpFile = 'hugo.cm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 807
    inherited fcLabel2: TfcLabel
      OnDblClick = fcLabel2DblClick
    end
    inherited tb97Atalho: TToolbar97
      object ToolbarSep971: TToolbarSep97
        Left = 192
        Top = 0
        Blank = True
        SizeHorz = 8
      end
      object sbtnSeparadorFuncef: TToolbarButton97
        Left = 200
        Top = 0
        Width = 22
        Height = 22
        Hint = 'Separa os Arquivos da CAIXA no LayOut TotalPREV'
        Action = ActListaMens
        DisplayMode = dmGlyphOnly
        Caption = '&Separa Arquivos CAIXA'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        ImageIndex = 0
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 183
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 369
    Width = 807
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
        Style = psHint
        Tag = 0
        Text = '11/04/2001 22:50'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  object BitBtn1: TBitBtn [3]
    Left = 184
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Arq. Financ'
    TabOrder = 3
    Visible = False
    OnClick = BitBtn1Click
  end
  inherited mnu: TMainMenu
    inherited mnuSistema: TMenuItem
      inherited mnuUtilitario: TMenuItem
        inherited mnuEnviaMensagem: TMenuItem
          HelpContext = 3360029
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object Batimentodereservas1: TMenuItem
          Caption = '&Batimento de reservas'
          HelpContext = 3360027
          OnClick = Batimentodereservas1Click
        end
        object Batimentodevaloresdecontribuies1: TMenuItem
          Caption = 'B&atimento de valores de contribuições'
          HelpContext = 3360028
          OnClick = Batimentodevaloresdecontribuies1Click
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object IgualacontribuiesPatronaisCaixa1: TMenuItem
          Caption = 'Iguala contribuições Patronais Caixa'
          HelpContext = 3360030
          OnClick = IgualacontribuiesPatronaisCaixa1Click
        end
        object N7: TMenuItem
          Caption = '-'
        end
        object mnuValidaodoInforme1: TMenuItem
          Caption = 'Validação do Informe'
          OnClick = mnuValidaodoInforme1Click
        end
      end
    end
    object mnuModulos: TMenuItem [1]
      Caption = 'Módulos'
      HelpContext = 3360013
      object Emprstimo1: TMenuItem
        Caption = 'E&mpréstimo'
        object RecebimentodeArquivodeCrticadaCAIXA1: TMenuItem
          Caption = '&Recebimento de Arquivo de Crítica da CAIXA'
          HelpContext = 3360002
          OnClick = RecebimentodeArquivodeCrticadaCAIXA1Click
        end
      end
      object mnuIRRF: TMenuItem
        Caption = 'IRRF'
        HelpContext = 3360012
        object mnuGeraArqDarfJud: TMenuItem
          Caption = 'Geração de Arquivo de Darf Judicial'
          HelpContext = 3360011
          OnClick = mnuGeraArqDarfJudClick
        end
      end
    end
    object Processar1: TMenuItem [2]
      Caption = 'Processar'
      HelpContext = 3360025
      object ConversodeLayOutdeArquivosFinanaceirosdaCAIXAparaInterfacePREV1: TMenuItem
        Caption = 
          'Conversão de LayOut de Arquivos Financeiros da CAIXA para Interf' +
          'acePREV'
        HelpContext = 3360023
        OnClick = ConversodeLayOutdeArquivosFinanaceirosdaCAIXAparaInterfacePREV1Click
      end
      object mnuSeparadordeArquivosdaFuncef: TMenuItem
        Caption = 
          'Conversão de LayOut de Arquivos Cadastrais da CAIXA para Interfa' +
          'cePREV'
        HelpContext = 3360022
        OnClick = mnuSeparadordeArquivosdaFuncefClick
      end
      object mnuConversaodeLayOutdeMantenedora: TMenuItem
        Caption = 
          'Conversão de LayOut de Mantenedora para Conciliação com INSS (Re' +
          'embolso)'
        HelpContext = 3360024
        OnClick = mnuConversaodeLayOutdeMantenedoraClick
      end
    end
    object Importaes1: TMenuItem [3]
      Caption = 'Importações'
      HelpContext = 3360006
      object ImportaodeCotaesdeMoedas1: TMenuItem
        Caption = 'Importação de Cotações de Moedas'
        HelpContext = 3360007
        OnClick = ImportaodeCotaesdeMoedas1Click
      end
    end
    object IntegraoSIAFIxTotalPrev1: TMenuItem [4]
      Caption = 'Integração SIAFI x TotalPrev'
      HelpContext = 3360008
      object mnuLerArquivoSIAFI: TMenuItem
        Caption = 'Ler Arquivo SIAFI'
        HelpContext = 3360010
        OnClick = mnuLerArquivoSIAFIClick
      end
      object mnuGerarArquivoSIAFI: TMenuItem
        Caption = 'Gerar Arquivo SIAFI'
        HelpContext = 3360009
        OnClick = mnuGerarArquivoSIAFIClick
      end
    end
  end
end
