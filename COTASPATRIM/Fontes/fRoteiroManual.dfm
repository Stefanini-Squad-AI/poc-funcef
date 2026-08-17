inherited frmRoteiroManual: TfrmRoteiroManual
  Left = 302
  Top = 184
  Caption = 'frmRoteiroManual'
  ClientHeight = 406
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 320
    inherited pnlMestre: TPanel
      Height = 80
      object Label1: TLabel
        Left = 24
        Top = 16
        Width = 42
        Height = 13
        Caption = 'Roteiro'
      end
      object Label2: TLabel
        Left = 352
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object ComboBox1: TComboBox
        Left = 24
        Top = 32
        Width = 289
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'Transferencias de cotas'
      end
      object DateTimePicker1: TDateTimePicker
        Left = 352
        Top = 32
        Width = 113
        Height = 21
        CalAlignment = dtaLeft
        Date = 38961.8218138542
        Time = 38961.8218138542
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 81
      Height = 238
      inherited pgctrlDetalhe: TPageControl
        Height = 179
        inherited tbsDet: TTabSheet
          Caption = 'Entradas'
          inherited dbgrdDet: TwwDBGrid [0]
            Height = 151
            Selected.Strings = (
              'Entrada'#9'30'#9'Entrada'
              'Valor'#9'20'#9'Valor'#9'F')
          end
          inherited pnlControlesDet: TPanel [1]
            Height = 151
          end
        end
      end
      inherited Dock973: TDock97
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Height = 179
      end
    end
  end
  inherited Dock971: TDock97
    Top = 367
  end
  inherited ds: TwwDataSource
    Top = 47
  end
  inherited ImlPadrao: TImageList
    Top = 47
  end
  inherited Cds: TCMClientDataSet
    Active = True
    Data = {
      340000009619E0BD01000000180000000100000000000300000034000576617A
      696F01004900000001000557494454480200020014000000}
    object Cdsvazio: TStringField
      FieldName = 'vazio'
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 256
    Top = 103
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
  end
  object CdsDet: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 353
    Top = 112
    Data = {
      960000009619E0BD010000001800000002000400000003000000440007456E74
      7261646101004900100001000557494454480200020014000556616C6F720800
      04001000000000000000044952524600000000004CCD4000000A515444452043
      4F5441530000000000FDD74000000B56414C4F5220425255544F00000000006A
      D84000000D56414C4F52204CCD515549444F000000000088D340}
    object CdsDetEntrada: TStringField
      DisplayWidth = 30
      FieldName = 'Entrada'
    end
    object CdsDetValor: TFloatField
      DisplayWidth = 20
      FieldName = 'Valor'
      DisplayFormat = '#,##0.00'
    end
  end
end
