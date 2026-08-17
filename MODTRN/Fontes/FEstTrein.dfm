inherited frmEstTrein: TfrmEstTrein
  Left = 150
  Top = 119
  Caption = 'Estatística da Atividade de Treinamento'
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
        object Chart1: TChartfx
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
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 444
      DockPos = 452
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 197
      DockPos = 205
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
        OnClick = bbtnSairClick
      end
    end
    object bbtnGraf: TBitBtn
      Left = 3
      Top = 2
      Width = 75
      Height = 33
      Hint = 'Alternar Horas e Valores'
      Caption = '&Gráfico'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnClick = bbtnGrafClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
  inherited tblProfis: TwwQuery
    Top = 284
  end
  inherited qryGrauInstr: TwwQuery
    Top = 285
  end
  inherited qryRamo: TwwQuery
    Top = 281
  end
  inherited qryMotivo: TwwQuery
    Top = 285
  end
  object ds2: TwwDataSource
    DataSet = tblHsttrn
    Left = 123
    Top = 72
  end
  object tblHsttrn: TwwTable
    OnCalcFields = tblHsttrnCalcFields
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    ReadOnly = True
    TableName = 'CM.HSTTRN'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 162
    Top = 72
    object tblHsttrnIDCURSO: TFloatField
      FieldName = 'IDCURSO'
      Required = True
    end
    object tblHsttrnDATREINI: TDateTimeField
      FieldName = 'DATREINI'
      Required = True
    end
    object tblHsttrnDATREFIM: TDateTimeField
      FieldName = 'DATREFIM'
    end
    object tblHsttrnDATPLINI: TDateTimeField
      FieldName = 'DATPLINI'
    end
    object tblHsttrnDATPLFIM: TDateTimeField
      FieldName = 'DATPLFIM'
    end
    object tblHsttrnDUR_TEOR: TFloatField
      FieldName = 'DUR_TEOR'
    end
    object tblHsttrnDUR_PRAT: TFloatField
      FieldName = 'DUR_PRAT'
    end
    object tblHsttrnDUR_TOT: TFloatField
      FieldName = 'DUR_TOT'
    end
    object tblHsttrnFLGCONTROLE: TFloatField
      FieldName = 'FLGCONTROLE'
      Required = True
    end
    object tblHsttrnFLGAVALCURS: TFloatField
      FieldName = 'FLGAVALCURS'
      Required = True
    end
    object tblHsttrnAVALCURSO: TFloatField
      FieldName = 'AVALCURSO'
    end
    object tblHsttrnFLGAVALTEOR: TFloatField
      FieldName = 'FLGAVALTEOR'
      Required = True
    end
    object tblHsttrnAVALTEOR: TFloatField
      FieldName = 'AVALTEOR'
    end
    object tblHsttrnFLGAVALPRAT: TFloatField
      FieldName = 'FLGAVALPRAT'
      Required = True
    end
    object tblHsttrnAVALPRAT: TFloatField
      FieldName = 'AVALPRAT'
    end
    object tblHsttrnVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object tblHsttrnDESP_VIAG: TFloatField
      FieldName = 'DESP_VIAG'
    end
    object tblHsttrnDESP_ESTAD: TFloatField
      FieldName = 'DESP_ESTAD'
    end
    object tblHsttrnDESP_OUTR: TFloatField
      FieldName = 'DESP_OUTR'
    end
    object tblHsttrnTOT_CUSTO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_CUSTO'
      Calculated = True
    end
    object tblHsttrnIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Required = True
    end
    object tblHsttrnIDENTIDINSTR: TFloatField
      FieldName = 'IDENTIDINSTR'
    end
    object tblHsttrnNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
      Required = True
    end
  end
  object tblCurso: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCURSO'
    MasterFields = 'IDCURSO'
    MasterSource = ds2
    ReadOnly = True
    TableName = 'CM.CURSO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 264
    Top = 69
  end
  object ds3: TwwDataSource
    Left = 219
    Top = 72
  end
  object tblGrptr: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODGRPTREIN'
    ReadOnly = True
    TableName = 'CM.GRPTREIN'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 393
    Top = 69
  end
  object tblCargo2: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    MasterFields = 'IDCARGO'
    ReadOnly = True
    TableName = 'CM.CARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 336
    Top = 72
  end
  object tblEstab2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPESSOA, NOME from PESSOA '
      'where IDGRUPO =:IdEmpresaProp '
      'order by NOME')
    ValidateWithMask = True
    Left = 509
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end>
  end
end
