inherited FrmParamCotacaoRVMT: TFrmParamCotacaoRVMT
  Caption = 'Configuração'
  ClientWidth = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 544
    inherited pnlControles: TPanel
      Width = 542
      object lblDtOperacao: TLabel
        Left = 13
        Top = 14
        Width = 99
        Height = 13
        Caption = 'Data de Vigência'
      end
      object lblTipoCotacao: TLabel
        Left = 13
        Top = 70
        Width = 95
        Height = 13
        Caption = 'Tipo de Cotação'
      end
      object dbDtaVigencia: TCMDateTimePicker
        Left = 13
        Top = 29
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAVIGENCIA'
        DataSource = ds
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
      object dbTipoCotacao: TwwDBComboBox
        Left = 13
        Top = 86
        Width = 183
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        ShowMatchText = True
        DataField = 'TIPOCOTACAO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Abertura'#9'A'
          'Fechamento '#9'F'
          'Média'#9'M'
          'Mínima'#9'N'
          'Máxima'#9'M')
        Sorted = False
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 542
      Selected.Strings = (
        'DATAVIGENCIA'#9'18'#9'Data de Vigência'
        'DESCRICAO'#9'55'#9'Tipo de Cotação'#9'F')
    end
  end
  inherited Dock972: TDock97
    Width = 544
  end
  inherited Dock971: TDock97
    Width = 544
    inherited tb97Fundo: TToolbar97
      Left = 372
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 203
    end
  end
  inherited pnlTitulo: TPanel
    Width = 544
    inherited lbNomItem: TfcLabel
      Width = 273
      Caption = 'Parâmetro de Cotação - RV'
    end
  end
  inherited ds: TwwDataSource
    Top = 103
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 240
    Top = 103
  end
  inherited Cds: TCMClientDataSet
    Active = True
    Top = 103
    Data = {
      AB0000009619E0BD010000001800000004000000000003000000AB0010494450
      4152414D434F544143414F525608000400000000000C44415441564947454E43
      494108000800000000000B5449504F434F544143414F01004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      01000944455343524943414F0100490000000100055749445448020002002200
      0100044C4349440400010009040000}
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PARAMCOTACAORV.DATAVIGENCIA'
      
        'case PARAMCOTACAORV.TIPOCOTACAO when '#39'A'#39' then '#39'Abertura'#39' when '#39'F' +
        #39' then '#39'Fechamento'#39' when '#39'M'#39' then '#39'Média'#39' when '#39'N'#39' then '#39'Mínimo'#39 +
        ' when '#39'X'#39' then '#39'Máximo'#39' else '#39'Campo em branco ou valor incorreto' +
        #39' end AS DESCRICAO')
    TipodeDado.Strings = (
      'D'
      'C')
    Descricao.Strings = (
      'Data de Vigência'
      'Tipo de Cotação')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PARAMCOTACAORV')
    CamposChave.Strings = (
      'PARAMCOTACAORV.IDPARAMCOTACAORV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '18'
      '55')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select IDPARAMCOTACAORV,DATAVIGENCIA, TIPOCOTACAO,'
      '  case TIPOCOTACAO    '
      '   when '#39'A'#39' then '#39'abertura'#39' '
      '   when '#39'f'#39' then '#39'fechamento'#39' '
      '    else '
      '       '#39'Campo em branco ou valor incorreto'#39' '
      '  end as DESCRICAO '
      'from PARAMCOTACAORV'
      'order by datavigencia desc')
    ClientDataSet = Cds
    Left = 184
    Top = 103
  end
end
