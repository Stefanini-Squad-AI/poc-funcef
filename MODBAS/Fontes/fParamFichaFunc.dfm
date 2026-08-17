inherited frmParamFichaFunc: TfrmParamFichaFunc
  Left = 133
  Top = 144
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Seleção das Pessoas para Ficha Funcional'
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited PageControl1: TPageControl
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            Caption = 'Tipo de Contrato'
            inherited cbxCandidatos: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited gbxSalario: TGroupBox
            inherited Label4: TLabel
              Width = 6
            end
          end
          inherited gbxTempAdm: TGroupBox
            inherited Label1: TLabel
              Width = 6
            end
          end
          inherited gbxTempLot: TGroupBox
            inherited Label2: TLabel
              Width = 6
            end
          end
          inherited gbxTempCar: TGroupBox
            inherited Label3: TLabel
              Width = 6
            end
          end
          inherited gbxAdmissao: TGroupBox
            inherited Label7: TLabel
              Width = 14
            end
            inherited Label8: TLabel
              Width = 7
            end
          end
        end
        inherited tsDadosPess: TTabSheet
          inherited gbxIdade: TGroupBox
            inherited Label5: TLabel
              Width = 6
            end
            inherited ednIda1: TSpinEdit
              Height = 21
            end
            inherited ednIda2: TSpinEdit
              Height = 21
            end
          end
          inherited gbxCep: TGroupBox
            inherited Label6: TLabel
              Width = 6
            end
          end
          inherited GroupBox1: TGroupBox
            inherited Label42: TLabel
              Width = 41
            end
          end
        end
        inherited tbsDemit: TTabSheet
          inherited gbxDemitidos: TGroupBox
            inherited LabelDeData: TLabel
              Width = 14
            end
            inherited LabelAdata: TLabel
              Width = 7
            end
            inherited Label711: TLabel
              Width = 90
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 446
      DockPos = 454
      inherited sep1: TToolbarSep97
        Left = 162
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 82
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 200
      DockPos = 208
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
        Visible = False
      end
      inherited bbtnOutraVez: TBitBtn
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 162
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ds: TwwDataSource
    Top = 274
  end
  inherited tblCargo: TwwQuery
    Top = 277
  end
  inherited tblSindic: TwwQuery
    Top = 271
  end
  inherited tblProfis: TwwQuery
    Top = 276
  end
  inherited tblPessoal: TwwQuery
    Top = 278
  end
  inherited tblEstab: TwwQuery
    Top = 274
  end
  inherited tblLotacao: TwwQuery
    Top = 276
  end
  inherited qryGrauInstr: TwwQuery
    Top = 277
  end
  inherited qryRamo: TwwQuery
    Top = 273
  end
  inherited qryMotivo: TwwQuery
    Top = 277
  end
end
