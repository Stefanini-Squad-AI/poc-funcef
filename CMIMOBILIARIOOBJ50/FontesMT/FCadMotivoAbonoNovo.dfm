inherited frmCadMotivoAbonoNovo: TfrmCadMotivoAbonoNovo
  Left = 193
  Top = 201
  Caption = 'Motivo de Abono'
  ClientHeight = 423
  ClientWidth = 638
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 24
    Top = 152
    Width = 35
    Height = 13
    Caption = 'Juros:'
  end
  object Image10: TImage [1]
    Left = 150
    Top = 80
    Width = 15
    Height = 16
    Picture.Data = {
      07544269746D6170F6000000424DF60000000000000076000000280000001000
      0000100000000100040000000000800000000000000000000000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00888888888888888888888888888888888888888888888888888888888888
      8888888888888888888888888888888888888887777777777788880000000000
      0788880FFFFFFFFF078888000000000008888888888888888888888888888888
      8888888888888888888888888888888888888888888888888888888888888888
      8888}
  end
  inherited pnlFundo: TPanel
    Width = 638
    Height = 384
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 636
      Height = 382
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      object GroupBox5: TGroupBox
        Left = 4
        Top = 4
        Width = 630
        Height = 297
        Caption = ' Abonos '
        TabOrder = 0
        object DBCtrlGrid1: TDBCtrlGrid
          Left = 2
          Top = 15
          Width = 626
          Height = 280
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          DataSource = dsAlienacao
          PanelHeight = 140
          PanelWidth = 609
          TabOrder = 0
          RowCount = 2
          object Label15: TLabel
            Left = 8
            Top = 3
            Width = 65
            Height = 13
            Caption = 'Documento'
            FocusControl = DBEdit1
          end
          object Label1: TLabel
            Left = 437
            Top = 7
            Width = 65
            Height = 26
            Caption = 'Saldo do Documento'
            FocusControl = DBEdit1
            WordWrap = True
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 21
            Width = 76
            Height = 21
            DataField = 'CODDOCUMENTO'
            DataSource = dsAlienacao
            ReadOnly = True
            TabOrder = 0
          end
          object GroupBox7: TGroupBox
            Left = 88
            Top = 5
            Width = 337
            Height = 127
            Caption = ' Abonos '
            TabOrder = 1
            object Label8: TLabel
              Left = 54
              Top = 14
              Width = 77
              Height = 13
              Caption = 'Valor Original'
            end
            object Label9: TLabel
              Left = 149
              Top = 14
              Width = 70
              Height = 13
              Caption = 'Valor Abono'
            end
            object Label14: TLabel
              Left = 259
              Top = 14
              Width = 64
              Height = 13
              Caption = 'Saldo Final'
            end
            object Label10: TLabel
              Left = 23
              Top = 34
              Width = 32
              Height = 13
              Caption = 'Multa'
            end
            object Label11: TLabel
              Left = 24
              Top = 55
              Width = 31
              Height = 13
              Caption = 'Juros'
            end
            object Label12: TLabel
              Left = 3
              Top = 77
              Width = 52
              Height = 13
              Caption = 'Correção'
            end
            object Label13: TLabel
              Left = 25
              Top = 102
              Width = 30
              Height = 13
              Caption = 'Total'
            end
            object Image6: TImage
              Left = 136
              Top = 34
              Width = 15
              Height = 16
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000001000
                0000100000000100040000000000800000000000000000000000100000000000
                0000000000000000800000800000008080008000000080008000808000008080
                8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888887777777777788880000000000
                0788880FFFFFFFFF078888000000000008888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888}
            end
            object Image12: TImage
              Left = 231
              Top = 32
              Width = 15
              Height = 16
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000001000
                0000100000000100040000000000800000000000000000000000100000000000
                000000000000FFFFFF0000008000008000000080800080000000800080008080
                000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
                0000999999999999999999999999999999999999999999999999999888888888
                8899990000000000089999011111111108999900000000000999999999999999
                9999999999999999999999988888888888999900000000000899990111111111
                0899990000000000099999999999999999999999999999999999999999999999
                9999}
            end
            object Image5: TImage
              Left = 136
              Top = 56
              Width = 15
              Height = 16
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000001000
                0000100000000100040000000000800000000000000000000000100000000000
                0000000000000000800000800000008080008000000080008000808000008080
                8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888887777777777788880000000000
                0788880FFFFFFFFF078888000000000008888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888}
            end
            object Image7: TImage
              Left = 136
              Top = 78
              Width = 15
              Height = 16
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000001000
                0000100000000100040000000000800000000000000000000000100000000000
                0000000000000000800000800000008080008000000080008000808000008080
                8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888887777777777788880000000000
                0788880FFFFFFFFF078888000000000008888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888}
            end
            object Image8: TImage
              Left = 231
              Top = 53
              Width = 15
              Height = 16
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000001000
                0000100000000100040000000000800000000000000000000000100000000000
                000000000000FFFFFF0000008000008000000080800080000000800080008080
                000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
                0000999999999999999999999999999999999999999999999999999888888888
                8899990000000000089999011111111108999900000000000999999999999999
                9999999999999999999999988888888888999900000000000899990111111111
                0899990000000000099999999999999999999999999999999999999999999999
                9999}
            end
            object Image11: TImage
              Left = 136
              Top = 101
              Width = 15
              Height = 16
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000001000
                0000100000000100040000000000800000000000000000000000100000000000
                0000000000000000800000800000008080008000000080008000808000008080
                8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888887777777777788880000000000
                0788880FFFFFFFFF078888000000000008888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888}
            end
            object Image9: TImage
              Left = 231
              Top = 77
              Width = 15
              Height = 16
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000001000
                0000100000000100040000000000800000000000000000000000100000000000
                000000000000FFFFFF0000008000008000000080800080000000800080008080
                000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
                0000999999999999999999999999999999999999999999999999999888888888
                8899990000000000089999011111111108999900000000000999999999999999
                9999999999999999999999988888888888999900000000000899990111111111
                0899990000000000099999999999999999999999999999999999999999999999
                9999}
            end
            object Image13: TImage
              Left = 231
              Top = 101
              Width = 15
              Height = 16
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000001000
                0000100000000100040000000000800000000000000000000000100000000000
                000000000000FFFFFF0000008000008000000080800080000000800080008080
                000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
                0000999999999999999999999999999999999999999999999999999888888888
                8899990000000000089999011111111108999900000000000999999999999999
                9999999999999999999999988888888888999900000000000899990111111111
                0899990000000000099999999999999999999999999999999999999999999999
                9999}
            end
            object DBEdit2: TDBEdit
              Left = 58
              Top = 31
              Width = 74
              Height = 21
              Color = 14155775
              DataField = 'MULTAORIG'
              DataSource = dsAlienacao
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit3: TDBEdit
              Left = 153
              Top = 31
              Width = 74
              Height = 21
              DataField = 'MULTAABONO'
              DataSource = dsAlienacao
              TabOrder = 0
              OnEnter = DBEdit3Enter
              OnExit = DBEdit3Exit
            end
            object DBEdit4: TDBEdit
              Left = 58
              Top = 52
              Width = 74
              Height = 21
              Color = 14155775
              DataField = 'JUROSORIG'
              DataSource = dsAlienacao
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit5: TDBEdit
              Left = 58
              Top = 74
              Width = 74
              Height = 21
              Color = 14155775
              DataField = 'CMORIG'
              DataSource = dsAlienacao
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit6: TDBEdit
              Left = 153
              Top = 52
              Width = 74
              Height = 21
              DataField = 'JUROSABONO'
              DataSource = dsAlienacao
              TabOrder = 1
              OnEnter = DBEdit3Enter
              OnExit = DBEdit3Exit
            end
            object DBEdit7: TDBEdit
              Left = 153
              Top = 74
              Width = 74
              Height = 21
              DataField = 'CMABONO'
              DataSource = dsAlienacao
              TabOrder = 2
              OnEnter = DBEdit3Enter
              OnExit = DBEdit3Exit
            end
            object DBEdit8: TDBEdit
              Left = 58
              Top = 99
              Width = 74
              Height = 21
              Color = 14155775
              DataField = 'TotalOrig'
              DataSource = dsAlienacao
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit9: TDBEdit
              Left = 154
              Top = 99
              Width = 74
              Height = 21
              Color = 14155775
              DataField = 'TotalAbono'
              DataSource = dsAlienacao
              ReadOnly = True
              TabOrder = 7
            end
            object DBEdit10: TDBEdit
              Left = 250
              Top = 31
              Width = 76
              Height = 21
              Color = 14155775
              DataField = 'MultaTotal'
              DataSource = dsAlienacao
              ReadOnly = True
              TabOrder = 8
            end
            object DBEdit11: TDBEdit
              Left = 250
              Top = 52
              Width = 76
              Height = 21
              Color = 14155775
              DataField = 'JurosTotal'
              DataSource = dsAlienacao
              ReadOnly = True
              TabOrder = 9
            end
            object DBEdit12: TDBEdit
              Left = 250
              Top = 74
              Width = 76
              Height = 21
              Color = 14155775
              DataField = 'CMTotal'
              DataSource = dsAlienacao
              ReadOnly = True
              TabOrder = 10
            end
            object DBEdit13: TDBEdit
              Left = 250
              Top = 99
              Width = 76
              Height = 21
              Color = 14155775
              DataField = 'TotalSaldo'
              DataSource = dsAlienacao
              ReadOnly = True
              TabOrder = 11
            end
          end
          object DBEdit14: TDBEdit
            Left = 437
            Top = 37
            Width = 76
            Height = 21
            Color = 14155775
            DataField = 'SaldoDoc'
            DataSource = dsAlienacao
            ReadOnly = True
            TabOrder = 2
          end
          object DBMemo1: TDBMemo
            Left = 436
            Top = 64
            Width = 163
            Height = 66
            BorderStyle = bsNone
            Color = clBtnFace
            DataField = 'StatusDoc'
            DataSource = dsAlienacao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 6
        Top = 303
        Width = 361
        Height = 73
        Caption = 'Motivo'
        TabOrder = 1
        object memMotivo: TMemo
          Left = 8
          Top = 18
          Width = 345
          Height = 46
          MaxLength = 200
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 386
        Top = 303
        Width = 147
        Height = 73
        Caption = 'Data do Abono'
        TabOrder = 2
        object edtDataAbono: TCMDateTimePicker
          Left = 20
          Top = 30
          Width = 121
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 638
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
    Top = 315
    TargetsData = (
      1
      3
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 333
    Top = 237
  end
  object dsAlienacao: TDataSource
    DataSet = cdsAlienacao
    Left = 250
    Top = 321
  end
  object cdsAlienacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsAlienacaoCalcFields
    Left = 74
    Top = 321
    object cdsAlienacaoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsAlienacaoIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object cdsAlienacaoCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      FixedChar = True
      Size = 5
    end
    object cdsAlienacaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object cdsAlienacaoDIASDIF: TFloatField
      FieldName = 'DIASDIF'
    end
    object cdsAlienacaoVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoVLRMULTACORRIG: TFloatField
      FieldName = 'VLRMULTACORRIG'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoVLRJUROSCORRIG: TFloatField
      FieldName = 'VLRJUROSCORRIG'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoVLRCMATRASO: TFloatField
      FieldName = 'VLRCMATRASO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoVLRCMCORRIG: TFloatField
      FieldName = 'VLRCMCORRIG'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoMULTAORIG: TFloatField
      FieldName = 'MULTAORIG'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoMULTAABONO: TFloatField
      FieldName = 'MULTAABONO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoJUROSORIG: TFloatField
      FieldName = 'JUROSORIG'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoJUROSABONO: TFloatField
      FieldName = 'JUROSABONO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoCMORIG: TFloatField
      FieldName = 'CMORIG'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoCMABONO: TFloatField
      FieldName = 'CMABONO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlienacaoMultaTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MultaTotal'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Calculated = True
    end
    object cdsAlienacaoJurosTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'JurosTotal'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Calculated = True
    end
    object cdsAlienacaoCMTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CMTotal'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Calculated = True
    end
    object cdsAlienacaoTotalOrig: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalOrig'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Calculated = True
    end
    object cdsAlienacaoTotalAbono: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalAbono'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Calculated = True
    end
    object cdsAlienacaoTotalSaldo: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalSaldo'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Calculated = True
    end
    object cdsAlienacaoVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object cdsAlienacaoSaldoDoc: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SaldoDoc'
      Calculated = True
    end
    object cdsAlienacaoStatusDoc: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusDoc'
      Size = 60
      Calculated = True
    end
  end
  object sqlAlienacao: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '       0 AS IDCONTRATOIMOVEL,'
      '       0 AS IDPARCFINANCIMOV,'
      '       '#39'12345'#39' AS CODTIPIMOVEL,'
      '       0 AS CODDOCUMENTO,'
      '       0 AS DIASDIF,'
      '       0 AS VLRPRESTACAO,'
      '       0 AS VLRMULTAATRASO,'
      '       0 AS VLRMULTACORRIG,'
      '       0 AS VLRMORAATRASO,'
      '       0 AS VLRJUROSCORRIG,'
      '       0 AS VLRCMATRASO,'
      '       0 AS VLRCMCORRIG,'
      '       0 AS VLRPAGO,'
      '       0 AS MULTAORIG,'
      '       0 AS MULTAABONO,'
      '       0 AS JUROSORIG,'
      '       0 AS JUROSABONO,'
      '       0 AS CMORIG,'
      '       0 AS CMABONO'
      '   FROM'
      '       DUAL'
      '   WHERE'
      '       1 = 2'
      ' '
      ' ')
    ClientDataSet = cdsAlienacao
    Left = 162
    Top = 321
  end
  object cdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 333
    Top = 325
  end
  object cdsAlteradorDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 429
    Top = 309
  end
end
