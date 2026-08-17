inherited frmCadHstPercGrupo: TfrmCadHstPercGrupo
  Left = 954
  Top = 358
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro Histórico Percentual em Grupo'
  ClientHeight = 455
  ClientWidth = 670
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 670
    Height = 369
    inherited pnlMestre: TPanel
      Width = 668
      object pnlParticipante: TPanel
        Left = 0
        Top = 0
        Width = 668
        Height = 121
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label11: TLabel
          Left = 9
          Top = 3
          Width = 331
          Height = 23
          Caption = 'Informações do Participante Titular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -19
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 21
          Top = 27
          Width = 33
          Height = 13
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 271
          Top = 64
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 271
          Top = 27
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 566
          Top = 28
          Width = 55
          Height = 13
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 566
          Top = 64
          Width = 77
          Height = 13
          Caption = 'Inscrição No.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edNome: TwwDBEdit
          Left = 23
          Top = 45
          Width = 247
          Height = 21
          Color = clSilver
          DataField = 'NOME'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edPatro: TwwDBEdit
          Left = 271
          Top = 44
          Width = 294
          Height = 21
          Color = clSilver
          DataField = 'NOMEPATRO'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edPlano: TwwDBEdit
          Left = 271
          Top = 79
          Width = 294
          Height = 21
          Color = clSilver
          DataField = 'NOMEPLANO'
          DataSource = ds
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edMatricula: TwwDBEdit
          Left = 566
          Top = 43
          Width = 100
          Height = 21
          Color = clSilver
          DataField = 'MATRICULA'
          DataSource = ds
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit5: TwwDBEdit
          Left = 566
          Top = 78
          Width = 100
          Height = 21
          Color = clSilver
          DataField = 'INSCRICAONUMERO'
          DataSource = ds
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 668
      Height = 269
      inherited pgctrlDetalhe: TPageControl
        Width = 570
        Height = 210
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 562
            Height = 182
            object GroupBox2: TGroupBox
              Left = 12
              Top = 12
              Width = 444
              Height = 106
              TabOrder = 0
              object Label1: TLabel
                Left = 11
                Top = 11
                Width = 102
                Height = 13
                Caption = 'Nome Pensionista'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label5: TLabel
                Left = 339
                Top = 53
                Width = 77
                Height = 13
                Caption = 'Processo No.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label6: TLabel
                Left = 11
                Top = 53
                Width = 54
                Height = 13
                Caption = 'Beneficio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edProcesso: TwwDBEdit
                Left = 338
                Top = 73
                Width = 100
                Height = 21
                Color = clSilver
                DataField = 'NUMEROPROCESSO'
                DataSource = dsDet
                Enabled = False
                ReadOnly = True
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object edBeneficio: TwwDBEdit
                Left = 11
                Top = 73
                Width = 316
                Height = 21
                Color = clSilver
                DataField = 'BENEFICIO'
                DataSource = dsDet
                ReadOnly = True
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dblkNomePensionista: TwwDBLookupCombo
                Left = 12
                Top = 27
                Width = 425
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NUMEROPROCESSO'#9'12'#9'Nº Processo'
                  'NOME'#9'30'#9'Nome Pensionista'
                  'BENEFICIO'#9'25'#9'Benefício')
                DataField = 'numeroprocesso'
                LookupTable = qryAux
                LookupField = 'numeroprocesso'
                Options = [loTitles]
                Color = clSilver
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnChange = dblkNomePensionistaChange
                OnClick = dblkNomePensionistaClick
              end
              object edPensionista: TwwDBEdit
                Left = 12
                Top = 27
                Width = 316
                Height = 21
                Color = clSilver
                DataField = 'NOME'
                DataSource = dsDet
                ReadOnly = True
                TabOrder = 3
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object GroupBox1: TGroupBox
              Left = 12
              Top = 118
              Width = 325
              Height = 54
              TabOrder = 1
              object Label7: TLabel
                Left = 8
                Top = 9
                Width = 83
                Height = 13
                Caption = 'Data de Início'
              end
              object lblQtdeParcelas: TLabel
                Left = 242
                Top = 9
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object Label8: TLabel
                Left = 124
                Top = 9
                Width = 59
                Height = 13
                Caption = 'Data Final'
              end
              object dtedInicio: TCMDateTimePicker
                Left = 8
                Top = 24
                Width = 106
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIO'
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
                UnboundDataType = wwDTEdtDate
              end
              object dtedFinal: TCMDateTimePicker
                Left = 124
                Top = 23
                Width = 104
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAFIM'
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 1
                UnboundDataType = wwDTEdtDate
              end
              object edPercentual: TwwDBEdit
                Left = 243
                Top = 22
                Width = 68
                Height = 21
                Color = clWhite
                DataField = 'PERCENTUAL'
                DataSource = dsDet
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnKeyPress = edPercentualKeyPress
              end
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 562
            Height = 182
            Selected.Strings = (
              'NOME'#9'30'#9'Nome Pensionista'
              'NUMEROPROCESSO'#9'12'#9'Nº Processo'
              'BENEFICIO'#9'25'#9'Benefício'
              'DATAINICIO'#9'10'#9'Data de ~Início'
              'DATAFIM'#9'10'#9'Data ~Final'
              'PERCENTUAL'#9'11'#9'Percentual')
            FixedCols = 1
            Font.Height = -11
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TitleFont.Height = -11
            TitleLines = 2
          end
        end
      end
      inherited Dock973: TDock97
        Width = 660
      end
      inherited Dock974: TDock97
        Left = 574
        Height = 210
      end
    end
  end
  inherited Dock972: TDock97
    Width = 670
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object sbtnProcHst: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Gera Histórico de percentual do Grupo via Procedure'
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Hist.Auto'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        ImageIndex = 1
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnProcHstClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 416
    Width = 670
    inherited tb97Fundo: TToolbar97
      Left = 270
      DockPos = 270
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 32
    Top = 74
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 237
    Top = 108
  end
  inherited ds: TwwDataSource
    Left = 188
    Top = 62
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE PESSOA SET NUMDOCUMENTO = :NUMDOCUMENTO'
      ' WHERE IDPESSOA = :IDPESSOA')
    Left = 148
    Top = 60
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'EL.MATRICULA'
      'PES.NOME'
      'PES.NUMDOCUMENTO'
      'P.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome Titular'
      'CPF Titular'
      'PLANO')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'PESSOA PES'
      'PLANPREV P')
    CamposChave.Strings = (
      'EL.IDPESSOA'
      'EL.IDPESSJUR'
      'PP.IDPLANOPREV')
    Filtro.Strings = (
      'EL.IDPESSOA = PP.IDPESSOA'
      'EL.IDPESSJUR = PP.IDPESSJUR'
      'EL.IDPESSOA = PES.IDPESSOA'
      'P.IDPLANOPREV = PP.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '30'
      '17'
      '30')
    OperComparador.Strings = (
      '1'
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
    UsaDistinct = True
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
    Left = 450
    Top = 59
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Top = 62
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV,'
      
        '       EL.MATRICULA, PP.INSCRICAONUMERO, P.NOME, PAT.NOME AS NOM' +
        'EPATRO,'
      '       PL.NOME AS NOMEPLANO, P.NUMDOCUMENTO'
      
        'FROM   PESSOA P, PESSOA PAT, PARTPREVPLAN PP, ELEGPATRO EL, PLAN' +
        'PREV PL'
      'WHERE  PP.IDPESSJUR = :IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV'
      'AND    PP.IDPESSOA = :IDPESSOA'
      'AND    PP.IDPESSJUR = EL.IDPESSJUR'
      'AND    PP.IDPESSOA  = EL.IDPESSOA'
      'AND    PAT.IDPESSOA = EL.IDPESSJUR'
      'AND    PL.IDPLANOPREV = PP.IDPLANOPREV'
      'AND    P.IDPESSOA = PP.IDPESSOA --WO21042 LEANDRO'
      ''
      ' '
      ''
      ' ')
    Left = 117
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 330
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select DP.MATRICULA AS MATRICULA_TIT,'
      '       H.NUMEROPROCESSO,'
      '       H.IDHSTPERCGRUPO,'
      '       H.IDTITULAR, '
      '       H.IDPESSOA,'
      '       PD.NOME,'
      '       H.IDBENEFICIO,'
      '       B.NOME AS BENEFICIO, '
      '       H.DATAINICIO,'
      '       H.DATAFIM, '
      '       H.PERCENTUAL,'
      '       H.TRGUSERINCLUSAO,'
      '       H.IDPLANOPREV,'
      '       H.IDPESSJUR,'
      '       h.fontepagadora,'
      '       h.idplanoorigem,'
      '       h.seqproposta'
      'from HSTPERCGRUPO H,'
      '     DEPENTIT DP,'
      '     BENEFICIO B, '
      '     PESSOA P,'
      '     PESSOA PD'
      'WHERE DP.IDPESSOA = P.IDPESSOA AND'
      '      H.IDTITULAR = DP.IDTITULAR AND'
      '      H.IDPESSOA = PD.IDPESSOA AND'
      '      B.IDBENEFICIO = H.IDBENEFICIO AND'
      '      DP.MATRICULA = :MATRICULA AND'
      '      H.IDPLANOPREV = :IDPLANOPREV'
      'ORDER BY H.NUMEROPROCESSO'
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 201
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      ' UPDATE HSTPERCGRUPO SET PERCENTUAL= :PERCENTUAL,'
      '       DATAINICIO= :DATAINICIO,'
      '       DATAFIM= :DATAFIM'
      ' WHERE IDHSTPERCGRUPO= :IDHSTPERCGRUPO')
    InsertSQL.Strings = (
      ' insert into hstpercgrupo (idhstpercgrupo,'
      '        idpessjur,'
      '        idplanoprev,'
      '        idtitular,'
      '        idpessoa,'
      '        idbeneficio,'
      '        datainicio,'
      '        numeroprocesso,'
      '        datafim,'
      '        percentual,'
      '        fontepagadora,'
      '        idplanoorigem,'
      '        seqproposta) values(seqhstpercgrupo.nextval,'
      '        :idpessjur,'
      '        :idplanoprev,'
      '        :idtitular,'
      '        :idpessoa,'
      '        :idbeneficio,'
      '        :datainicio,'
      '        :numeroprocesso,'
      '        :datafim,'
      '        :percentual,'
      '        :fontepagadora,'
      '        :idplanoorigem,'
      '        :seqproposta)')
    DeleteSQL.Strings = (
      ' DELETE FROM HSTPERCGRUPO '
      ' WHERE IDHSTPERCGRUPO= :OLD_IDHSTPERCGRUPO')
    Left = 157
    Top = 119
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' select h.idpessjur,'
      '        h.idplanoprev,'
      '        h.idtitular,'
      '        h.idpessoa,'
      '        h.idbeneficio,'
      '        h.numeroprocesso,'
      '        PD.NOME,'
      '        B.NOME AS BENEFICIO,'
      '        h.fontepagadora,'
      '        h.idplanoorigem,'
      '        h.seqproposta'
      '   from hstpercgrupo h,beneficio b, pessoa PD'
      '  where idhstpercgrupo in( select distinct(H.IDHSTPERCGRUPO)'
      '                             from HSTPERCGRUPO H,'
      '                                  DEPENTIT DP,'
      '                                  BENEFICIO B,'
      '                                  PESSOA P,'
      '                                  PESSOA PD'
      '                            WHERE DP.IDPESSOA = P.IDPESSOA'
      '                              AND H.IDTITULAR = DP.IDTITULAR'
      '                              AND H.IDPESSOA = PD.IDPESSOA'
      '                              AND B.IDBENEFICIO = H.IDBENEFICIO'
      '                              AND DP.MATRICULA = :MATRICULA'
      '                              AND H.IDPLANOPREV = :IDPLANOPREV )'
      'and B.IDBENEFICIO = H.IDBENEFICIO  '
      'and H.IDPESSOA = PD.IDPESSOA                            '
      '  group by h.idpessjur,'
      '        h.idplanoprev,'
      '        h.numeroprocesso,'
      '        h.idtitular,'
      '        h.idpessoa,'
      '        h.idbeneficio,'
      '        PD.NOME,'
      '        B.NOME,'
      '        h.fontepagadora,'
      '        h.idplanoorigem,'
      '        h.seqproposta'
      '  order by h.idpessoa,'
      '        h.numeroprocesso       '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 79
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsAux: TwwDataSource
    AutoEdit = False
    DataSet = qryAux
    Left = 117
    Top = 114
  end
  object qryBuscaDBeneficio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' select h.idpessjur,'
      '        h.idplanoprev,'
      '        h.idtitular,'
      '        h.idpessoa,'
      '        h.idbeneficio,'
      '        h.numeroprocesso,'
      '        PD.NOME,'
      '        B.NOME AS BENEFICIO,'
      '        h.fontepagadora,'
      '        h.idplanoorigem,'
      '        h.seqproposta'
      '   from hstpercgrupo h,beneficio b, pessoa PD'
      '  where idhstpercgrupo in( select distinct(H.IDHSTPERCGRUPO)'
      '                             from HSTPERCGRUPO H,'
      '                                  DEPENTIT DP,'
      '                                  BENEFICIO B,'
      '                                  PESSOA P,'
      '                                  PESSOA PD'
      '                            WHERE DP.IDPESSOA = P.IDPESSOA'
      '                              AND H.IDTITULAR = DP.IDTITULAR'
      '                              AND H.IDPESSOA = PD.IDPESSOA'
      '                              AND B.IDBENEFICIO = H.IDBENEFICIO'
      '                              AND DP.MATRICULA = :MATRICULA'
      '                              AND H.IDPLANOPREV = :IDPLANOPREV )'
      'and B.IDBENEFICIO = H.IDBENEFICIO  '
      'and H.IDPESSOA = PD.IDPESSOA                            '
      '  group by h.idpessjur,'
      '        h.idplanoprev,'
      '        h.numeroprocesso,'
      '        h.idtitular,'
      '        h.idpessoa,'
      '        h.idbeneficio,'
      '        PD.NOME,'
      '        B.NOME,'
      '        h.fontepagadora,'
      '        h.idplanoorigem,'
      '        h.seqproposta'
      '  order by h.idpessoa,'
      '        h.numeroprocesso       '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 143
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
end
