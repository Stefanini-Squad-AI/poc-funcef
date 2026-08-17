inherited frmSelRelProc2: TfrmSelRelProc2
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Seleção para o Relatório de Processos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PageControl1: TPageControl
      inherited tbshReclamante: TTabSheet
        inherited PageControl2: TPageControl
          inherited tsDadosFunc: TTabSheet
            inherited gbxSituacao: TGroupBox
              inherited cbxDemitidos: TCheckBox
                OnClick = nil
              end
            end
            inherited gbxTempLot: TGroupBox
              inherited ednLot1: TSpinEdit
                OnChange = nil
              end
              inherited ednLot2: TSpinEdit
                OnChange = nil
              end
            end
            inherited gbxTempCar: TGroupBox
              inherited ednCar1: TSpinEdit
                OnChange = nil
              end
              inherited ednCar2: TSpinEdit
                OnChange = nil
              end
            end
          end
          inherited tsDadosPess: TTabSheet
            inherited gbxIdade: TGroupBox
              inherited ednIda1: TSpinEdit
                OnChange = nil
              end
              inherited ednIda2: TSpinEdit
                OnChange = nil
              end
            end
            inherited gbxProfis: TGroupBox
              inherited dblcProfis: TwwDBLookupCombo
                OnCloseUp = nil
              end
            end
            inherited gbxGrauInstr: TGroupBox
              inherited dblcGrauInstr: TwwDBLookupCombo
                OnCloseUp = nil
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 123
    Top = 187
  end
end
