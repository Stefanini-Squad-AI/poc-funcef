inherited frmParcelaAcordo: TfrmParcelaAcordo
  Left = 194
  Top = 123
  Caption = 'Parcelas do Acordo de um Processo'
  ClientHeight = 368
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 282
    inherited pnlMestre: TPanel
      Height = 55
      object dbedNumProc: TwwDBEdit
        Left = 8
        Top = 19
        Width = 121
        Height = 21
        TabStop = False
        Color = clWindowFrame
        DataField = 'PROCJCJNUM'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 136
        Top = 19
        Width = 340
        Height = 21
        TabStop = False
        Color = clWindowFrame
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 60
      Height = 217
      Tabs.Strings = (
        'Parcelas')
      inherited pgctrlDetalhe: TPageControl
        Height = 158
        inherited tbsDet: TTabSheet
          Caption = 'Parcelas'
          inherited pnlControlesDet: TPanel [0]
            Height = 130
            object Label1: TLabel
              Left = 78
              Top = 19
              Width = 109
              Height = 13
              Caption = 'Número da Parcela'
            end
            object Label2: TLabel
              Left = 78
              Top = 59
              Width = 113
              Height = 13
              Caption = 'Data de Pagamento'
            end
            object Label3: TLabel
              Left = 78
              Top = 103
              Width = 95
              Height = 13
              Caption = 'Valor da Parcela'
            end
            object dbredNumParcela: TDBRealEdit
              Left = 196
              Top = 16
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'NUMPARCELA'
              DataSource = dsDet
            end
            object dbredValorParcela: TDBRealEdit
              Left = 196
              Top = 100
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORPARCELA'
              DataSource = dsDet
            end
            object dbredDataParcela: TCMDateTimePicker
              Left = 196
              Top = 56
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPARCELA'
              DataSource = dsDet
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
              TabOrder = 2
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Height = 130
            Selected.Strings = (
              'NUMPARCELA'#9'15'#9'Número da Parcela'
              'DATAPARCELA'#9'14'#9'Data Pagamento'
              'VALORPARCELA'#9'18'#9'     Valor da Parcela'#9'F')
          end
        end
      end
      inherited Dock974: TDock97
        Height = 158
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 329
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT PT.PROCJCJNUM, P.NOME'
      'FROM PESSOA P, PROCESSOTRAB PT'
      'WHERE PT.NUMPROCTRAB = :NUMPROCTRAB'
      'AND   PT.IDRECLAMANTE = P.IDPESSOA  ')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 323
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 276
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMPROCTRAB, NUMPARCELA,DATAPARCELA,'
      '     VALORPARCELA'
      'FROM PARCELASPROCTRAB'
      'WHERE NUMPROCTRAB = :NUMPROCTRAB')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 361
    Top = 106
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCELASPROCTRAB'
      'set'
      '  DATAPARCELA = :DATAPARCELA,'
      '  VALORPARCELA = :VALORPARCELA'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB and'
      '  NUMPARCELA = :OLD_NUMPARCELA')
    InsertSQL.Strings = (
      'insert into PARCELASPROCTRAB'
      '  (NUMPROCTRAB, NUMPARCELA, DATAPARCELA, VALORPARCELA)'
      'values'
      '  (:NUMPROCTRAB, :NUMPARCELA, :DATAPARCELA, :VALORPARCELA)')
    DeleteSQL.Strings = (
      'delete from PARCELASPROCTRAB'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB and'
      '  NUMPARCELA = :OLD_NUMPARCELA')
    Left = 402
    Top = 106
  end
end
