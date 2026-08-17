inherited frmParamFormAvalBranco: TfrmParamFormAvalBranco
  Left = 94
  Top = 129
  BorderStyle = bsSizeToolWin
  Caption = 'Formulário de Avaliação em Branco'
  Font.Style = []
  FormStyle = fsNormal
  Scaled = False
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited PageControl1: TPageControl
        ActivePage = tbshRelat
        object tbshRelat: TTabSheet [0]
          Caption = 'Relatório'
          object lblNomeEmp: TLabel
            Left = 237
            Top = 32
            Width = 54
            Height = 13
            Caption = 'Empregado'
            Visible = False
          end
          object lblTipoAval: TLabel
            Left = 237
            Top = 77
            Width = 86
            Height = 13
            Caption = 'Tipo de Avaliação'
          end
          object dblckNome: TwwDBLookupCombo
            Left = 237
            Top = 48
            Width = 332
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Nome'#9'F'
              'MATRICULA'#9'13'#9'Matrícula'#9'F')
            LookupTable = qryPessoal
            LookupField = 'NOME'
            Options = [loColLines, loTitles]
            TabOrder = 2
            Visible = False
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dblckTipAval: TwwDBLookupCombo
            Left = 237
            Top = 94
            Width = 332
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRTIPOAVAL'#9'30'#9'DESCRTIPOAVAL')
            LookupTable = qryTipAval
            LookupField = 'DESCRTIPOAVAL'
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = False
          end
          object gbxOrdem: TGroupBox
            Left = 237
            Top = 179
            Width = 332
            Height = 47
            Caption = 'Ordem de Impressão dos Fatores de Avaliação'
            TabOrder = 5
            object cmbOrderBy: TComboBox
              Left = 8
              Top = 16
              Width = 316
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Código do Fator de Avaliação'
                'Descrição do Fator de Avaliação')
            end
          end
          object rgSelecao: TRadioGroup
            Left = 26
            Top = 32
            Width = 175
            Height = 80
            Caption = 'Emitir Para'
            ItemIndex = 1
            Items.Strings = (
              'Uma só Pessoa'
              'Pessoas a Selecionar')
            TabOrder = 0
            OnClick = rgSelecaoClick
          end
          object gbxTipoPapel: TGroupBox
            Left = 237
            Top = 122
            Width = 332
            Height = 46
            Caption = 'Tipo de Papel'
            TabOrder = 4
            object cmbTipoPapel: TComboBox
              Left = 8
              Top = 16
              Width = 316
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
            end
          end
          object rgObserv: TRadioGroup
            Left = 26
            Top = 146
            Width = 175
            Height = 80
            Caption = 'Com Observações dos Fatores'
            ItemIndex = 1
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 1
          end
        end
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            inherited cbxCandidatos: TCheckBox
              Visible = False
            end
          end
          inherited rgSequencia: TGroupBox [2]
            inherited cmbSequencia: TComboBox
              Items.Strings = (
                'Nome'
                'Matrícula'
                'Cargo,Nome'
                'Cargo,Matrícula'
                'Centro de Custo,Nome'
                'Centro de Custo,Matrícula'
                'Lotação,Nome'
                'Lotação,Matrícula'
                'C.Custo,Cargo,Nome'
                'C.Custo,Cargo,Matrícula'
                'Lotação,Cargo,Nome'
                'Lotação,Cargo,Matrícula')
            end
          end
          inherited gbxTempAdm: TGroupBox [3]
            Top = 145
            inherited Label1: TLabel
              Width = 6
            end
          end
          inherited gbxTempLot: TGroupBox [4]
            Top = 145
            inherited Label2: TLabel
              Width = 6
            end
          end
          inherited gbxSalario: TGroupBox [5]
            Top = 194
            inherited Label4: TLabel
              Width = 6
            end
          end
          inherited gbxTipoSal: TGroupBox [6]
            Top = 194
          end
          inherited gbxTempCar: TGroupBox [7]
            Top = 145
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
          inherited gbxCep: TGroupBox [2]
            inherited Label6: TLabel
              Width = 6
            end
          end
          inherited gbxAniv: TGroupBox [3]
          end
          inherited gbxGrauInstr: TGroupBox [4]
          end
          inherited gbxProfis: TGroupBox [5]
          end
          inherited GroupBox1: TGroupBox
            inherited Label42: TLabel
              Width = 41
            end
          end
        end
        inherited tsDadosOutros: TTabSheet
          inherited rgSelCargo: TRadioGroup [1]
          end
          inherited gbxLotacao: TGroupBox [2]
          end
          inherited rgSelSindi: TRadioGroup [3]
          end
          inherited gbxEstab: TGroupBox [4]
          end
          inherited gbxCargo: TGroupBox [5]
          end
          inherited rgSelRamo: TRadioGroup [6]
          end
          inherited gbxSindi: TGroupBox [7]
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
      DockPos = 453
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
      DockPos = 206
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
  inherited ivTradutor: TIvExtendedTranslator
    Top = 275
  end
  inherited ds: TwwDataSource
    Left = 55
    Top = 275
  end
  inherited tblCargo: TwwQuery
    Left = 509
    Top = 285
  end
  inherited tblSindic: TwwQuery
    Left = 460
    Top = 269
  end
  inherited tblProfis: TwwQuery
    Left = 420
    Top = 284
  end
  inherited tblPessoal: TwwQuery
    Left = 96
    Top = 287
  end
  inherited tblEstab: TwwQuery
    Left = 207
    Top = 284
  end
  inherited tblLotacao: TwwQuery
    Left = 153
    Top = 271
  end
  inherited qryGrauInstr: TwwQuery
    Left = 361
    Top = 270
  end
  inherited qryRamo: TwwQuery
    Left = 256
    Top = 271
  end
  inherited qryMotivo: TwwQuery
    Left = 307
    Top = 285
  end
  inherited qryParamRH: TwwQuery
    Left = 559
  end
  object qryTipAval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPOAVAL, DESCRTIPOAVAL'
      'FROM'
      '  TIPOAVAL'
      'WHERE'
      '  (FLGTIPOAVAL < 2)'
      'ORDER BY'
      '  UPPER(DESCRTIPOAVAL)')
    ValidateWithMask = True
    Left = 455
    Top = 41
  end
  object qryPessoal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select P.IDPESSOA, P.NOME, F.MATRICULA '
      'from PESSOA P, FUNCIONARIO F'
      'where F.IDPESSOA = P.IDPESSOA'
      'order by UPPER(NOME)')
    ValidateWithMask = True
    Left = 514
    Top = 41
  end
end
