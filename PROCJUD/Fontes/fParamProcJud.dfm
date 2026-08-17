inherited frmParamProcJud: TfrmParamProcJud
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
        object rgImprimeLitis: TRadioGroup
          Left = 18
          Top = 82
          Width = 408
          Height = 34
          Caption = 'Imprime os Litisconsortes?'
          Columns = 3
          ItemIndex = 2
          Items.Strings = (
            'Com Situação'
            'Sem Situação'
            'Não')
          TabOrder = 1
        end
        object rgImprimeOpcao: TRadioGroup
          Left = 430
          Top = 82
          Width = 155
          Height = 60
          Caption = 'Opção para Imprimir'
          ItemIndex = 0
          Items.Strings = (
            'Valores'
            'Órgão Jurisdicional (Vara)')
          TabOrder = 2
          OnClick = rgImprimeOpcaoClick
        end
        object rgImprimeEtapa: TRadioGroup
          Left = 18
          Top = 129
          Width = 184
          Height = 80
          Caption = 'Imprime as Etapas'
          ItemIndex = 1
          Items.Strings = (
            'Todas'
            'Nenhuma'
            'Que Forem Selecionadas')
          TabOrder = 3
          OnClick = rgImprimeEtapaClick
        end
        object rgImprimeObservEtapa: TRadioGroup
          Left = 206
          Top = 129
          Width = 220
          Height = 34
          Caption = 'Com as Obs. das Etapas'
          Columns = 2
          Enabled = False
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 4
        end
        object rgImprimeResumo: TRadioGroup
          Left = 206
          Top = 175
          Width = 220
          Height = 34
          Caption = 'Imprime Resumo por UF?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 5
        end
        object rgImprimeCabRod: TRadioGroup
          Left = 206
          Top = 222
          Width = 220
          Height = 43
          Caption = 'Imprime Cabeçalho e Rodapé'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 6
        end
        object rgImprimeObj: TRadioGroup
          Left = 430
          Top = 191
          Width = 155
          Height = 75
          Caption = 'Imprime os Objetos'
          ItemIndex = 1
          Items.Strings = (
            'Todos'
            'Nenhum'
            'Que Forem Selecionados')
          TabOrder = 7
        end
        object gbxTipoPapel: TGroupBox
          Left = 18
          Top = 222
          Width = 184
          Height = 43
          Caption = 'Tipo de Papel'
          TabOrder = 8
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
        object rgNumProc: TRadioGroup
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
          TabOrder = 9
          OnClick = rgEtapaClick
        end
        object rgExibeRelatRisco: TRadioGroup
          Left = 206
          Top = 280
          Width = 220
          Height = 37
          Caption = 'Exibe no Relatório o Risco'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Máximo'
            'Original')
          TabOrder = 10
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
      inherited tbsContraParte: TTabSheet
        inherited gbxCep: TGroupBox
          inherited Label7: TLabel
            Width = 6
          end
        end
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
    Left = 157
    Top = 291
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
end
