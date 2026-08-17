inherited frmParamInconsistSal: TfrmParamInconsistSal
  Top = 125
  BorderStyle = bsSizeToolWin
  Caption = 'Listagem de Inconsistências Salariais'
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
            inherited cbxEfetivos: TCheckBox
              Width = 58
            end
            inherited cbxTemporarios: TCheckBox
              Width = 80
            end
            inherited cbxEstagiarios: TCheckBox
              Width = 72
            end
            inherited cbxCandidatos: TCheckBox
              Width = 74
              Visible = False
            end
            inherited cbxTerceiros: TCheckBox
              Width = 65
            end
            inherited cbxAutonomos: TCheckBox
              Width = 74
            end
            inherited cbxProprietarios: TCheckBox
              Width = 104
            end
            inherited cbxEspeciais: TCheckBox
              Width = 106
            end
          end
          inherited gbxSituacao: TGroupBox
            inherited cbxDemitidos: TCheckBox
              Visible = False
            end
          end
          inherited gbxTipoSal: TGroupBox
            Top = 190
            TabOrder = 9
          end
          inherited gbxSalario: TGroupBox
            Top = 190
            inherited Label4: TLabel
              Width = 6
            end
          end
          inherited gbxTempAdm: TGroupBox
            Top = 143
            inherited Label1: TLabel
              Width = 6
            end
          end
          inherited gbxTempLot: TGroupBox
            Top = 143
            inherited Label2: TLabel
              Width = 6
            end
          end
          inherited gbxTempCar: TGroupBox
            Top = 143
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
          object gbxTipoPapel: TGroupBox
            Left = 216
            Top = 237
            Width = 352
            Height = 44
            Caption = 'Tipo de Papel'
            TabOrder = 8
            object cmbTipoPapel: TComboBox
              Left = 8
              Top = 14
              Width = 336
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
            end
          end
          object gbxFatoresHay: TGroupBox
            Left = 31
            Top = 237
            Width = 165
            Height = 43
            Caption = 'Fatores Hay (Min / Max)'
            TabOrder = 10
            object redHayMin: TRealEdit
              Left = 13
              Top = 15
              Width = 50
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object redHayMax: TRealEdit
              Left = 101
              Top = 15
              Width = 50
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
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
      Left = 443
      DockPos = 455
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 194
      DockPos = 206
      inherited bbtnOutraVez: TBitBtn
        Enabled = False
        ModalResult = 0
        Kind = bkCustom
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited qryParamRH: TwwQuery
    Left = 77
    Top = 320
  end
  object qryInconsistSalAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 334
    Top = 89
  end
end
