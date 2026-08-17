inherited frmPrincipal: TfrmPrincipal
  Left = 352
  Top = 290
  Caption = 'FCRT - Simulador BrTPREV'
  ClientHeight = 380
  ClientWidth = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 562
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 360
    Width = 562
  end
  inherited mnu: TMainMenu
    inherited mnuSistema: TMenuItem
      inherited mnuUtilitario: TMenuItem
        object mnuAcertaReserva: TMenuItem [0]
          Caption = 'Acerta Reserva Migração BRTPREV'
          OnClick = mnuAcertaReservaClick
        end
        object N5: TMenuItem [1]
          Caption = '-'
        end
        object mnuAuxiliar: TMenuItem
          Caption = 'Auxiliar'
          OnClick = mnuAuxiliarClick
        end
      end
    end
    object mnuProcessos: TMenuItem [1]
      Caption = 'Processos'
      object mnuExportaDados: TMenuItem
        Caption = 
          'Exportar Arquivos para Simulador - Independente de Dados do Lega' +
          'do'
        OnClick = mnuExportaDadosClick
      end
      object mnuImportaDados: TMenuItem
        Caption = 'Importar Arquivos para Simulador'
        OnClick = mnuImportaDadosClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuProcAcertoManual: TMenuItem
        Caption = 'Acerto Manual da Base de Simulação'
        OnClick = mnuProcAcertoManualClick
      end
      object mnuProcAcertaPeculio: TMenuItem
        Caption = 'Acerto do Valor do Peculio Saldado'
        Visible = False
        OnClick = mnuProcAcertaPeculioClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuProcExcluiMigracao: TMenuItem
        Caption = 'Exclusão de Confirmação de Migração'
        OnClick = mnuProcExcluiMigracaoClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuProcEfetivaMigracao: TMenuItem
        Caption = '&Efetivação de Migração de Plano'
        OnClick = mnuProcEfetivaMigracaoClick
      end
    end
    object mnuSimulacao: TMenuItem [2]
      Caption = 'Simulações'
      object mnuSimulacaoSub: TMenuItem
        Caption = 'Simulação de Transferência de Plano'
        OnClick = mnuSimulacaoSubClick
      end
      object N1: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnuSimulacaoSub2Periodo: TMenuItem
        Caption = 'Simulação de Transferência de Plano - 2o Período'
        Visible = False
        OnClick = mnuSimulacaoSub2PeriodoClick
      end
    end
    inherited mnuConsulta: TMenuItem
      object N6: TMenuItem
        Caption = '-'
      end
      object DemonstrativodeClculodoSRBeINSS1: TMenuItem
        Caption = 'Demonstrativo de Cálculo do SRB e INSS'
        OnClick = DemonstrativodeClculodoSRBeINSS1Click
      end
      object mnuRelExtratoMovReserva: TMenuItem
        Caption = 'Extrato de Reservas (Mensal, Trimestral, Consolidado)'
        OnClick = mnuRelExtratoMovReservaClick
      end
    end
  end
end
