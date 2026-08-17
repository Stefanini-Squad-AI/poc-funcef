inherited frmSelRelProc: TfrmSelRelProc
  Left = 256
  Top = 93
  BorderIcons = [biSystemMenu]
  Caption = 'Seleção para Relatórios de Processos'
  ClientHeight = 410
  ClientWidth = 386
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 386
    Height = 371
    inherited PageControl1: TPageControl
      Width = 376
      Height = 361
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Seleção da Impressão'
        object rgTipoRel: TRadioGroup
          Left = 0
          Top = -2
          Width = 368
          Height = 82
          Caption = 'Tipo de Relatório'
          ItemIndex = 0
          Items.Strings = (
            'Geral'
            'Economia dos Processos Encerrados')
          TabOrder = 0
          OnClick = rgTipoRelClick
        end
        object gbxEncargos: TGroupBox
          Left = 249
          Top = 19
          Width = 109
          Height = 43
          Caption = '% Encargos'
          TabOrder = 1
          Visible = False
          object redEncargos: TRealEdit
            Left = 24
            Top = 16
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
        object rgCargo: TRadioGroup
          Left = 0
          Top = 166
          Width = 184
          Height = 40
          Caption = 'Imprime Cargo do Reclamante'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
        end
        object rgEtapa: TRadioGroup
          Left = 0
          Top = 207
          Width = 184
          Height = 81
          Caption = 'Imprime as Etapas'
          ItemIndex = 1
          Items.Strings = (
            'Todas'
            'Nenhuma'
            'Que Forem Selecionadas')
          TabOrder = 3
          OnClick = rgEtapaClick
        end
        object rgObserv: TRadioGroup
          Left = 0
          Top = 290
          Width = 180
          Height = 40
          Caption = 'Com as Obs. das Etapas'
          Columns = 2
          Enabled = False
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 4
          OnClick = rgEtapaClick
        end
        object rgRateio: TRadioGroup
          Left = 1
          Top = 82
          Width = 184
          Height = 40
          Caption = 'Imprime os Rateios'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 5
          OnClick = rgEtapaClick
        end
        object rgCabRod: TRadioGroup
          Left = 187
          Top = 83
          Width = 180
          Height = 40
          Caption = 'Imprime Cabeçalho e Rodapé'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 6
          OnClick = rgEtapaClick
        end
        object rgResumo: TRadioGroup
          Left = 187
          Top = 166
          Width = 180
          Height = 40
          Caption = 'Imprime Resumo por Unidade'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 7
          OnClick = rgEtapaClick
        end
        object rgRisco: TRadioGroup
          Left = 187
          Top = 290
          Width = 180
          Height = 40
          Caption = 'Exibe no Relatório o Risco'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Máximo'
            'Original')
          TabOrder = 8
          OnClick = rgEtapaClick
        end
        object rgLitis: TRadioGroup
          Left = 0
          Top = 123
          Width = 366
          Height = 40
          Caption = 'Imprime os Litisconsortes'
          Columns = 3
          ItemIndex = 2
          Items.Strings = (
            'Com Situação'
            'Sem Situação'
            'Não')
          TabOrder = 9
        end
        object rgObjeto: TRadioGroup
          Left = 187
          Top = 207
          Width = 180
          Height = 81
          Caption = 'Imprime os Objetos'
          ItemIndex = 1
          Items.Strings = (
            'Todos'
            'Nenhum'
            'Que Forem Selecionados')
          TabOrder = 10
          OnClick = rgEtapaClick
        end
      end
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 55
          Top = 66
        end
        inherited BitBtn2: TBitBtn
          Left = 55
          Top = 6
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 371
    Width = 386
    inherited tb97Fundo: TToolbar97
      Left = 56
      DockPos = 64
      inherited bbtnSair: TBitBtn
        Cancel = True
        Visible = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = True
      end
      inherited rbtnVisualizar: TBitBtn
        Default = True
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        Cancel = False
        OnClick = rbtnImprimirClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 139
    Top = 355
  end
  inherited cdMestre: TColorDialog
    Left = 193
    Top = 356
  end
  inherited cdCabecalho: TColorDialog
    Left = 262
    Top = 349
  end
  object qryResumo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select 0 AS IDPESSOA,'
      
        '           '#39'                                                    ' +
        '        '#39'  AS  NOME, '
      '           0 AS QTDPROC, 0 AS VALRECLAMADO,'
      '           0 AS VALESTIMADO, 0 AS VALREAL, 0 AS ECONRECLAMADO,'
      '           0 AS ECONESTIMADO'
      'from    DUAL'
      'order by NOME')
    UpdateObject = updResumo
    ValidateWithMask = True
    Left = 31
    Top = 361
  end
  object updResumo: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NOME = :NOME,'
      '  QTDPROC = :QTDPROC,'
      '  VALRECLAMADO = :VALRECLAMADO,'
      '  VALESTIMADO = :VALESTIMADO,'
      '  VALREAL = :VALREAL,'
      '  ECONRECLAMADO = :ECONRECLAMADO,'
      '  ECONESTIMADO = :ECONESTIMADO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (IDPESSOA, NOME, QTDPROC, VALRECLAMADO, VALESTIMADO, VALREAL, ' +
        'ECONRECLAMADO, '
      '   ECONESTIMADO)'
      'values'
      
        '  (:IDPESSOA, :NOME, :QTDPROC, :VALRECLAMADO, :VALESTIMADO, :VAL' +
        'REAL, :ECONRECLAMADO, '
      '   :ECONESTIMADO)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 86
    Top = 366
  end
end
