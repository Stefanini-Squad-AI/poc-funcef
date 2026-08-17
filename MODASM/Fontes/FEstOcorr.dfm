inherited frmEstOcorr: TfrmEstOcorr
  Left = 150
  Top = 115
  Caption = 'Estatística de Ocorrências Médicas'
  Constraints.MinHeight = 392
  Constraints.MinWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited PageControl1: TPageControl [0]
        inherited tsDadosFunc: TTabSheet
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
      end
      inherited pnResult: TPanel [1]
        object Chart2: TChartfx
          Left = 1
          Top = 1
          Width = 602
          Height = 314
          Align = alClient
          TabOrder = 1
          ControlData = {
            383E0000742000006000000000000102550200FFFFFFFF320032002800280002
            00000000000000080001000000000000000000000000000000020000FFFF00C0
            C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
            2008000060080000000800000008000000080000000800000008000000080000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000000000F0
            3F02000400000000000000000000000000000059400000000000000000000000
            000000000000000000}
        end
        object Chart1: TChartfx
          Left = 1
          Top = 1
          Width = 602
          Height = 314
          Align = alClient
          TabOrder = 0
          ControlData = {
            383E0000742000006000000000000102550200FFFFFFFF320032002800280002
            00000000000000080001000000000000000000000000000000020000FFFF00C0
            C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
            2008000060080000000800000008000000080000000800000008000000080000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000000000F0
            3F02000400000000000000000000000000000059400000000000000000000000
            000000000000000000}
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 445
      DockPos = 452
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 198
      DockPos = 205
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    object bbtnGraf: TBitBtn
      Left = 108
      Top = 2
      Width = 80
      Height = 33
      Hint = 'Quantidade e Percentual (alternar)'
      Caption = '&Gráfico'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnClick = bbtnGrafClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
        0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
        0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
        CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
        CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
        CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
        CCC77777777777777377330333333333CCC3337F33333333737F370333333333
        0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  inherited qryGrauInstr: TwwQuery
    Top = 285
  end
  inherited qryMotivo: TwwQuery
    Top = 285
  end
  object ds3: TwwDataSource
    DataSet = qryTabOcorr
    Left = 240
    Top = 72
  end
  object ds2: TwwDataSource
    DataSet = tblHstasm
    Left = 72
    Top = 48
  end
  object tblHstasm: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.HSTASMED'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 135
    Top = 45
  end
  object qryTabOcorr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from TIPOCMED order by DESCRTIPOOCMED')
    ValidateWithMask = True
    Left = 351
    Top = 74
  end
end
