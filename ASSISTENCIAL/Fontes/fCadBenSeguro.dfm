inherited frmCadBenSeguro: TfrmCadBenSeguro
  Left = 8
  Top = 47
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Cadastro de Beneficiários de Seguro'
  ClientHeight = 438
  ClientWidth = 759
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 759
    Height = 352
    inherited pnlMestre: TPanel
      Width = 749
      Height = 124
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 2
        Width = 123
        Height = 13
        Caption = 'Nome do Participante'
      end
      object DBText1: TDBText
        Left = 6
        Top = 18
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = dsMestre
      end
      object Label2: TLabel
        Left = 456
        Top = 2
        Width = 53
        Height = 13
        Caption = 'Inscrição'
      end
      object DBText2: TDBText
        Left = 456
        Top = 18
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataSource = dsMestre
      end
      object DBText3: TDBText
        Left = 600
        Top = 18
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'DATAENTRADA'
        DataSource = dsMestre
      end
      object Label3: TLabel
        Left = 600
        Top = 2
        Width = 84
        Height = 13
        Caption = 'Data Inscrição'
      end
      object DBText4: TDBText
        Left = 6
        Top = 56
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'PATROCINADORA'
        DataSource = dsMestre
      end
      object Label4: TLabel
        Left = 6
        Top = 40
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object DBText5: TDBText
        Left = 184
        Top = 56
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'DATANASC'
        DataSource = dsMestre
      end
      object Label5: TLabel
        Left = 184
        Top = 40
        Width = 67
        Height = 13
        Caption = 'Nascimento'
      end
      object DBText6: TDBText
        Left = 288
        Top = 56
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'IDADE'
        DataSource = dsMestre
      end
      object Label6: TLabel
        Left = 288
        Top = 40
        Width = 33
        Height = 13
        Caption = 'Idade'
      end
      object DBText7: TDBText
        Left = 360
        Top = 56
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'SEXO'
        DataSource = dsMestre
      end
      object Label7: TLabel
        Left = 360
        Top = 40
        Width = 29
        Height = 13
        Caption = 'Sexo'
      end
      object DBText8: TDBText
        Left = 456
        Top = 56
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'ESTCIVIL'
        DataSource = dsMestre
      end
      object Label8: TLabel
        Left = 456
        Top = 40
        Width = 68
        Height = 13
        Caption = 'Estado Civil'
      end
      object DBText9: TDBText
        Left = 600
        Top = 56
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'FORMAPAGTO'
        DataSource = dsMestre
      end
      object Label9: TLabel
        Left = 600
        Top = 40
        Width = 120
        Height = 13
        Caption = 'Forma de Pagamento'
      end
      object DBText10: TDBText
        Left = 6
        Top = 96
        Width = 57
        Height = 13
        AutoSize = True
        DataField = 'PLANO'
        DataSource = dsMestre
      end
      object Label10: TLabel
        Left = 6
        Top = 80
        Width = 104
        Height = 13
        Caption = 'Plano Assistencial'
      end
      object DBText11: TDBText
        Left = 600
        Top = 95
        Width = 57
        Height = 13
        AutoSize = True
        DataField = 'SITUACAO'
        DataSource = dsMestre
      end
      object Label11: TLabel
        Left = 600
        Top = 80
        Width = 51
        Height = 13
        Caption = 'Situação'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 120
      Width = 749
      Height = 227
      Align = alBottom
      TabOrder = 0
      Tabs.Strings = (
        'Beneficiários')
      inherited pgctrlDetalhe: TPageControl
        Width = 651
        Height = 168
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 643
            Height = 140
            Selected.Strings = (
              'BENEFICIARIO'#9'35'#9'Nome do Beneficiário'#9'F'
              'VALORPERCENT'#9'10'#9'Percentual do Prêmio'#9'F'
              'SITUACAO'#9'9'#9'Situação'#9'F'
              'DATACANCEL'#9'18'#9'Data Cancelamento'#9'F'
              'MOTIVOCANCEL'#9'100'#9'Motivo Cancelamento'#9'F')
            DataSource = ds
            PopupMenu = PopupMenu1
            ReadOnly = True
            OnCalcCellColors = dbgrdDetCalcCellColors
            FooterColor = clCaptionText
            FooterCellColor = clWhite
          end
          inherited pnlControlesDet: TPanel
            Width = 643
            Height = 140
            object Label12: TLabel
              Left = 8
              Top = 8
              Width = 122
              Height = 13
              Caption = 'Nome do Beneficiário'
              Color = clBtnFace
              ParentColor = False
            end
            object Label13: TLabel
              Left = 8
              Top = 72
              Width = 122
              Height = 13
              Caption = 'Percentual do Prêmio'
            end
            object Label16: TLabel
              Left = 471
              Top = 8
              Width = 116
              Height = 13
              Caption = 'Data de Nascimento'
            end
            object edtNomePessoa: TEdit
              Left = 8
              Top = 24
              Width = 457
              Height = 21
              TabOrder = 0
              OnKeyPress = edtNomePessoaKeyPress
            end
            object edtPercentual: TRealEdit
              Left = 8
              Top = 88
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object dtDataNasc: TCMDateTimePicker
              Left = 471
              Top = 24
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
              TabOrder = 2
            end
          end
        end
        object tbsCancelar: TTabSheet
          Caption = 'Cancelamento'
          Enabled = False
          ImageIndex = 1
          object Label14: TLabel
            Left = 8
            Top = 12
            Width = 32
            Height = 13
            Caption = 'Data '
          end
          object Label15: TLabel
            Left = 8
            Top = 67
            Width = 39
            Height = 13
            Caption = 'Motivo'
          end
          object dtDataCancel: TCMDateTimePicker
            Left = 8
            Top = 26
            Width = 133
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
          object EdtMotivoCancel: TEdit
            Left = 8
            Top = 87
            Width = 601
            Height = 21
            TabOrder = 1
          end
        end
      end
      inherited Dock973: TDock97
        Width = 741
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnExcluiDet: TToolbarButton97
            Hint = 'Cancelar'
          end
        end
      end
      inherited Dock974: TDock97
        Left = 655
        Height = 168
      end
    end
  end
  inherited Dock972: TDock97
    Width = 759
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 57
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 57
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 177
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 117
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 399
    Width = 759
    inherited tb97Fundo: TToolbar97
      Left = 568
      DockPos = 568
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 401
      DockPos = 401
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT PB.NOME AS BENEFICIARIO,'
      '       BE.IDBENEFSEGURO,'
      '       PT.NOME AS TITULAR,'
      '       BE.IDTITULAR,'
      '       UPPER(PL.NOME) AS PLANO,'
      '       DECODE(BE.FLGATIVO,0,'#39'CANCELADO'#39',1,'#39'NORMAL'#39') AS SITUACAO,'
      '       BE.DATACANCEL,'
      '       BE.MOTIVOCANCEL,'
      '       BE.VALORPERCENT'
      'FROM PESSOA    PT,'
      '     PESSOA    PB,'
      '     BENSEGASS BE,'
      '     PLANASS   PL'
      'WHERE (BE.IDBENEFSEGURO = PB.IDPESSOA)   AND'
      '      (BE.IDTITULAR     = PT.IDPESSOA)   AND'
      '      (BE.IDPLANASS     = PL.IDPLANASS)  AND'
      '      (BE.IDTITULAR     = :IDTITULAR)'
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' ')
    UpdateObject = nil
    Left = 273
    Top = 143
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object qryBENEFICIARIO: TStringField
      DisplayLabel = 'Nome do Beneficiário'
      DisplayWidth = 35
      FieldName = 'BENEFICIARIO'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryVALORPERCENT: TFloatField
      DisplayLabel = 'Percentual do Prêmio'
      DisplayWidth = 10
      FieldName = 'VALORPERCENT'
      Origin = 'BASEDADOS.BENSEGASS.VALORPERCENT'
    end
    object qrySITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 9
      FieldName = 'SITUACAO'
      Size = 9
    end
    object qryDATACANCEL: TDateTimeField
      DisplayLabel = 'Data Cancelamento'
      DisplayWidth = 18
      FieldName = 'DATACANCEL'
    end
    object qryMOTIVOCANCEL: TStringField
      DisplayLabel = 'Motivo Cancelamento'
      DisplayWidth = 100
      FieldName = 'MOTIVOCANCEL'
      Size = 100
    end
    object qryIDBENEFSEGURO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFSEGURO'
      Origin = 'BASEDADOS.BENSEGASS.IDBENEFSEGURO'
      Visible = False
    end
    object qryTITULAR: TStringField
      DisplayWidth = 60
      FieldName = 'TITULAR'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Visible = False
      Size = 60
    end
    object qryIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.BENSEGASS.IDTITULAR'
      Visible = False
    end
    object qryPLANO: TStringField
      DisplayWidth = 40
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PLANASS.NOME'
      Visible = False
      Size = 40
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qry
    Left = 427
    Top = 191
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 2
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    Left = 338
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Left = 419
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 370
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 281
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 452
    Top = 2
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnInsert = nil
    Left = 300
    Top = 175
  end
  object msInserir: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PARTASS.INSCRICAONUMERO'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Número da Inscrição'
      'Nome do Participante')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PARTASS'
      'PESSOA'
      'ELEGPATRO')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PARTASS.INSCRICAONUMERO')
    Filtro.Strings = (
      'PARTASS.IDPESSOA = PESSOA.IDPESSOA'
      'PARTASS.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PARTASS.FLGINSCRICAOCANC=0')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '20'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 603
    Top = 2
  end
  object qryMestre: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PE.IDPESSOA,'
      '       PA.INSCRICAONUMERO,'
      '       PA.IDPESSJUR,'
      '       PA.IDPLANASS,'
      '       PA.IDPLANOPREV,'
      '       PE.NOME,'
      '       PJ.NOME AS PATROCINADORA,'
      '       PA.DATAENTRADA,'
      '       PF.DATANASC,'
      '       TRUNC((SYSDATE - PF.DATANASC)/365.5) AS IDADE,'
      '       PF.SEXO,'
      '       DECODE(PF.ESTCIVIL,'#39'S'#39','#39'SOLTEIRO(A)'#39','
      '                          '#39'C'#39','#39'CASADO(A)'#39','
      '                          '#39'D'#39','#39'DIVORCIADO(A)'#39','
      '                          '#39'V'#39','#39'VIÚVO(A)'#39','
      '                          '#39'O'#39','#39'OUTROS'#39') AS ESTCIVIL,'
      '       DECODE(CO.CODPORTFORMA, NULL, '#39'DESCONTO EM FOLHA'#39','
      
        '                                     '#39'BOLETO BANCARIO  '#39') AS FOR' +
        'MAPAGTO,'
      '       UPPER(PL.NOME) AS PLANO,'
      '       UPPER(SP.DESCRICAO) AS SITUACAO'
      'FROM PESSOA            PE,'
      '     PESSOA            PJ,'
      '     PESSOAFISICA      PF,'
      '     PARTPREVPLAN      PV,'
      '     PARTASS           PA,'
      '     CONTASS           CO,'
      '     PLANASS           PL,'
      '     SITPART           SP'
      'WHERE (PA.IDPESSOA  = PE.IDPESSOA)              AND'
      '      (PA.IDPESSOA  = PF.IDPESSOA)              AND'
      '      (PA.IDPESSJUR = PJ.IDPESSOA)              AND'
      '      (PA.IDPESSOA  = CO.IDTITULAR)             AND'
      '      (PA.IDPLANASS = CO.IDPLANASS)             AND'
      '      (PA.IDPESSOA  = PV.IDPESSOA)              AND'
      '      (PV.FLGDESATIVADO=0) AND'
      '      (PA.FLGINSCRICAOCANC=0) AND'
      ''
      '      (PA.IDPLANASS = PL.IDPLANASS)             AND'
      '      (PV.IDSITPART = SP.IDSITPART)             AND'
      '      (PE.IDPESSOA  = :IDPESSOA)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 153
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1295525'
      end>
    object qryMestreIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMestreINSCRICAONUMERO: TStringField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryMestreNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryMestrePATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryMestreDATAENTRADA: TDateTimeField
      FieldName = 'DATAENTRADA'
    end
    object qryMestreDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qryMestreIDADE: TFloatField
      FieldName = 'IDADE'
    end
    object qryMestreSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object qryMestreESTCIVIL: TStringField
      FieldName = 'ESTCIVIL'
      Size = 13
    end
    object qryMestreFORMAPAGTO: TStringField
      FieldName = 'FORMAPAGTO'
      Size = 17
    end
    object qryMestreIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
    end
    object qryMestrePLANO: TStringField
      FieldName = 'PLANO'
      Size = 40
    end
    object qryMestreSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryMestreIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryMestreIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
  end
  object dsMestre: TwwDataSource
    AutoEdit = False
    DataSet = qryMestre
    Left = 210
    Top = 50
  end
  object PopupMenu1: TPopupMenu
    Left = 469
    Top = 182
    object pmgrid1: TMenuItem
      Caption = 'Beneficiários Cancelados'
      OnClick = pmgrid1Click
    end
    object pmgrid2: TMenuItem
      Caption = 'Restaurar Cancelado'
      OnClick = pmgrid2Click
    end
    object pmgrid3: TMenuItem
      Caption = 'Beneficiários Ativos'
      OnClick = pmgrid3Click
    end
  end
end
