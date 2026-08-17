inherited frmPrincipal: TfrmPrincipal
  Left = 315
  Top = 68
  Caption = 'Controle de Ponto e Acesso'
  ClientHeight = 304
  ClientWidth = 595
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 595
    object sbtnTeclado: TToolbarButton97 [1]
      Left = 264
      Top = 2
      Width = 37
      Height = 22
      Hint = 'Alterna Entrada para Teclado'
      DisplayMode = dmGlyphOnly
      Glyph.Data = {
        36020000424D360200000000000076000000280000001D0000001C0000000100
        040000000000C001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000000
        0000000000000000F000888888888888888888888888888800008F8000000000
        000000000000000800008F8777707707777777707707770800008F8FFF70F70F
        FFFFFF70F70FF70800008F8000000000000000000000000800008F8770770770
        770770770777770800008F8FF0F70F70F70F70F70FFFF70800008F8000000000
        000000000000000800008F8777707707707707707707770800008F8FFF70F70F
        70F70F70F70F770800008F8000000000000000000000000800008F8770770770
        770770770770770800008F8F70F70F70F70F70F70F70F70800008F8888888888
        888888888888888800008FFFFFFFFFFFFFFFFFFFFFFFFFF80000F88888888888
        8888888888888888F000FF8FFFFFFFFFFFFFFFFFFFFFFFFFF000FF8FFFFFFFFF
        FFFFFFFFFFFFFFFFF000FFF80F00F00F00F00F0008FFFFFFF000FFFFF80F80F8
        0F80F80FFF8FFFFFF000FFFFFFFFFFFFFFFFFFFFFF8FFFFFF000FFFFFFFFFFFF
        FFFFFFFFFF0FFFFFF000FFFFFFFFFFFFFFFFFFF800FFFFFFF000FFFFFFFFFFFF
        FFFF000FFFFFFFFFF000FFFFFFFFFFFFFFF8B30FFFFFFFFFF000FFFFFFFFFFFF
        FFFF8B0FFFFFFFFFF000FFFFFFFFFFFFFFFFF8FFFFFFFFFFF000}
      ImageIndex = 13
      Opaque = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sbtnTecladoClick
    end
    object sbtnTecladoMatric: TToolbarButton97 [2]
      Left = 314
      Top = 2
      Width = 95
      Height = 22
      Hint = 'Alterna Entrada para Teclado com Matrícula'
      Caption = 'Matrícula'
      Glyph.Data = {
        36020000424D360200000000000076000000280000001D0000001C0000000100
        040000000000C001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000000
        0000000000000000F000888888888888888888888888888800008F8000000000
        000000000000000800008F8777707707777777707707770800008F8FFF70F70F
        FFFFFF70F70FF70800008F8000000000000000000000000800008F8770770770
        770770770777770800008F8FF0F70F70F70F70F70FFFF70800008F8000000000
        000000000000000800008F8777707707707707707707770800008F8FFF70F70F
        70F70F70F70F770800008F8000000000000000000000000800008F8770770770
        770770770770770800008F8F70F70F70F70F70F70F70F70800008F8888888888
        888888888888888800008FFFFFFFFFFFFFFFFFFFFFFFFFF80000F88888888888
        8888888888888888F000FF8FFFFFFFFFFFFFFFFFFFFFFFFFF000FF8FFFFFFFFF
        FFFFFFFFFFFFFFFFF000FFF80F00F00F00F00F0008FFFFFFF000FFFFF80F80F8
        0F80F80FFF8FFFFFF000FFFFFFFFFFFFFFFFFFFFFF8FFFFFF000FFFFFFFFFFFF
        FFFFFFFFFF0FFFFFF000FFFFFFFFFFFFFFFFFFF800FFFFFFF000FFFFFFFFFFFF
        FFFF000FFFFFFFFFF000FFFFFFFFFFFFFFF8B30FFFFFFFFFF000FFFFFFFFFFFF
        FFFF8B0FFFFFFFFFF000FFFFFFFFFFFFFFFFF8FFFFFFFFFFF000}
      ImageIndex = 13
      Opaque = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sbtnTecladoMatricClick
    end
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 284
    Width = 595
  end
  object VeSalario: TPanel [3]
    Left = 471
    Top = 33
    Width = 94
    Height = 22
    Caption = 'VeSalario'
    TabOrder = 3
    Visible = False
  end
  object UsuarioRH: TPanel [4]
    Left = 375
    Top = 34
    Width = 94
    Height = 22
    Caption = 'UsuarioRH'
    TabOrder = 4
    Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 162
    Top = 231
  end
  inherited mnu: TMainMenu
    Left = 32
    Top = 125
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N3: TMenuItem
          Caption = '-'
        end
        object mnuVisualizarArquivosLog: TMenuItem
          Caption = '&Visualizar / Enviar Arquivos de Log'
          OnClick = mnuVisualizarArquivosLogClick
        end
        object N4: TMenuItem
          Caption = '-'
        end
        object mnuGravaCartao: TMenuItem
          Caption = '&Gravação de Cartões'
          OnClick = mnuGravaCartaoClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      object mnuCadEstacao: TMenuItem
        Caption = '&Estação'
        OnClick = mnuCadEstacaoClick
      end
      object mnuCadLocalizacao: TMenuItem
        Caption = '&Localização'
        OnClick = mnuCadLocalizacaoClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = 'Transações'
      object mnuRegAcesso: TMenuItem
        Caption = '&Registro de Acesso'
        ShortCut = 16466
        OnClick = mnuRegAcessoClick
      end
      object mnuQuantidadePermitida: TMenuItem
        Caption = '&Quantidade Permitida de Acessos'
        OnClick = mnuQuantidadePermitidaClick
      end
      object mnuRegistrodeQuemMarcaPonto: TMenuItem
        Caption = 'Registro de &Quem Marca Ponto'
        OnClick = mnuRegistrodeQuemMarcaPontoClick
      end
      object RegistroIndividualdeAcesso1: TMenuItem
        Caption = '&Registro Individual de Acesso'
        OnClick = RegistroIndividualdeAcesso1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuControlePonto: TMenuItem
        Caption = 'Controle Individual do &Ponto'
        ShortCut = 16464
        OnClick = mnuControlePontoClick
      end
      object mnuLancaHoraPonto: TMenuItem
        Caption = '&Lançamento Coletivo do Ponto'
        ShortCut = 16460
        OnClick = mnuLancaHoraPontoClick
      end
      object mnuLancamentosBancoHoras: TMenuItem
        Caption = 'Lançamentos no Banco de &Horas'
        OnClick = mnuLancamentosBancoHorasClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuRegRevesamentoHorarios: TMenuItem
        Caption = 'Revesamento de Horários de &Trabalho'
        OnClick = mnuRegRevesamentoHorariosClick
      end
    end
    inherited mnuConsulta: TMenuItem [3]
    end
    inherited mnuRAD: TMenuItem [4]
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 352
    Top = 232
  end
  inherited ImlPadrao: TImageList
    Left = 34
    Top = 176
  end
  inherited AclPadrao: TActionList
    Left = 34
    Top = 224
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 96
    Top = 224
  end
  inherited Skt: TSocketConnection
    Left = 96
    Top = 32
  end
  inherited Dcom: TDCOMConnection
    Left = 96
    Top = 80
  end
  inherited Web: TWebConnection
    Left = 96
    Top = 125
  end
  inherited CorreioCM: TCorreioCM
    Left = 96
    Top = 176
  end
  inherited ResourceManager: TCMResourceManager
    Left = 32
    Top = 40
  end
end
