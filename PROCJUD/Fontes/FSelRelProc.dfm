inherited frmSelRelProc: TfrmSelRelProc
  Left = 256
  Top = 168
  Caption = 'Seleção para Relatórios de Processos'
  ClientHeight = 300
  ClientWidth = 386
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 386
    Height = 261
    inherited PageControl1: TPageControl
      Width = 376
      Height = 251
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Seleção da Impressão'
        object rgObserv: TRadioGroup
          Left = 187
          Top = 48
          Width = 180
          Height = 40
          Caption = 'Com as Obs. das Etapas'
          Columns = 2
          Enabled = False
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
          OnClick = rgEtapaClick
        end
        object rgLitis: TRadioGroup
          Left = 0
          Top = 3
          Width = 366
          Height = 40
          Caption = 'Imprime os Litisconsortes'
          Columns = 3
          ItemIndex = 2
          Items.Strings = (
            'Com Situação'
            'Sem Situação'
            'Não')
          TabOrder = 0
        end
        object rgEtapa: TRadioGroup
          Left = 0
          Top = 48
          Width = 184
          Height = 83
          Caption = 'Imprime as Etapas'
          ItemIndex = 1
          Items.Strings = (
            'Todas'
            'Nenhuma'
            'Que Forem Selecionadas')
          TabOrder = 1
          OnClick = rgEtapaClick
        end
        object rgResumo: TRadioGroup
          Left = 187
          Top = 91
          Width = 180
          Height = 40
          Caption = 'Imprime Resumo por UF'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 3
          OnClick = rgEtapaClick
        end
        object rgObjeto: TRadioGroup
          Left = 0
          Top = 135
          Width = 184
          Height = 83
          Caption = 'Imprime os Objetos'
          ItemIndex = 1
          Items.Strings = (
            'Todos'
            'Nenhum'
            'Que Forem Selecionados')
          TabOrder = 4
          OnClick = rgEtapaClick
        end
        object rgOpcao: TRadioGroup
          Left = 187
          Top = 135
          Width = 180
          Height = 83
          Caption = 'Opção para Imprimir'
          ItemIndex = 0
          Items.Strings = (
            'Valores'
            'Vara de Justiça')
          TabOrder = 5
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
        object rgCabRod: TRadioGroup
          Left = 96
          Top = 144
          Width = 180
          Height = 40
          Caption = 'Imprime Cabeçalho e Rodapé'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
          OnClick = rgEtapaClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 261
    Width = 386
    inherited tb97Fundo: TToolbar97
      Left = 56
      DockPos = 64
      inherited bbtnSair: TBitBtn
        Visible = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = True
      end
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        OnClick = rbtnImprimirClick
      end
    end
  end
  inherited cdCabecalho: TColorDialog
    Left = 123
    Top = 50
  end
  object qryResumo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select 0 AS IDESTADO,'
      
        '           '#39'                                                    ' +
        '        '#39'  AS  NOME, '
      '           0 AS QTDPROC, 0 AS VALRECLAMADO,'
      '           0 AS VALESTIMADO, 0 AS VALREAL, 0 AS ECONRECLAMADO,'
      '           0 AS ECONESTIMADO'
      'from    DUAL'
      'order by NOME')
    UpdateObject = updResumo
    ValidateWithMask = True
    Left = 95
    Top = 25
  end
  object updResumo: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  NOME = :NOME,'
      '  QTDPROC = :QTDPROC,'
      '  VALRECLAMADO = :VALRECLAMADO,'
      '  VALESTIMADO = :VALESTIMADO,'
      '  VALREAL = :VALREAL,'
      '  ECONRECLAMADO = :ECONRECLAMADO,'
      '  ECONESTIMADO = :ECONESTIMADO'
      'where'
      '  IDESTADO = :OLD_IDESTADO')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDESTADO, NOME, QTDPROC, VALRECLAMADO, VALESTIMADO, VALREAL, '
      'ECONRECLAMADO, '
      '   ECONESTIMADO)'
      'values'
      
        '  (:IDESTADO, :NOME, :QTDPROC, :VALRECLAMADO, :VALESTIMADO, :VAL' +
        'REAL, '
      ':ECONRECLAMADO, '
      '   :ECONESTIMADO)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDESTADO = :OLD_IDESTADO')
    Left = 150
    Top = 30
  end
end
