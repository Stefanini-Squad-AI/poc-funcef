inherited frmPrincipal: TfrmPrincipal
  Left = 198
  Top = 91
  Caption = 'TotalPREV - Importações e Exportações de Arquivos '
  ClientHeight = 331
  ClientWidth = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 562
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 311
    Width = 562
  end
  inherited mnu: TMainMenu
    object mnuExportarSimulador: TMenuItem [1]
      Caption = 'Exportações/Importações'
      object mnuExportar: TMenuItem
        Caption = 'Exportar Arquivos para Simulador'
        Visible = False
        OnClick = mnuExportarClick
      end
      object mnuExportarNOVO: TMenuItem
        Caption = 
          'Exportar Arquivos para Simulador - Independente de Dados do Lega' +
          'do'
        Visible = False
        OnClick = mnuExportarNOVOClick
      end
      object mnuImportarSimulador: TMenuItem
        Caption = 'Importar Arquivos para Simulador'
        Visible = False
        OnClick = mnuImportarSimuladorClick
      end
      object N2: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnuExportarAtuarial: TMenuItem
        Caption = 'Exportar Arquivos para Avaliação Atuarial'
        OnClick = mnuExportarAtuarialClick
      end
      object mnuExportarAtuarialNOVA: TMenuItem
        Caption = 
          'Exportar Arquivos para Avaliação Atuarial - Independente do Simu' +
          'lador'
        OnClick = mnuExportarAtuarialNOVAClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuGeraINSSHistRubrica: TMenuItem
        Caption = 'Gerar INSS no Histórico de Rubricas'
        OnClick = mnuGeraINSSHistRubricaClick
      end
    end
  end
end
