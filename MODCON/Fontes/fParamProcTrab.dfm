inherited frmParamProcTrab: TfrmParamProcTrab
  Left = 151
  Top = 120
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Relação de Processos'
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PageControl1: TPageControl
      ActivePage = tbshRelatorio
      object tbshRelatorio: TTabSheet [0]
        Caption = 'Relatório'
        ImageIndex = 4
        object gbxTituloRelat: TGroupBox
          Left = 18
          Top = 9
          Width = 572
          Height = 43
          Caption = 'Título do Relatório'
          TabOrder = 0
          object edTituloRelat: TEdit
            Left = 8
            Top = 14
            Width = 555
            Height = 21
            TabOrder = 0
            Text = 'Relação de Processos'
          end
        end
        object rgTipoRel: TRadioGroup
          Left = 18
          Top = 55
          Width = 408
          Height = 66
          Caption = 'Tipo de Relatório'
          ItemIndex = 0
          Items.Strings = (
            'Geral'
            'Economia dos Processos Encerrados')
          TabOrder = 1
          OnClick = rgTipoRelClick
        end
        object gbxEncargos: TGroupBox
          Left = 265
          Top = 65
          Width = 109
          Height = 46
          Caption = '% Encargos'
          TabOrder = 2
          Visible = False
          object redEncargos: TRealEdit
            Left = 24
            Top = 15
            Width = 60
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 3
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object rgImprimeRateio: TRadioGroup
          Left = 430
          Top = 55
          Width = 160
          Height = 45
          Caption = 'Imprime Rateios?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 3
        end
        object rgImprimeLitis: TRadioGroup
          Left = 18
          Top = 124
          Width = 408
          Height = 34
          Caption = 'Imprime os Litisconsortes ou Testemunhas?'
          Columns = 3
          ItemIndex = 2
          Items.Strings = (
            'Com Situação'
            'Sem Situação'
            'Não')
          TabOrder = 4
        end
        object rgImprimeCargo: TRadioGroup
          Left = 18
          Top = 161
          Width = 202
          Height = 34
          Caption = 'Imprime Cargo do Reclamante?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 5
        end
        object rgImprimeResumo: TRadioGroup
          Left = 224
          Top = 161
          Width = 202
          Height = 34
          Caption = 'Imprime Resumo por Unidade?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 6
        end
        object rgImprimeCabRod: TRadioGroup
          Left = 430
          Top = 151
          Width = 160
          Height = 45
          Caption = 'Imprime Cabeçalho e Rodapé?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 7
        end
        object rgImprimeEtapa: TRadioGroup
          Left = 18
          Top = 198
          Width = 202
          Height = 76
          Caption = 'Imprime as Etapas'
          ItemIndex = 1
          Items.Strings = (
            'Todas'
            'Nenhuma'
            'Que Forem Selecionadas')
          TabOrder = 8
          OnClick = rgImprimeEtapaClick
        end
        object rgImprimeObservEtapa: TRadioGroup
          Left = 224
          Top = 198
          Width = 202
          Height = 37
          Caption = 'Com as Obs. das Etapas'
          Columns = 2
          Enabled = False
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 9
        end
        object rgExibeRelatRisco: TRadioGroup
          Left = 224
          Top = 237
          Width = 202
          Height = 37
          Caption = 'Exibe no Relatório o Risco'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Máximo'
            'Original')
          TabOrder = 10
        end
        object rgImprimeObj: TRadioGroup
          Left = 430
          Top = 198
          Width = 160
          Height = 119
          Caption = 'Imprime os Objetos'
          ItemIndex = 1
          Items.Strings = (
            'Todos'
            'Nenhum'
            'Que Forem Selecionados')
          TabOrder = 11
        end
        object gbxTipoPapel: TGroupBox
          Left = 18
          Top = 277
          Width = 408
          Height = 40
          Caption = 'Tipo de Papel'
          TabOrder = 12
          object cmbTipoPapel: TComboBox
            Left = 8
            Top = 13
            Width = 392
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object rgNumProc: TRadioGroup
          Left = 430
          Top = 103
          Width = 160
          Height = 45
          Caption = 'Número do Processo'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Interno'
            'Na Vara')
          TabOrder = 13
          OnClick = rgEtapaClick
        end
      end
      inherited tbshGeral: TTabSheet
        inherited gbxNumPr: TGroupBox
          inherited Label2: TLabel
            Width = 6
          end
        end
        inherited gbxSalario: TGroupBox
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
          inherited Label1: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaData: TGroupBox
          inherited Label3: TLabel
            Width = 6
          end
        end
        inherited gbxDataEnc: TGroupBox
          inherited Label5: TLabel
            Width = 6
          end
        end
        inherited gbxTempAdm: TGroupBox
          inherited Label14: TLabel
            Width = 6
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
    Left = 459
    Top = 331
  end
  inherited ds: TwwDataSource
    Left = 375
    Top = 356
  end
  inherited qryAdvog1: TwwQuery
    Left = 260
    Top = 360
  end
  inherited qryProcesso: TwwQuery
    Left = 411
    Top = 354
  end
  inherited qryAdvog2: TwwQuery
    Left = 601
  end
  inherited qryAT: TwwQuery
    Left = 533
    Top = 186
  end
  inherited qryTipoProc: TwwQuery
    Left = 157
    Top = 360
  end
  inherited qrySentenca: TwwQuery
    Left = 600
    Top = 66
  end
  inherited qryGrauInstr: TwwQuery
    Left = 605
    Top = 17
  end
  inherited tblCargo: TwwQuery
    Left = 591
  end
  inherited tblProfis: TwwQuery
    Left = 596
  end
  inherited qryRamo: TwwQuery
    Left = 209
    Top = 360
  end
  inherited tblEstab: TwwQuery
    Left = 51
    Top = 360
  end
  inherited tblLotacao: TwwQuery
    Left = 100
    Top = 360
  end
  inherited tblSindic: TwwQuery
    Left = 597
  end
  inherited qryTipoAcao: TwwQuery
    Left = 602
  end
  inherited qryAdvCasa: TwwQuery
    Left = 596
  end
  inherited qryEstab: TwwQuery
    Left = 8
    Top = 360
  end
  inherited qryUF: TwwQuery
    Left = 553
    Top = 328
  end
  object qryObj: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  O.NUMPROCTRAB, O.CODTIPOOBJETO, O.VALORRECL,'
      '  O.PERCPROB, O.PERCORIG, O.VALORSENTENCA, O.INDVALOR,'
      '  O.DATAINICIO, O.DATAFINAL, T.DESCRICAO AS OBJETO'
      'FROM'
      '  OBJPROCTRAB O, TIPOOBJPROCTRAB T'
      'WHERE'
      '  (O.NUMPROCTRAB   = :NUMPROCTRAB) AND'
      '  (O.CODTIPOOBJETO = T.CODTIPOOBJETO)'
      'ORDER BY'
      '  UPPER(T.DESCRICAO)'
      ' ')
    ValidateWithMask = True
    Left = 315
    Top = 356
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
end
