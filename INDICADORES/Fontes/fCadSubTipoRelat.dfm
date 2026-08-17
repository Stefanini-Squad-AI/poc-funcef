inherited frmCadSubTipoRelat: TfrmCadSubTipoRelat
  Left = 141
  Top = 80
  Caption = 'Cadastro de SubTipo de Relatório'
  ClientHeight = 420
  ClientWidth = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 574
    Height = 334
    inherited pnlMestre: TPanel
      Width = 564
      Height = 116
      object Label1: TLabel
        Left = 16
        Top = 64
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 99
        Height = 13
        Caption = 'Tipo de Relatório'
      end
      object wwDBEdit1: TwwDBEdit
        Left = 16
        Top = 80
        Width = 521
        Height = 21
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object ComboBox1: TComboBox
        Left = 16
        Top = 32
        Width = 521
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Condomínio Civil'
          'Condomínio Operacional'
          'Desempenho do Shopping'
          'Operacional do Shopping')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 121
      Width = 564
      Height = 208
      Tabs.Strings = (
        'Indicadores')
      inherited pgctrlDetalhe: TPageControl
        Width = 466
        Height = 149
        inherited tbsDet: TTabSheet
          Caption = 'Indicadores'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 458
            Height = 121
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 458
            Height = 121
            object Label3: TLabel
              Left = 20
              Top = 9
              Width = 54
              Height = 13
              Caption = 'Indicador'
            end
            object Label4: TLabel
              Left = 256
              Top = 56
              Width = 137
              Height = 13
              Caption = 'Ordem de Apresentação'
            end
            object ComboBox2: TComboBox
              Left = 20
              Top = 25
              Width = 408
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'ABONOS - DATA DE PAGAMENTO'
                'ABONOS - DATA DE VENCIMENTO'
                'ABONOS - CORREÇÃO MONETÁRIA'
                'ABONOS - MULTA E JUROS'
                'ABONOS - VALOR FATURADO'
                'ABONOS - VALOR PAGO'
                'AUDITORIA EXTERNA'
                'CONDUÇÃO E REFEIÇÃO'
                'IMPOSTOS, TAXAS E OUTRAS'
                'LIVROS, JORNAIS E IOB')
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 20
              Top = 56
              Width = 185
              Height = 65
              Caption = 'Tipo de Lançamento'
              Items.Strings = (
                'Previsto'
                'Realizado')
              TabOrder = 1
            end
            object wwDBSpinEdit1: TwwDBSpinEdit
              Left = 256
              Top = 72
              Width = 137
              Height = 21
              Increment = 1
              TabOrder = 2
              UnboundDataType = wwDefault
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 556
      end
      inherited Dock974: TDock97
        Left = 470
        Height = 149
      end
    end
  end
  inherited Dock972: TDock97
    Width = 574
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 574
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 306
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 422
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 264
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 424
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Active = True
    ProviderName = 'DataSetProvider1'
    Left = 423
    Top = 21
  end
  inherited MontaSelect: TMontaSelect
    Left = 360
    Top = 65535
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 493
    Top = 290
  end
  inherited dsDet: TwwDataSource
    DataSet = Query2
    Left = 494
    Top = 303
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'                            '#39' AS DESCRICAO'
      'FROM DUAL')
    Left = 504
    Top = 31
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 504
    Top = 15
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 434
    Top = 281
  end
  object Query2: TQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'                            '#39' AS Indicador'
      'FROM DUAL')
    UpdateObject = UpdateSQL1
    Left = 432
    Top = 294
  end
  object UpdateSQL1: TUpdateSQL
    Left = 437
    Top = 271
  end
end
