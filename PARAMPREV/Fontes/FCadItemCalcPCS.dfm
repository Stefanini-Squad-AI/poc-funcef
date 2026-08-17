inherited frmCadItemCalcPCS: TfrmCadItemCalcPCS
  Left = 61
  Top = 31
  HelpContext = 160149
  Caption = 'Cadastro de Parcelas que Compõem o Enquadramento'
  ClientHeight = 463
  ClientWidth = 720
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 720
    Height = 377
    inherited pnlMestre: TPanel
      Width = 718
      Height = 68
      object lblFinalVigencia: TLabel
        Left = 524
        Top = 19
        Width = 81
        Height = 13
        Caption = 'Final Vigência'
      end
      object lblNome: TLabel
        Left = 88
        Top = 19
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object lblPrazoPBC: TLabel
        Left = 366
        Top = 19
        Width = 61
        Height = 13
        Caption = 'Prazo PBC'
      end
      object lblInicioVigencia: TLabel
        Left = 433
        Top = 19
        Width = 85
        Height = 13
        Caption = 'Inicio Vigência'
      end
      object lblCodigo: TLabel
        Left = 5
        Top = 19
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object dbeNome: TDBEdit
        Left = 88
        Top = 35
        Width = 273
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbePrazoPBC: TDBEdit
        Left = 366
        Top = 35
        Width = 57
        Height = 21
        DataField = 'PRAZOPBC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object dbdeInicioVigencia: TCMDateTimePicker
        Left = 433
        Top = 35
        Width = 86
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clSilver
        ButtonStyle = cbsCustom
        DataField = 'INICIOVIGENCIA'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 3
      end
      object dbdeFinalVigencia: TCMDateTimePicker
        Left = 524
        Top = 35
        Width = 86
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clSilver
        ButtonStyle = cbsCustom
        DataField = 'FINALVIGENCIA'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 4
      end
      object dbeCodigo: TDBEdit
        Left = 5
        Top = 35
        Width = 81
        Height = 21
        Color = clSilver
        DataField = 'CODIGO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object stPatro: TStaticText
        Left = 3
        Top = -2
        Width = 112
        Height = 23
        Caption = 'Patrocinadora :'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
      end
      object stNomePatro: TStaticText
        Left = 128
        Top = -2
        Width = 98
        Height = 23
        Caption = 'stNomePatro'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 67
      Width = 718
      Height = 309
      Align = alBottom
      Tabs.Strings = (
        'Parcelas que Compõem o Enquadramento')
      inherited pgctrlDetalhe: TPageControl
        Width = 620
        Height = 250
        inherited tbsDet: TTabSheet
          Caption = 'Parcelas que Compõem o Enquadramento'
          inherited dbgrdDet: TwwDBGrid
            Width = 612
            Height = 222
            Selected.Strings = (
              'CODITEMPCS'#9'20'#9'Cod.'
              'DESCTIPO'#9'10'#9'Tipo de Item'
              'DESCRUBRICA'#9'30'#9'Rubrica'
              'PRAZOAPUR'#9'10'#9'Prazo ~(meses)'
              'ORDEMCALC'#9'10'#9'Ordem de ~Calc.')
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 612
            Height = 222
            object TLabel
              Left = 16
              Top = 160
              Width = 5
              Height = 13
            end
            object pgctrlItens: TPageControl
              Left = 0
              Top = 0
              Width = 612
              Height = 222
              ActivePage = tbsDadosMensais
              Align = alClient
              TabOrder = 0
              object tbsDadosMensais: TTabSheet
                Caption = 'Informações para Cálculo Mensal'
                object lblCodItemPCS: TLabel
                  Left = 8
                  Top = 72
                  Width = 86
                  Height = 13
                  Caption = 'Código do Item'
                end
                object lblOrdemCalc: TLabel
                  Left = 131
                  Top = 72
                  Width = 101
                  Height = 13
                  Caption = 'Ordem de Cálculo'
                end
                object lblIdRubrica: TLabel
                  Left = 302
                  Top = 74
                  Width = 45
                  Height = 13
                  Caption = 'Rubrica'
                end
                object lblIDRegraValorRubrica: TLabel
                  Left = 8
                  Top = 117
                  Width = 240
                  Height = 13
                  Caption = 'Regra de Cálculo do Valor do Item Mensal'
                end
                object lblIdRegraPercRubrica: TLabel
                  Left = 302
                  Top = 117
                  Width = 231
                  Height = 13
                  Caption = 'Regra de Percentual do Item no Período'
                end
                object dbrgrTipo: TDBRadioGroup
                  Left = 6
                  Top = 0
                  Width = 590
                  Height = 70
                  Caption = 'Tipo de Item'
                  Columns = 2
                  DataField = 'TIPO'
                  DataSource = dsDet
                  Items.Strings = (
                    'Rubrica Salarial'
                    'Calculado (baseado em outros itens)'
                    'Cargo'
                    'Função'
                    'Adicionais ( T. Serviço, Pericul., Insalub. )')
                  TabOrder = 0
                  TabStop = True
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5')
                end
                object dbeCodItemPCS: TDBEdit
                  Left = 8
                  Top = 86
                  Width = 114
                  Height = 21
                  DataField = 'CODITEMPCS'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object dbeOrdemCalc: TDBEdit
                  Left = 131
                  Top = 86
                  Width = 112
                  Height = 21
                  DataField = 'ORDEMCALC'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object dblkpcmbRubrica: TCMDBLookupCombo
                  Left = 302
                  Top = 88
                  Width = 282
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRPROVDESC'#9'130'#9'Rubrica')
                  DataField = 'IDRUBRICA'
                  DataSource = dsDet
                  LookupTable = qryRubrica
                  LookupField = 'IDRUBRICA'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblkpcmbIDRegraVlrRubrica: TCMDBLookupCombo
                  Left = 8
                  Top = 132
                  Width = 282
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Nome ')
                  DataField = 'IDREGRAVALORUB'
                  DataSource = dsDet
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblkpcmbIDRegraPercRubrica: TCMDBLookupCombo
                  Left = 302
                  Top = 132
                  Width = 282
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Nome ')
                  DataField = 'IDREGRAPERCRUBRICA'
                  DataSource = dsDet
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 5
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
              object tbsDadosNoEvento: TTabSheet
                Caption = 'Informações para Cálculo no Evento ( Manutenção ou Benefício )'
                ImageIndex = 1
                object lblPrazoApur: TLabel
                  Left = 4
                  Top = 34
                  Width = 109
                  Height = 13
                  Caption = 'Prazo de Apuração'
                end
                object Label1: TLabel
                  Left = 120
                  Top = 56
                  Width = 36
                  Height = 13
                  Caption = 'meses'
                end
                object lblIdRegraCalcItem: TLabel
                  Left = 4
                  Top = 117
                  Width = 258
                  Height = 13
                  Caption = 'Regra de Cálculo do Valor do Item no Evento'
                end
                object lblIdRegraCalcPercent: TLabel
                  Left = 308
                  Top = 117
                  Width = 290
                  Height = 13
                  Caption = 'Regra de Cálculo de Percentual do Item no Evento'
                end
                object dbePrazoApur: TDBEdit
                  Left = 4
                  Top = 48
                  Width = 112
                  Height = 21
                  DataField = 'PRAZOAPUR'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object dblkpcmbIdRegraCalcItem: TCMDBLookupCombo
                  Left = 4
                  Top = 132
                  Width = 282
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Nome ')
                  DataField = 'IDREGRACALCITEM'
                  DataSource = dsDet
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblkpcmbIdRegraCalcPercent: TCMDBLookupCombo
                  Left = 308
                  Top = 132
                  Width = 282
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Nome ')
                  DataField = 'IDREGRACALCPERCENT'
                  DataSource = dsDet
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 710
      end
      inherited Dock974: TDock97
        Left = 624
        Height = 250
      end
    end
  end
  inherited Dock972: TDock97
    Width = 720
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
    Top = 424
    Width = 720
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 403
    Top = 22
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PCS'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPCS = :IDPCS,'
      '  CODIGO = :CODIGO,'
      '  NOME = :NOME,'
      '  PRAZOPBC = :PRAZOPBC,'
      '  INICIOVIGENCIA = :INICIOVIGENCIA,'
      '  FINALVIGENCIA = :FINALVIGENCIA'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPCS = :OLD_IDPCS')
    InsertSQL.Strings = (
      'insert into PCS'
      
        '  (IDPESSJUR, IDPCS, CODIGO, NOME, PRAZOPBC, INICIOVIGENCIA, FIN' +
        'ALVIGENCIA)'
      'values'
      
        '  (:IDPESSJUR, :IDPCS, :CODIGO, :NOME, :PRAZOPBC, :INICIOVIGENCI' +
        'A, :FINALVIGENCIA)')
    DeleteSQL.Strings = (
      'delete from PCS'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPCS = :OLD_IDPCS')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Plano de Cargos e Salários'
    Colunas.Strings = (
      'PCS.CODIGO'
      'PCS.NOME'
      'PCS.PRAZOPBC'
      'PCS.INICIOVIGENCIA'
      'PCS.FINALVIGENCIA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'D'
      'D')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Prazo'
      'Início Vigência'
      'Final Vigência')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PCS')
    CamposChave.Strings = (
      'PCS.IDPESSJUR'
      'PCS.IDPCS')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '10'
      '10')
    ExibePergunta = False
    Left = 316
    Top = 65522
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 327
    Top = 29
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      
        'SELECT  IDPESSJUR, IDPCS, CODIGO, NOME, PRAZOPBC, INICIOVIGENCIA' +
        ', FINALVIGENCIA'
      'FROM PCS '
      'WHERE IDPESSJUR = :IDPESSJUR'
      'AND       IDPCS = :IDPCS'
      '  ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPCS'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT I.IDPESSJUR, I.IDPCS, I.IDITEMPCS, I.FLGOBRIGATORIO,'
      '       I.CODITEMPCS, I.TIPO, I.PRAZOAPUR, I.ORDEMCALC,'
      
        '       I.IDRUBRICA, I.IDREGRAVALORUB, I.IDREGRAPERCRUBRICA, I.ID' +
        'REGRACARGO,'
      '       I.IDREGRACALCPERCENT, I.IDREGRACALCITEM,'
      '       DECODE(I.FLGOBRIGATORIO,1,'#39'Sim'#39','#39'Não'#39') AS DESCITEM,'
      '       DECODE(I.TIPO, 1, '#39'Rubrica Salarial'#39','
      '                      2, '#39'Calculado'#39','
      '                      3, '#39'Cargo'#39','
      '                      4, '#39'Função'#39','
      '                      5, '#39'ATS'#39','
      '                      '#39'Baseado em Faixa Salarial'#39') AS DESCTIPO,'
      '       P.DESCRICAO AS DESCRUBRICA'
      'FROM   ITEMPCS I, PROVDESC P'
      'WHERE  I.IDPCS  =  :IDPCS'
      'AND    I.IDRUBRICA = P.IDPROVENTO(+)'
      'ORDER BY  I.ORDEMCALC, I.CODITEMPCS'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 432
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPCS'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMPCS'
      'set'
      '  FLGOBRIGATORIO = :FLGOBRIGATORIO,'
      '  CODITEMPCS = :CODITEMPCS,'
      '  TIPO = :TIPO,'
      '  PRAZOAPUR = :PRAZOAPUR,'
      '  ORDEMCALC = :ORDEMCALC,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  IDREGRAVALORUB = :IDREGRAVALORUB,'
      '  IDREGRAPERCRUBRICA = :IDREGRAPERCRUBRICA,'
      '  IDREGRACARGO = :IDREGRACARGO,'
      '  IDREGRACALCPERCENT = :IDREGRACALCPERCENT,'
      '  IDREGRACALCITEM = :IDREGRACALCITEM'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPCS = :OLD_IDPCS and'
      '  IDITEMPCS = :OLD_IDITEMPCS'
      ' ')
    InsertSQL.Strings = (
      'insert into ITEMPCS'
      
        '  (IDPESSJUR, IDPCS, IDITEMPCS, FLGOBRIGATORIO, CODITEMPCS, TIPO' +
        ', '
      'PRAZOAPUR, '
      '   ORDEMCALC, IDRUBRICA, IDREGRAVALORUB,'
      'IDREGRAPERCRUBRICA, IDREGRACARGO,'
      '   IDREGRACALCPERCENT, IDREGRACALCITEM)'
      'values'
      
        '  (:IDPESSJUR, :IDPCS, :IDITEMPCS, :FLGOBRIGATORIO, :CODITEMPCS,' +
        ' :TIPO,'
      '   :PRAZOAPUR, :ORDEMCALC, :IDRUBRICA, :IDREGRAVALORUB, '
      ':IDREGRAPERCRUBRICA, '
      '   :IDREGRACARGO, :IDREGRACALCPERCENT, :IDREGRACALCITEM)'
      ' ')
    DeleteSQL.Strings = (
      'delete from ITEMPCS'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPCS = :OLD_IDPCS and'
      '  IDITEMPCS = :OLD_IDITEMPCS')
    Left = 472
    Top = 9
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   DISTINCT IDPROVENTO AS IDRUBRICA, DESCRICAO AS DESCRPRO' +
        'VDESC'
      'FROM     PROVDESC'
      'ORDER BY DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 644
    Top = 64
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA '
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 611
    Top = 16
  end
end
