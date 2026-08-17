inherited FrmRegCertificado: TFrmRegCertificado
  Left = 310
  Top = 177
  Caption = 'Registro de Certificado'
  ClientHeight = 477
  ClientWidth = 723
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 723
    Height = 391
    inherited pnlMestre: TPanel
      Width = 721
      object lblCertificado: TLabel
        Left = 16
        Top = 8
        Width = 62
        Height = 13
        Caption = 'Certificado'
      end
      object lblSigla: TLabel
        Left = 16
        Top = 51
        Width = 29
        Height = 13
        Caption = 'Sigla'
      end
      object dbedtCertificado: TwwDBEdit
        Left = 16
        Top = 24
        Width = 305
        Height = 21
        DataField = 'descricao'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtSigla: TwwDBEdit
        Left = 16
        Top = 66
        Width = 129
        Height = 21
        DataField = 'sigla'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 721
      Height = 291
      inherited pgctrlDetalhe: TPageControl
        Width = 623
        Height = 232
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 615
            Height = 204
            Selected.Strings = (
              'MATRICULA'#9'7'#9'Mat.'
              'NOME'#9'35'#9'Nome'
              'AREA'#9'18'#9'Centro Custo'
              'DT_INICIO'#9'12'#9'Dt. Início'
              'DT_VALIDADE'#9'12'#9'Dt. Validade'
              'DESC_EXIGE_HABILITACAO'#9'5'#9'Exige Habilitação'
              'DT_VALIDADE_HABILITACAO'#9'12'#9'Dt. Val. Habilitação'
              'DESC_STATUS_HABILITACAO'#9'12'#9'Status Habilitação')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 615
            Height = 204
            object lblDtInicio: TLabel
              Left = 344
              Top = 36
              Width = 65
              Height = 13
              Caption = 'Data Início'
            end
            object lblDtValidade: TLabel
              Left = 480
              Top = 36
              Width = 81
              Height = 13
              Caption = 'Data Validade'
            end
            object lblNomeEmpregado: TLabel
              Left = 24
              Top = 36
              Width = 64
              Height = 13
              Caption = 'Empregado'
            end
            object btnProcuraEmpregado: TToolbarButton97
              Left = 307
              Top = 51
              Width = 23
              Height = 22
              ImageIndex = 3
              Images = ImlPadrao
              OnClick = btnProcuraEmpregadoClick
            end
            object dbdtInicio: TCMDateTimePicker
              Left = 344
              Top = 52
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'dt_inicio'
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
              TabOrder = 1
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dbdtValidade: TCMDateTimePicker
              Left = 480
              Top = 52
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'dt_validade'
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
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dbchkHabilitacao: TDBCheckBox
              Left = 24
              Top = 122
              Width = 129
              Height = 17
              Caption = 'Exige habilitação?'
              DataField = 'flghabilitacao'
              DataSource = dsDet
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnClick = dbchkHabilitacaoClick
            end
            object pnlHabilitacao: TPanel
              Left = 160
              Top = 100
              Width = 441
              Height = 49
              TabOrder = 4
              object lblNumHabilitacao: TLabel
                Left = 12
                Top = 6
                Width = 83
                Height = 13
                Caption = 'Nº Habilitação'
              end
              object lblDtValidadeHabilitacao: TLabel
                Left = 147
                Top = 6
                Width = 112
                Height = 13
                Caption = 'Dt. Val. Habilitação'
              end
              object lblStatusHabilitacao: TLabel
                Left = 283
                Top = 6
                Width = 105
                Height = 13
                Caption = 'Status Habilitação'
              end
              object dbedtNumHabilitacao: TwwDBEdit
                Left = 12
                Top = 21
                Width = 121
                Height = 21
                DataField = 'num_habilitacao'
                DataSource = dsDet
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbdtValidadeHabilitacao: TCMDateTimePicker
                Left = 147
                Top = 21
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'dt_validade_habilitacao'
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
                TabOrder = 1
                DisplayFormat = 'dd/MM/yyyy'
              end
              object cbbStatusHabilitacao: TwwDBComboBox
                Left = 283
                Top = 21
                Width = 145
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = True
                DataField = 'status_habilitacao'
                DataSource = dsDet
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'Habilitado'#9'1'
                  'Sem Habilitação'#9'0'
                  'N/A'#9'-1')
                Sorted = False
                TabOrder = 2
                UnboundDataType = wwDefault
              end
            end
            object edtNomeEmpregado: TEdit
              Left = 24
              Top = 52
              Width = 279
              Height = 21
              Enabled = False
              TabOrder = 0
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 713
      end
      inherited Dock974: TDock97
        Left = 627
        Height = 232
      end
    end
  end
  inherited Dock972: TDock97
    Width = 723
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 438
    Width = 723
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 698
    Top = 47
  end
  inherited ds: TwwDataSource
    Left = 404
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 696
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 365
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 404
    Top = 65524
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Certificado'
    Colunas.Strings = (
      'CERTIFICADO.DESCRICAO'
      'CERTIFICADO.SIGLA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Sigla')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CERTIFICADO')
    CamposChave.Strings = (
      'CERTIFICADO.IDCERTIFICADO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 261
    Top = 65535
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnAbortConfirma = CmeDetalheAbortConfirma
    Left = 364
    Top = 65523
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 440
    Top = 65535
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 441
    Top = 65523
  end
  object MsEmpregado: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NOME'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Área')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'PESSOA'
      'CENTCUST')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NOME'
      'CENTCUST.NOME')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '25')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
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
    Left = 262
    Top = 65521
  end
end
