inherited frmPrincipal: TfrmPrincipal
  Left = 141
  Top = 159
  Caption = 'Refer'
  ClientHeight = 516
  ClientWidth = 792
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 792
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 496
    Width = 792
  end
  inherited mnu: TMainMenu
    object mnuModulo: TMenuItem [2]
      Caption = '&Módulos'
      object mnuAssistencial: TMenuItem
        Caption = 'Assistencial'
        object mnuRecebimento_Assistencial: TMenuItem
          Caption = 'Recebimento Assistencial'
          OnClick = mnuRecebimento_AssistencialClick
        end
      end
      object mnuFolhaBenef: TMenuItem
        Caption = 'Folha de Benefícios'
        object mnuContraChequeTrimestral: TMenuItem
          Caption = 'Contra Cheque Trimestral'
          OnClick = mnuContraChequeTrimestralClick
        end
      end
    end
    object mnuProcessamentos: TMenuItem [4]
      Caption = 'Processamentos'
      object mnuGeraArquivoSipcCap: TMenuItem
        Caption = 'Gera arquivo SIPC - CAP'
        OnClick = mnuGeraArquivoSipcCapClick
      end
    end
  end
end
