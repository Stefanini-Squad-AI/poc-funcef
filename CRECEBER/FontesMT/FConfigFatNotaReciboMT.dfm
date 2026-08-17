inherited FrmConfigFatNotaReciboMT: TFrmConfigFatNotaReciboMT
  Left = 203
  Top = 204
  Caption = ' Configuração de Faturas e  Notas de Crédito'
  ClientHeight = 247
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 161
    inherited PnlImprime: TPanel
      Height = 151
    end
    inherited PnlCadastro: TPanel
      Height = 151
      inherited Label1: TLabel
        Left = 12
        Top = 7
      end
      object Label3: TLabel [1]
        Left = 300
        Top = 47
        Width = 84
        Height = 13
        Caption = 'Cód. Reduzido'
      end
      object Label5: TLabel [2]
        Left = 12
        Top = 102
        Width = 226
        Height = 13
        Caption = 'Imposto a Discriminar \ Somar no Valor:'
      end
      inherited DeRelatorio: TwwDBEdit
        Left = 12
        Top = 24
      end
      inherited BtnDesenho: TBitBtn
        Top = 14
      end
      object RgTipoFatura: TDBRadioGroup
        Left = 12
        Top = 47
        Width = 281
        Height = 46
        Caption = ' Tipo '
        Columns = 2
        DataField = 'FLGTIPOFATURA'
        DataSource = ds
        Items.Strings = (
          '&Fatura'
          '&Nota de Crédito')
        TabOrder = 2
        Values.Strings = (
          'F'
          'N')
      end
      object EdtCodReduz: TwwDBEdit
        Left = 300
        Top = 63
        Width = 101
        Height = 21
        DataField = 'CODREDUZIDO'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblkAlterador: TwwDBLookupCombo
        Left = 12
        Top = 117
        Width = 389
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'
          'ACRESDECRES'#9'1'#9'D/C')
        DataField = 'CODALTERADOR'
        DataSource = ds
        LookupField = 'CODALTERADOR'
        DropDownWidth = 400
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 208
  end
  inherited ds: TwwDataSource
    Left = 388
    Top = 154
  end
  inherited Cds: TCMClientDataSet
    Left = 388
  end
  inherited Sql: TCMSqlParams
    Left = 388
  end
  inherited CdsModelo: TCMClientDataSet
    Left = 449
  end
  inherited SqlModelo: TCMSqlParams
    Left = 449
  end
  inherited SqlDados: TCMSqlParams
    Left = 510
  end
  inherited CdsDados: TCMClientDataSet
    Left = 510
  end
end
