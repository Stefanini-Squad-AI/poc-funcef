inherited frmParamProcTrab: TfrmParamProcTrab
  Left = 65
  Top = 81
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
          Top = 26
          Width = 567
          Height = 43
          Caption = 'Título do Relatório'
          TabOrder = 0
          object edTituloRelat: TEdit
            Left = 8
            Top = 14
            Width = 551
            Height = 21
            TabOrder = 0
            Text = 'Relação de Processos'
          end
        end
        object rgNumProc: TRadioGroup
          Left = 18
          Top = 74
          Width = 202
          Height = 34
          Caption = 'Número do Processo'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Interno'
            'Na Vara')
          TabOrder = 1
        end
        object rgImprimeCargo: TRadioGroup
          Left = 224
          Top = 74
          Width = 202
          Height = 34
          Caption = 'Imprime Cargo do Requerente'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
        end
        object rgImprimeLitis: TRadioGroup
          Left = 18
          Top = 114
          Width = 408
          Height = 34
          Caption = 'Imprime os Litisconsortes?'
          Columns = 3
          ItemIndex = 2
          Items.Strings = (
            'Com Situação'
            'Sem Situação'
            'Não')
          TabOrder = 3
        end
        object rgImprimeOpcao: TRadioGroup
          Left = 430
          Top = 74
          Width = 155
          Height = 65
          Caption = 'Opção para Imprimir'
          ItemIndex = 0
          Items.Strings = (
            'Valores,Adm,Dem,Patroc.'
            'Órgão Jurisdicional (Vara)')
          TabOrder = 4
          OnClick = rgImprimeOpcaoClick
        end
        object rgImprimeEtapa: TRadioGroup
          Left = 18
          Top = 155
          Width = 184
          Height = 76
          Caption = 'Imprime as Etapas'
          ItemIndex = 1
          Items.Strings = (
            'Todas'
            'Nenhuma'
            'Que Forem Selecionadas')
          TabOrder = 5
          OnClick = rgImprimeEtapaClick
        end
        object rgImprimeObservEtapa: TRadioGroup
          Left = 206
          Top = 155
          Width = 220
          Height = 34
          Caption = 'Com as Obs. das Etapas'
          Columns = 2
          Enabled = False
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 6
        end
        object rgImprimeResumo: TRadioGroup
          Left = 206
          Top = 197
          Width = 220
          Height = 34
          Caption = 'Imprime Resumo por UF?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 7
        end
        object rgImprimeCabRod: TRadioGroup
          Left = 206
          Top = 239
          Width = 220
          Height = 43
          Caption = 'Imprime Cabeçalho e Rodapé'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 8
        end
        object rgImprimeObj: TRadioGroup
          Left = 430
          Top = 196
          Width = 155
          Height = 85
          Caption = 'Imprime os Objetos'
          ItemIndex = 1
          Items.Strings = (
            'Todos'
            'Nenhum'
            'Que Forem Selecionados')
          TabOrder = 9
        end
        object gbxTipoPapel: TGroupBox
          Left = 18
          Top = 239
          Width = 184
          Height = 43
          Caption = 'Tipo de Papel'
          TabOrder = 10
          object cmbTipoPapel: TComboBox
            Left = 8
            Top = 14
            Width = 168
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object RadioGroup1: TRadioGroup
          Left = 430
          Top = 144
          Width = 155
          Height = 45
          Caption = 'Número do Processo'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Interno'
            'Na Vara')
          TabOrder = 11
          OnClick = rgEtapaClick
        end
        object rgExibeRelatRisco: TRadioGroup
          Left = 206
          Top = 287
          Width = 220
          Height = 37
          Caption = 'Exibe no Relatório o Risco'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Máximo'
            'Original')
          TabOrder = 12
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
          inherited Label6: TLabel
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
          inherited Label1: TLabel
            Width = 6
          end
        end
      end
      inherited tbshContraParte: TTabSheet
        inherited PageControl2: TPageControl
          inherited tsDadosFunc: TTabSheet
            inherited pnlSelDadosFunc: TPanel
              inherited GroupBox1: TGroupBox
                inherited Label7: TLabel
                  Width = 6
                end
              end
              inherited GroupBox2: TGroupBox
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
          end
          inherited tsDadosPess: TTabSheet
            inherited gbxIdade: TGroupBox
              inherited Label10: TLabel
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
              inherited Label11: TLabel
                Width = 6
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
    Left = 83
    Top = 331
  end
  inherited qryAdvog2: TwwQuery
    Left = 601
  end
  inherited qryAdvCasa: TwwQuery
    Left = 596
  end
  inherited qryTipoAcao: TwwQuery
    Left = 602
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
  inherited tblSindic: TwwQuery
    Left = 597
  end
  inherited qryUF: TwwQuery
    Left = 553
    Top = 328
  end
  object qryObj: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
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
    Left = 181
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
end
