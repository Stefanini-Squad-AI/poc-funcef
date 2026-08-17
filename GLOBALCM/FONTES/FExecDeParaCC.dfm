inherited frmExecDeParaCC: TfrmExecDeParaCC
  Left = 157
  Top = 205
  Caption = 'Executa De/Para Centro de Custo'
  ClientHeight = 422
  ClientWidth = 729
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 729
    Height = 383
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 727
      Height = 381
      ActivePage = tbsExecucao
      Align = alClient
      TabOrder = 0
      object tbsExecucao: TTabSheet
        Caption = 'Execução'
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 124
          Width = 719
          Height = 229
          Selected.Strings = (
            'SQLDEPARA'#9'94'#9'SQLDEPARA')
          MemoAttributes = [mSizeable, mWordWrap, mGridShow]
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsErros
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 719
          Height = 124
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 1
          object Label3: TLabel
            Left = 8
            Top = 106
            Width = 30
            Height = 13
            Caption = 'Erros'
          end
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 103
            Height = 13
            Caption = 'Data a Considerar'
          end
          object Label6: TLabel
            Left = 139
            Top = 8
            Width = 187
            Height = 13
            Caption = 'Plano Orçamentário a Considerar'
          end
          object Label2: TLabel
            Left = 461
            Top = 8
            Width = 73
            Height = 13
            Caption = 'Processados'
          end
          object Label4: TLabel
            Left = 549
            Top = 8
            Width = 77
            Height = 13
            Caption = 'Com Sucesso'
          end
          object Label5: TLabel
            Left = 641
            Top = 8
            Width = 52
            Height = 13
            Caption = 'Com Erro'
          end
          object Label7: TLabel
            Left = 8
            Top = 57
            Width = 372
            Height = 13
            Caption = 'Motivo para alteração do Centro de Custo na Evolução Funcional'
          end
          object edtData: TCMDateTimePicker
            Left = 9
            Top = 22
            Width = 112
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ShowButton = True
            TabOrder = 0
          end
          object dblkPlanoOrc: TwwDBLookupCombo
            Left = 141
            Top = 22
            Width = 251
            Height = 21
            Hint = 
              'Se não indicar um plano orçamentário o sistema fará o DE/PARA so' +
              'mente no plano orçamentário corrente'
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEPLANOORC'#9'60'#9'NOMEPLANOORC'#9'F')
            LookupTable = cdsPlanoOrc
            LookupField = 'IDPLANOORCAMEN'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object edtProcessados: TRealEdit
            Left = 462
            Top = 22
            Width = 75
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            ReadOnly = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object EdtOk: TRealEdit
            Left = 550
            Top = 22
            Width = 75
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object edtErro: TRealEdit
            Left = 636
            Top = 22
            Width = 75
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            ReadOnly = True
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object dblkMotivo: TwwDBLookupCombo
            Left = 9
            Top = 72
            Width = 382
            Height = 21
            Hint = 
              'Indique o motivo da alteração do centro de custo na evolução fun' +
              'cional'
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
            LookupTable = cdsMotivo
            LookupField = 'IDMOTIVO'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 729
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 400
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object sp_de_paracc: TStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'SP_EXECUTADE_PARA_CC'
    Left = 416
    Top = 260
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDPLANOORCAMEN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDMOTIVO'
        ParamType = ptInput
      end>
  end
  object qryErros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SQLDEPARA'
      'FROM'
      '    LOGDEPARA'
      'WHERE'
      '    TIPODEPARA = '#39'CC'#39
      'AND IDTIPOERRO = 1'
      '')
    ValidateWithMask = True
    Left = 312
    Top = 260
  end
  object dsErros: TDataSource
    DataSet = qryErros
    Left = 216
    Top = 236
  end
  object qryProcessados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    COUNT(*)  AS TOTAL'
      'FROM'
      '    LOGDEPARA'
      'WHERE'
      '    TIPODEPARA = '#39'CC'#39
      'AND (:PIDTIPOERRO IS NULL OR IDTIPOERRO = :PIDTIPOERRO)')
    ValidateWithMask = True
    Left = 120
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOERRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOERRO'
        ParamType = ptInput
      end>
    object qryProcessadosTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object cdsPlanoOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 405
    Top = 41
  end
  object sqlPlanoOrc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDPLANOORCAMEN, NOMEPLANOORC FROM PLANOORCAMENTARIO ORDER' +
        ' BY NOMEPLANOORC')
    ClientDataSet = cdsPlanoOrc
    Left = 432
    Top = 41
  end
  object sqlMotivo: TCMSqlParams
    SQL.Strings = (
      'SELECT IDMOTIVO, DESCRICAO FROM MOTIVO ORDER BY DESCRICAO')
    ClientDataSet = cdsMotivo
    Left = 428
    Top = 96
  end
  object cdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 399
    Top = 96
  end
end
