inherited FrmCadRegMerito: TFrmCadRegMerito
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Registro de Mérito'
  ClientHeight = 433
  ClientWidth = 739
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 739
    Height = 347
    inherited pnlMestre: TPanel
      Width = 737
      Height = 34
      object lblMatricula: TLabel
        Left = 12
        Top = 12
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object lblNome: TLabel
        Left = 180
        Top = 12
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbmMATRICULA: TwwDBEdit
        Left = 71
        Top = 9
        Width = 98
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
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
      object dbmNOME: TwwDBEdit
        Left = 216
        Top = 9
        Width = 418
        Height = 21
        Color = clGray
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
      Top = 35
      Width = 737
      Height = 311
      Tabs.Strings = (
        'Mérito')
      inherited pgctrlDetalhe: TPageControl
        Width = 639
        Height = 252
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 631
            Height = 224
            object lblDtOcorre: TLabel
              Left = 20
              Top = 23
              Width = 112
              Height = 13
              Caption = 'Data da Ocorrência'
            end
            object lblMotivo: TLabel
              Left = 20
              Top = 55
              Width = 39
              Height = 13
              Caption = 'Motivo'
            end
            object lblObs: TLabel
              Left = 20
              Top = 82
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object lblPontua: TLabel
              Left = 361
              Top = 23
              Width = 62
              Height = 13
              Caption = 'Pontuação'
            end
            object dbedDataOcorre: TCMDateTimePicker
              Left = 138
              Top = 18
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAOCORRENCIA'
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
              TabOrder = 0
              UnboundDataType = wwDTEdtDate
            end
            object dbedObserva: TwwDBEdit
              Left = 20
              Top = 100
              Width = 492
              Height = 111
              AutoSize = False
              DataField = 'OBS'
              DataSource = dsDet
              MaxLength = 2000
              TabOrder = 3
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = True
            end
            object dbedMotivo: TwwDBEdit
              Left = 65
              Top = 50
              Width = 448
              Height = 21
              AutoSize = False
              DataField = 'MOTIVO'
              DataSource = dsDet
              MaxLength = 100
              TabOrder = 2
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = True
            end
            object dbedPontuacao: TwwDBEdit
              Left = 429
              Top = 18
              Width = 84
              Height = 21
              AutoSize = False
              DataField = 'PONTUACAO'
              DataSource = dsDet
              TabOrder = 1
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = True
              OnKeyPress = dbedPontuacaoKeyPress
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 631
            Height = 224
            Selected.Strings = (
              'DATAOCORRENCIA'#9'14'#9'Data de Ocorrência'#9'F'
              'PONTUACAO'#9'14'#9'Pontuação'#9'F'
              'MOTIVO'#9'35'#9'Motivo'#9'F'
              'OBS_STR'#9'75'#9'Observação'#9'F')
          end
        end
      end
      inherited Dock973: TDock97
        Width = 729
      end
      inherited Dock974: TDock97
        Left = 643
        Height = 252
      end
    end
  end
  inherited Dock972: TDock97
    Width = 739
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 739
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 514
    Top = 7
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 342
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 288
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 392
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 564
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDCARGO   = CARGO.IDCARGO'
      'FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 584
    Top = 239
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    Left = 452
    Top = 7
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 582
    Top = 295
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'idxData'
        Fields = 'DATAOCORRENCIA'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 580
    Top = 343
  end
end
