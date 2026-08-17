inherited frmParamCartaComunAux: TfrmParamCartaComunAux
  Left = 92
  Top = 137
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Seleção para Envio de Carta ou Comunicado'
  ClientHeight = 363
  ClientWidth = 609
  Font.Style = []
  FormStyle = fsNormal
  Scaled = False
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 609
    Height = 324
    inherited pnSelecao: TPanel
      Width = 601
      Height = 316
      inherited pnResult: TPanel
        Width = 599
        Height = 314
      end
      inherited PageControl1: TPageControl
        Width = 599
        Height = 314
        inherited tsDadosFunc: TTabSheet
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
          end
          inherited gbxCep: TGroupBox
            inherited Label6: TLabel
              Width = 6
            end
          end
          inherited gbxAniv: TGroupBox
            inherited cbxAniv: TComboBox
              Left = 19
              Width = 102
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
            Width = 591
            Height = 286
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
    Top = 324
    Width = 609
    inherited tb97Fundo: TToolbar97
      Left = 440
      DockPos = 448
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 193
      DockPos = 201
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnOutraVez: TBitBtn
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 563
    Top = 275
  end
  inherited ds: TwwDataSource
    Left = 16
    Top = 290
  end
  inherited tblCargo: TwwQuery
    Left = 331
    Top = 274
  end
  inherited tblSindic: TwwQuery
    Left = 377
    Top = 274
  end
  inherited tblProfis: TwwQuery
    Left = 421
    Top = 274
  end
  inherited tblPessoal: TwwQuery
    Left = 16
    Top = 274
  end
  inherited tblEstab: TwwQuery
    Left = 66
    Top = 274
  end
  inherited tblLotacao: TwwQuery
    Left = 114
    Top = 274
  end
  inherited qryGrauInstr: TwwQuery
    Left = 223
    Top = 274
  end
  inherited qryRamo: TwwQuery
    Left = 166
    Top = 274
  end
  inherited qryMotivo: TwwQuery
    Left = 281
    Top = 274
  end
end
