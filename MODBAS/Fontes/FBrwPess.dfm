inherited frmBrwPess: TfrmBrwPess
  Left = 113
  Top = 126
  Caption = 'Visão Geral do Cadastro de Pessoal'
  Constraints.MinHeight = 392
  Constraints.MinWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      BevelInner = bvRaised
      BevelOuter = bvNone
      inherited PageControl1: TPageControl [0]
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            inherited cbxCandidatos: TCheckBox
              Enabled = False
            end
          end
          inherited rgSequencia: TGroupBox [2]
          end
          inherited gbxTempAdm: TGroupBox [3]
          end
          inherited gbxTempLot: TGroupBox [4]
          end
          inherited gbxSalario: TGroupBox [5]
          end
          inherited gbxTipoSal: TGroupBox [6]
          end
          inherited gbxTempCar: TGroupBox [7]
          end
        end
        inherited tsDadosPess: TTabSheet
          inherited gbxCep: TGroupBox [2]
          end
          inherited gbxAniv: TGroupBox [3]
          end
          inherited gbxGrauInstr: TGroupBox [4]
          end
          inherited gbxProfis: TGroupBox [5]
          end
        end
        inherited tsDadosOutros: TTabSheet
          inherited rgSelCargo: TRadioGroup [1]
          end
          inherited gbxEstab: TGroupBox [3]
          end
          inherited gbxCargo: TGroupBox [4]
          end
          inherited gbxLotacao: TGroupBox [5]
          end
          inherited gbxSindi: TGroupBox [6]
          end
        end
      end
      inherited pnResult: TPanel [1]
        BevelOuter = bvNone
        object dbgrPessoal: TwwDBGrid
          Left = 0
          Top = 0
          Width = 604
          Height = 316
          Selected.Strings = (
            'MATRICULA'#9'13'#9'Matrícula'
            'IDPESSOA'#9'10'#9'Id.Pessoa'
            'NOME'#9'60'#9'Nome'
            'NUMDOCUMENTO'#9'18'#9'CPF'
            'SEXO'#9'1'#9'Sexo'
            'DATANASC'#9'10'#9'Data Nasc.'
            'ESTCIVIL'#9'1'#9'Est.Civil')
          IniAttributes.Delimiter = ';;'
          TitleColor = clGray
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icYellow
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 444
      DockPos = 452
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 197
      DockPos = 205
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
    Top = 243
  end
  inherited ds: TwwDataSource
    Top = 250
  end
  inherited tblCargo: TwwQuery
    Top = 253
  end
  inherited tblSindic: TwwQuery
    Top = 247
  end
  inherited tblProfis: TwwQuery
    Top = 252
  end
  inherited tblPessoal: TwwQuery
    Top = 254
  end
  inherited tblEstab: TwwQuery
    Top = 250
  end
  inherited tblLotacao: TwwQuery
    Top = 252
  end
  inherited qryGrauInstr: TwwQuery
    Top = 253
  end
  inherited qryRamo: TwwQuery
    Top = 249
  end
  inherited qryMotivo: TwwQuery
    Top = 253
  end
  inherited qryParamRH: TwwQuery
    Top = 205
  end
end
