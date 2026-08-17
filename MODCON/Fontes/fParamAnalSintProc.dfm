inherited frmParamAnalSintProc: TfrmParamAnalSintProc
  BorderStyle = bsToolWindow
  Caption = 'Relatório de Análise Sintética dos Processos'
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PageControl1: TPageControl
      inherited tbshGeral: TTabSheet
        inherited rgSitProc: TRadioGroup
          Left = 9
          Top = 51
        end
        inherited gbxNumPr: TGroupBox
          Left = 324
          Top = 99
          Visible = False
          inherited Label2: TLabel
            Width = 6
          end
        end
        inherited gbxTipEncer: TGroupBox
          Left = 9
          Top = 101
        end
        inherited gbxSalario: TGroupBox
          Left = 324
          Top = 101
          inherited Label4: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaInc: TGroupBox
          inherited Label15: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaAju: TGroupBox
          Left = 9
          Top = 157
          inherited Label1: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaData: TGroupBox
          Left = 9
          Top = 199
          inherited Label3: TLabel
            Width = 6
          end
        end
        inherited gbxDataEnc: TGroupBox
          Left = 9
          Top = 240
          inherited Label5: TLabel
            Width = 6
          end
        end
        inherited gbxTempAdm: TGroupBox
          Left = 9
          Top = 280
          inherited Label14: TLabel
            Width = 6
          end
        end
        inherited rgTipoProc: TRadioGroup
          Left = 256
          Top = 157
        end
        inherited gbxTipoProc: TGroupBox
          Left = 256
          Top = 190
        end
        inherited rgTipoAcao: TRadioGroup
          Left = 430
          Top = 157
        end
        inherited gbxTipoAcao: TGroupBox
          Left = 430
          Top = 190
          TabOrder = 14
        end
        object gbxTituloRelat: TGroupBox
          Left = 9
          Top = 1
          Width = 591
          Height = 43
          Caption = 'Título do Relatório'
          TabOrder = 12
          object edTituloRelat: TEdit
            Left = 8
            Top = 14
            Width = 574
            Height = 21
            TabOrder = 0
            Text = 'Análise Sintética de Processos'
          end
        end
        object grpMesRef: TGroupBox
          Left = 324
          Top = 51
          Width = 276
          Height = 43
          Caption = ' Mês e Ano de Referência '
          TabOrder = 13
          object cmbMes: TComboBox
            Left = 20
            Top = 14
            Width = 136
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = cmbMesChange
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object spedAno: TSpinEdit
            Left = 176
            Top = 14
            Width = 81
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
            OnChange = cmbMesChange
          end
        end
      end
      inherited tbshReclamante: TTabSheet
        inherited PageControl2: TPageControl
          inherited tsDadosFunc: TTabSheet
            inherited GroupBox1: TGroupBox
              inherited Label6: TLabel
                Width = 6
              end
            end
            inherited GroupBox2: TGroupBox
              inherited Label7: TLabel
                Width = 6
              end
            end
            inherited gbxTempLot: TGroupBox
              inherited Label8: TLabel
                Width = 6
              end
            end
            inherited gbxTempCar: TGroupBox
              inherited Label9: TLabel
                Width = 6
              end
            end
          end
          inherited tsDadosPess: TTabSheet
            inherited gbxIdade: TGroupBox
              inherited Label10: TLabel
                Width = 6
              end
            end
            inherited gbxCep: TGroupBox
              inherited Label11: TLabel
                Width = 6
              end
            end
            inherited GroupBox3: TGroupBox
              inherited Label40: TLabel
                Width = 24
              end
              inherited Label41: TLabel
                Width = 38
              end
              inherited Label42: TLabel
                Width = 41
              end
            end
          end
          inherited tbsDemit: TTabSheet
            inherited gbxDemitidos: TGroupBox
              inherited Label12: TLabel
                Width = 14
              end
              inherited Label13: TLabel
                Width = 7
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 453
      DockPos = 461
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 286
      DockPos = 294
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
    Left = 579
    Top = 355
  end
  inherited ds: TwwDataSource
    Left = 47
    Top = 348
  end
  inherited qryAdvog1: TwwQuery
    Left = 305
    Top = 364
  end
  inherited qryTRT: TwwQuery
    Left = 585
    Top = 192
  end
  inherited qryProcesso: TwwQuery
    Left = 83
  end
  inherited qryAdvog2: TwwQuery
    Left = 611
    Top = 128
  end
  inherited qryAT: TwwQuery
    Left = 611
    Top = 115
  end
  inherited qryTipoProc: TwwQuery
    Left = 611
    Top = 103
  end
  inherited qryObjeto: TwwQuery
    Left = 582
    Top = 240
  end
  inherited qryEtapa: TwwQuery
    Left = 611
    Top = 89
  end
  inherited qrySentenca: TwwQuery
    Left = 8
    Top = 338
  end
  inherited qryMotivo: TwwQuery
    Left = 611
    Top = 77
  end
  inherited qryGrauInstr: TwwQuery
    Left = 611
    Top = 65
  end
  inherited tblCargo: TwwQuery
    Left = 611
    Top = 52
  end
  inherited tblProfis: TwwQuery
    Left = 611
    Top = 40
  end
  inherited qryRamo: TwwQuery
    Left = 222
  end
  inherited tblEstab: TwwQuery
    Left = 156
    Top = 355
  end
  inherited tblLotacao: TwwQuery
    Left = 179
    Top = 339
  end
  inherited tblSindic: TwwQuery
    Left = 588
    Top = 295
  end
  inherited qryTipoAcao: TwwQuery
    Left = 611
    Top = 27
  end
  inherited qryAdvCasa: TwwQuery
    Left = 260
    Top = 345
  end
  inherited qryEstab: TwwQuery
    Left = 116
    Top = 347
  end
  inherited qryUF: TwwQuery
    Top = 368
  end
end
