inherited frmPrincipal: TfrmPrincipal
  Left = 235
  Top = 280
  Caption = 'Agendamento de Atendimentos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    inherited fcLabel2: TfcLabel
      OnClick = fcLabel2Click
    end
  end
  inherited mnu: TMainMenu
    inherited mnuCadastro: TMenuItem
      object mnuAssuntoAgendamento: TMenuItem
        Caption = 'Assunto para Agendamento'
        OnClick = mnuAssuntoAgendamentoClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuAtendente: TMenuItem
        Caption = 'Atendente'
        OnClick = mnuAtendenteClick
      end
      object mnuGrupoAtendentes: TMenuItem
        Caption = 'Grupo de Atendentes'
        OnClick = mnuGrupoAtendentesClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuPeriodoAgendamento: TMenuItem
        Caption = 'Período de Agendamento'
        OnClick = mnuPeriodoAgendamentoClick
      end
      object mnuAusenciaAtendente: TMenuItem
        Caption = 'Ausência de Atendente'
        OnClick = mnuAusenciaAtendenteClick
      end
    end
    object mnuAgenda: TMenuItem [3]
      Caption = 'Agenda'
      object mnuAgendamento: TMenuItem
        Caption = '&Agendamento'
        OnClick = mnuAgendamentoClick
      end
      object mnuCalendario: TMenuItem
        Caption = '&Calendário'
        OnClick = mnuCalendarioClick
      end
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
  end
end
