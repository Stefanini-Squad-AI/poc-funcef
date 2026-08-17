inherited frmCadHistProp: TfrmCadHistProp
  Left = 5
  Top = 106
  Caption = 'Cadastro de Históricos de Propostas'
  ClientHeight = 407
  ClientWidth = 765
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 374
    inherited Panel1: TPanel
      Width = 763
      object Label2: TLabel
        Left = 16
        Top = 10
        Width = 51
        Height = 13
        Caption = 'Proposta'
      end
      object Label1: TLabel
        Left = 632
        Top = 10
        Width = 100
        Height = 13
        Caption = 'Data da Proposta'
      end
      object edtProposta: TEdit
        Left = 16
        Top = 24
        Width = 577
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnBuscaPai: TBitBtn
        Left = 593
        Top = 23
        Width = 23
        Height = 22
        Hint = 'Busca uma Proposta'
        TabOrder = 1
        OnClick = btnBuscaPaiClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object edtDataProposta: TCMDateTimePicker
        Left = 632
        Top = 24
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'PRODATA'
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
        Enabled = False
        ShowButton = True
        TabOrder = 2
      end
    end
    inherited pgc: TPageControl
      Width = 763
      Height = 312
      inherited tbs: TTabSheet
        Caption = 'Históricos de Propostas'
        inherited Dock973: TDock97
          Width = 755
        end
        inherited pnlControles: TPanel
          Width = 755
          Height = 106
          object Bevel1: TBevel
            Left = 16
            Top = 98
            Width = 719
            Height = 2
            Shape = bsTopLine
          end
          object Label3: TLabel
            Left = 16
            Top = 10
            Width = 90
            Height = 13
            Caption = 'Data do Evento'
          end
          object Label4: TLabel
            Left = 136
            Top = 10
            Width = 41
            Height = 13
            Caption = 'Evento'
          end
          object Label5: TLabel
            Left = 432
            Top = 10
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object Label6: TLabel
            Left = 16
            Top = 50
            Width = 74
            Height = 13
            Caption = 'Responsável'
          end
          object DBedtDataHistorico: TCMDateTimePicker
            Left = 16
            Top = 24
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'HIPDATA'
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
          object DBedtHistorico: TDBEdit
            Left = 136
            Top = 24
            Width = 281
            Height = 21
            DataField = 'HIPCABECALHO'
            DataSource = ds
            TabOrder = 1
          end
          object DBcboResponsavel: TwwDBLookupCombo
            Left = 16
            Top = 64
            Width = 401
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            DataField = 'IDRESPONSAVEL'
            DataSource = ds
            LookupTable = qryLookResponsavel
            LookupField = 'IDRESPONSAVEL'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBmemDescricao: TDBMemo
            Left = 432
            Top = 24
            Width = 303
            Height = 61
            DataField = 'HIPDESCRICAO'
            DataSource = ds
            MaxLength = 1750
            TabOrder = 2
          end
        end
        inherited pnlGrd: TPanel
          Top = 137
          Width = 755
          Height = 165
          inherited DBgrd: TwwDBGrid
            Top = 24
            Width = 721
            Height = 121
            Selected.Strings = (
              'HIPDATA'#9'10'#9'Data'
              'HIPCABECALHO'#9'40'#9'Evento'
              'NOME'#9'60'#9'Responsável')
            UseTFields = False
          end
          object Panel3: TPanel
            Left = 16
            Top = 3
            Width = 721
            Height = 22
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Histórico'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 374
    Width = 765
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTPROPNOVONEGOC'
      'set'
      '  IDHISTPROPOSTA = :IDHISTPROPOSTA,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDPROPOSTA = :IDPROPOSTA,'
      '  HIPDATA = :HIPDATA,'
      '  HIPCABECALHO = :HIPCABECALHO,'
      '  HIPDESCRICAO = :HIPDESCRICAO'
      'where'
      '  IDHISTPROPOSTA = :OLD_IDHISTPROPOSTA')
    InsertSQL.Strings = (
      'insert into HISTPROPNOVONEGOC'
      
        '  (IDHISTPROPOSTA, IDRESPONSAVEL, IDPROPOSTA, HIPDATA, HIPCABECA' +
        'LHO, HIPDESCRICAO)'
      'values'
      
        '  (:IDHISTPROPOSTA, :IDRESPONSAVEL, :IDPROPOSTA, :HIPDATA, :HIPC' +
        'ABECALHO, '
      '   :HIPDESCRICAO)')
    DeleteSQL.Strings = (
      'delete from HISTPROPNOVONEGOC'
      'where'
      '  IDHISTPROPOSTA = :OLD_IDHISTPROPOSTA')
    Left = 464
    Top = 20
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   H.IDPROPOSTA, H.IDHISTPROPOSTA, H.IDRESPONSAVEL,'
      '   H.HIPDATA, H.HIPCABECALHO, H.HIPDESCRICAO,'
      '   P.PRODATA,'
      '   PR.NOME'
      ''
      'FROM'
      '   PESSOA PR, RESPONSAVEL R,'
      '   HISTPROPNOVONEGOC H, PROPOSTANOVONEGOC P'
      ''
      'WHERE'
      '   ( H.IDPROPOSTA =:PIDPROPOSTA )'
      '   AND ( H.IDPROPOSTA = P.IDPROPOSTA )'
      '   AND ( H.IDRESPONSAVEL = R.IDRESPONSAVEL(+) )'
      '   AND ( R.IDRESPONSAVEL = PR.IDPESSOA(+) )'
      ''
      'ORDER BY'
      '   H.HIPDATA DESC')
    Left = 496
    Top = 20
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryHIPDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'HIPDATA'
      Origin = 'HISTPROPNOVONEGOC.HIPDATA'
    end
    object qryHIPCABECALHO: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 40
      FieldName = 'HIPCABECALHO'
      Origin = 'HISTPROPNOVONEGOC.HIPCABECALHO'
      Size = 60
    end
    object qryHIPDESCRICAO: TMemoField
      FieldName = 'HIPDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryNOME: TStringField
      DisplayLabel = 'Responsável'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryIDPROPOSTA: TFloatField
      FieldName = 'IDPROPOSTA'
      Origin = 'HISTPROPNOVONEGOC.IDPROPOSTA'
    end
    object qryIDHISTPROPOSTA: TFloatField
      FieldName = 'IDHISTPROPOSTA'
      Origin = 'HISTPROPNOVONEGOC.IDHISTPROPOSTA'
    end
    object qryIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'HISTPROPNOVONEGOC.IDRESPONSAVEL'
    end
    object qryPRODATA: TDateTimeField
      DisplayWidth = 10
      FieldName = 'PRODATA'
      Origin = 'PROPOSTANOVONEGOC.PRODATA'
    end
  end
  inherited ds: TwwDataSource
    Left = 528
    Top = 20
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 389
    Top = 21
  end
  object qryLookResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   R.IDRESPONSAVEL,'
      '   P.NOME, P.RAZAOSOCIAL'
      ''
      'FROM'
      '   PESSOA P, RESPONSAVEL R '
      ''
      'WHERE'
      '   ( R.FLGIMOBILIARIO = 1 )'
      '   AND ( R.IDRESPONSAVEL = P.IDPESSOA )'
      ''
      'ORDER BY'
      '   P.NOME')
    ValidateWithMask = True
    Left = 320
    Top = 158
    object qryLookResponsavelNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryLookResponsavelIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'RESPONSAVEL.IDRESPONSAVEL'
      Visible = False
    end
    object qryLookResponsavelRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Visible = False
      Size = 60
    end
  end
end
