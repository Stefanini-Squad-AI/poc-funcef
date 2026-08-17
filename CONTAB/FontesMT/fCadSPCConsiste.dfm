inherited frmCadSPCConsiste: TfrmCadSPCConsiste
  Left = 231
  Top = 93
  Caption = 'Cadastro de Regras de Consistência de Balancetes'
  ClientHeight = 513
  ClientWidth = 508
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 508
    Height = 427
    inherited pnlMestre: TPanel
      Width = 506
      Height = 152
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = dbedtDescricao
      end
      object Label2: TLabel
        Left = 12
        Top = 55
        Width = 37
        Height = 13
        Caption = 'Plano '
      end
      object lblDTSPCCONSISTE: TLabel
        Left = 12
        Top = 100
        Width = 118
        Height = 13
        Caption = 'Data de Composição'
      end
      object dbedtDescricao: TDBEdit
        Left = 8
        Top = 24
        Width = 481
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object cbbPlano: TwwDBLookupCombo
        Left = 12
        Top = 70
        Width = 481
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPLANO'#9'50'#9'Plano'#9'F')
        LookupTable = cdsPlano
        LookupField = 'PLANO'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dtpDtSpcConsiste: TCMDateTimePicker
        Left = 14
        Top = 116
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        Frame.FocusStyle = efsFrameSingle
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
        UnboundDataType = wwDTEdtDate
        OnCloseUp = dtpDtSpcConsisteCloseUp
        OnExit = dtpDtSpcConsisteCloseUp
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 153
      Width = 506
      Height = 273
      inherited pgctrlDetalhe: TPageControl
        Width = 408
        Height = 214
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 400
            Height = 186
            Selected.Strings = (
              'PLACONTA'#9'44'#9'Conta Contábil'
              'FLGSALDOOUMOVIM'#9'15'#9'Saldo / Movimento')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 400
            Height = 186
            object CMProcuraMaskContabil: TCMProcuraMaskContabil
              Left = 16
              Top = 24
              Width = 361
              Height = 49
              Caption = 'Conta Contábil'
              TabOrder = 0
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              Mensagens.Sintetica = 'Chave não pode ser sintética'
              Mensagens.Analitica = 'Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scSoAtiva
            end
            object rdgCalcula: TDBRadioGroup
              Left = 16
              Top = 96
              Width = 361
              Height = 57
              Caption = 'Calcula Valor pelo'
              Columns = 2
              DataField = 'FLGSALDOOUMOVIM'
              DataSource = dsDet
              Items.Strings = (
                'Saldo Atual'
                'Movimento Atual')
              TabOrder = 1
              Values.Strings = (
                'S'
                'M')
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 498
      end
      inherited Dock974: TDock97
        Left = 412
        Height = 214
      end
    end
  end
  inherited Dock972: TDock97
    Width = 508
    object btnCriarData: TToolbarButton97 [0]
      Left = 244
      Top = 0
      Width = 63
      Height = 49
      AllowAllUp = True
      GroupIndex = -1
      Caption = '&Criar Data'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
        777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
        79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
        777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
        79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
        CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      Spacing = 0
      OnClick = btnCriarDataClick
    end
  end
  inherited Dock971: TDock97
    Top = 474
    Width = 508
    inherited tb97Fundo: TToolbar97
      Left = 336
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 167
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
  end
  inherited Cds: TCMClientDataSet
    object CdsIDSPCCONSISTE: TFloatField
      DisplayLabel = 'Identificador'
      FieldName = 'IDSPCCONSISTE'
    end
    object CdsDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object CdsTIPOCONSISTE: TStringField
      FieldName = 'TIPOCONSISTE'
      Size = 2
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SPCCONSISTE.DESCRICAO'
      'ITEMSPCCONSISTE.PLANO'
      'ITEMSPCCONSISTE.DTSPCCONSISTE')
    TipodeDado.Strings = (
      'C'
      'N'
      'D')
    Descricao.Strings = (
      'Descrição'
      'Plano'
      'Data de Composição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SPCCONSISTE'
      'ITEMSPCCONSISTE')
    CamposChave.Strings = (
      'SPCCONSISTE.IDSPCCONSISTE'
      'SPCCONSISTE.TIPOCONSISTE'
      'ITEMSPCCONSISTE.DTSPCCONSISTE')
    Filtro.Strings = (
      'SPCCONSISTE.TIPOCONSISTE = '#39'RC'#39
      'ITEMSPCCONSISTE.IDSPCCONSISTE = SPCCONSISTE.IDSPCCONSISTE')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '10'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 256
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 357
    Top = 108
    object cdsDetPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 44
      FieldName = 'PLACONTA'
      FixedChar = True
      Size = 18
    end
    object cdsDetFLGSALDOOUMOVIM: TStringField
      DisplayLabel = 'Saldo / Movimento'
      DisplayWidth = 15
      FieldName = 'FLGSALDOOUMOVIM'
      FixedChar = True
      Size = 1
    end
    object cdsDetIDITEMSPCCONSISTE: TFloatField
      DisplayLabel = 'Identificador'
      DisplayWidth = 10
      FieldName = 'IDITEMSPCCONSISTE'
      Visible = False
    end
    object cdsDetIDSPCCONSISTE: TFloatField
      DisplayLabel = 'Regra de Consistência'
      DisplayWidth = 10
      FieldName = 'IDSPCCONSISTE'
      Visible = False
    end
    object cdsDetPLANO: TFloatField
      DisplayLabel = 'Plano'
      DisplayWidth = 10
      FieldName = 'PLANO'
      Visible = False
    end
    object cdsDetDTSPCCONSISTE: TDateTimeField
      FieldName = 'DTSPCCONSISTE'
    end
  end
  object cdsPlano: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 225
    Top = 160
    Data = {
      130200009619E0BD010000001800000006000500000003000000DB0005504C41
      4E4F08000400000000001149445553554152494F494E434C5553414F08000400
      000000000944455343504C414E4F010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002001400074D41534341
      524101004900000001000557494454480200020019000D5452474454494E434C
      5553414F08000800000000000F54524755534552494E434C5553414F01004900
      00000100055749445448020002001E000100044C434944040001000908000000
      0000000000000000F03F00000000008056400A5365637265746172696113392E
      392E392E392E39392E39392E392E39393900DCC83481ABCC4202434D00000000
      000000000000400000000000E07F4005524546455213392E392E392E392E3939
      2E39392E392E39393900DCC83481ABCC4202434D000000000000000000084000
      00000080D2C3400A52454645525F3230303216392E392E392E392E39392E3939
      2E39392E392E39393900784F2553B7CC4207434D313031343900000000000000
      000010400000000000E07F400646555345534313392E392E392E392E39392E39
      392E39392E393900E04F365DCACC4205434D3531300000000000000000001440
      0000000000E07F400C504C414E4F2046555345534313392E392E392E392E3939
      2E39392E39392E393900D4751177CACC4205434D353130}
  end
end
